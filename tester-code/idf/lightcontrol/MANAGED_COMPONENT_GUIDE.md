# ESP32-S3 Light Control with TCAL6416 Managed Component

This project now uses a **professional managed component architecture** for the TCAL6416 I/O expander, following ESP-IDF best practices.

## 🏗️ **Managed Component Architecture**

### **What is a Managed Component?**
A managed component is a reusable, self-contained piece of functionality that can be easily integrated into any ESP-IDF project. It's similar to libraries in other ecosystems (npm packages, Python pip packages, etc.).

### **Benefits Over Individual Files**
- ✅ **Reusability** - Can be used across multiple projects
- ✅ **Version Management** - Proper semantic versioning
- ✅ **Dependency Management** - Automatic handling of requirements
- ✅ **Professional Structure** - Matches Espressif's component design
- ✅ **Easy Updates** - Component can be updated independently
- ✅ **Clean Separation** - Application code is separate from driver code

## 📁 **New Project Structure**

```
lightcontrol/
├── main/
│   ├── main.cpp     # 🎯 Clean application code only
│   └── CMakeLists.txt           # 📋 Simplified build config
├── managed_components/
│   └── tcal6416/               # 📦 Self-contained component
│       ├── include/
│       │   └── tcal6416.hpp      # 🔗 Public API header
│       ├── src/
│       │   └── tcal6416.cpp      # ⚙️ Implementation
│       ├── CMakeLists.txt      # 🔧 Component build config
│       ├── idf_component.yml   # 📋 Component manifest
│       └── README.md           # 📚 Component documentation
├── CMakeLists.txt              # 🏗️ Main project config
└── Documentation files         # 📖 Project documentation
```

## 🎯 **Key Improvements**

### **Application Code (`main/main.c`)**
- ✅ **Clean & Focused** - Only application logic
- ✅ **Simple Includes** - Just `#include "tcal6416.hpp"`
- ✅ **Handle-Based API** - Modern, safe device management
- ✅ **Better Error Handling** - Uses ESP_CHECK macros

### **TCAL6416 Component (`managed_components/tcal6416/`)**
- ✅ **Professional API** - Handle-based design pattern
- ✅ **Comprehensive Features** - All TCAL6416 functionality
- ✅ **ESP-IDF Integration** - Proper error handling and logging
- ✅ **Version Information** - Semantic versioning support
- ✅ **Cross-Platform** - Works with any ESP-IDF version 4.4+

### **Build System**
- ✅ **Automatic Dependencies** - Handles I2C driver requirements
- ✅ **Version Compatibility** - Works with old and new ESP-IDF versions
- ✅ **Clean CMakeLists** - Simplified build configuration

## 🚀 **Usage Examples**

### **Basic Usage (Handle-Based API)**
```c
#include "tcal6416.hpp"

void app_main(void) {
    // Initialize I2C first
    // ... your I2C setup code ...
    
    // Create device handle
    tcal6416_handle_t tcal_handle;
    
    // Initialize with defaults (Port 0 = outputs, Port 1 = inputs)
    esp_err_t ret = tcal6416_init(&tcal_handle, 0, 0x20);
    if (ret != ESP_OK) {
        ESP_LOGE("app", "Init failed");
        return;
    }
    
    // Use the device
    tcal6416_set_pin(&tcal_handle, 0, true);     // Set pin 0 HIGH
    tcal6416_set_port(&tcal_handle, TCAL6416_PORT0, 0xFF); // All port 0 HIGH
    
    // Read inputs
    bool pin_state;
    tcal6416_get_pin(&tcal_handle, 8, &pin_state); // Read pin 8
    
    // Print status
    tcal6416_print_status(&tcal_handle);
}
```

### **Custom Configuration**
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

## 🔧 **API Comparison**

### **Old Individual Files Approach**
```c
// Multiple includes needed
#include "i2c_driver.h"
#include "tcal6416.hpp"

// Address passed to every function
tcal6416_set_pin(0x20, pin, state);
tcal6416_read_port(0x20, port, &value);
```

### **New Managed Component Approach**
```c
// Single include
#include "tcal6416.hpp"

// Handle-based API (safer, cleaner)
tcal6416_set_pin(&handle, pin, state);
tcal6416_read_port(&handle, port, &value);
```

## 📋 **Hardware Connections**

```
ESP32-S3          TCAL6416
--------          --------
GPIO 21    <-->   SDA
GPIO 22    <-->   SCL
3.3V       <-->   VCC
GND        <-->   GND

Note: Add 4.7kΩ pull-up resistors on SDA and SCL lines
```

## 🛠️ **Building and Running**

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
   I (xxx) lightcontrol_app: === ESP32-S3 Light Control with TCAL6416 Managed Component ===
   I (xxx) lightcontrol_app: TCAL6416 Driver Version: 1.0.0
   I (xxx) lightcontrol_app: I2C master initialized successfully
   I (xxx) tcal6416: TCAL6416 initialized successfully at address 0x20
   ```

## 🔄 **Migration Benefits**

### **From Individual Files → Managed Component**
- 🎯 **Cleaner main application** - Focused on your business logic
- 🔧 **Professional driver** - Industry-standard patterns
- 📦 **Reusable component** - Use in other projects easily
- 🛡️ **Better error handling** - ESP-IDF best practices
- 📈 **Scalable architecture** - Easy to add more components

## 🌟 **Best Practices Implemented**

- ✅ **Handle-based API** - Safe device management
- ✅ **ESP-IDF integration** - Uses ESP_CHECK, ESP_LOG, etc.
- ✅ **Version management** - Semantic versioning
- ✅ **Comprehensive documentation** - API docs and examples
- ✅ **Cross-platform compatibility** - Works with different ESP-IDF versions
- ✅ **Professional structure** - Follows Espressif conventions

This managed component architecture provides a solid foundation that you can extend for any I2C-based project! 🚀