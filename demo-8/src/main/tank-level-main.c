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

// Generics
#define TAG "app"

// Pins
#define BLINK_GPIO         2
#define I2C_MASTER_SDA_IO  21
#define I2C_MASTER_SCL_IO  22
#define ROT_ENC_A_GPIO     34    // You need a pullup 10k resistor to 5V
#define ROT_ENC_B_GPIO     35    // You need a pullup 10k resistor to 5V

// Encoder
#define ENABLE_HALF_STEPS false  // Set to true to enable tracking of rotary encoder at half step resolution
#define RESET_AT          0      // Set to a positive non-zero number to reset the position if this value is exceeded
#define FLIP_DIRECTION    false  // Set to true to reverse the clockwise/counterclockwise sense

// LCD1602
#define LCD_NUM_ROWS               2
#define LCD_NUM_COLUMNS            32
#define LCD_NUM_VISIBLE_COLUMNS    16
#define I2C_MASTER_NUM           I2C_NUM_0
#define I2C_MASTER_TX_BUF_LEN    0                     // disabled
#define I2C_MASTER_RX_BUF_LEN    0                     // disabled
#define I2C_MASTER_FREQ_HZ       100000
#define CONFIG_LCD1602_I2C_ADDRESS 0x27

void TaskDelayMs(int ms)
{
    vTaskDelay(ms/portTICK_PERIOD_MS);
}

static void i2c_master_init(void)
{
    int i2c_master_port = I2C_MASTER_NUM;
    i2c_config_t conf;
    conf.mode = I2C_MODE_MASTER;
    conf.sda_io_num = I2C_MASTER_SDA_IO;
    conf.sda_pullup_en = GPIO_PULLUP_DISABLE;  // GY-2561 provides 10kΩ pullups
    conf.scl_io_num = I2C_MASTER_SCL_IO;
    conf.scl_pullup_en = GPIO_PULLUP_DISABLE;  // GY-2561 provides 10kΩ pullups
    conf.master.clk_speed = I2C_MASTER_FREQ_HZ;
    i2c_param_config(i2c_master_port, &conf);
    i2c_driver_install(i2c_master_port, conf.mode,
                       I2C_MASTER_RX_BUF_LEN,
                       I2C_MASTER_TX_BUF_LEN, 0);
}

static void encoder_init()
{
    // esp32-rotary-encoder requires that the GPIO ISR service is installed before calling rotary_encoder_register()
    ESP_ERROR_CHECK(gpio_install_isr_service(0));
    // Initialise the rotary encoder device with the GPIOs for A and B signals
    rotary_encoder_info_t info = { 0 };
    ESP_ERROR_CHECK(rotary_encoder_init(&info, ROT_ENC_A_GPIO, ROT_ENC_B_GPIO));
    ESP_ERROR_CHECK(rotary_encoder_enable_half_steps(&info, ENABLE_HALF_STEPS));
    
    // Create a queue for events from the rotary encoder driver.
    // Tasks can read from this queue to receive up to date position information.
    QueueHandle_t event_queue = rotary_encoder_create_queue();
    ESP_ERROR_CHECK(rotary_encoder_set_queue(&info, event_queue));

        while (1)
    {
        // Wait for incoming events on the event queue.
        rotary_encoder_event_t event = { 0 };
        if (xQueueReceive(event_queue, &event, 1000 / portTICK_PERIOD_MS) == pdTRUE)
        {
            ESP_LOGI(TAG, "Event: position %d, direction %s", event.state.position,
                     event.state.direction ? (event.state.direction == ROTARY_ENCODER_DIRECTION_CLOCKWISE ? "CW" : "CCW") : "NOT_SET");
        }
        else
        {
            // Poll current position and direction
            rotary_encoder_state_t state = { 0 };
            ESP_ERROR_CHECK(rotary_encoder_get_state(&info, &state));
            ESP_LOGI(TAG, "Poll: position %d, direction %s", state.position,
                     state.direction ? (state.direction == ROTARY_ENCODER_DIRECTION_CLOCKWISE ? "CW" : "CCW") : "NOT_SET");

            // Reset the device
            if (RESET_AT && (state.position >= RESET_AT || state.position <= -RESET_AT))
            {
                ESP_LOGI(TAG, "Reset");
                ESP_ERROR_CHECK(rotary_encoder_reset(&info));
            }
        }
    }
}

void hearbeat_task(void * pvParameter)
{
    gpio_reset_pin(BLINK_GPIO);
    gpio_set_direction(BLINK_GPIO, GPIO_MODE_OUTPUT);

    while(1)
    {
        TaskDelayMs(1000);
        gpio_set_level(BLINK_GPIO, 0);
        TaskDelayMs(1000);
        gpio_set_level(BLINK_GPIO, 1);
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
    printf("Starting i2c\n");
    i2c_master_init();
    printf("Done starting i2c\n");

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

    encoder_init();
    while(1) {
        printf("Doing nothing in app_main");
        TaskDelayMs(10000);
    }
    //printf("Restarting now.\n");
    //fflush(stdout);
    //esp_restart();
}

