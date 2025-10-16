# TCAL6416 I/O Expander Driver for ESP32

This is a comprehensive ESP-IDF component for the Texas Instruments TCAL6416 16-bit I/O expander.

## Features

- ✅ **16 I/O pins** organized as two 8-bit ports
- ✅ **Individual pin control** - Set/read any of the 16 pins independently  
- ✅ **Port-level operations** - Control 8 pins at once
- ✅ **Configurable pin direction** - Each pin can be input or output
- ✅ **Polarity inversion** - Option to invert input polarity per pin
- ✅ **I2C interface** - Supports addresses 0x20-0x27
- ✅ **ESP-IDF integration** - Proper error handling with ESP_CHECK macros
- ✅ **Version management** - Semantic versioning support

## Hardware Specifications

- **Supply voltage**: 1.65V to 5.5V
- **I2C addresses**: 0x20 to 0x27 (configurable via A2, A1, A0 pins)
- **I2C speed**: Up to 400 kHz
- **Pin count**: 16 I/O pins (P0_0 to P0_7, P1_0 to P1_7)
- **Package**: VQFN-24, TSSOP-24

## Usage

### Basic Example

```c
#include "tcal6416.h"

void app_main(void)
{
    // Initialize I2C master (your I2C setup code here)
    // ...
    
    // Initialize TCAL6416
    tcal6416_handle_t tcal_handle;
    esp_err_t ret = tcal6416_init(&tcal_handle, 0, 0x20);  // I2C port 0, address 0x20
    if (ret != ESP_OK) {
        ESP_LOGE("app", "TCAL6416 initialization failed");
        return;
    }
    
    // Set pin 0 HIGH
    tcal6416_set_pin(&tcal_handle, 0, true);
    
    // Read pin 8 (port 1, pin 0)
    bool pin_state;
    tcal6416_get_pin(&tcal_handle, 8, &pin_state);
    
    // Set entire port 0 to 0xFF (all HIGH)
    tcal6416_set_port(&tcal_handle, TCAL6416_PORT0, 0xFF);
    
    // Print device status
    tcal6416_print_status(&tcal_handle);
}
```

### Custom Configuration

```c
tcal6416_config_t config = {
    .i2c_address = 0x20,
    .i2c_port = 0,
    .port0_config = 0x0F,    // Pins 0-3 output, 4-7 input
    .port1_config = 0xFF,    // All inputs
    .port0_polarity = 0x00,  // Normal polarity
    .port1_polarity = 0x00   // Normal polarity
};

tcal6416_handle_t tcal_handle;
tcal6416_init_with_config(&tcal_handle, &config);
```

## API Reference

### Initialization
- `tcal6416_init()` - Initialize with default configuration
- `tcal6416_init_with_config()` - Initialize with custom configuration
- `tcal6416_test_communication()` - Test device communication

### Pin Operations
- `tcal6416_set_pin()` - Set individual pin state
- `tcal6416_get_pin()` - Read individual pin state
- `tcal6416_config_pin()` - Configure pin direction

### Port Operations  
- `tcal6416_set_port()` - Set entire port state
- `tcal6416_read_port()` - Read entire port state
- `tcal6416_config_port()` - Configure port direction

### Advanced Features
- `tcal6416_set_pin_polarity()` - Set polarity inversion per pin
- `tcal6416_write_register()` - Direct register write access
- `tcal6416_read_register()` - Direct register read access
- `tcal6416_print_status()` - Print complete device status

### Utility
- `tcal6416_get_version()` - Get driver version information

## Pin Mapping

| Pin Number | Port | Port Pin | Description |
|------------|------|----------|-------------|
| 0-7        | 0    | P0_0-P0_7| Port 0 pins |
| 8-15       | 1    | P1_0-P1_7| Port 1 pins |

## Register Map

| Register | Address | Description |
|----------|---------|-------------|
| Input Port 0 | 0x00 | Read input values of port 0 |
| Input Port 1 | 0x01 | Read input values of port 1 |
| Output Port 0 | 0x02 | Set output values of port 0 |
| Output Port 1 | 0x03 | Set output values of port 1 |
| Polarity Inversion Port 0 | 0x04 | Polarity inversion for port 0 |
| Polarity Inversion Port 1 | 0x05 | Polarity inversion for port 1 |
| Configuration Port 0 | 0x06 | Pin direction for port 0 (1=input, 0=output) |
| Configuration Port 1 | 0x07 | Pin direction for port 1 (1=input, 0=output) |

## Dependencies

- ESP-IDF v4.4 or newer
- I2C driver component (automatically handled)

## License

This component is released under the public domain (CC0) license.

## Contributing

Contributions are welcome! Please submit pull requests or issues on the project repository.