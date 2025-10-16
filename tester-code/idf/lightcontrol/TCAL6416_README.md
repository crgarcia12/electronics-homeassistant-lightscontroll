# ESP32-S3 I2C Master with TCAL6416 I/O Expander

This project configures an ESP32-S3 microcontroller as an I2C master to communicate with a TCAL6416 16-bit I/O expander chip.

## Hardware Configuration

### TCAL6416 Connection
- **I2C Address**: 0x20 (when A2, A1, A0 pins are tied to GND)
- **VCC**: Connect to 3.3V
- **GND**: Connect to ground
- **SDA**: Connect to GPIO 21 (ESP32-S3)
- **SCL**: Connect to GPIO 22 (ESP32-S3)
- **Pull-up resistors**: 4.7kΩ resistors on both SDA and SCL lines (to 3.3V)

### ESP32-S3 Pin Configuration
```
GPIO 21 - I2C SDA (Data line)
GPIO 22 - I2C SCL (Clock line)
```

## TCAL6416 Features

The TCAL6416 is a 16-bit I/O expander with the following features:
- 16 I/O pins organized as two 8-bit ports (Port 0: P0_0 to P0_7, Port 1: P1_0 to P1_7)
- Each pin can be individually configured as input or output
- Input polarity inversion capability
- I2C interface with configurable address (0x20-0x27)
- Operating voltage: 1.65V to 5.5V
- Low standby current

## Register Map

| Register | Address | Description |
|----------|---------|-------------|
| Input Port 0 | 0x00 | Read input values of port 0 (P0_7-P0_0) |
| Input Port 1 | 0x01 | Read input values of port 1 (P1_7-P1_0) |
| Output Port 0 | 0x02 | Set output values of port 0 (P0_7-P0_0) |
| Output Port 1 | 0x03 | Set output values of port 1 (P1_7-P1_0) |
| Polarity Inversion Port 0 | 0x04 | Polarity inversion for port 0 |
| Polarity Inversion Port 1 | 0x05 | Polarity inversion for port 1 |
| Configuration Port 0 | 0x06 | Pin direction for port 0 (1=input, 0=output) |
| Configuration Port 1 | 0x07 | Pin direction for port 1 (1=input, 0=output) |

## Current Implementation

The current code implements:

1. **I2C Master Initialization**: Sets up ESP32-S3 as I2C master on GPIO 21 (SDA) and GPIO 22 (SCL)
2. **TCAL6416 Driver Functions**:
   - Register read/write operations
   - Pin-level control functions
   - Port configuration functions
3. **Demo Application**: 
   - Configures Port 0 (8 pins) as outputs
   - Configures Port 1 (8 pins) as inputs
   - Cycles through output pins on Port 0
   - Continuously reads input state from Port 1

## Building and Flashing

To build and flash the project:

1. **Set up ESP-IDF environment** (if not already done):
   ```bash
   # Windows (Command Prompt)
   %IDF_PATH%\export.bat
   
   # Or Windows (PowerShell)
   .$env:IDF_PATH/export.ps1
   ```

2. **Build the project**:
   ```bash
   idf.py build
   ```

3. **Flash to ESP32-S3**:
   ```bash
   idf.py -p COMx flash monitor
   ```
   Replace `COMx` with your actual COM port.

## Usage Example

The demo application will:
1. Initialize I2C and TCAL6416
2. Configure Port 0 as outputs (all 8 pins)
3. Configure Port 1 as inputs (all 8 pins) 
4. Cycle through each output pin (0-7) turning them ON/OFF
5. Read and display the state of input Port 1

## Expected Output

```
I (xxx) i2c_tcal6416: ESP32-S3 I2C Master with TCAL6416 Demo
I (xxx) i2c_tcal6416: I2C master initialized successfully
I (xxx) i2c_tcal6416: TCAL6416 communication test successful, input port 0: 0xXX
I (xxx) i2c_tcal6416: TCAL6416 initialized successfully
I (xxx) i2c_tcal6416: Port 0: Configured as outputs (8 pins)
I (xxx) i2c_tcal6416: Port 1: Configured as inputs (8 pins)
I (xxx) i2c_tcal6416: Demo started - cycling through output pins and reading inputs
I (xxx) i2c_tcal6416: Setting pin 0 to LOW
I (xxx) i2c_tcal6416: Input port 1 state: 0xXX
I (xxx) i2c_tcal6416: Setting pin 0 to HIGH
I (xxx) i2c_tcal6416: Input port 1 state: 0xXX
...
```

## Customization

### Changing I2C Address
If your TCAL6416 has a different address (due to A2, A1, A0 pin configuration), modify:
```c
#define TCAL6416_ADDR   0x20  // Change this to your address
```

### Changing I2C Pins
To use different GPIO pins for I2C:
```c
#define I2C_MASTER_SCL_IO   22    // Change SCL pin
#define I2C_MASTER_SDA_IO   21    // Change SDA pin
```

### Custom Pin Configuration
To configure pins differently, modify the initialization:
```c
// Example: Configure port 0 pins 0-3 as outputs, 4-7 as inputs
tcal6416_write_reg(TCAL6416_REG_CONFIG_PORT0, 0xF0);  // 0xF0 = 11110000b
```

## API Functions Available

- `tcal6416_write_reg()` - Write to any TCAL6416 register
- `tcal6416_read_reg()` - Read from any TCAL6416 register
- `tcal6416_set_pin()` - Set individual pin state (HIGH/LOW)
- `tcal6416_read_inputs()` - Read entire input port state

## Troubleshooting

1. **No communication with TCAL6416**:
   - Check wiring connections
   - Verify I2C address (use I2C scanner if needed)
   - Ensure pull-up resistors are connected
   - Check power supply (3.3V)

2. **Build errors**:
   - Ensure ESP-IDF is properly installed and environment is set up
   - Check that you've removed the `MINIMAL_BUILD` setting from CMakeLists.txt

3. **Pin not responding**:
   - Verify pin is configured as output in configuration register
   - Check that you're writing to the correct port register
   - Measure voltage levels with multimeter