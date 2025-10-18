/**
 * @file tcal6416.h
 * @brief TCAL6416 16-bit I/O Expander Driver
 * 
 * This driver provides a comprehensive interface for the TCAL6416 I/O expander.
 * The TCAL6416 is a 16-bit I/O expander with I2C interface, providing 16 pins
 * organized as two 8-bit ports.
 * 
 * Features:
 * - 16 I/O pins (2 ports × 8 pins)
 * - Individual pin control
 * - Port-level operations
 * - Configurable pin direction (input/output)
 * - Polarity inversion
 * - I2C interface with configurable address
 * 
 * @version 1.0.0
 * @author ESP32 Community
 */

#ifndef TCAL6416_H
#define TCAL6416_H

#include "esp_err.h"
#include <stdint.h>
#include <stdbool.h>

#ifdef __cplusplus
extern "C" {
#endif

/**
 * @brief Driver version information
 */
#define TCAL6416_VERSION_MAJOR  1
#define TCAL6416_VERSION_MINOR  0
#define TCAL6416_VERSION_PATCH  0

/**
 * @brief TCAL6416 I2C base address (7-bit)
 * Can be modified with A2, A1, A0 pins to addresses 0x20-0x27
 */
#define TCAL6416_ADDR_BASE          0x20

/**
 * @brief TCAL6416 Register addresses
 */
typedef enum {
    TCAL6416_REG_INPUT_PORT0           = 0x00,  ///< Input port 0 register (P0_7-P0_0)
    TCAL6416_REG_INPUT_PORT1           = 0x01,  ///< Input port 1 register (P1_7-P1_0)
    TCAL6416_REG_OUTPUT_PORT0          = 0x02,  ///< Output port 0 register (P0_7-P0_0)
    TCAL6416_REG_OUTPUT_PORT1          = 0x03,  ///< Output port 1 register (P1_7-P1_0)
    TCAL6416_REG_POL_INV_PORT0         = 0x04,  ///< Polarity inversion port 0
    TCAL6416_REG_POL_INV_PORT1         = 0x05,  ///< Polarity inversion port 1
    TCAL6416_REG_CONFIG_PORT0          = 0x06,  ///< Configuration port 0 (1=input, 0=output)
    TCAL6416_REG_CONFIG_PORT1          = 0x07,  ///< Configuration port 1 (1=input, 0=output)
    TCAL6416_REG_OUTPUT_DRIVE_0_PORT0  = 0x40,  ///< Output drive strength 0 for port 0
    TCAL6416_REG_OUTPUT_DRIVE_0_PORT1  = 0x41,  ///< Output drive strength 0 for port 1
    TCAL6416_REG_OUTPUT_DRIVE_1_PORT0  = 0x42,  ///< Output drive strength 1 for port 0
    TCAL6416_REG_OUTPUT_DRIVE_1_PORT1  = 0x43,  ///< Output drive strength 1 for port 1
} tcal6416_reg_t;

/**
 * @brief Output drive strength definitions
 */
typedef enum {
    TCAL6416_DRIVE_0_25X = 0,  ///< 0.25x drive strength (weakest, more open-drain like)
    TCAL6416_DRIVE_0_50X = 1,  ///< 0.5x drive strength
    TCAL6416_DRIVE_0_75X = 2,  ///< 0.75x drive strength
    TCAL6416_DRIVE_1_00X = 3,  ///< 1.0x drive strength (strongest, full push-pull)
} tcal6416_drive_strength_t;

/**
 * @brief Port definitions
 */
typedef enum {
    TCAL6416_PORT0 = 0,  ///< Port 0 (pins 0-7)
    TCAL6416_PORT1 = 1,  ///< Port 1 (pins 8-15)
} tcal6416_port_t;

/**
 * @brief Pin direction definitions
 */
typedef enum {
    TCAL6416_PIN_OUTPUT = 0,  ///< Configure pin as output
    TCAL6416_PIN_INPUT  = 1,  ///< Configure pin as input
} tcal6416_pin_dir_t;

/**
 * @brief TCAL6416 device handle
 */
typedef struct {
    uint8_t i2c_address;        ///< I2C address of the device
    uint8_t i2c_port;           ///< I2C port number
} tcal6416_handle_t;

/**
 * @brief TCAL6416 configuration structure
 */
typedef struct {
    uint8_t i2c_address;        ///< I2C address of the device (0x20-0x27)
    uint8_t i2c_port;           ///< I2C port number (usually 0 or 1)
    uint8_t port0_config;       ///< Port 0 configuration (1=input, 0=output per bit)
    uint8_t port1_config;       ///< Port 1 configuration (1=input, 0=output per bit)
    uint8_t port0_polarity;     ///< Port 0 polarity inversion (1=inverted, 0=normal)
    uint8_t port1_polarity;     ///< Port 1 polarity inversion (1=inverted, 0=normal)
} tcal6416_config_t;

/**
 * @brief Initialize TCAL6416 with default configuration
 * 
 * Default configuration:
 * - Port 0: All pins as outputs
 * - Port 1: All pins as inputs
 * - No polarity inversion
 * 
 * @param handle Pointer to device handle
 * @param i2c_port I2C port number
 * @param i2c_address I2C address of the TCAL6416 device
 * @return esp_err_t ESP_OK on success, error code otherwise
 */
esp_err_t tcal6416_init(tcal6416_handle_t *handle, uint8_t i2c_port, uint8_t i2c_address);

/**
 * @brief Initialize TCAL6416 with custom configuration
 * 
 * @param handle Pointer to device handle
 * @param config Pointer to configuration structure
 * @return esp_err_t ESP_OK on success, error code otherwise
 */
esp_err_t tcal6416_init_with_config(tcal6416_handle_t *handle, const tcal6416_config_t *config);

/**
 * @brief Test device communication
 * 
 * @param handle Pointer to device handle
 * @return esp_err_t ESP_OK if device responds, error code otherwise
 */
esp_err_t tcal6416_test_communication(const tcal6416_handle_t *handle);

/**
 * @brief Write data to a TCAL6416 register
 * 
 * @param handle Pointer to device handle
 * @param reg_addr Register address to write to
 * @param data Data to write
 * @return esp_err_t ESP_OK on success, error code otherwise
 */
esp_err_t tcal6416_write_register(const tcal6416_handle_t *handle, tcal6416_reg_t reg_addr, uint8_t data);

/**
 * @brief Read data from a TCAL6416 register
 * 
 * @param handle Pointer to device handle
 * @param reg_addr Register address to read from
 * @param data Pointer to store read data
 * @return esp_err_t ESP_OK on success, error code otherwise
 */
esp_err_t tcal6416_read_register(const tcal6416_handle_t *handle, tcal6416_reg_t reg_addr, uint8_t *data);

/**
 * @brief Set output state of a specific pin
 * 
 * @param handle Pointer to device handle
 * @param pin Pin number (0-15)
 * @param state Pin state (true=HIGH, false=LOW)
 * @return esp_err_t ESP_OK on success, error code otherwise
 */
esp_err_t tcal6416_set_pin(const tcal6416_handle_t *handle, uint8_t pin, bool state);

/**
 * @brief Get input state of a specific pin
 * 
 * @param handle Pointer to device handle
 * @param pin Pin number (0-15)
 * @param state Pointer to store pin state
 * @return esp_err_t ESP_OK on success, error code otherwise
 */
esp_err_t tcal6416_get_pin(const tcal6416_handle_t *handle, uint8_t pin, bool *state);

/**
 * @brief Set output state of an entire port
 * 
 * @param handle Pointer to device handle
 * @param port Port number (0 or 1)
 * @param value 8-bit value to set on the port
 * @return esp_err_t ESP_OK on success, error code otherwise
 */
esp_err_t tcal6416_set_port(const tcal6416_handle_t *handle, tcal6416_port_t port, uint8_t value);

/**
 * @brief Read input state of an entire port
 * 
 * @param handle Pointer to device handle
 * @param port Port number (0 or 1)
 * @param value Pointer to store port value
 * @return esp_err_t ESP_OK on success, error code otherwise
 */
esp_err_t tcal6416_read_port(const tcal6416_handle_t *handle, tcal6416_port_t port, uint8_t *value);

/**
 * @brief Configure pin direction for a specific pin
 * 
 * @param handle Pointer to device handle
 * @param pin Pin number (0-15)
 * @param direction Pin direction (TCAL6416_PIN_INPUT or TCAL6416_PIN_OUTPUT)
 * @return esp_err_t ESP_OK on success, error code otherwise
 */
esp_err_t tcal6416_config_pin(const tcal6416_handle_t *handle, uint8_t pin, tcal6416_pin_dir_t direction);

/**
 * @brief Configure pin direction for an entire port
 * 
 * @param handle Pointer to device handle
 * @param port Port number (0 or 1)
 * @param config 8-bit configuration value (1=input, 0=output per bit)
 * @return esp_err_t ESP_OK on success, error code otherwise
 */
esp_err_t tcal6416_config_port(const tcal6416_handle_t *handle, tcal6416_port_t port, uint8_t config);

/**
 * @brief Set polarity inversion for a specific pin
 * 
 * @param handle Pointer to device handle
 * @param pin Pin number (0-15)
 * @param inverted true to invert polarity, false for normal
 * @return esp_err_t ESP_OK on success, error code otherwise
 */
esp_err_t tcal6416_set_pin_polarity(const tcal6416_handle_t *handle, uint8_t pin, bool inverted);

/**
 * @brief Set output drive strength for a specific pin
 * 
 * @param handle Pointer to device handle
 * @param pin Pin number (0-15)
 * @param strength Drive strength setting
 * @return esp_err_t ESP_OK on success, error code otherwise
 */
esp_err_t tcal6416_set_pin_drive_strength(const tcal6416_handle_t *handle, uint8_t pin, tcal6416_drive_strength_t strength);

/**
 * @brief Set output drive strength for an entire port
 * 
 * @param handle Pointer to device handle
 * @param port Port number (0 or 1)
 * @param strength Drive strength setting (applied to all pins in the port)
 * @return esp_err_t ESP_OK on success, error code otherwise
 */
esp_err_t tcal6416_set_port_drive_strength(const tcal6416_handle_t *handle, tcal6416_port_t port, tcal6416_drive_strength_t strength);

/**
 * @brief Print complete TCAL6416 status and register values
 * 
 * @param handle Pointer to device handle
 * @return esp_err_t ESP_OK on success, error code otherwise
 */
esp_err_t tcal6416_print_status(const tcal6416_handle_t *handle);

/**
 * @brief Get driver version information
 * 
 * @param major Pointer to store major version
 * @param minor Pointer to store minor version
 * @param patch Pointer to store patch version
 */
void tcal6416_get_version(uint8_t *major, uint8_t *minor, uint8_t *patch);

#ifdef __cplusplus
}
#endif

#endif // TCAL6416_H