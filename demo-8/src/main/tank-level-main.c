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
#define ENABLE_SCREEN
#include "smbus.h"
#include "i2c-lcd1602.h"
#include "driver/i2c.h"

// Encoder
#include "freertos/queue.h"
#include "rotary_encoder.h"

// HC-SR04
#include "ultrasonic.h"

// Generics
#define LOG_TAG "app"

// Pins
#define BLINK_GPIO_PIN         GPIO_NUM_2
#define I2C_MASTER_SDA_IO_PIN  GPIO_NUM_21
#define I2C_MASTER_SCL_IO_PIN  GPIO_NUM_22
#define PUMP_PIN               GPIO_NUM_25
#define TRIGGER_GPIO_PIN       GPIO_NUM_26
#define ECHO_GPIO_PIN          GPIO_NUM_27
#define ROT_ENC_B_GPIO_PIN     GPIO_NUM_32    // You need a pullup 10k resistor to 5V
#define MENU_BUTTON_PIN        GPIO_NUM_34    // You need a pullup 10k resistor to 5V
#define ROT_ENC_A_GPIO_PIN     GPIO_NUM_35

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
i2c_lcd1602_info_t * lcd_info;

// Button
#define ESP_INTR_FLAG_DEFAULT 0
SemaphoreHandle_t menuButtonSemaphore = NULL;

// Ultrasonic
#define MAX_DISTANCE_CM 30
ultrasonic_sensor_t ultrasonic_sensor  = {
    .trigger_pin = TRIGGER_GPIO_PIN,
    .echo_pin = ECHO_GPIO_PIN
};

// Pump
#define PumpOff         0
#define PumpOn          1
int PumpStartDistance = 12;
int PumpStopDistance  = 5;
int PumpStatus         = PumpOff;

// Menu
// Last Item is used to know when we should go back to the first one
enum MenuStates {Main = 0, MinDistance, MaxDistance, LastItem};
enum MenuStates MenuCurrentState;

void TaskDelayMs(int ms)
{
    vTaskDelay(ms/portTICK_PERIOD_MS);
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
void IRAM_ATTR menu_button_isr_handler(void* arg)
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

        // Advance the menu to next item
        MenuCurrentState = ( MenuCurrentState + 1 ) % LastItem;    

        // Skip a very fast next press
        TaskDelayMs(100);
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
    gpio_isr_handler_add(MENU_BUTTON_PIN, &menu_button_isr_handler, NULL);
    // Interrupt when state changes from HIGH to LOW
    gpio_set_intr_type(MENU_BUTTON_PIN, GPIO_INTR_NEGEDGE);


    menuButtonSemaphore = xSemaphoreCreateBinary();
    xTaskCreate(&menu_button_pressed_task, "menu_button_pressed_task", 2048, NULL, 5, NULL);

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

void menu_loop_task(void * pvParameter)
{
    while(1)
    {
        rotary_encoder_state_t state = { 0 };
        ESP_ERROR_CHECK(rotary_encoder_get_state(&encoder_info, &state));
        ESP_ERROR_CHECK(rotary_encoder_reset(&encoder_info));

        char secondLine[16];
        
        // this might change in the way
        enum MenuStates local_menuCurrentState = MenuCurrentState;
        switch (local_menuCurrentState)
        {
            case Main:
                snprintf(secondLine, 16, "Pump: %d        ", (int)PumpStatus); 
                break;
            case MaxDistance:
                PumpStartDistance = PumpStartDistance + state.position;
                if(PumpStartDistance < PumpStopDistance) 
                    PumpStartDistance = PumpStopDistance + 1;
                if(PumpStartDistance > 30) 
                    PumpStartDistance = 30;
                snprintf(secondLine, 16, "Max dist: %d    ", PumpStartDistance);
                break;
            case MinDistance:
                PumpStopDistance = PumpStopDistance + state.position;
                if (PumpStopDistance < 5) 
                    PumpStopDistance = 5;
                if (PumpStopDistance > PumpStartDistance) 
                    PumpStopDistance = PumpStartDistance - 1;
                snprintf(secondLine, 16, "Min dist: %d    ", PumpStopDistance);
                break;
            case LastItem:
                printf("Error, MenuCurrentState is overflowed: %d", local_menuCurrentState);
        }

        int distance = ultrasonic_measure_distance_cm();
        char firstLine[16];
        snprintf(firstLine, 16, "Distance: %d    ", distance);
        i2c_lcd1602_move_cursor(lcd_info, 0, 0);
        i2c_lcd1602_write_string(lcd_info, firstLine);

        i2c_lcd1602_move_cursor(lcd_info, 0, 1);
        i2c_lcd1602_write_string(lcd_info, secondLine);

        TaskDelayMs(200);
    }
}

static void i2c_screen_init(void)
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

    printf("i2c light on\n");
    i2c_port_t i2c_num = I2C_MASTER_NUM;
    uint8_t address = CONFIG_LCD1602_I2C_ADDRESS;

    // Set up the SMBus
    smbus_info_t * smbus_info = smbus_malloc();
    ESP_ERROR_CHECK(smbus_init(smbus_info, i2c_num, address));
    ESP_ERROR_CHECK(smbus_set_timeout(smbus_info, 1000 / portTICK_RATE_MS));

    // Set up the LCD1602 device with backlight off
    lcd_info = i2c_lcd1602_malloc();
    ESP_ERROR_CHECK(i2c_lcd1602_init(lcd_info, smbus_info, true, LCD_NUM_ROWS, LCD_NUM_COLUMNS, LCD_NUM_VISIBLE_COLUMNS));

    ESP_ERROR_CHECK(i2c_lcd1602_reset(lcd_info));

    // turn on backlight
    printf("backlight on\n");
    i2c_lcd1602_set_backlight(lcd_info, true);

    printf("cursor off\n");
    i2c_lcd1602_set_cursor(lcd_info, false);
}

void pump_task()
{
    while(1)
    {
        TaskDelayMs(2000);
        int distance = ultrasonic_measure_distance_cm();
        if(distance >= PumpStartDistance)
        {
            printf("PumpOn. Distance: %d\n", distance);
            PumpStatus = PumpOn;
        }
        // On sensor error => distance < 0
        if(distance <= PumpStopDistance)
        {
            printf("PumpOff. Distance: %d\n", distance);
            PumpStatus = PumpOff;
        }
        gpio_set_level(PUMP_PIN, PumpStatus);
    }
}

void pump_init()
{
    gpio_reset_pin(PUMP_PIN);
    gpio_set_direction(PUMP_PIN, GPIO_MODE_OUTPUT);
    gpio_set_level(PUMP_PIN, PumpOff);
    PumpStatus = PumpOff;
    xTaskCreate(&pump_task, "pump_task", 2048, NULL, 5, NULL);
}

void app_main(void)
{
    ESP_LOGI(LOG_TAG, "Init everyting\n");
    i2c_screen_init();
    encoder_init();
    menubutton_init();
    ultrasonic_init(&ultrasonic_sensor);
    pump_init();
    ESP_LOGI(LOG_TAG, "Done Init everything\n");

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

    xTaskCreate(&hearbeat_task, "hearbeat_task", 2048, NULL, 5, NULL);
    xTaskCreate(&menu_loop_task, "menu_loop_task", 6144, NULL, 5, NULL);
    
    //printf("Restarting now.\n");
    //fflush(stdout);
    //esp_restart();
}

