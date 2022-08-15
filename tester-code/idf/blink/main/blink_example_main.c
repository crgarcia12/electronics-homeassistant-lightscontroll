/* Blink Example

   This example code is in the Public Domain (or CC0 licensed, at your option.)

   Unless required by applicable law or agreed to in writing, this
   software is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
   CONDITIONS OF ANY KIND, either express or implied.
*/
#include <stdio.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "driver/gpio.h"
#include "esp_log.h"
#include "led_strip.h"
#include "sdkconfig.h"

static const char *TAG = "example";

/* Use project configuration menu (idf.py menuconfig) to choose the GPIO to blink,
   or you can edit the following line and set a number here.
*/
static int BLINK_GPIO = 23;
static int ESP_RELAYS_GPIOS[] = {13, 27, 26, 25};
static uint8_t s_led_state = 0;

static void blink_led(void)
{
    /* Set the GPIO level according to the state (LOW or HIGH)*/
    gpio_set_level(BLINK_GPIO, s_led_state);
}

static void configure_led(void)
{
    ESP_LOGI(TAG, "Example configured to blink GPIO LED!");
    gpio_reset_pin(BLINK_GPIO);
    /* Set the GPIO as a push/pull output */
    gpio_set_direction(BLINK_GPIO, GPIO_MODE_OUTPUT);
    gpio_set_level(BLINK_GPIO, 0);
}

static void configure_relay(void)
{
    ESP_LOGI(TAG, "Configuring relays");

    int number_of_relays = sizeof(ESP_RELAYS_GPIOS)/sizeof(ESP_RELAYS_GPIOS[0]);
    for (int i = 0; i < number_of_relays; i++)
    {
        gpio_reset_pin(ESP_RELAYS_GPIOS[i]);
        gpio_set_direction(ESP_RELAYS_GPIOS[i], GPIO_MODE_OUTPUT);
    }
    
    /* Set the GPIO as a push/pull output */
    
    ESP_LOGI(TAG, "Configuring relays done");
}

static void switch_relays(void)
{
    ESP_LOGI(TAG, "Turning relays ON");

    int number_of_relays = sizeof(ESP_RELAYS_GPIOS)/sizeof(ESP_RELAYS_GPIOS[0]);
    for (int i = 0; i < number_of_relays; i++)
    {
        gpio_set_level(ESP_RELAYS_GPIOS[i], 1);
    }
    vTaskDelay(100 / portTICK_PERIOD_MS);

    ESP_LOGI(TAG, "Turning relays OFF");
    for (int i = 0; i < number_of_relays; i++)
    {
        gpio_set_level(ESP_RELAYS_GPIOS[i], 0);
    }
    /* Set the GPIO as a push/pull output */
    
    ESP_LOGI(TAG, "Turning relays done");
}

void app_main(void)
{

    /* Configure the peripheral according to the LED type */
    configure_led();
    configure_relay();
    vTaskDelay(3000 / portTICK_PERIOD_MS);

    gpio_set_level(BLINK_GPIO, 1);

    while (1) {
        ESP_LOGI(TAG, "Turning the LED %s!", s_led_state == true ? "ON" : "OFF");
        //blink_led();
        /* Toggle the LED state */
        s_led_state = !s_led_state;

        switch_relays();
        vTaskDelay(2000 / portTICK_PERIOD_MS);
    }
}
