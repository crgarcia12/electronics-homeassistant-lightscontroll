Connecting WS2815 12v Addressable Led strip to Arduino

Wireing:

black   0v
red    12v

red     -
green   D4 (data pin)
blue    0v
white   -

All Neutro (0v) has to be connected together
Arduino can be powered using USB and the PC, but first try with another source since it can burn the USB if missconnected

Using library: #include <FastLED.h> v 3.4.0

#include <FastLED.h>
#define NUM_LEDS 288
#define DATA_PIN 4

// Define the array of leds
CRGB leds[NUM_LEDS];

void setup() { 
    FastLED.addLeds<WS2813, DATA_PIN, RGB>(leds, NUM_LEDS);  // GRB ordering is typical
}

void loop() {
    for(int i = 0; i < NUM_LEDS; i++)
    {
         leds[i] = CRGB(255,0,0);
    }
    FastLED.show();
    delay(1000);
}