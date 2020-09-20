/* Hello World Example

   This example code is in the Public Domain (or CC0 licensed, at your option.)

   Unless required by applicable law or agreed to in writing, this
   software is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
   CONDITIONS OF ANY KIND, either express or implied.
*/
#include <stdio.h>
#include "sdkconfig.h"
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/semphr.h"
#include "esp_system.h"
#include "esp_spi_flash.h"
#include "esp_log.h"
#include "driver/gpio.h"
#include "sdkconfig.h"
#include "esp32/rom/uart.h"

// LCD
#include "smbus.h"
#include "i2c-lcd1602.h"
#include "driver/i2c.h"

// Encoder
#include "freertos/queue.h"
#include "rotary_encoder.h"

// HC-SR04
#include "ultrasonic.h"
#define MAX_DISTANCE_CM 500 // 5m max

// Generics
#define LOG_TAG "app"

// Pins
#define BLINK_GPIO_PIN         GPIO_NUM_2
#define I2C_MASTER_SDA_IO_PIN  GPIO_NUM_21
#define I2C_MASTER_SCL_IO_PIN  GPIO_NUM_22
#define TRIGGER_GPIO_PIN       GPIO_NUM_26
#define ECHO_GPIO_PIN          GPIO_NUM_27
#define MENU_BUTTON_PIN        GPIO_NUM_32
#define ROT_ENC_A_GPIO_PIN     GPIO_NUM_34    // You need a pullup 10k resistor to 5V
#define ROT_ENC_B_GPIO_PIN     GPIO_NUM_35    // You need a pullup 10k resistor to 5V

// Encoder
#define ENABLE_HALF_STEPS false  // Set to true to enable tracking of rotary encoder at half step resolution
#define RESET_AT          0      // Set to a positive non-zero number to reset the position if this value is exceeded
#define FLIP_DIRECTION    false  // Set to true to reverse the clockwise/counterclockwise sense
rotary_encoder_info_t encoder_info = { 0 };
QueueHandle_t encoder_event_queue;

// LCD1602
#define LCD_NUM_ROWS               2
#define LCD_NUM_COLUMNS            32
#define LCD_NUM_VISIBLE_COLUMNS    16
#define I2C_MASTER_NUM             I2C_NUM_0
#define I2C_MASTER_TX_BUF_LEN      0                     // disabled
#define I2C_MASTER_RX_BUF_LEN      0                     // disabled
#define I2C_MASTER_FREQ_HZ         100000
#define CONFIG_LCD1602_I2C_ADDRESS 0x27

// Button
#define ESP_INTR_FLAG_DEFAULT 0
SemaphoreHandle_t menuButtonSemaphore = NULL;

// Ultrasonic
#define MAX_DISTANCE_CM 30
ultrasonic_sensor_t ultrasonic_sensor  = {
    .trigger_pin = TRIGGER_GPIO_PIN,
    .echo_pin = ECHO_GPIO_PIN
};

// Menu
int menu = 0;


void TaskDelayMs(int ms)
{
    vTaskDelay(ms/portTICK_PERIOD_MS);
}

void ultrasonic_sensor_init()
{
    ultrasonic_init(&ultrasonic_sensor);
}

int32_t ultrasonic_measure_distance_cm()
{
    uint32_t distance;
    esp_err_t res = ultrasonic_measure_cm(&ultrasonic_sensor, MAX_DISTANCE_CM, &distance);
    if (res != ESP_OK)
    {
        printf("Error: ");
        switch (res)
        {
            case ESP_ERR_ULTRASONIC_PING:
                printf("Cannot ping (device is in invalid state)\n");
                break;
            case ESP_ERR_ULTRASONIC_PING_TIMEOUT:
                printf("Ping timeout (no device found)\n");
                break;
            case ESP_ERR_ULTRASONIC_ECHO_TIMEOUT:
                printf("Echo timeout (i.e. distance too big)\n");
                break;
            default:
                printf("%d\n", res);
        }
    }
    else
    {
        printf("Distance: %d cm\n", distance);
    }

    return distance;
}

// Interrupt Service Routine: code called when interrupt is triggered
void IRAM_ATTR Menu_Button_Isr_Handler(void* arg)
{
    xSemaphoreGiveFromISR(menuButtonSemaphore, NULL);
}

void menu_button_pressed_task()
{
    while(1)
    {
        // Blocking until ISR
        if(xSemaphoreTake(menuButtonSemaphore, portMAX_DELAY) == pdTRUE)
        {
            printf("BOTON!\n");
        }

        printf("OUT LOOP\n");
        TaskDelayMs(500);
    }
    
}

void menubutton_init()
{
    // Each pin has multiple functions, we want it as GPIO
    gpio_pad_select_gpio(MENU_BUTTON_PIN);
    // GPIO is input
    gpio_set_direction(MENU_BUTTON_PIN, GPIO_MODE_INPUT);
    // We need to install ISR services
    gpio_install_isr_service(ESP_INTR_FLAG_DEFAULT);
    // Whow is going to handle the ISR call?
    gpio_isr_handler_add(MENU_BUTTON_PIN, &Menu_Button_Isr_Handler, NULL);
    // Interrupt when state changes from HIGH to LOW
    gpio_set_intr_type(MENU_BUTTON_PIN, GPIO_INTR_NEGEDGE);


    menuButtonSemaphore = xSemaphoreCreateBinary();
    xTaskCreate(&menu_button_pressed_task, "menu_button_pressed_task", 2048, NULL, 5, NULL);

}
static void i2c_master_init(void)
{
    int i2c_master_port = I2C_MASTER_NUM;
    i2c_config_t conf;
    conf.mode = I2C_MODE_MASTER;
    conf.sda_io_num = I2C_MASTER_SDA_IO_PIN;
    conf.sda_pullup_en = GPIO_PULLUP_DISABLE;  // GY-2561 provides 10kΩ pullups
    conf.scl_io_num = I2C_MASTER_SCL_IO_PIN;
    conf.scl_pullup_en = GPIO_PULLUP_DISABLE;  // GY-2561 provides 10kΩ pullups
    conf.master.clk_speed = I2C_MASTER_FREQ_HZ;
    i2c_param_config(i2c_master_port, &conf);
    i2c_driver_install(i2c_master_port, conf.mode,
                       I2C_MASTER_RX_BUF_LEN,
                       I2C_MASTER_TX_BUF_LEN, 0);
}

void encoder_task()
{
    while (1)
    {
        // Wait for incoming events on the event queue.
        rotary_encoder_event_t event = { 0 };
        if (xQueueReceive(encoder_event_queue, &event, 1000 / portTICK_PERIOD_MS) == pdTRUE)
        {
            ESP_LOGI(LOG_TAG, "Event: position %d, direction %s", event.state.position,
                     event.state.direction ? (event.state.direction == ROTARY_ENCODER_DIRECTION_CLOCKWISE ? "CW" : "CCW") : "NOT_SET");
        }
        else
        {
            // Poll current position and direction
            rotary_encoder_state_t state = { 0 };
            ESP_ERROR_CHECK(rotary_encoder_get_state(&encoder_info, &state));
            ESP_LOGI(LOG_TAG, "Poll: position %d, direction %s", state.position,
                     state.direction ? (state.direction == ROTARY_ENCODER_DIRECTION_CLOCKWISE ? "CW" : "CCW") : "NOT_SET");

            // Reset the device
            if (RESET_AT && (state.position >= RESET_AT || state.position <= -RESET_AT))
            {
                ESP_LOGI(LOG_TAG, "Reset");
                ESP_ERROR_CHECK(rotary_encoder_reset(&encoder_info));
            }
        }
    }
}

void encoder_init()
{
    // esp32-rotary-encoder requires that the GPIO ISR service is installed before calling rotary_encoder_register()
    ESP_ERROR_CHECK(gpio_install_isr_service(ESP_INTR_FLAG_DEFAULT));
    // Initialise the rotary encoder device with the GPIOs for A and B signals
    ESP_ERROR_CHECK(rotary_encoder_init(&encoder_info, ROT_ENC_A_GPIO_PIN, ROT_ENC_B_GPIO_PIN));
    ESP_ERROR_CHECK(rotary_encoder_enable_half_steps(&encoder_info, ENABLE_HALF_STEPS));
    
    // Create a queue for events from the rotary encoder driver.
    // Tasks can read from this queue to receive up to date position information.
    encoder_event_queue = rotary_encoder_create_queue();
    ESP_ERROR_CHECK(rotary_encoder_set_queue(&encoder_info, encoder_event_queue));

    xTaskCreate(&encoder_task, "encoder_task", 2048, NULL, 5, NULL);
}

void hearbeat_task(void * pvParameter)
{
    gpio_reset_pin(BLINK_GPIO_PIN);
    gpio_set_direction(BLINK_GPIO_PIN, GPIO_MODE_OUTPUT);

    while(1)
    {
        TaskDelayMs(1000);
        gpio_set_level(BLINK_GPIO_PIN, 0);
        TaskDelayMs(1000);
        gpio_set_level(BLINK_GPIO_PIN, 1);
    }
}

void lcd1602_task(void * pvParameter)
{
    printf("i2c light on\n");
    i2c_port_t i2c_num = I2C_MASTER_NUM;
    uint8_t address = CONFIG_LCD1602_I2C_ADDRESS;

    // Set up the SMBus
    smbus_info_t * smbus_info = smbus_malloc();
    ESP_ERROR_CHECK(smbus_init(smbus_info, i2c_num, address));
    ESP_ERROR_CHECK(smbus_set_timeout(smbus_info, 1000 / portTICK_RATE_MS));

    // Set up the LCD1602 device with backlight off
    i2c_lcd1602_info_t * lcd_info = i2c_lcd1602_malloc();
    ESP_ERROR_CHECK(i2c_lcd1602_init(lcd_info, smbus_info, true,
                                    LCD_NUM_ROWS, LCD_NUM_COLUMNS, LCD_NUM_VISIBLE_COLUMNS));

    ESP_ERROR_CHECK(i2c_lcd1602_reset(lcd_info));

    // turn off backlight
    printf("backlight off\n");
    i2c_lcd1602_set_backlight(lcd_info, false);

    // turn on backlight
    printf("backlight on\n");
    i2c_lcd1602_set_backlight(lcd_info, true);

    printf("cursor on\n");
    i2c_lcd1602_set_cursor(lcd_info, false);

    printf("display hola at 0,0\n");
    i2c_lcd1602_move_cursor(lcd_info, 0, 0);
    i2c_lcd1602_write_string(lcd_info, "hola");

    printf("done scrolling\n");

    vTaskDelete(NULL);
}

void app_main(void)
{
    printf("Init everyting\n");
    i2c_master_init();
    encoder_init();
    menubutton_init();
    ultrasonic_sensor_init();
    printf("Done Init everything\n");

    /* Print chip information */
    esp_chip_info_t chip_info;
    esp_chip_info(&chip_info);
    printf("This is %s chip with %d CPU cores, WiFi%s%s, ",
            CONFIG_IDF_TARGET,
            chip_info.cores,
            (chip_info.features & CHIP_FEATURE_BT) ? "/BT" : "",
            (chip_info.features & CHIP_FEATURE_BLE) ? "/BLE" : "");

    printf("silicon revision %d, ", chip_info.revision);

    printf("%dMB %s flash\n", spi_flash_get_chip_size() / (1024 * 1024),
            (chip_info.features & CHIP_FEATURE_EMB_FLASH) ? "embedded" : "external");

    printf("Minimum free heap size: %d bytes\n", esp_get_minimum_free_heap_size());

    xTaskCreate(&lcd1602_task, "lcd1602_task", 4096, NULL, 5, NULL);
    xTaskCreate(&hearbeat_task, "hearbeat_task", 2048, NULL, 5, NULL);

    
    while(1) {
        int water_distance = ultrasonic_measure_distance_cm();
        printf("Doing nothing in app_main. Water level: %d\n", water_distance);
        TaskDelayMs(1000);
    }
    //printf("Restarting now.\n");
    //fflush(stdout);
    //esp_restart();
}

