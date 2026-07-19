#pragma once

#include <cstddef>
#include <cstdint>

#include "driver/i2c_master.h"

namespace sht40 {

struct Measurement {
    float temperature_c;
    float relative_humidity;
};

class Device {
public:
    explicit Device(i2c_master_bus_handle_t bus, uint8_t address = 0x44);
    ~Device();

    Device(const Device&) = delete;
    Device& operator=(const Device&) = delete;
    Device(Device&&) = delete;
    Device& operator=(Device&&) = delete;

    Measurement read();

private:
    static uint8_t calculate_crc(const uint8_t* data, size_t length);
    void transmit_command(uint8_t command);

    i2c_master_dev_handle_t device_ = nullptr;
};

}  // namespace sht40
