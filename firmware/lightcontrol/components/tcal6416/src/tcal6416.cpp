/**
 * @file tcal6416.cpp
 * @brief TCAL6416 16-bit I/O Expander Driver - Simple C++ Implementation using ESP-IDF I2C Master
 */

#include "tcal6416.hpp"
#include "esp_log.h"

namespace tcal6416 {

static const char* TAG = "tcal6416";

// Device implementation
Device::Device(i2c_master_bus_handle_t bus_handle, uint8_t i2c_address, const Config& config)
    : i2c_dev_handle_(nullptr), i2c_address_(i2c_address), config_(config), initialized_(false) {
    
    // Print driver version at initialization
    ESP_LOGI(TAG, "TCAL6416 Driver Version: 1.0.0");
    
    try {
        // Validate parameters
        if (!bus_handle) {
            throw InvalidArgumentException("Bus handle is null");
        }
        validateAddress(i2c_address);
        
        // Create I2C device using ESP-IDF I2C Master
        i2c_device_config_t dev_cfg = {
            .device_address = i2c_address,
            .scl_speed_hz = 100000, // Default to 100kHz
        };
        
        esp_err_t ret = i2c_master_bus_add_device(bus_handle, &dev_cfg, &i2c_dev_handle_);
        if (ret != ESP_OK) {
            throw InitializationException("Failed to add I2C device: " + std::string(esp_err_to_name(ret)), ret);
        }
        
        ESP_LOGI(TAG, "I2C device added at address 0x%02X", i2c_address);
        
        // Apply configuration
        applyConfiguration();
        
        initialized_ = true;
        
        ESP_LOGI(TAG, "TCAL6416 initialized successfully at address 0x%02X", i2c_address_);
        
    } catch (...) {
        // Cleanup on exception
        if (i2c_dev_handle_) {
            i2c_master_bus_rm_device(i2c_dev_handle_);
            i2c_dev_handle_ = nullptr;
        }
        throw; // Re-throw the exception
    }
}

Device::~Device() {
    if (initialized_ && i2c_dev_handle_) {
        esp_err_t ret = i2c_master_bus_rm_device(i2c_dev_handle_);
        if (ret != ESP_OK) {
            ESP_LOGE(TAG, "Failed to remove I2C device: %s", esp_err_to_name(ret));
        }
        ESP_LOGI(TAG, "TCAL6416 deinitialized");
    }
}

Device::Device(Device&& other) noexcept
    : i2c_dev_handle_(other.i2c_dev_handle_),
      i2c_address_(other.i2c_address_),
      config_(other.config_),
      initialized_(other.initialized_) {
    
    other.i2c_dev_handle_ = nullptr;
    other.initialized_ = false;
}

Device& Device::operator=(Device&& other) noexcept {
    if (this != &other) {
        // Clean up current resources
        if (initialized_ && i2c_dev_handle_) {
            i2c_master_bus_rm_device(i2c_dev_handle_);
        }
        
        // Move resources
        i2c_dev_handle_ = other.i2c_dev_handle_;
        i2c_address_ = other.i2c_address_;
        config_ = other.config_;
        initialized_ = other.initialized_;
        
        // Clear other object
        other.i2c_dev_handle_ = nullptr;
        other.initialized_ = false;
    }
    return *this;
}

void Device::setPin(uint8_t pin, bool state) {
    validatePin(pin);
    
    // Check if pin is configured as output
    Port port = (pin < 8) ? Port::PORT0 : Port::PORT1;
    uint8_t port_pin = pin % 8;
    uint8_t port_config = (port == Port::PORT0) ? config_.port0_config : config_.port1_config;
    
    if (port_config & (1 << port_pin)) {
        throw InvalidStateException("Pin " + std::to_string(pin) + " is configured as input");
    }
    
    Register reg_addr = (port == Port::PORT0) ? Register::OUTPUT_PORT0 : Register::OUTPUT_PORT1;
    
    // Read current port state
    uint8_t current_state = readRegisterInternal(reg_addr);
    
    // Modify the specific pin
    if (state) {
        current_state |= (1 << port_pin);   // Set bit
    } else {
        current_state &= ~(1 << port_pin);  // Clear bit
    }
    
    // Write back the modified state
    writeRegisterInternal(reg_addr, current_state);
}

bool Device::getPin(uint8_t pin) {
    validatePin(pin);
    
    Port port = (pin < 8) ? Port::PORT0 : Port::PORT1;
    uint8_t port_pin = pin % 8;
    Register reg_addr = (port == Port::PORT0) ? Register::INPUT_PORT0 : Register::INPUT_PORT1;
    
    // Read port state
    uint8_t port_state = readRegisterInternal(reg_addr);
    
    // Extract the specific pin state
    return (port_state & (1 << port_pin)) != 0;
}

void Device::setPort(Port port, uint8_t value) {
    Register reg_addr = (port == Port::PORT0) ? Register::OUTPUT_PORT0 : Register::OUTPUT_PORT1;
    writeRegisterInternal(reg_addr, value);
}

uint8_t Device::readPort(Port port) {
    Register reg_addr = (port == Port::PORT0) ? Register::INPUT_PORT0 : Register::INPUT_PORT1;
    return readRegisterInternal(reg_addr);
}

void Device::configPin(uint8_t pin, PinDirection direction) {
    validatePin(pin);
    
    Port port = (pin < 8) ? Port::PORT0 : Port::PORT1;
    uint8_t port_pin = pin % 8;
    Register reg_addr = (port == Port::PORT0) ? Register::CONFIG_PORT0 : Register::CONFIG_PORT1;
    
    // Read current configuration
    uint8_t current_config = readRegisterInternal(reg_addr);
    
    // Modify the specific pin configuration
    if (direction == PinDirection::INPUT) {
        current_config |= (1 << port_pin);   // Set bit for input
    } else {
        current_config &= ~(1 << port_pin);  // Clear bit for output
    }
    
    // Write back the modified configuration
    writeRegisterInternal(reg_addr, current_config);
    
    // Update internal config
    if (port == Port::PORT0) {
        config_.port0_config = current_config;
    } else {
        config_.port1_config = current_config;
    }
}

void Device::configPort(Port port, uint8_t config) {
    Register reg_addr = (port == Port::PORT0) ? Register::CONFIG_PORT0 : Register::CONFIG_PORT1;
    writeRegisterInternal(reg_addr, config);
    
    // Update internal config
    if (port == Port::PORT0) {
        config_.port0_config = config;
    } else {
        config_.port1_config = config;
    }
}

void Device::setPinPolarity(uint8_t pin, bool inverted) {
    validatePin(pin);
    
    Port port = (pin < 8) ? Port::PORT0 : Port::PORT1;
    uint8_t port_pin = pin % 8;
    Register reg_addr = (port == Port::PORT0) ? Register::POL_INV_PORT0 : Register::POL_INV_PORT1;
    
    // Read current polarity setting
    uint8_t current_polarity = readRegisterInternal(reg_addr);
    
    // Modify the specific pin polarity
    if (inverted) {
        current_polarity |= (1 << port_pin);   // Set bit for inverted
    } else {
        current_polarity &= ~(1 << port_pin);  // Clear bit for normal
    }
    
    // Write back the modified polarity
    writeRegisterInternal(reg_addr, current_polarity);
}

void Device::setPinDriveStrength(uint8_t pin, DriveStrength strength) {
    validatePin(pin);
    
    Port port = (pin < 8) ? Port::PORT0 : Port::PORT1;
    uint8_t port_pin = pin % 8;
    
    // TCAL6416 uses two registers per port for drive strength (2-bit per pin)
    Register reg0_addr = (port == Port::PORT0) ? Register::OUTPUT_DRIVE_0_PORT0 : Register::OUTPUT_DRIVE_0_PORT1;
    Register reg1_addr = (port == Port::PORT0) ? Register::OUTPUT_DRIVE_1_PORT0 : Register::OUTPUT_DRIVE_1_PORT1;
    
    // Read current drive strength registers
    uint8_t drive0 = readRegisterInternal(reg0_addr);
    uint8_t drive1 = readRegisterInternal(reg1_addr);
    
    // Clear the current pin's drive strength bits
    uint8_t pin_mask = (1 << port_pin);
    drive0 &= ~pin_mask;
    drive1 &= ~pin_mask;
    
    // Set the new drive strength (2-bit value split across two registers)
    uint8_t strength_val = static_cast<uint8_t>(strength);
    if (strength_val & 0x01) {
        drive0 |= pin_mask;  // Set bit 0 of drive strength
    }
    if (strength_val & 0x02) {
        drive1 |= pin_mask;  // Set bit 1 of drive strength
    }
    
    // Write back the modified drive strength registers
    writeRegisterInternal(reg0_addr, drive0);
    writeRegisterInternal(reg1_addr, drive1);
}

void Device::setPortDriveStrength(Port port, DriveStrength strength) {
    Register reg0_addr = (port == Port::PORT0) ? Register::OUTPUT_DRIVE_0_PORT0 : Register::OUTPUT_DRIVE_0_PORT1;
    Register reg1_addr = (port == Port::PORT0) ? Register::OUTPUT_DRIVE_1_PORT0 : Register::OUTPUT_DRIVE_1_PORT1;
    
    // Calculate register values for all pins in the port
    uint8_t strength_val = static_cast<uint8_t>(strength);
    uint8_t drive0_val = (strength_val & 0x01) ? 0xFF : 0x00;  // Bit 0 of drive strength
    uint8_t drive1_val = (strength_val & 0x02) ? 0xFF : 0x00;  // Bit 1 of drive strength
    
    // Write drive strength registers
    writeRegisterInternal(reg0_addr, drive0_val);
    writeRegisterInternal(reg1_addr, drive1_val);
}

// Public register access
// Public register access
uint8_t Device::readRegister(Register reg) {
    return readRegisterInternal(reg);
}

// Private methods
void Device::writeRegisterInternal(Register reg_addr, uint8_t data) {
    uint8_t write_buf[2] = {static_cast<uint8_t>(reg_addr), data};
    esp_err_t ret = i2c_master_transmit(i2c_dev_handle_, write_buf, sizeof(write_buf), 1000);
    
    if (ret != ESP_OK) {
        throw CommunicationException("Failed to write register 0x" + 
                                    std::to_string(static_cast<uint8_t>(reg_addr)) + 
                                    ": " + esp_err_to_name(ret), ret);
    }
}

uint8_t Device::readRegisterInternal(Register reg_addr) {
    uint8_t reg = static_cast<uint8_t>(reg_addr);
    uint8_t data;
    esp_err_t ret = i2c_master_transmit_receive(i2c_dev_handle_, &reg, 1, &data, 1, 1000);
    
    if (ret != ESP_OK) {
        throw CommunicationException("Failed to read register 0x" + 
                                    std::to_string(static_cast<uint8_t>(reg_addr)) + 
                                    ": " + esp_err_to_name(ret), ret);
    }
    
    return data;
}

void Device::applyConfiguration() {
    ESP_LOGI(TAG, "Applying TCAL6416 configuration...");
    try {
        // Apply configuration
        writeRegisterInternal(Register::CONFIG_PORT0, config_.port0_config);
        writeRegisterInternal(Register::CONFIG_PORT1, config_.port1_config);
        
        // Set polarity inversion
        writeRegisterInternal(Register::POL_INV_PORT0, config_.port0_polarity);
        writeRegisterInternal(Register::POL_INV_PORT1, config_.port1_polarity);
        
        // Set initial output values
        writeRegisterInternal(Register::OUTPUT_PORT0, config_.port0_initial_output);
        writeRegisterInternal(Register::OUTPUT_PORT1, config_.port1_initial_output);
        
        // Set drive strength
        setPortDriveStrength(Port::PORT0, config_.port0_drive_strength);
        setPortDriveStrength(Port::PORT1, config_.port1_drive_strength);
        
    } catch (const CommunicationException& e) {
        throw InitializationException("Failed to apply configuration: " + std::string(e.what()), e.getErrorCode());
    }
}

void Device::validateAddress(uint8_t address) {
    if (address < 0x20 || address > 0x27) {
        throw InvalidArgumentException("Invalid I2C address: 0x" + 
                                      std::to_string(address) + 
                                      " (valid range: 0x20-0x27)");
    }
}

void Device::validatePin(uint8_t pin) {
    if (pin >= 16) {
        throw InvalidArgumentException("Invalid pin number: " + 
                                      std::to_string(pin) + 
                                      " (valid: 0-15)");
    }
}

// Convenience functions
std::unique_ptr<Device> createDevice(i2c_master_bus_handle_t bus_handle, uint8_t i2c_address) {
    return std::make_unique<Device>(bus_handle, i2c_address);
}

std::unique_ptr<Device> createDevice(i2c_master_bus_handle_t bus_handle, uint8_t i2c_address, const Config& config) {
    return std::make_unique<Device>(bus_handle, i2c_address, config);
}

} // namespace tcal6416
