# Modular ESP32-S3 I2C + TCAL6416 Project Structure

This project has been refactored into a clean, modular architecture for better maintainability and reusability.

## 📁 Project Structure

```
main/
├── main.c    # Main application logic
├── i2c_driver.h           # I2C driver header
├── i2c_driver.c           # I2C driver implementation
├── tcal6416.hpp            # TCAL6416 driver header  
├── tcal6416.c            # TCAL6416 driver implementation
├── CMakeLists.txt        # Build configuration
└── idf_component.yml     # Component dependencies
```

## 🔧 Module Breakdown

### 1. I2C Driver Module (`i2c_driver.h` / `i2c_driver.c`)
**Purpose**: Generic I2C master functionality for ESP32-S3

**Key Features**:
- ✅ I2C master initialization and configuration
- ✅ Single byte read/write operations
- ✅ Multi-byte read/write operations  
- ✅ Device presence testing
- ✅ Comprehensive error handling and logging
- ✅ Configurable GPIO pins, frequency, and timeouts

**API Functions**:
```c
esp_err_t i2c_master_init(void);
esp_err_t i2c_master_deinit(void);
esp_err_t i2c_master_write_byte(uint8_t device_addr, uint8_t reg_addr, uint8_t data);
esp_err_t i2c_master_read_byte(uint8_t device_addr, uint8_t reg_addr, uint8_t *data);
esp_err_t i2c_master_write_bytes(uint8_t device_addr, uint8_t reg_addr, const uint8_t *data, size_t len);
esp_err_t i2c_master_read_bytes(uint8_t device_addr, uint8_t reg_addr, uint8_t *data, size_t len);
esp_err_t i2c_master_test_device(uint8_t device_addr);
```

### 2. TCAL6416 Driver Module (`tcal6416.hpp` / `tcal6416.cpp`)
**Purpose**: Specific functionality for TCAL6416 I/O expander

**Key Features**:
- ✅ Device initialization with default or custom configuration
- ✅ Individual pin control (16 pins total)
- ✅ Port-level operations (2 ports × 8 pins each)
- ✅ Pin direction configuration (input/output)
- ✅ Register-level access for advanced operations
- ✅ Status reporting and debugging functions

**API Functions**:
```c
esp_err_t tcal6416_init_default(uint8_t i2c_address);
esp_err_t tcal6416_init_config(const tcal6416_config_t *config);
esp_err_t tcal6416_set_pin(uint8_t i2c_address, uint8_t pin, bool state);
esp_err_t tcal6416_get_pin(uint8_t i2c_address, uint8_t pin, bool *state);
esp_err_t tcal6416_set_port(uint8_t i2c_address, uint8_t port, uint8_t value);
esp_err_t tcal6416_read_port(uint8_t i2c_address, uint8_t port, uint8_t *value);
esp_err_t tcal6416_config_pin(uint8_t i2c_address, uint8_t pin, uint8_t direction);
esp_err_t tcal6416_config_port(uint8_t i2c_address, uint8_t port, uint8_t config);
esp_err_t tcal6416_print_status(uint8_t i2c_address);
```

### 3. Main Application (`main.c`)
**Purpose**: Application-specific logic and demo functionality

**Key Features**:
- ✅ Clean application initialization
- ✅ Individual pin testing function
- ✅ Continuous demo task with cycling pins
- ✅ Comprehensive status reporting
- ✅ Binary representation of port states
- ✅ Error handling with helpful troubleshooting messages

## 🚀 Benefits of Modular Design

### **Reusability**
- I2C driver can be used with any I2C device
- TCAL6416 driver is portable across different projects
- Clean separation allows easy testing of individual modules

### **Maintainability** 
- Each module has a single responsibility
- Easy to debug issues in specific functionality
- Clear API boundaries between modules

### **Scalability**
- Easy to add support for additional I2C devices
- Can extend TCAL6416 functionality without touching main app
- Simple to add new application features

### **Readability**
- Main application logic is clean and focused
- Driver implementation details are hidden
- Self-documenting code with comprehensive logging

## 📋 Configuration

### I2C Configuration (in `i2c_driver.h`):
```c
#define I2C_MASTER_SCL_IO           22    // GPIO for I2C clock
#define I2C_MASTER_SDA_IO           21    // GPIO for I2C data  
#define I2C_MASTER_FREQ_HZ          100000 // I2C frequency (100kHz)
```

### Application Configuration (in `main.c`):
```c
#define TCAL6416_I2C_ADDR           0x20  // TCAL6416 I2C address
```

## 🔍 Usage Examples

### Basic Pin Control:
```c
// Initialize system
i2c_master_init();
tcal6416_init_default(0x20);

// Control individual pins
tcal6416_set_pin(0x20, 0, true);   // Set pin 0 HIGH
tcal6416_set_pin(0x20, 1, false);  // Set pin 1 LOW

// Read input pins
bool pin_state;
tcal6416_get_pin(0x20, 8, &pin_state);  // Read pin 8 (port 1)
```

### Port-Level Operations:
```c
// Set entire port at once
tcal6416_set_port(0x20, 0, 0xFF);  // All port 0 pins HIGH

// Read entire input port
uint8_t input_state;
tcal6416_read_port(0x20, 1, &input_state);  // Read all port 1 pins
```

### Custom Configuration:
```c
tcal6416_config_t config = {
    .i2c_address = 0x20,
    .port0_config = 0x0F,    // Pins 0-3 output, 4-7 input
    .port1_config = 0xFF,    // All inputs
    .port0_polarity = 0x00,  // Normal polarity
    .port1_polarity = 0x00   // Normal polarity
};
tcal6416_init_config(&config);
```

## 🛠️ Building and Testing

1. **Build the project**:
   ```bash
   idf.py build
   ```

2. **Flash and monitor**:
   ```bash
   idf.py -p COMx flash monitor
   ```

3. **Expected output**:
   ```
   I (xxx) lightcontrol_app: === ESP32-S3 Light Control with TCAL6416 ===
   I (xxx) i2c_driver: I2C master initialized successfully
   I (xxx) tcal6416: TCAL6416 found at address 0x20
   I (xxx) tcal6416: TCAL6416 initialized with default configuration
   ...
   ```

## 🔧 Customization

### Adding New I2C Devices:
1. Create new driver header/source files
2. Use `i2c_driver.h` functions for communication
3. Add device-specific logic and registers

### Modifying Pin Configuration:
1. Edit the initialization in `app_main()`
2. Use `tcal6416_config_port()` or `tcal6416_config_pin()`
3. Customize the demo task for your specific needs

### Changing I2C Settings:
1. Modify defines in `i2c_driver.h`
2. Rebuild and reflash the project

This modular architecture provides a solid foundation for any I2C-based project with the ESP32-S3!