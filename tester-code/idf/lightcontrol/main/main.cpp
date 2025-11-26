/**
 * @file main.cpp
 * @brief ESP32-S3 Light Control with TCAL6416 I/O Expander - C++ Version
 * 
 * This example demonstrates how to use the TCAL6416 C++ driver
 * for controlling a 16-bit I/O expander via I2C with exception handling.
 * 
 * This example code is in the Public Domain (or CC0 licensed, at your option.)
 * Unless required by applicable law or agreed to in writing, this
 * software is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
 * CONDITIONS OF ANY KIND, either express or implied.
 */

#include <stdio.h>
#include <memory>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "driver/i2c_master.h"
#include "esp_log.h"
#include "tcal6416.hpp"

static const char *TAG = "main";

// I2C configuration
#define I2C_MASTER_SCL_IO           (gpio_num_t) 41     /*!< GPIO number used for I2C master clock */
#define I2C_MASTER_SDA_IO           (gpio_num_t)42     /*!< GPIO number used for I2C master data  */
#define I2C_MASTER_FREQ_HZ          100000 /*!< I2C master clock frequency */

// TCAL6416 configuration
#define TCAL6416_I2C_ADDR           0x20   /*!< TCAL6416 I2C address */

extern "C" void app_main(void)
{
    ESP_LOGI(TAG, "Starting ESP32-S3 TCAL6416 I/O Expander Example (C++ Version)");
    // Wait 1 second
    vTaskDelay(pdMS_TO_TICKS(1000));
    
    try {
        // Configure I2C master
        i2c_master_bus_config_t i2c_mst_config = {
            .i2c_port = I2C_NUM_0,
            .sda_io_num = I2C_MASTER_SDA_IO,
            .scl_io_num = I2C_MASTER_SCL_IO,
            .clk_source = I2C_CLK_SRC_DEFAULT,
            // .glitch_ignore_cnt = 7,
            // .intr_priority = 0,
            // .trans_queue_depth = 0,
            .flags = {
                .enable_internal_pullup = true,
            }
        };
        
        i2c_master_bus_handle_t bus_handle;
        esp_err_t ret = i2c_new_master_bus(&i2c_mst_config, &bus_handle);
        if (ret != ESP_OK) {
            ESP_LOGE(TAG, "Failed to create I2C master bus: %s", esp_err_to_name(ret));
            return;
        }

        ESP_LOGI(TAG, "I2C master bus created successfully");

        // TCAL6416 Configuration using C++ config structure
        tcal6416::Config tcal_config = {
            .port0_config = 0xFF,      // All pins as inputs (0xFF = all input, 0x00 = all output)
            .port1_config = 0x00,      // All pins as outputs
            .port0_polarity = 0x00,    // Normal polarity
            .port1_polarity = 0x00,    // Normal polarity
            .port0_initial_output = 0x00,  // Initial output low
            .port1_initial_output = 0x00,  // Initial output low
            .port0_drive_strength = tcal6416::DriveStrength::DRIVE_1_00X,  // Full drive strength for port 0
            .port1_drive_strength = tcal6416::DriveStrength::DRIVE_1_00X   // Full drive strength for port 1
        };

        // Initialize TCAL6416 using C++ device class with RAII
        auto tcal_device = std::make_unique<tcal6416::Device>(bus_handle, TCAL6416_I2C_ADDR, tcal_config);

        ESP_LOGI(TAG, "TCAL6416 initialized successfully");

        // Print initial status
        tcal_device->printStatus();

        // Example: Blink LED on P1_0 (Pin 8)
        uint8_t led_pin = 8;  // P1_0
        bool led_state = false;

        ESP_LOGI(TAG, "Starting LED blink on pin P1_%d (GPIO %d)", led_pin % 8, led_pin);

        while (1) {
            try {
                // Toggle LED
                led_state = !led_state;
                tcal_device->setPin(led_pin, led_state);
                ESP_LOGI(TAG, "LED %s (pin %d)", led_state ? "ON" : "OFF", led_pin);

                // Read input port 0 (as an example)
                uint8_t input_state = tcal_device->readPort(tcal6416::Port::PORT0);
                ESP_LOGI(TAG, "Input Port 0 state: 0x%02X", input_state);

                // Example: Read individual pin state from port 0
                for (int pin = 0; pin < 8; pin++) {
                    bool pin_state = tcal_device->getPin(pin);
                    if (pin_state) {  // Only log if pin is high to reduce spam
                        ESP_LOGI(TAG, "Pin P0_%d is HIGH", pin);
                    }
                }

            } catch (const tcal6416::CommunicationException& e) {
                ESP_LOGE(TAG, "Communication error: %s (ESP error: %s)", 
                         e.what(), esp_err_to_name(e.getErrorCode()));
                // Continue operation, might be temporary
            } catch (const tcal6416::InvalidStateException& e) {
                ESP_LOGE(TAG, "Invalid state error: %s", e.what());
                // Continue operation
            } catch (const tcal6416::TCAL6416Exception& e) {
                ESP_LOGE(TAG, "TCAL6416 error: %s", e.what());
                // Continue operation
            }

            // Wait 1 second
            vTaskDelay(pdMS_TO_TICKS(1000));
        }

        // RAII: tcal_device will be automatically cleaned up when it goes out of scope
        // The I2C bus should also be cleaned up
        ESP_LOGI(TAG, "Cleaning up I2C bus");
        i2c_del_master_bus(bus_handle);

    } catch (const tcal6416::InitializationException& e) {
        ESP_LOGE(TAG, "Initialization failed: %s (ESP error: %s)", e.what(), esp_err_to_name(e.getErrorCode()));
    } catch (const tcal6416::InvalidArgumentException& e) {
        ESP_LOGE(TAG, "Invalid argument: %s", e.what());
    } catch (const tcal6416::TCAL6416Exception& e) {
        ESP_LOGE(TAG, "TCAL6416 exception: %s", e.what());
    } catch (const std::exception& e) {
        ESP_LOGE(TAG, "Standard exception: %s", e.what());
    } catch (...) {
        ESP_LOGE(TAG, "Unknown exception occurred");
    }

    ESP_LOGI(TAG, "Application finished");
}