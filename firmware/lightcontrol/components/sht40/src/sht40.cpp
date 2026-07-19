#include "sht40.hpp"

#include <stdexcept>
#include <string>

#include "esp_err.h"
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"

namespace sht40 {
namespace {

constexpr uint8_t SOFT_RESET_COMMAND = 0x94;
constexpr uint8_t HIGH_PRECISION_MEASUREMENT_COMMAND = 0xFD;
constexpr int I2C_TIMEOUT_MS = 100;
constexpr int SOFT_RESET_DELAY_MS = 2;
constexpr int MEASUREMENT_DELAY_MS = 10;

void throw_on_error(esp_err_t error, const char* operation) {
    if (error != ESP_OK) {
        throw std::runtime_error(std::string(operation) + ": " + esp_err_to_name(error));
    }
}

}  // namespace

Device::Device(i2c_master_bus_handle_t bus, uint8_t address) {
    if (!bus) {
        throw std::invalid_argument("SHT40 I2C bus is null");
    }

    i2c_device_config_t config = {
        .dev_addr_length = I2C_ADDR_BIT_LEN_7,
        .device_address = address,
        .scl_speed_hz = 100000,
        .scl_wait_us = 0,
        .flags = {.disable_ack_check = false},
    };
    throw_on_error(i2c_master_bus_add_device(bus, &config, &device_), "adding SHT40 to I2C bus");

    try {
        transmit_command(SOFT_RESET_COMMAND);
        vTaskDelay(pdMS_TO_TICKS(SOFT_RESET_DELAY_MS) + 1);
    } catch (...) {
        i2c_master_bus_rm_device(device_);
        device_ = nullptr;
        throw;
    }
}

Device::~Device() {
    if (device_) {
        i2c_master_bus_rm_device(device_);
    }
}

Measurement Device::read() {
    transmit_command(HIGH_PRECISION_MEASUREMENT_COMMAND);
    vTaskDelay(pdMS_TO_TICKS(MEASUREMENT_DELAY_MS) + 1);

    uint8_t response[6] = {};
    throw_on_error(
        i2c_master_receive(device_, response, sizeof(response), I2C_TIMEOUT_MS),
        "reading SHT40 measurement");

    if (calculate_crc(response, 2) != response[2] ||
        calculate_crc(response + 3, 2) != response[5]) {
        throw std::runtime_error("SHT40 measurement CRC check failed");
    }

    const uint16_t raw_temperature =
        (static_cast<uint16_t>(response[0]) << 8) | response[1];
    const uint16_t raw_humidity =
        (static_cast<uint16_t>(response[3]) << 8) | response[4];

    Measurement measurement = {
        .temperature_c = -45.0f + (175.0f * raw_temperature / 65535.0f),
        .relative_humidity = -6.0f + (125.0f * raw_humidity / 65535.0f),
    };
    if (measurement.relative_humidity < 0.0f) {
        measurement.relative_humidity = 0.0f;
    } else if (measurement.relative_humidity > 100.0f) {
        measurement.relative_humidity = 100.0f;
    }
    return measurement;
}

uint8_t Device::calculate_crc(const uint8_t* data, size_t length) {
    uint8_t crc = 0xFF;
    for (size_t index = 0; index < length; ++index) {
        crc ^= data[index];
        for (int bit = 0; bit < 8; ++bit) {
            crc = (crc & 0x80) ? static_cast<uint8_t>((crc << 1) ^ 0x31)
                               : static_cast<uint8_t>(crc << 1);
        }
    }
    return crc;
}

void Device::transmit_command(uint8_t command) {
    throw_on_error(
        i2c_master_transmit(device_, &command, sizeof(command), I2C_TIMEOUT_MS),
        "sending SHT40 command");
}

}  // namespace sht40
