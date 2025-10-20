// Test file to check compilation
#include "components/tcal6416/include/tcal6416.h"
#include "driver/i2c_master.h"

void test_function(void) {
    tcal6416_handle_t *handle;
    i2c_master_bus_handle_t bus_handle;
    tcal6416_config_t config = tcal6416_get_default_config();
    
    tcal6416_init(&handle, bus_handle, 0x20, &config);
    tcal6416_deinit(handle);
}