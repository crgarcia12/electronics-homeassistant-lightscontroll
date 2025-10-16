/**
 * @file tcal6416.c
 * @brief TCAL6416 16-bit I/O Expander Driver Implementation
 */

#include "tcal6416.h"
#include "esp_log.h"
#include "esp_check.h"
#include "driver/i2c.h"
#include <string.h>

static const char *TAG = "tcal6416";

// I2C operation parameters
#define I2C_MASTER_TIMEOUT_MS   1000
#define WRITE_BIT              I2C_MASTER_WRITE
#define READ_BIT               I2C_MASTER_READ
#define ACK_CHECK_EN           0x1
#define NACK_VAL               0x1

/**
 * @brief Write a byte to I2C device register
 */
static esp_err_t tcal6416_i2c_write_byte(const tcal6416_handle_t *handle, uint8_t reg_addr, uint8_t data)
{
    i2c_cmd_handle_t cmd = i2c_cmd_link_create();
    i2c_master_start(cmd);
    i2c_master_write_byte(cmd, (handle->i2c_address << 1) | WRITE_BIT, ACK_CHECK_EN);
    i2c_master_write_byte(cmd, reg_addr, ACK_CHECK_EN);
    i2c_master_write_byte(cmd, data, ACK_CHECK_EN);
    i2c_master_stop(cmd);
    
    esp_err_t ret = i2c_master_cmd_begin(handle->i2c_port, cmd, I2C_MASTER_TIMEOUT_MS / portTICK_PERIOD_MS);
    i2c_cmd_link_delete(cmd);
    
    return ret;
}

/**
 * @brief Read a byte from I2C device register
 */
static esp_err_t tcal6416_i2c_read_byte(const tcal6416_handle_t *handle, uint8_t reg_addr, uint8_t *data)
{
    i2c_cmd_handle_t cmd = i2c_cmd_link_create();
    i2c_master_start(cmd);
    i2c_master_write_byte(cmd, (handle->i2c_address << 1) | WRITE_BIT, ACK_CHECK_EN);
    i2c_master_write_byte(cmd, reg_addr, ACK_CHECK_EN);
    i2c_master_start(cmd);
    i2c_master_write_byte(cmd, (handle->i2c_address << 1) | READ_BIT, ACK_CHECK_EN);
    i2c_master_read_byte(cmd, data, NACK_VAL);
    i2c_master_stop(cmd);
    
    esp_err_t ret = i2c_master_cmd_begin(handle->i2c_port, cmd, I2C_MASTER_TIMEOUT_MS / portTICK_PERIOD_MS);
    i2c_cmd_link_delete(cmd);
    
    return ret;
}

esp_err_t tcal6416_init(tcal6416_handle_t *handle, uint8_t i2c_port, uint8_t i2c_address)
{
    ESP_RETURN_ON_FALSE(handle, ESP_ERR_INVALID_ARG, TAG, "Handle pointer is NULL");
    ESP_RETURN_ON_FALSE(i2c_address >= 0x20 && i2c_address <= 0x27, ESP_ERR_INVALID_ARG, 
                       TAG, "Invalid I2C address: 0x%02X (valid range: 0x20-0x27)", i2c_address);
    
    handle->i2c_address = i2c_address;
    handle->i2c_port = i2c_port;
    
    // Test communication
    esp_err_t ret = tcal6416_test_communication(handle);
    ESP_RETURN_ON_ERROR(ret, TAG, "Communication test failed");
    
    // Apply default configuration
    // Port 0: All outputs (0x00)
    ESP_RETURN_ON_ERROR(tcal6416_write_register(handle, TCAL6416_REG_CONFIG_PORT0, 0x00), 
                       TAG, "Failed to configure port 0");
    
    // Port 1: All inputs (0xFF)
    ESP_RETURN_ON_ERROR(tcal6416_write_register(handle, TCAL6416_REG_CONFIG_PORT1, 0xFF), 
                       TAG, "Failed to configure port 1");
    
    // Clear polarity inversion
    ESP_RETURN_ON_ERROR(tcal6416_write_register(handle, TCAL6416_REG_POL_INV_PORT0, 0x00), 
                       TAG, "Failed to set port 0 polarity");
    ESP_RETURN_ON_ERROR(tcal6416_write_register(handle, TCAL6416_REG_POL_INV_PORT1, 0x00), 
                       TAG, "Failed to set port 1 polarity");
    
    // Initialize outputs to LOW
    ESP_RETURN_ON_ERROR(tcal6416_write_register(handle, TCAL6416_REG_OUTPUT_PORT0, 0x00), 
                       TAG, "Failed to initialize port 0 outputs");
    
    ESP_LOGI(TAG, "TCAL6416 initialized successfully at address 0x%02X", i2c_address);
    ESP_LOGI(TAG, "Default config: Port 0 = outputs, Port 1 = inputs");
    
    return ESP_OK;
}

esp_err_t tcal6416_init_with_config(tcal6416_handle_t *handle, const tcal6416_config_t *config)
{
    ESP_RETURN_ON_FALSE(handle && config, ESP_ERR_INVALID_ARG, TAG, "Handle or config pointer is NULL");
    
    handle->i2c_address = config->i2c_address;
    handle->i2c_port = config->i2c_port;
    
    // Test communication
    ESP_RETURN_ON_ERROR(tcal6416_test_communication(handle), TAG, "Communication test failed");
    
    // Apply custom configuration
    ESP_RETURN_ON_ERROR(tcal6416_write_register(handle, TCAL6416_REG_CONFIG_PORT0, config->port0_config), 
                       TAG, "Failed to configure port 0");
    ESP_RETURN_ON_ERROR(tcal6416_write_register(handle, TCAL6416_REG_CONFIG_PORT1, config->port1_config), 
                       TAG, "Failed to configure port 1");
    ESP_RETURN_ON_ERROR(tcal6416_write_register(handle, TCAL6416_REG_POL_INV_PORT0, config->port0_polarity), 
                       TAG, "Failed to set port 0 polarity");
    ESP_RETURN_ON_ERROR(tcal6416_write_register(handle, TCAL6416_REG_POL_INV_PORT1, config->port1_polarity), 
                       TAG, "Failed to set port 1 polarity");
    
    ESP_LOGI(TAG, "TCAL6416 initialized with custom configuration");
    return ESP_OK;
}

esp_err_t tcal6416_test_communication(const tcal6416_handle_t *handle)
{
    ESP_RETURN_ON_FALSE(handle, ESP_ERR_INVALID_ARG, TAG, "Handle pointer is NULL");
    
    uint8_t test_data;
    esp_err_t ret = tcal6416_read_register(handle, TCAL6416_REG_INPUT_PORT0, &test_data);
    
    if (ret == ESP_OK) {
        ESP_LOGI(TAG, "Communication test successful with device at 0x%02X", handle->i2c_address);
    } else {
        ESP_LOGE(TAG, "Communication test failed with device at 0x%02X: %s", 
                 handle->i2c_address, esp_err_to_name(ret));
    }
    
    return ret;
}

esp_err_t tcal6416_write_register(const tcal6416_handle_t *handle, tcal6416_reg_t reg_addr, uint8_t data)
{
    ESP_RETURN_ON_FALSE(handle, ESP_ERR_INVALID_ARG, TAG, "Handle pointer is NULL");
    return tcal6416_i2c_write_byte(handle, (uint8_t)reg_addr, data);
}

esp_err_t tcal6416_read_register(const tcal6416_handle_t *handle, tcal6416_reg_t reg_addr, uint8_t *data)
{
    ESP_RETURN_ON_FALSE(handle && data, ESP_ERR_INVALID_ARG, TAG, "Handle or data pointer is NULL");
    return tcal6416_i2c_read_byte(handle, (uint8_t)reg_addr, data);
}

esp_err_t tcal6416_set_pin(const tcal6416_handle_t *handle, uint8_t pin, bool state)
{
    ESP_RETURN_ON_FALSE(handle, ESP_ERR_INVALID_ARG, TAG, "Handle pointer is NULL");
    ESP_RETURN_ON_FALSE(pin < 16, ESP_ERR_INVALID_ARG, TAG, "Invalid pin number: %d (valid: 0-15)", pin);
    
    tcal6416_port_t port = (pin < 8) ? TCAL6416_PORT0 : TCAL6416_PORT1;
    uint8_t port_pin = pin % 8;
    tcal6416_reg_t reg_addr = (port == TCAL6416_PORT0) ? TCAL6416_REG_OUTPUT_PORT0 : TCAL6416_REG_OUTPUT_PORT1;
    
    // Read current port state
    uint8_t current_state;
    ESP_RETURN_ON_ERROR(tcal6416_read_register(handle, reg_addr, &current_state), 
                       TAG, "Failed to read current port state");
    
    // Modify the specific pin
    if (state) {
        current_state |= (1 << port_pin);   // Set bit
    } else {
        current_state &= ~(1 << port_pin);  // Clear bit
    }
    
    // Write back the modified state
    return tcal6416_write_register(handle, reg_addr, current_state);
}

esp_err_t tcal6416_get_pin(const tcal6416_handle_t *handle, uint8_t pin, bool *state)
{
    ESP_RETURN_ON_FALSE(handle && state, ESP_ERR_INVALID_ARG, TAG, "Handle or state pointer is NULL");
    ESP_RETURN_ON_FALSE(pin < 16, ESP_ERR_INVALID_ARG, TAG, "Invalid pin number: %d (valid: 0-15)", pin);
    
    tcal6416_port_t port = (pin < 8) ? TCAL6416_PORT0 : TCAL6416_PORT1;
    uint8_t port_pin = pin % 8;
    tcal6416_reg_t reg_addr = (port == TCAL6416_PORT0) ? TCAL6416_REG_INPUT_PORT0 : TCAL6416_REG_INPUT_PORT1;
    
    // Read port state
    uint8_t port_state;
    ESP_RETURN_ON_ERROR(tcal6416_read_register(handle, reg_addr, &port_state), 
                       TAG, "Failed to read port state");
    
    // Extract the specific pin state
    *state = (port_state & (1 << port_pin)) != 0;
    
    return ESP_OK;
}

esp_err_t tcal6416_set_port(const tcal6416_handle_t *handle, tcal6416_port_t port, uint8_t value)
{
    ESP_RETURN_ON_FALSE(handle, ESP_ERR_INVALID_ARG, TAG, "Handle pointer is NULL");
    ESP_RETURN_ON_FALSE(port <= TCAL6416_PORT1, ESP_ERR_INVALID_ARG, TAG, "Invalid port: %d (valid: 0-1)", port);
    
    tcal6416_reg_t reg_addr = (port == TCAL6416_PORT0) ? TCAL6416_REG_OUTPUT_PORT0 : TCAL6416_REG_OUTPUT_PORT1;
    return tcal6416_write_register(handle, reg_addr, value);
}

esp_err_t tcal6416_read_port(const tcal6416_handle_t *handle, tcal6416_port_t port, uint8_t *value)
{
    ESP_RETURN_ON_FALSE(handle && value, ESP_ERR_INVALID_ARG, TAG, "Handle or value pointer is NULL");
    ESP_RETURN_ON_FALSE(port <= TCAL6416_PORT1, ESP_ERR_INVALID_ARG, TAG, "Invalid port: %d (valid: 0-1)", port);
    
    tcal6416_reg_t reg_addr = (port == TCAL6416_PORT0) ? TCAL6416_REG_INPUT_PORT0 : TCAL6416_REG_INPUT_PORT1;
    return tcal6416_read_register(handle, reg_addr, value);
}

esp_err_t tcal6416_config_pin(const tcal6416_handle_t *handle, uint8_t pin, tcal6416_pin_dir_t direction)
{
    ESP_RETURN_ON_FALSE(handle, ESP_ERR_INVALID_ARG, TAG, "Handle pointer is NULL");
    ESP_RETURN_ON_FALSE(pin < 16, ESP_ERR_INVALID_ARG, TAG, "Invalid pin number: %d (valid: 0-15)", pin);
    
    tcal6416_port_t port = (pin < 8) ? TCAL6416_PORT0 : TCAL6416_PORT1;
    uint8_t port_pin = pin % 8;
    tcal6416_reg_t reg_addr = (port == TCAL6416_PORT0) ? TCAL6416_REG_CONFIG_PORT0 : TCAL6416_REG_CONFIG_PORT1;
    
    // Read current configuration
    uint8_t current_config;
    ESP_RETURN_ON_ERROR(tcal6416_read_register(handle, reg_addr, &current_config), 
                       TAG, "Failed to read current configuration");
    
    // Modify the specific pin configuration
    if (direction == TCAL6416_PIN_INPUT) {
        current_config |= (1 << port_pin);   // Set bit for input
    } else {
        current_config &= ~(1 << port_pin);  // Clear bit for output
    }
    
    // Write back the modified configuration
    return tcal6416_write_register(handle, reg_addr, current_config);
}

esp_err_t tcal6416_config_port(const tcal6416_handle_t *handle, tcal6416_port_t port, uint8_t config)
{
    ESP_RETURN_ON_FALSE(handle, ESP_ERR_INVALID_ARG, TAG, "Handle pointer is NULL");
    ESP_RETURN_ON_FALSE(port <= TCAL6416_PORT1, ESP_ERR_INVALID_ARG, TAG, "Invalid port: %d (valid: 0-1)", port);
    
    tcal6416_reg_t reg_addr = (port == TCAL6416_PORT0) ? TCAL6416_REG_CONFIG_PORT0 : TCAL6416_REG_CONFIG_PORT1;
    return tcal6416_write_register(handle, reg_addr, config);
}

esp_err_t tcal6416_set_pin_polarity(const tcal6416_handle_t *handle, uint8_t pin, bool inverted)
{
    ESP_RETURN_ON_FALSE(handle, ESP_ERR_INVALID_ARG, TAG, "Handle pointer is NULL");
    ESP_RETURN_ON_FALSE(pin < 16, ESP_ERR_INVALID_ARG, TAG, "Invalid pin number: %d (valid: 0-15)", pin);
    
    tcal6416_port_t port = (pin < 8) ? TCAL6416_PORT0 : TCAL6416_PORT1;
    uint8_t port_pin = pin % 8;
    tcal6416_reg_t reg_addr = (port == TCAL6416_PORT0) ? TCAL6416_REG_POL_INV_PORT0 : TCAL6416_REG_POL_INV_PORT1;
    
    // Read current polarity setting
    uint8_t current_polarity;
    ESP_RETURN_ON_ERROR(tcal6416_read_register(handle, reg_addr, &current_polarity), 
                       TAG, "Failed to read current polarity");
    
    // Modify the specific pin polarity
    if (inverted) {
        current_polarity |= (1 << port_pin);   // Set bit for inverted
    } else {
        current_polarity &= ~(1 << port_pin);  // Clear bit for normal
    }
    
    // Write back the modified polarity
    return tcal6416_write_register(handle, reg_addr, current_polarity);
}

esp_err_t tcal6416_print_status(const tcal6416_handle_t *handle)
{
    ESP_RETURN_ON_FALSE(handle, ESP_ERR_INVALID_ARG, TAG, "Handle pointer is NULL");
    
    uint8_t reg_values[8];
    
    // Read all registers
    for (int i = 0; i < 8; i++) {
        esp_err_t ret = tcal6416_read_register(handle, (tcal6416_reg_t)i, &reg_values[i]);
        ESP_RETURN_ON_ERROR(ret, TAG, "Failed to read register 0x%02X", i);
    }
    
    ESP_LOGI(TAG, "=== TCAL6416 Status (Address: 0x%02X) ===", handle->i2c_address);
    ESP_LOGI(TAG, "Input Port 0:        0x%02X (P0_7-P0_0)", reg_values[0]);
    ESP_LOGI(TAG, "Input Port 1:        0x%02X (P1_7-P1_0)", reg_values[1]);
    ESP_LOGI(TAG, "Output Port 0:       0x%02X (P0_7-P0_0)", reg_values[2]);
    ESP_LOGI(TAG, "Output Port 1:       0x%02X (P1_7-P1_0)", reg_values[3]);
    ESP_LOGI(TAG, "Polarity Inv Port 0: 0x%02X", reg_values[4]);
    ESP_LOGI(TAG, "Polarity Inv Port 1: 0x%02X", reg_values[5]);
    ESP_LOGI(TAG, "Config Port 0:       0x%02X (1=in, 0=out)", reg_values[6]);
    ESP_LOGI(TAG, "Config Port 1:       0x%02X (1=in, 0=out)", reg_values[7]);
    ESP_LOGI(TAG, "=====================================");
    
    return ESP_OK;
}

void tcal6416_get_version(uint8_t *major, uint8_t *minor, uint8_t *patch)
{
    if (major) *major = TCAL6416_VERSION_MAJOR;
    if (minor) *minor = TCAL6416_VERSION_MINOR;
    if (patch) *patch = TCAL6416_VERSION_PATCH;
}