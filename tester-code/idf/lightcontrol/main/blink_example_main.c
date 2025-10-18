/* ESP32-S3 Light Control with TCAL6416 I/O Expander - Managed Component Version

   This example demonstrates how to use the TCAL6416 managed component
   for controlling a 16-bit I/O expander via I2C.
   
   This example code is in the Public Domain (or CC0 licensed, at your option.)

   Unless required by applicable law or agreed to in writing, this
   software is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
   CONDITIONS OF ANY KIND, either express or implied.
*/

#include <stdio.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "driver/i2c.h"
#include "driver/gpio.h"
#include "esp_log.h"
#include "esp_err.h"

// Include the TCAL6416 managed component
#include "tcal6416.h"

static const char *TAG = "lightcontrol_app";

// GPIO and I2C configuration
#define OUTPUT_ENABLED_PIN          16    // GPIO to enable outputs before I2C init
#define I2C_MASTER_SCL_IO           41    // GPIO for I2C clock (updated)
#define I2C_MASTER_SDA_IO           42    // GPIO for I2C data (updated)
#define I2C_MASTER_NUM              0     // I2C port number
#define I2C_MASTER_FREQ_HZ          100000 // I2C frequency (100kHz)
#define TCAL6416_I2C_ADDR           0x20  // TCAL6416 I2C address
#define STATUS_LED_PIN              1   

// Macro for binary representation of a byte
#define BYTE_TO_BINARY_PATTERN "%c%c%c%c%c%c%c%c"
#define BYTE_TO_BINARY(byte)  \
  (byte & 0x80 ? '1' : '0'), \
  (byte & 0x40 ? '1' : '0'), \
  (byte & 0x20 ? '1' : '0'), \
  (byte & 0x10 ? '1' : '0'), \
  (byte & 0x08 ? '1' : '0'), \
  (byte & 0x04 ? '1' : '0'), \
  (byte & 0x02 ? '1' : '0'), \
  (byte & 0x01 ? '1' : '0')

// Global device handle
static tcal6416_handle_t tcal_handle;

/**
 * @brief Configure and enable the output enable pin
 */
static esp_err_t configure_output_enable_pin(void)
{
    ESP_LOGI(TAG, "Configuring OUTPUT_ENABLED_PIN on GPIO %d", OUTPUT_ENABLED_PIN);
    
    // Reset the GPIO pin to ensure clean state
    gpio_reset_pin(OUTPUT_ENABLED_PIN);
    gpio_reset_pin(STATUS_LED_PIN);
    
    // Configure as output
    esp_err_t ret = gpio_set_direction(STATUS_LED_PIN, GPIO_MODE_OUTPUT);
    ret |= gpio_set_direction(OUTPUT_ENABLED_PIN, GPIO_MODE_OUTPUT);
    if (ret != ESP_OK) {
        ESP_LOGE(TAG, "Failed to set GPIO %d as output: %s", OUTPUT_ENABLED_PIN, esp_err_to_name(ret));
        return ret;
    }
    
    // Enable outputs by setting the pin LOW
    ESP_LOGI(TAG, "Configuring OUTPUT_ENABLED_PIN on GPIO %d to LOW", OUTPUT_ENABLED_PIN);
    ret = gpio_set_level(OUTPUT_ENABLED_PIN, 0);
    ret = gpio_set_level(STATUS_LED_PIN, 1);
    if (ret != ESP_OK) {
        ESP_LOGE(TAG, "Failed to set GPIO %d LOW: %s", OUTPUT_ENABLED_PIN, esp_err_to_name(ret));
        return ret;
    }
    vTaskDelay(pdMS_TO_TICKS(1000));

    // Enable outputs by setting the pin HIGH
    ESP_LOGI(TAG, "Configuring OUTPUT_ENABLED_PIN on GPIO %d to HIGH", OUTPUT_ENABLED_PIN);
    ret = gpio_set_level(OUTPUT_ENABLED_PIN, 1);
    if (ret != ESP_OK) {
        ESP_LOGE(TAG, "Failed to set GPIO %d HIGH: %s", OUTPUT_ENABLED_PIN, esp_err_to_name(ret));
        return ret;
    }
    
    ESP_LOGI(TAG, "OUTPUT_ENABLED_PIN configured and enabled successfully");
    
    // Small delay to ensure the enable signal is stable before proceeding
    vTaskDelay(pdMS_TO_TICKS(1000));
    ret = gpio_set_level(STATUS_LED_PIN, 0);
    return ESP_OK;
}

/**
 * @brief Initialize I2C master
 */
static esp_err_t i2c_master_init(void)
{
    ESP_LOGI(TAG, "Initializing I2C master...");
    
    i2c_config_t conf = {
        .mode = I2C_MODE_MASTER,
        .sda_io_num = I2C_MASTER_SDA_IO,
        .sda_pullup_en = GPIO_PULLUP_ENABLE,
        .scl_io_num = I2C_MASTER_SCL_IO,
        .scl_pullup_en = GPIO_PULLUP_ENABLE,
        .master.clk_speed = I2C_MASTER_FREQ_HZ,
        .clk_flags = 0,
    };

    esp_err_t err = i2c_param_config(I2C_MASTER_NUM, &conf);
    if (err != ESP_OK) {
        ESP_LOGE(TAG, "I2C parameter configuration failed: %s", esp_err_to_name(err));
        return err;
    }

    err = i2c_driver_install(I2C_MASTER_NUM, conf.mode, 0, 0, 0);
    if (err != ESP_OK) {
        ESP_LOGE(TAG, "I2C driver installation failed: %s", esp_err_to_name(err));
        return err;
    }

    ESP_LOGI(TAG, "I2C master initialized successfully");
    ESP_LOGI(TAG, "SDA: GPIO%d, SCL: GPIO%d, Frequency: %d Hz", 
             I2C_MASTER_SDA_IO, I2C_MASTER_SCL_IO, I2C_MASTER_FREQ_HZ);
    
    return ESP_OK;
}

/**
 * @brief Demo task showing TCAL6416 functionality
 * Port 0 (pins 0-7): Configured as OUTPUTS - cycles through each pin HIGH/LOW
 * Port 1 (pins 8-15): Configured as INPUTS - reads and displays state
 */
static void tcal6416_demo_task(void *pvParameters)
{
    uint8_t input_pin = 0;        // Current output pin on port 0 (0-7)
    bool pin_state = false;        // Current state of the output pin
    uint8_t input_port_state;      // State of all input pins on port 1
    uint32_t cycle_count = 0;
    
    ESP_LOGI(TAG, "Starting TCAL6416 demo loop...");
    ESP_LOGI(TAG, "Port 0 (pins 8-15): INPUTS - will read and display state");
    ESP_LOGI(TAG, "Port 1 (pins 0-7): OUTPUTS - will cycle through each pin");
        
    while (1) {
        // === CONTROL PORT 1 OUTPUTS ===
        int output_pin = input_pin + 8;
        ESP_LOGI(TAG, "Cycle %lu: Setting PORT 1 pin %d to %s", cycle_count, output_pin, pin_state ? "HIGH" : "LOW");
        
        esp_err_t ret = tcal6416_set_pin(&tcal_handle, output_pin, pin_state);
        if (ret != ESP_OK) {
            ESP_LOGE(TAG, "Failed to set PORT 1 pin %d: %s", output_pin, esp_err_to_name(ret));
        }
        
        // === READ PORT 0 INPUTS ===
        ret = tcal6416_read_port(&tcal_handle, TCAL6416_PORT0, &input_port_state);
        if (ret == ESP_OK) {
            ESP_LOGI(TAG, "PORT 0 input state: 0x%02X (binary: " BYTE_TO_BINARY_PATTERN ")", 
                     input_port_state, BYTE_TO_BINARY(input_port_state));
            
            // Log individual pin states for clarity
            for (int i = 0; i < 8; i++) {
                bool pin_input_state = (input_port_state & (1 << i)) != 0;
                ESP_LOGD(TAG, "  PORT 0 pin %d (global pin %d): %s", i, i, pin_input_state ? "HIGH" : "LOW");
            }
        } else {
            ESP_LOGE(TAG, "Failed to read PORT 0 inputs: %s", esp_err_to_name(ret));
        }
        
        // === STATUS REPORTING ===
        if (cycle_count % 10 == 0) {
            ESP_LOGI(TAG, "=== Status Report (Cycle %lu) ===", cycle_count);
            ESP_LOGI(TAG, "Current OUTPUT pin: PORT 1 pin %d", output_pin);
            ESP_LOGI(TAG, "Current OUTPUT state: %s", pin_state ? "HIGH" : "LOW");
            tcal6416_print_status(&tcal_handle);
        }
        
        // === ADVANCE TO NEXT PIN ===
        input_pin = (input_pin + 1) % 8;  // Keep in port 0 range (0-7)
        cycle_count++;

        if (input_pin == 0) {
            pin_state = !pin_state;
            ESP_LOGI(TAG, "Completed full cycle through all PORT 0 pins, starting over...");
        }
                
        vTaskDelay(pdMS_TO_TICKS(500)); // 1 second delay
    }
}

/**
 * @brief Test individual pin operations on PORT 0 (outputs only)
 */
static void test_individual_pins(void)
{
    ESP_LOGI(TAG, "=== Testing Individual PORT 0 Pin Operations (OUTPUTS) ===");
    
    // Test setting individual pins on port 0 (configured as outputs)
    for (int pin = 0; pin < 8; pin++) {
        ESP_LOGI(TAG, "Testing PORT 0 pin %d (output)...", pin);
        
        // Set pin HIGH
        esp_err_t ret = tcal6416_set_pin(&tcal_handle, pin, true);
        if (ret == ESP_OK) {
            ESP_LOGI(TAG, "PORT 0 pin %d set to HIGH", pin);
        } else {
            ESP_LOGE(TAG, "Failed to set PORT 0 pin %d HIGH", pin);
        }
        
        vTaskDelay(pdMS_TO_TICKS(200));
        
        // Set pin LOW
        ret = tcal6416_set_pin(&tcal_handle, pin, false);
        if (ret == ESP_OK) {
            ESP_LOGI(TAG, "PORT 0 pin %d set to LOW", pin);
        } else {
            ESP_LOGE(TAG, "Failed to set PORT 0 pin %d LOW", pin);
        }
        
        vTaskDelay(pdMS_TO_TICKS(200));
    }
    
    ESP_LOGI(TAG, "PORT 0 individual pin test completed");
    ESP_LOGI(TAG, "Note: PORT 1 pins (8-15) are configured as inputs - use external signals to test");
}

void app_main(void)
{
    ESP_LOGI(TAG, "=== ESP32-S3 Light Control with TCAL6416 Managed Component ===");
    
    uint8_t major, minor, patch;
    tcal6416_get_version(&major, &minor, &patch);
    ESP_LOGI(TAG, "TCAL6416 Driver Version: %d.%d.%d", major, minor, patch);
    
    ESP_LOGI(TAG, "Initializing system...");
    
    // STEP 1: Configure and enable the output enable pin BEFORE I2C initialization
    esp_err_t ret = configure_output_enable_pin();
    if (ret != ESP_OK) {
        ESP_LOGE(TAG, "OUTPUT_ENABLED_PIN configuration failed: %s", esp_err_to_name(ret));
        return;
    }
    
    // STEP 2: Initialize I2C master (after outputs are enabled)
    ret = i2c_master_init();
    if (ret != ESP_OK) {
        ESP_LOGE(TAG, "I2C master initialization failed: %s", esp_err_to_name(ret));
        return;
    }
    
    // STEP 3: Initialize TCAL6416 with default configuration
    ret = tcal6416_init(&tcal_handle, I2C_MASTER_NUM, TCAL6416_I2C_ADDR);
    if (ret != ESP_OK) {
        ESP_LOGE(TAG, "TCAL6416 initialization failed: %s", esp_err_to_name(ret));
        ESP_LOGE(TAG, "Please check:");
        ESP_LOGE(TAG, "  - OUTPUT_ENABLED_PIN: GPIO%d (should be HIGH)", OUTPUT_ENABLED_PIN);
        ESP_LOGE(TAG, "  - Wiring connections (SDA: GPIO%d, SCL: GPIO%d)", I2C_MASTER_SDA_IO, I2C_MASTER_SCL_IO);
        ESP_LOGE(TAG, "  - I2C address (current: 0x%02X)", TCAL6416_I2C_ADDR);
        ESP_LOGE(TAG, "  - Pull-up resistors on I2C lines");
        ESP_LOGE(TAG, "  - Power supply (3.3V)");
        return;
    }
    
    ESP_LOGI(TAG, "System initialization completed successfully!");
    ESP_LOGI(TAG, "Hardware configuration:");
    ESP_LOGI(TAG, "  - OUTPUT_ENABLED_PIN: GPIO%d (enabled)", OUTPUT_ENABLED_PIN);
    ESP_LOGI(TAG, "  - I2C SDA: GPIO%d", I2C_MASTER_SDA_IO);
    ESP_LOGI(TAG, "  - I2C SCL: GPIO%d", I2C_MASTER_SCL_IO);
    ESP_LOGI(TAG, "  - TCAL6416 address: 0x%02X", TCAL6416_I2C_ADDR);
    
    // Print initial status
    tcal6416_print_status(&tcal_handle);
    
    // Run individual pin test first
    test_individual_pins();

    // Set all pins in port 0 to HIGH
    ESP_LOGI(TAG, "Setting all PORT 0 pins to HIGH...");
    ret = tcal6416_set_port(&tcal_handle, TCAL6416_PORT1, 0xFF);
    if (ret == ESP_OK) {
        ESP_LOGI(TAG, "All PORT 0 pins set to HIGH successfully");
    } else {
        ESP_LOGE(TAG, "Failed to set all PORT 0 pins HIGH: %s", esp_err_to_name(ret));
    }
    
    tcal6416_print_status(&tcal_handle);
    // Create demo task for continuous operation
    xTaskCreate(tcal6416_demo_task, "tcal6416_demo", 4096, NULL, 5, NULL);
    
    ESP_LOGI(TAG, "Application started - monitor output for pin cycling demo");
}
