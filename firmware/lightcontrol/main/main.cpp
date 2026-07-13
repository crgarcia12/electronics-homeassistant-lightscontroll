/**
 * ESP32-S3 Home Assistant bridge for:
 * - v27 board (8 channels via TCAL6416)
 * - v28 board (4 channels via direct GPIO)
 *
 * Runtime configuration is stored in NVS and can be set via setup AP + web page.
 */

#include <cctype>
#include <atomic>
#include <cstdio>
#include <cstring>
#include <memory>
#include <string>
#include <utility>
#include <vector>

#include "driver/gpio.h"
#include "driver/i2c_master.h"
#include "esp_event.h"
#include "esp_crt_bundle.h"
#include "esp_https_ota.h"
#include "esp_http_server.h"
#include "esp_app_desc.h"
#include "esp_log.h"
#include "esp_mac.h"
#include "esp_netif.h"
#include "esp_ota_ops.h"
#include "esp_system.h"
#include "esp_wifi.h"
#include "freertos/FreeRTOS.h"
#include "freertos/event_groups.h"
#include "freertos/task.h"
#include "mqtt_client.h"
#include "nvs.h"
#include "nvs_flash.h"
#include "tcal6416.hpp"

static const char* TAG = "ha_bridge";

static constexpr int I2C_FREQ_HZ = 100000;
static constexpr gpio_num_t I2C_SDA = GPIO_NUM_42;
static constexpr gpio_num_t I2C_SCL = GPIO_NUM_41;
static constexpr uint8_t TCAL_ADDR = 0x20;
static constexpr int RELAY_PULSE_MS = 500;
static constexpr int CHANNEL_POLL_MS = 250;
static constexpr int WIFI_CONNECT_TIMEOUT_MS = 20000;
static constexpr gpio_num_t SETUP_MODE_BUTTON = GPIO_NUM_0;

static constexpr gpio_num_t V28_RELAY_GPIO[] = {GPIO_NUM_46, GPIO_NUM_8, GPIO_NUM_18, GPIO_NUM_17};
static constexpr gpio_num_t V28_SENSOR_GPIO[] = {GPIO_NUM_15, GPIO_NUM_7, GPIO_NUM_6, GPIO_NUM_5};
static constexpr bool V28_SENSOR_ACTIVE_HIGH = true;

static constexpr const char* NVS_NS = "cfg";

enum class BoardType {
    V27_8CH_TCAL,
    V28_4CH_GPIO,
};

struct RuntimeConfig {
    char wifi_ssid[33] = "";
    char wifi_password[65] = "";
    char mqtt_uri[128] = "";
    char mqtt_username[64] = "";
    char mqtt_password[64] = "";
    char device_name[48] = "";
    char room_name[48] = "";
    char ota_url[192] = "";
    bool configured = false;
};

struct AppContext {
    BoardType board = BoardType::V28_4CH_GPIO;
    int channel_count = 4;
    i2c_master_bus_handle_t i2c_bus = nullptr;
    std::unique_ptr<tcal6416::Device> tcal;
    esp_mqtt_client_handle_t mqtt = nullptr;
    httpd_handle_t setup_httpd = nullptr;
    std::string node_id;
    std::string base_topic;
    std::vector<bool> last_state;
    RuntimeConfig cfg;
};

static EventGroupHandle_t wifi_event_group;
static constexpr int WIFI_CONNECTED_BIT = BIT0;
static AppContext g_ctx;
static std::atomic_bool ota_in_progress = false;

static std::string sanitize_topic_part(const char* src) {
    std::string out;
    if (!src) {
        return "device";
    }
    for (size_t i = 0; src[i] != '\0'; ++i) {
        unsigned char c = static_cast<unsigned char>(src[i]);
        if (std::isalnum(c)) {
            out.push_back(static_cast<char>(std::tolower(c)));
        } else if (c == '-' || c == '_') {
            out.push_back(static_cast<char>(c));
        } else if (c == ' ') {
            out.push_back('_');
        }
    }
    if (out.empty()) {
        return "device";
    }
    return out;
}

static void set_default_device_name() {
    uint8_t mac[6] = {};
    ESP_ERROR_CHECK(esp_read_mac(mac, ESP_MAC_WIFI_STA));

    char node[32];
    std::snprintf(node, sizeof(node), "lightscontrol-%02X%02X%02X", mac[3], mac[4], mac[5]);
    g_ctx.node_id = node;

    if (g_ctx.cfg.device_name[0] == '\0') {
        std::snprintf(g_ctx.cfg.device_name, sizeof(g_ctx.cfg.device_name), "%s", node);
    }
    if (g_ctx.cfg.room_name[0] == '\0') {
        std::snprintf(g_ctx.cfg.room_name, sizeof(g_ctx.cfg.room_name), "room");
    }
}

static esp_err_t nvs_get_str_safe(nvs_handle_t handle, const char* key, char* out, size_t out_len) {
    if (out_len == 0) {
        return ESP_ERR_INVALID_ARG;
    }
    size_t required = out_len;
    esp_err_t err = nvs_get_str(handle, key, out, &required);
    if (err == ESP_ERR_NVS_NOT_FOUND) {
        out[0] = '\0';
        return ESP_OK;
    }
    if (err != ESP_OK) {
        out[0] = '\0';
        return err;
    }
    out[out_len - 1] = '\0';
    return ESP_OK;
}

static bool load_runtime_config(RuntimeConfig& cfg) {
    nvs_handle_t nvs_handle = 0;
    esp_err_t err = nvs_open(NVS_NS, NVS_READONLY, &nvs_handle);
    if (err != ESP_OK) {
        return false;
    }

    uint8_t configured = 0;
    err = nvs_get_u8(nvs_handle, "configured", &configured);
    if (err != ESP_OK || configured == 0) {
        nvs_close(nvs_handle);
        return false;
    }

    if (nvs_get_str_safe(nvs_handle, "wifi_ssid", cfg.wifi_ssid, sizeof(cfg.wifi_ssid)) != ESP_OK ||
        nvs_get_str_safe(nvs_handle, "wifi_pwd", cfg.wifi_password, sizeof(cfg.wifi_password)) != ESP_OK ||
        nvs_get_str_safe(nvs_handle, "mqtt_uri", cfg.mqtt_uri, sizeof(cfg.mqtt_uri)) != ESP_OK ||
        nvs_get_str_safe(nvs_handle, "mqtt_user", cfg.mqtt_username, sizeof(cfg.mqtt_username)) != ESP_OK ||
        nvs_get_str_safe(nvs_handle, "mqtt_pwd", cfg.mqtt_password, sizeof(cfg.mqtt_password)) != ESP_OK ||
        nvs_get_str_safe(nvs_handle, "dev_name", cfg.device_name, sizeof(cfg.device_name)) != ESP_OK ||
        nvs_get_str_safe(nvs_handle, "room_name", cfg.room_name, sizeof(cfg.room_name)) != ESP_OK ||
        nvs_get_str_safe(nvs_handle, "ota_url", cfg.ota_url, sizeof(cfg.ota_url)) != ESP_OK) {
        nvs_close(nvs_handle);
        return false;
    }

    nvs_close(nvs_handle);
    cfg.configured = cfg.wifi_ssid[0] != '\0' && cfg.mqtt_uri[0] != '\0';
    return cfg.configured;
}

static esp_err_t save_runtime_config(const RuntimeConfig& cfg) {
    nvs_handle_t nvs_handle = 0;
    esp_err_t err = nvs_open(NVS_NS, NVS_READWRITE, &nvs_handle);
    if (err != ESP_OK) {
        return err;
    }

    err = ESP_OK;
    err |= nvs_set_str(nvs_handle, "wifi_ssid", cfg.wifi_ssid);
    err |= nvs_set_str(nvs_handle, "wifi_pwd", cfg.wifi_password);
    err |= nvs_set_str(nvs_handle, "mqtt_uri", cfg.mqtt_uri);
    err |= nvs_set_str(nvs_handle, "mqtt_user", cfg.mqtt_username);
    err |= nvs_set_str(nvs_handle, "mqtt_pwd", cfg.mqtt_password);
    err |= nvs_set_str(nvs_handle, "dev_name", cfg.device_name);
    err |= nvs_set_str(nvs_handle, "room_name", cfg.room_name);
    err |= nvs_set_str(nvs_handle, "ota_url", cfg.ota_url);
    err |= nvs_set_u8(nvs_handle, "configured", 1);
    if (err == ESP_OK) {
        err = nvs_commit(nvs_handle);
    }
    nvs_close(nvs_handle);
    return err;
}

static bool is_setup_button_pressed() {
    gpio_config_t cfg = {};
    cfg.pin_bit_mask = (1ULL << SETUP_MODE_BUTTON);
    cfg.mode = GPIO_MODE_INPUT;
    cfg.pull_up_en = GPIO_PULLUP_ENABLE;
    cfg.pull_down_en = GPIO_PULLDOWN_DISABLE;
    ESP_ERROR_CHECK(gpio_config(&cfg));
    return gpio_get_level(SETUP_MODE_BUTTON) == 0;
}

static bool read_channel_state(int ch) {
    if (g_ctx.board == BoardType::V27_8CH_TCAL) {
        try {
            return g_ctx.tcal->getPin(static_cast<uint8_t>(ch - 1));
        } catch (const std::exception& e) {
            ESP_LOGE(TAG, "Failed reading TCAL sensor ch%d: %s", ch, e.what());
            return false;
        }
    }

    int idx = ch - 1;
    int raw = gpio_get_level(V28_SENSOR_GPIO[idx]);
    bool sensed_on = raw > 0;
    return V28_SENSOR_ACTIVE_HIGH ? sensed_on : !sensed_on;
}

static void pulse_relay_channel(int ch) {
    if (g_ctx.board == BoardType::V27_8CH_TCAL) {
        uint8_t pin = static_cast<uint8_t>(8 + (ch - 1));
        try {
            g_ctx.tcal->setPin(pin, true);
            vTaskDelay(pdMS_TO_TICKS(RELAY_PULSE_MS));
            g_ctx.tcal->setPin(pin, false);
        } catch (const std::exception& e) {
            ESP_LOGE(TAG, "Failed pulsing TCAL relay ch%d: %s", ch, e.what());
        }
        return;
    }

    int idx = ch - 1;
    gpio_set_level(V28_RELAY_GPIO[idx], 1);
    vTaskDelay(pdMS_TO_TICKS(RELAY_PULSE_MS));
    gpio_set_level(V28_RELAY_GPIO[idx], 0);
}

static void publish_channel_state(int ch, bool on) {
    if (!g_ctx.mqtt) {
        return;
    }

    char topic[192];
    std::snprintf(topic, sizeof(topic), "%s/light/%d/state", g_ctx.base_topic.c_str(), ch);
    esp_mqtt_client_publish(g_ctx.mqtt, topic, on ? "ON" : "OFF", 0, 1, true);
}

static void publish_ota_status(const char* status, bool retain = true) {
    if (!g_ctx.mqtt) {
        return;
    }
    std::string topic = g_ctx.base_topic + "/firmware/status";
    esp_mqtt_client_publish(g_ctx.mqtt, topic.c_str(), status, 0, 1, retain);
}

static void publish_discovery() {
    std::string topic_device = sanitize_topic_part(g_ctx.cfg.device_name);

    for (int ch = 1; ch <= g_ctx.channel_count; ++ch) {
        char topic[256];
        std::snprintf(topic, sizeof(topic), "homeassistant/switch/%s_light_%d/config", g_ctx.node_id.c_str(), ch);

        char display_name[128];
        std::snprintf(display_name, sizeof(display_name), "%s %s Light %d", g_ctx.cfg.room_name, g_ctx.cfg.device_name, ch);

        char object_id[96];
        std::snprintf(object_id, sizeof(object_id), "%s_light_%d", topic_device.c_str(), ch);

        char payload[1024];
        std::snprintf(
            payload,
            sizeof(payload),
            "{\"name\":\"%s\","
            "\"uniq_id\":\"%s_light_%d\","
            "\"obj_id\":\"%s\","
            "\"cmd_t\":\"%s/light/%d/set\","
            "\"stat_t\":\"%s/light/%d/state\","
            "\"avty_t\":\"%s/status\","
            "\"pl_avail\":\"online\","
            "\"pl_not_avail\":\"offline\","
            "\"pl_on\":\"ON\","
            "\"pl_off\":\"OFF\","
            "\"icon\":\"mdi:ceiling-light\","
            "\"dev\":{\"ids\":[\"%s\"],\"name\":\"%s (%s)\",\"mf\":\"crgarcia12\",\"mdl\":\"%s\"}}",
            display_name,
            g_ctx.node_id.c_str(), ch,
            object_id,
            g_ctx.base_topic.c_str(), ch,
            g_ctx.base_topic.c_str(), ch,
            g_ctx.base_topic.c_str(),
            g_ctx.node_id.c_str(), g_ctx.cfg.device_name, g_ctx.cfg.room_name,
            g_ctx.board == BoardType::V27_8CH_TCAL ? "v27-8ch" : "v28-4ch");

        esp_mqtt_client_publish(g_ctx.mqtt, topic, payload, 0, 1, true);
    }

    char update_topic[256];
    std::snprintf(update_topic, sizeof(update_topic), "homeassistant/button/%s_firmware_update/config", g_ctx.node_id.c_str());
    char update_payload[900];
    std::snprintf(
        update_payload,
        sizeof(update_payload),
        "{\"name\":\"Install firmware update\","
        "\"uniq_id\":\"%s_firmware_update\","
        "\"cmd_t\":\"%s/firmware/update\","
        "\"pl_prs\":\"UPDATE\","
        "\"icon\":\"mdi:update\","
        "\"dev\":{\"ids\":[\"%s\"],\"name\":\"%s (%s)\",\"mf\":\"crgarcia12\",\"mdl\":\"%s\"}}",
        g_ctx.node_id.c_str(),
        g_ctx.base_topic.c_str(),
        g_ctx.node_id.c_str(), g_ctx.cfg.device_name, g_ctx.cfg.room_name,
        g_ctx.board == BoardType::V27_8CH_TCAL ? "v27-8ch" : "v28-4ch");
    esp_mqtt_client_publish(g_ctx.mqtt, update_topic, update_payload, 0, 1, true);

    char version_topic[256];
    std::snprintf(version_topic, sizeof(version_topic), "homeassistant/sensor/%s_firmware_version/config", g_ctx.node_id.c_str());
    char version_payload[900];
    std::snprintf(
        version_payload,
        sizeof(version_payload),
        "{\"name\":\"Firmware version\","
        "\"uniq_id\":\"%s_firmware_version\","
        "\"stat_t\":\"%s/firmware/version\","
        "\"entity_category\":\"diagnostic\","
        "\"icon\":\"mdi:chip\","
        "\"dev\":{\"ids\":[\"%s\"],\"name\":\"%s (%s)\",\"mf\":\"crgarcia12\",\"mdl\":\"%s\"}}",
        g_ctx.node_id.c_str(),
        g_ctx.base_topic.c_str(),
        g_ctx.node_id.c_str(), g_ctx.cfg.device_name, g_ctx.cfg.room_name,
        g_ctx.board == BoardType::V27_8CH_TCAL ? "v27-8ch" : "v28-4ch");
    esp_mqtt_client_publish(g_ctx.mqtt, version_topic, version_payload, 0, 1, true);
}

static void subscribe_channel_commands() {
    for (int ch = 1; ch <= g_ctx.channel_count; ++ch) {
        char topic[192];
        std::snprintf(topic, sizeof(topic), "%s/light/%d/set", g_ctx.base_topic.c_str(), ch);
        esp_mqtt_client_subscribe(g_ctx.mqtt, topic, 1);
    }
    std::string ota_topic = g_ctx.base_topic + "/firmware/update";
    esp_mqtt_client_subscribe(g_ctx.mqtt, ota_topic.c_str(), 1);
}

static int topic_to_channel(const char* topic, int topic_len) {
    char buffer[200] = {0};
    int n = topic_len < static_cast<int>(sizeof(buffer) - 1) ? topic_len : static_cast<int>(sizeof(buffer) - 1);
    std::memcpy(buffer, topic, n);

    for (int ch = 1; ch <= g_ctx.channel_count; ++ch) {
        char expected[192];
        std::snprintf(expected, sizeof(expected), "%s/light/%d/set", g_ctx.base_topic.c_str(), ch);
        if (std::strcmp(buffer, expected) == 0) {
            return ch;
        }
    }
    return -1;
}

static void handle_set_command(int ch, const char* data, int data_len) {
    if (ch < 1 || ch > g_ctx.channel_count) {
        return;
    }

    bool want_on = (data_len >= 2 && std::strncmp(data, "ON", 2) == 0);
    bool want_off = (data_len >= 3 && std::strncmp(data, "OFF", 3) == 0);
    if (!want_on && !want_off) {
        ESP_LOGW(TAG, "Unsupported payload for ch%d: %.*s", ch, data_len, data);
        return;
    }

    bool current = read_channel_state(ch);
    bool need_toggle = (want_on && !current) || (want_off && current);
    if (need_toggle) {
        pulse_relay_channel(ch);
        vTaskDelay(pdMS_TO_TICKS(100));
    }

    bool updated = read_channel_state(ch);
    g_ctx.last_state[ch - 1] = updated;
    publish_channel_state(ch, updated);
}

static void ota_update_task(void* arg) {
    (void)arg;
    publish_ota_status("downloading");

    esp_http_client_config_t http_config = {};
    http_config.url = g_ctx.cfg.ota_url;
    http_config.crt_bundle_attach = esp_crt_bundle_attach;
    http_config.timeout_ms = 15000;
    http_config.keep_alive_enable = true;

    esp_https_ota_config_t ota_config = {};
    ota_config.http_config = &http_config;

    ESP_LOGI(TAG, "Starting OTA update from %s", g_ctx.cfg.ota_url);
    esp_err_t err = esp_https_ota(&ota_config);
    if (err == ESP_OK) {
        ESP_LOGI(TAG, "OTA update complete; rebooting");
        publish_ota_status("restarting");
        vTaskDelay(pdMS_TO_TICKS(1000));
        esp_restart();
    }

    ESP_LOGE(TAG, "OTA update failed: %s", esp_err_to_name(err));
    char status[96];
    std::snprintf(status, sizeof(status), "failed: %s", esp_err_to_name(err));
    publish_ota_status(status);
    ota_in_progress.store(false);
    vTaskDelete(nullptr);
}

static void handle_ota_command(const char* data, int data_len) {
    if (data_len != 6 || std::strncmp(data, "UPDATE", 6) != 0) {
        ESP_LOGW(TAG, "Ignoring invalid firmware update command");
        return;
    }
    if (g_ctx.cfg.ota_url[0] == '\0' || std::strncmp(g_ctx.cfg.ota_url, "https://", 8) != 0) {
        ESP_LOGE(TAG, "OTA requires a configured HTTPS firmware URL");
        publish_ota_status("failed: configure an HTTPS URL");
        return;
    }
    if (ota_in_progress.exchange(true)) {
        publish_ota_status("already running", false);
        return;
    }
    if (xTaskCreate(ota_update_task, "ota_update", 8192, nullptr, 5, nullptr) != pdPASS) {
        ota_in_progress.store(false);
        publish_ota_status("failed: could not start update task");
    }
}

static void mqtt_event_handler(void* handler_args, esp_event_base_t base, int32_t event_id, void* event_data) {
    (void)handler_args;
    (void)base;
    auto* event = static_cast<esp_mqtt_event_handle_t>(event_data);

    switch (event_id) {
        case MQTT_EVENT_CONNECTED: {
            ESP_LOGI(TAG, "MQTT connected");
            esp_mqtt_client_publish(g_ctx.mqtt, (g_ctx.base_topic + "/status").c_str(), "online", 0, 1, true);
            publish_discovery();
            subscribe_channel_commands();
            const esp_app_desc_t* app = esp_app_get_description();
            esp_mqtt_client_publish(
                g_ctx.mqtt,
                (g_ctx.base_topic + "/firmware/version").c_str(),
                app->version,
                0,
                1,
                true);
            publish_ota_status("idle");
            for (int ch = 1; ch <= g_ctx.channel_count; ++ch) {
                bool st = read_channel_state(ch);
                g_ctx.last_state[ch - 1] = st;
                publish_channel_state(ch, st);
            }
            break;
        }
        case MQTT_EVENT_DATA: {
            int ch = topic_to_channel(event->topic, event->topic_len);
            if (ch > 0) {
                handle_set_command(ch, event->data, event->data_len);
            } else {
                std::string event_topic(event->topic, static_cast<size_t>(event->topic_len));
                if (event_topic == g_ctx.base_topic + "/firmware/update") {
                    handle_ota_command(event->data, event->data_len);
                }
            }
            break;
        }
        default:
            break;
    }
}

static void wifi_event_handler(void* arg, esp_event_base_t event_base, int32_t event_id, void* event_data) {
    (void)arg;
    (void)event_data;
    if (event_base == WIFI_EVENT && event_id == WIFI_EVENT_STA_START) {
        esp_wifi_connect();
    } else if (event_base == WIFI_EVENT && event_id == WIFI_EVENT_STA_DISCONNECTED) {
        esp_wifi_connect();
    } else if (event_base == IP_EVENT && event_id == IP_EVENT_STA_GOT_IP) {
        xEventGroupSetBits(wifi_event_group, WIFI_CONNECTED_BIT);
    }
}

static void init_wifi_core() {
    wifi_event_group = xEventGroupCreate();
    ESP_ERROR_CHECK(esp_netif_init());
    ESP_ERROR_CHECK(esp_event_loop_create_default());
    esp_netif_create_default_wifi_sta();
    esp_netif_create_default_wifi_ap();

    wifi_init_config_t cfg = WIFI_INIT_CONFIG_DEFAULT();
    ESP_ERROR_CHECK(esp_wifi_init(&cfg));
    ESP_ERROR_CHECK(esp_event_handler_register(WIFI_EVENT, ESP_EVENT_ANY_ID, &wifi_event_handler, nullptr));
    ESP_ERROR_CHECK(esp_event_handler_register(IP_EVENT, IP_EVENT_STA_GOT_IP, &wifi_event_handler, nullptr));
}

static bool connect_wifi_sta() {
    wifi_config_t wifi_config = {};
    size_t ssid_len = std::strlen(g_ctx.cfg.wifi_ssid);
    if (ssid_len > sizeof(wifi_config.sta.ssid) - 1) {
        ssid_len = sizeof(wifi_config.sta.ssid) - 1;
    }
    std::memcpy(wifi_config.sta.ssid, g_ctx.cfg.wifi_ssid, ssid_len);
    wifi_config.sta.ssid[ssid_len] = '\0';

    size_t pwd_len = std::strlen(g_ctx.cfg.wifi_password);
    if (pwd_len > sizeof(wifi_config.sta.password) - 1) {
        pwd_len = sizeof(wifi_config.sta.password) - 1;
    }
    std::memcpy(wifi_config.sta.password, g_ctx.cfg.wifi_password, pwd_len);
    wifi_config.sta.password[pwd_len] = '\0';
    wifi_config.sta.threshold.authmode = WIFI_AUTH_WPA2_PSK;

    xEventGroupClearBits(wifi_event_group, WIFI_CONNECTED_BIT);
    ESP_ERROR_CHECK(esp_wifi_set_mode(WIFI_MODE_STA));
    ESP_ERROR_CHECK(esp_wifi_set_config(WIFI_IF_STA, &wifi_config));
    ESP_ERROR_CHECK(esp_wifi_start());
    EventBits_t bits = xEventGroupWaitBits(
        wifi_event_group,
        WIFI_CONNECTED_BIT,
        pdFALSE,
        pdTRUE,
        pdMS_TO_TICKS(WIFI_CONNECT_TIMEOUT_MS));
    return (bits & WIFI_CONNECTED_BIT) != 0;
}

static void init_mqtt() {
    esp_mqtt_client_config_t mqtt_cfg = {};
    mqtt_cfg.broker.address.uri = g_ctx.cfg.mqtt_uri;
    mqtt_cfg.credentials.username = g_ctx.cfg.mqtt_username;
    mqtt_cfg.credentials.authentication.password = g_ctx.cfg.mqtt_password;

    g_ctx.mqtt = esp_mqtt_client_init(&mqtt_cfg);
    ESP_ERROR_CHECK(esp_mqtt_client_register_event(g_ctx.mqtt, MQTT_EVENT_ANY, mqtt_event_handler, nullptr));
    ESP_ERROR_CHECK(esp_mqtt_client_start(g_ctx.mqtt));
}

static void init_i2c_bus() {
    i2c_master_bus_config_t i2c_mst_config = {
        .i2c_port = I2C_NUM_0,
        .sda_io_num = I2C_SDA,
        .scl_io_num = I2C_SCL,
        .clk_source = I2C_CLK_SRC_DEFAULT,
        .flags = {.enable_internal_pullup = true},
    };
    ESP_ERROR_CHECK(i2c_new_master_bus(&i2c_mst_config, &g_ctx.i2c_bus));
}

static void init_v28_gpio_board() {
    g_ctx.board = BoardType::V28_4CH_GPIO;
    g_ctx.channel_count = 4;

    gpio_config_t relay_cfg = {};
    relay_cfg.mode = GPIO_MODE_OUTPUT;
    relay_cfg.pull_down_en = GPIO_PULLDOWN_DISABLE;
    relay_cfg.pull_up_en = GPIO_PULLUP_DISABLE;
    for (gpio_num_t pin : V28_RELAY_GPIO) {
        relay_cfg.pin_bit_mask |= (1ULL << pin);
    }
    ESP_ERROR_CHECK(gpio_config(&relay_cfg));
    for (gpio_num_t pin : V28_RELAY_GPIO) {
        gpio_set_level(pin, 0);
    }

    gpio_config_t sensor_cfg = {};
    sensor_cfg.mode = GPIO_MODE_INPUT;
    sensor_cfg.pull_down_en = GPIO_PULLDOWN_DISABLE;
    sensor_cfg.pull_up_en = GPIO_PULLUP_DISABLE;
    for (gpio_num_t pin : V28_SENSOR_GPIO) {
        sensor_cfg.pin_bit_mask |= (1ULL << pin);
    }
    ESP_ERROR_CHECK(gpio_config(&sensor_cfg));
}

static void init_v27_tcal_board() {
    tcal6416::Config cfg = {
        .port0_config = 0xFF,
        .port1_config = 0x00,
        .port0_polarity = 0x00,
        .port1_polarity = 0x00,
        .port0_initial_output = 0x00,
        .port1_initial_output = 0x00,
        .port0_drive_strength = tcal6416::DriveStrength::DRIVE_1_00X,
        .port1_drive_strength = tcal6416::DriveStrength::DRIVE_1_00X,
    };
    g_ctx.tcal = std::make_unique<tcal6416::Device>(g_ctx.i2c_bus, TCAL_ADDR, cfg);
    g_ctx.board = BoardType::V27_8CH_TCAL;
    g_ctx.channel_count = 8;
}

static void detect_board() {
    try {
        init_v27_tcal_board();
        ESP_LOGI(TAG, "Detected v27 8-channel board (TCAL6416)");
        return;
    } catch (const std::exception& e) {
        ESP_LOGW(TAG, "TCAL probe failed (%s), falling back to v28 GPIO board", e.what());
    }

    init_v28_gpio_board();
    ESP_LOGI(TAG, "Using v28 4-channel GPIO board");
}

static void confirm_running_firmware() {
    const esp_partition_t* running = esp_ota_get_running_partition();
    esp_ota_img_states_t state;
    if (esp_ota_get_state_partition(running, &state) == ESP_OK &&
        state == ESP_OTA_IMG_PENDING_VERIFY) {
        ESP_ERROR_CHECK(esp_ota_mark_app_valid_cancel_rollback());
        ESP_LOGI(TAG, "Confirmed newly installed firmware");
    }
}

static uint8_t hex_value(char c) {
    if (c >= '0' && c <= '9') return static_cast<uint8_t>(c - '0');
    if (c >= 'a' && c <= 'f') return static_cast<uint8_t>(10 + c - 'a');
    if (c >= 'A' && c <= 'F') return static_cast<uint8_t>(10 + c - 'A');
    return 0;
}

static std::string url_decode(const char* src) {
    std::string out;
    for (size_t i = 0; src[i] != '\0'; ++i) {
        if (src[i] == '+') {
            out.push_back(' ');
        } else if (src[i] == '%' && src[i + 1] != '\0' && src[i + 2] != '\0') {
            uint8_t hi = hex_value(src[i + 1]);
            uint8_t lo = hex_value(src[i + 2]);
            out.push_back(static_cast<char>((hi << 4) | lo));
            i += 2;
        } else {
            out.push_back(src[i]);
        }
    }
    return out;
}

static std::string form_value(const std::string& body, const char* key) {
    std::string key_eq = std::string(key) + "=";
    size_t start = body.find(key_eq);
    if (start == std::string::npos) {
        return "";
    }
    start += key_eq.size();
    size_t end = body.find('&', start);
    std::string raw = body.substr(start, end == std::string::npos ? std::string::npos : end - start);
    return url_decode(raw.c_str());
}

static esp_err_t setup_get_handler(httpd_req_t* req) {
    char page[2600];
    std::snprintf(
        page,
        sizeof(page),
        "<!doctype html><html><head><meta name='viewport' content='width=device-width,initial-scale=1'>"
        "<title>Lights Control Setup</title></head><body>"
        "<h2>Lights Control Setup</h2>"
        "<p>Configure WiFi + MQTT + names for Home Assistant discovery.</p>"
        "<form method='post' action='/save'>"
        "WiFi SSID:<br><input name='wifi_ssid' value='%s'><br>"
        "WiFi Password:<br><input name='wifi_password' type='password' value='%s'><br>"
        "MQTT Broker URI (mqtt://ip:1883):<br><input name='mqtt_uri' value='%s'><br>"
        "MQTT Username:<br><input name='mqtt_user' value='%s'><br>"
        "MQTT Password:<br><input name='mqtt_password' type='password' value='%s'><br>"
        "Device Name:<br><input name='device_name' value='%s'><br>"
        "Room Name:<br><input name='room_name' value='%s'><br>"
        "Firmware HTTPS URL:<br><input name='ota_url' value='%s' size='48'><br><br>"
        "<button type='submit'>Save and Reboot</button>"
        "</form></body></html>",
        g_ctx.cfg.wifi_ssid,
        g_ctx.cfg.wifi_password,
        g_ctx.cfg.mqtt_uri,
        g_ctx.cfg.mqtt_username,
        g_ctx.cfg.mqtt_password,
        g_ctx.cfg.device_name,
        g_ctx.cfg.room_name,
        g_ctx.cfg.ota_url);
    httpd_resp_set_type(req, "text/html");
    return httpd_resp_send(req, page, HTTPD_RESP_USE_STRLEN);
}

static esp_err_t setup_save_handler(httpd_req_t* req) {
    if (req->content_len <= 0 || req->content_len > 1800) {
        return httpd_resp_send_err(req, HTTPD_400_BAD_REQUEST, "Invalid form payload");
    }

    std::string body;
    body.resize(static_cast<size_t>(req->content_len));
    int read = httpd_req_recv(req, body.data(), req->content_len);
    if (read <= 0) {
        return httpd_resp_send_err(req, HTTPD_400_BAD_REQUEST, "Failed reading payload");
    }
    body.resize(static_cast<size_t>(read));

    RuntimeConfig next = g_ctx.cfg;
    auto set_field = [](char* dst, size_t dst_len, const std::string& src) {
        std::snprintf(dst, dst_len, "%s", src.c_str());
    };

    set_field(next.wifi_ssid, sizeof(next.wifi_ssid), form_value(body, "wifi_ssid"));
    set_field(next.wifi_password, sizeof(next.wifi_password), form_value(body, "wifi_password"));
    set_field(next.mqtt_uri, sizeof(next.mqtt_uri), form_value(body, "mqtt_uri"));
    set_field(next.mqtt_username, sizeof(next.mqtt_username), form_value(body, "mqtt_user"));
    set_field(next.mqtt_password, sizeof(next.mqtt_password), form_value(body, "mqtt_password"));
    set_field(next.device_name, sizeof(next.device_name), form_value(body, "device_name"));
    set_field(next.room_name, sizeof(next.room_name), form_value(body, "room_name"));
    set_field(next.ota_url, sizeof(next.ota_url), form_value(body, "ota_url"));
    next.configured = (next.wifi_ssid[0] != '\0' && next.mqtt_uri[0] != '\0');

    if (!next.configured) {
        return httpd_resp_send_err(req, HTTPD_400_BAD_REQUEST, "wifi_ssid and mqtt_uri are required");
    }

    esp_err_t err = save_runtime_config(next);
    if (err != ESP_OK) {
        ESP_LOGE(TAG, "Failed saving config: %s", esp_err_to_name(err));
        return httpd_resp_send_err(req, HTTPD_500_INTERNAL_SERVER_ERROR, "Failed saving config");
    }

    httpd_resp_set_type(req, "text/html");
    httpd_resp_sendstr(req, "<html><body><h3>Saved. Rebooting...</h3></body></html>");
    vTaskDelay(pdMS_TO_TICKS(400));
    esp_restart();
    return ESP_OK;
}

static void start_setup_portal() {
    ESP_LOGW(TAG, "Entering setup AP mode");

    wifi_config_t ap_cfg = {};
    std::snprintf(reinterpret_cast<char*>(ap_cfg.ap.ssid), sizeof(ap_cfg.ap.ssid), "LightsSetup-%s", g_ctx.node_id.substr(g_ctx.node_id.size() - 4).c_str());
    ap_cfg.ap.ssid_len = 0;
    std::snprintf(reinterpret_cast<char*>(ap_cfg.ap.password), sizeof(ap_cfg.ap.password), "setup1234");
    ap_cfg.ap.authmode = WIFI_AUTH_WPA2_PSK;
    ap_cfg.ap.max_connection = 4;
    ap_cfg.ap.channel = 1;

    ESP_ERROR_CHECK(esp_wifi_set_mode(WIFI_MODE_AP));
    ESP_ERROR_CHECK(esp_wifi_set_config(WIFI_IF_AP, &ap_cfg));
    ESP_ERROR_CHECK(esp_wifi_start());

    httpd_config_t config = HTTPD_DEFAULT_CONFIG();
    config.uri_match_fn = httpd_uri_match_wildcard;
    ESP_ERROR_CHECK(httpd_start(&g_ctx.setup_httpd, &config));

    httpd_uri_t get_uri = {};
    get_uri.uri = "/";
    get_uri.method = HTTP_GET;
    get_uri.handler = setup_get_handler;
    ESP_ERROR_CHECK(httpd_register_uri_handler(g_ctx.setup_httpd, &get_uri));

    httpd_uri_t save_uri = {};
    save_uri.uri = "/save";
    save_uri.method = HTTP_POST;
    save_uri.handler = setup_save_handler;
    ESP_ERROR_CHECK(httpd_register_uri_handler(g_ctx.setup_httpd, &save_uri));

    ESP_LOGI(TAG, "Setup AP started. Connect to SSID %s and open http://192.168.4.1", ap_cfg.ap.ssid);
}

static void state_publisher_task(void* arg) {
    (void)arg;
    while (true) {
        if (g_ctx.mqtt) {
            for (int ch = 1; ch <= g_ctx.channel_count; ++ch) {
                bool st = read_channel_state(ch);
                if (g_ctx.last_state[ch - 1] != st) {
                    g_ctx.last_state[ch - 1] = st;
                    publish_channel_state(ch, st);
                }
            }
        }
        vTaskDelay(pdMS_TO_TICKS(CHANNEL_POLL_MS));
    }
}

extern "C" void app_main(void) {
    esp_err_t err = nvs_flash_init();
    if (err == ESP_ERR_NVS_NO_FREE_PAGES || err == ESP_ERR_NVS_NEW_VERSION_FOUND) {
        ESP_ERROR_CHECK(nvs_flash_erase());
        ESP_ERROR_CHECK(nvs_flash_init());
    } else {
        ESP_ERROR_CHECK(err);
    }

    load_runtime_config(g_ctx.cfg);
    set_default_device_name();

    init_i2c_bus();
    detect_board();
    confirm_running_firmware();
    g_ctx.last_state.assign(g_ctx.channel_count, false);

    init_wifi_core();

    bool force_setup = is_setup_button_pressed();
    if (force_setup || !g_ctx.cfg.configured) {
        start_setup_portal();
        while (true) {
            vTaskDelay(pdMS_TO_TICKS(1000));
        }
    }

    if (!connect_wifi_sta()) {
        ESP_LOGW(TAG, "WiFi failed, starting setup portal");
        start_setup_portal();
        while (true) {
            vTaskDelay(pdMS_TO_TICKS(1000));
        }
    }

    g_ctx.base_topic = std::string("home/") + sanitize_topic_part(g_ctx.cfg.device_name);
    init_mqtt();
    xTaskCreate(state_publisher_task, "state_publisher_task", 4096, nullptr, 5, nullptr);
}
