/**
 * @file tcal6416.hpp
 * @brief TCAL6416 16-bit I/O Expander Driver - C++ Interface
 * 
 * This driver provides a comprehensive C++ interface for the TCAL6416 I/O expander
 * with exception handling and modern C++ features.
 * 
 * Features:
 * - 16 I/O pins (2 ports × 8 pins)
 * - Individual pin control
 * - Port-level operations
 * - Configurable pin direction (input/output)
 * - Polarity inversion
 * - I2C interface with configurable address
 * - Exception-based error handling
 * - RAII resource management
 * 
 * @version 1.0.0
 * @author ESP32 Community
 */

#ifndef TCAL6416_HPP
#define TCAL6416_HPP

#include <stdint.h>
#include <memory>
#include <stdexcept>
#include <string>
#include "driver/i2c_master.h"
#include "esp_err.h"

namespace tcal6416 {

/**
 * @brief TCAL6416 specific exceptions
 */
class TCAL6416Exception : public std::runtime_error {
public:
    explicit TCAL6416Exception(const std::string& message, esp_err_t error_code = ESP_FAIL)
        : std::runtime_error(message), error_code_(error_code) {}
    
    esp_err_t getErrorCode() const noexcept { return error_code_; }

private:
    esp_err_t error_code_;
};

class InitializationException : public TCAL6416Exception {
public:
    explicit InitializationException(const std::string& message, esp_err_t error_code = ESP_FAIL)
        : TCAL6416Exception("Initialization failed: " + message, error_code) {}
};

class CommunicationException : public TCAL6416Exception {
public:
    explicit CommunicationException(const std::string& message, esp_err_t error_code = ESP_FAIL)
        : TCAL6416Exception("I2C communication failed: " + message, error_code) {}
};

class InvalidArgumentException : public TCAL6416Exception {
public:
    explicit InvalidArgumentException(const std::string& message)
        : TCAL6416Exception("Invalid argument: " + message, ESP_ERR_INVALID_ARG) {}
};

class InvalidStateException : public TCAL6416Exception {
public:
    explicit InvalidStateException(const std::string& message)
        : TCAL6416Exception("Invalid state: " + message, ESP_ERR_INVALID_STATE) {}
};

/**
 * @brief Driver version information
 */
struct Version {
    static constexpr uint8_t MAJOR = 1;
    static constexpr uint8_t MINOR = 0;
    static constexpr uint8_t PATCH = 0;
};

/**
 * @brief TCAL6416 Register addresses
 */
enum class Register : uint8_t {
    INPUT_PORT0           = 0x00,  ///< Input port 0 register (P0_7-P0_0)
    INPUT_PORT1           = 0x01,  ///< Input port 1 register (P1_7-P1_0)
    OUTPUT_PORT0          = 0x02,  ///< Output port 0 register (P0_7-P0_0)
    OUTPUT_PORT1          = 0x03,  ///< Output port 1 register (P1_7-P1_0)
    POL_INV_PORT0         = 0x04,  ///< Polarity inversion port 0
    POL_INV_PORT1         = 0x05,  ///< Polarity inversion port 1
    CONFIG_PORT0          = 0x06,  ///< Configuration port 0 (1=input, 0=output)
    CONFIG_PORT1          = 0x07,  ///< Configuration port 1 (1=input, 0=output)
    OUTPUT_DRIVE_0_PORT0  = 0x40,  ///< Output drive strength 0 for port 0
    OUTPUT_DRIVE_0_PORT1  = 0x41,  ///< Output drive strength 0 for port 1
    OUTPUT_DRIVE_1_PORT0  = 0x42,  ///< Output drive strength 1 for port 0
    OUTPUT_DRIVE_1_PORT1  = 0x43,  ///< Output drive strength 1 for port 1
};

/**
 * @brief Output drive strength definitions
 */
enum class DriveStrength : uint8_t {
    DRIVE_0_25X = 0,  ///< 0.25x drive strength (weakest, more open-drain like)
    DRIVE_0_50X = 1,  ///< 0.5x drive strength
    DRIVE_0_75X = 2,  ///< 0.75x drive strength
    DRIVE_1_00X = 3,  ///< 1.0x drive strength (strongest, full push-pull)
};

/**
 * @brief Port definitions
 */
enum class Port : uint8_t {
    PORT0 = 0,  ///< Port 0 (pins 0-7)
    PORT1 = 1,  ///< Port 1 (pins 8-15)
};

/**
 * @brief Pin direction definitions
 */
enum class PinDirection : uint8_t {
    OUTPUT = 0,  ///< Configure pin as output
    INPUT  = 1,  ///< Configure pin as input
};

/**
 * @brief TCAL6416 configuration structure
 */
struct Config {
    uint8_t port0_config = 0xFF;        ///< Port 0 configuration (1=input, 0=output per bit)
    uint8_t port1_config = 0x00;        ///< Port 1 configuration (1=input, 0=output per bit)
    uint8_t port0_polarity = 0x00;      ///< Port 0 polarity inversion (1=inverted, 0=normal)
    uint8_t port1_polarity = 0x00;      ///< Port 1 polarity inversion (1=inverted, 0=normal)
    uint8_t port0_initial_output = 0x00; ///< Port 0 initial output state (for output pins)
    uint8_t port1_initial_output = 0x00; ///< Port 1 initial output state (for output pins)
    DriveStrength port0_drive_strength = DriveStrength::DRIVE_1_00X; ///< Port 0 drive strength
    DriveStrength port1_drive_strength = DriveStrength::DRIVE_1_00X; ///< Port 1 drive strength

    /**
     * @brief Get default configuration
     * 
     * Default configuration:
     * - Port 0: All pins as inputs (0xFF)
     * - Port 1: All pins as outputs (0x00)
     * - No polarity inversion
     * - Initial outputs: LOW
     * - Drive strength: 1.0x (full strength)
     */
    static Config getDefault() {
        return Config{};  // Uses default member initializers
    }
};

/**
 * @brief TCAL6416 device class with RAII and exception handling
 */
class Device {
public:
    /**
     * @brief I2C base address (7-bit)
     * Can be modified with A2, A1, A0 pins to addresses 0x20-0x27
     */
    static constexpr uint8_t ADDR_BASE = 0x20;
    
    /**
     * @brief Constructor - Initialize TCAL6416 device
     * 
     * @param bus_handle I2C master bus handle
     * @param i2c_address I2C address of the TCAL6416 device (0x20-0x27)
     * @param config Device configuration
     * 
     * @throws InitializationException if initialization fails
     * @throws InvalidArgumentException if parameters are invalid
     * @throws CommunicationException if I2C communication fails
     */
    Device(i2c_master_bus_handle_t bus_handle, uint8_t i2c_address, const Config& config = Config::getDefault());
    
    /**
     * @brief Destructor - Automatically cleans up resources (RAII)
     */
    ~Device();
    
    // Delete copy constructor and assignment operator (move-only semantics)
    Device(const Device&) = delete;
    Device& operator=(const Device&) = delete;
    
    // Move constructor and assignment operator
    Device(Device&& other) noexcept;
    Device& operator=(Device&& other) noexcept;
    
    /**
     * @brief Set output state of a specific pin
     * 
     * @param pin Pin number (0-15)
     * @param state Pin state (true=HIGH, false=LOW)
     * 
     * @throws InvalidArgumentException if pin number is invalid
     * @throws InvalidStateException if pin is configured as input
     * @throws CommunicationException if I2C communication fails
     */
    void setPin(uint8_t pin, bool state);
    
    /**
     * @brief Get input state of a specific pin
     * 
     * @param pin Pin number (0-15)
     * @return Pin state (true=HIGH, false=LOW)
     * 
     * @throws InvalidArgumentException if pin number is invalid
     * @throws CommunicationException if I2C communication fails
     */
    bool getPin(uint8_t pin);
    
    /**
     * @brief Set output state of an entire port
     * 
     * @param port Port number
     * @param value 8-bit value to set on the port
     * 
     * @throws InvalidArgumentException if port is invalid
     * @throws CommunicationException if I2C communication fails
     */
    void setPort(Port port, uint8_t value);
    
    /**
     * @brief Read input state of an entire port
     * 
     * @param port Port number
     * @return 8-bit port value
     * 
     * @throws InvalidArgumentException if port is invalid
     * @throws CommunicationException if I2C communication fails
     */
    uint8_t readPort(Port port);
    
    /**
     * @brief Configure pin direction for a specific pin
     * 
     * @param pin Pin number (0-15)
     * @param direction Pin direction
     * 
     * @throws InvalidArgumentException if pin number is invalid
     * @throws CommunicationException if I2C communication fails
     */
    void configPin(uint8_t pin, PinDirection direction);
    
    /**
     * @brief Configure pin direction for an entire port
     * 
     * @param port Port number
     * @param config 8-bit configuration value (1=input, 0=output per bit)
     * 
     * @throws InvalidArgumentException if port is invalid
     * @throws CommunicationException if I2C communication fails
     */
    void configPort(Port port, uint8_t config);
    
    /**
     * @brief Set polarity inversion for a specific pin
     * 
     * @param pin Pin number (0-15)
     * @param inverted true to invert polarity, false for normal
     * 
     * @throws InvalidArgumentException if pin number is invalid
     * @throws CommunicationException if I2C communication fails
     */
    void setPinPolarity(uint8_t pin, bool inverted);
    
    /**
     * @brief Set output drive strength for a specific pin
     * 
     * @param pin Pin number (0-15)
     * @param strength Drive strength setting
     * 
     * @throws InvalidArgumentException if pin number is invalid
     * @throws CommunicationException if I2C communication fails
     */
    void setPinDriveStrength(uint8_t pin, DriveStrength strength);
    
    /**
     * @brief Set output drive strength for an entire port
     * 
     * @param port Port number
     * @param strength Drive strength setting (applied to all pins in the port)
     * 
     * @throws InvalidArgumentException if port is invalid
     * @throws CommunicationException if I2C communication fails
     */
    void setPortDriveStrength(Port port, DriveStrength strength);
    
    /**
     * @brief Read a register value
     * 
     * @param reg Register to read
     * @return Register value
     * 
     * @throws CommunicationException if I2C communication fails
     */
    uint8_t readRegister(Register reg);
    
    /**
     * @brief Get I2C address of the device
     * 
     * @return I2C address
     */
    uint8_t getI2CAddress() const noexcept { return i2c_address_; }
    
    /**
     * @brief Get current configuration
     * 
     * @return Current device configuration
     */
    const Config& getConfig() const noexcept { return config_; }
    
    /**
     * @brief Get driver version information
     * 
     * @return Version structure
     */
    static Version getVersion() noexcept {
        return Version{};
    }

private:
    i2c_master_dev_handle_t i2c_dev_handle_;
    uint8_t i2c_address_;
    Config config_;
    bool initialized_;
    
    /**
     * @brief Write a byte to I2C device register (internal use)
     * 
     * @param reg_addr Register address
     * @param data Data to write
     * 
     * @throws CommunicationException if I2C communication fails
     */
    void writeRegisterInternal(Register reg_addr, uint8_t data);
    
    /**
     * @brief Read a byte from I2C device register (internal use)
     * 
     * @param reg_addr Register address
     * @return Read data
     * 
     * @throws CommunicationException if I2C communication fails
     */
    uint8_t readRegisterInternal(Register reg_addr);
    
    /**
     * @brief Test device communication
     * 
     * @throws CommunicationException if communication test fails
     */
    void testCommunication();
    
    /**
     * @brief Apply configuration to device
     * 
     * @throws CommunicationException if I2C communication fails
     */
    void applyConfiguration();
    
    /**
     * @brief Check if address is valid
     * 
     * @param address I2C address to check
     * @throws InvalidArgumentException if address is invalid
     */
    static void validateAddress(uint8_t address);
    
    /**
     * @brief Check if pin number is valid
     * 
     * @param pin Pin number to check
     * @throws InvalidArgumentException if pin is invalid
     */
    static void validatePin(uint8_t pin);
};

/**
 * @brief Convenience function to create a device with default configuration
 * 
 * @param bus_handle I2C master bus handle
 * @param i2c_address I2C address (0x20-0x27)
 * @return Unique pointer to the device
 * 
 * @throws InitializationException if initialization fails
 * @throws InvalidArgumentException if parameters are invalid
 * @throws CommunicationException if I2C communication fails
 */
std::unique_ptr<Device> createDevice(i2c_master_bus_handle_t bus_handle, uint8_t i2c_address);

/**
 * @brief Convenience function to create a device with custom configuration
 * 
 * @param bus_handle I2C master bus handle
 * @param i2c_address I2C address (0x20-0x27)
 * @param config Device configuration
 * @return Unique pointer to the device
 * 
 * @throws InitializationException if initialization fails
 * @throws InvalidArgumentException if parameters are invalid
 * @throws CommunicationException if I2C communication fails
 */
std::unique_ptr<Device> createDevice(i2c_master_bus_handle_t bus_handle, uint8_t i2c_address, const Config& config);

} // namespace tcal6416

#endif // TCAL6416_HPP