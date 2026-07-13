idf_component_register(SRCS "main.cpp"
                       INCLUDE_DIRS "."
                       REQUIRES "tcal6416" "driver" "esp_wifi" "esp_event" "esp_netif" "nvs_flash"
                                "mqtt" "esp_http_server" "esp_https_ota" "app_update" "mbedtls")
