#include "Adafruit_SHT4x.h"
#include "Wire.h"
Adafruit_SHT4x sht4;

#define PIN_LED 1

int PIN_RELAYS[] = {
  46, 8, 18, 17
};    

int PIN_SENSING[] = {
  15, 7, 6, 5
};    

int i = 0;
bool SHT_is_working = false;

void setup() {
  Serial.begin(115200);

  // SET SDA, SCL pins
  int sda_pin = 42;
  int scl_pin = 41;
  Wire.begin(sda_pin, scl_pin);
  sht4 = Adafruit_SHT4x();
  
  // PINS
  pinMode(PIN_LED, OUTPUT);

  for(i = 0; i < 4; i++) {
    pinMode(PIN_RELAYS[i], OUTPUT);
    pinMode(PIN_SENSING[i], INPUT);
  }
  
  ////////////////////////////////////////////////////////////
  // SHT 40
  ////////////////////////////////////////////////////////////
  
  if (! sht4.begin()) {
    Serial.println("Couldn't find SHT4x");
    return;
  }
  
  SHT_is_working = true;
  Serial.println("Found SHT4x sensor");
  Serial.print("Serial number 0x");
  Serial.println(sht4.readSerial(), HEX);

  // You can have 3 different precisions, higher precision takes longer
  sht4.setPrecision(SHT4X_HIGH_PRECISION);
  switch (sht4.getPrecision()) {
     case SHT4X_HIGH_PRECISION: 
       Serial.println("High precision");
       break;
     case SHT4X_MED_PRECISION: 
       Serial.println("Med precision");
       break;
     case SHT4X_LOW_PRECISION: 
       Serial.println("Low precision");
       break;
  }

  // You can have 6 different heater settings
  // higher heat and longer times uses more power
  // and reads will take longer too!
  sht4.setHeater(SHT4X_NO_HEATER);
  switch (sht4.getHeater()) {
     case SHT4X_NO_HEATER: 
       Serial.println("No heater");
       break;
     case SHT4X_HIGH_HEATER_1S: 
       Serial.println("High heat for 1 second");
       break;
     case SHT4X_HIGH_HEATER_100MS: 
       Serial.println("High heat for 0.1 second");
       break;
     case SHT4X_MED_HEATER_1S: 
       Serial.println("Medium heat for 1 second");
       break;
     case SHT4X_MED_HEATER_100MS: 
       Serial.println("Medium heat for 0.1 second");
       break;
     case SHT4X_LOW_HEATER_1S: 
       Serial.println("Low heat for 1 second");
       break;
     case SHT4X_LOW_HEATER_100MS: 
       Serial.println("Low heat for 0.1 second");
       break;
  }
  
}

void loop() {
  // put your main code here, to run repeatedly:
  delay(1000);
  // Led
  digitalWrite(PIN_LED, HIGH);
  Serial.println("#######################");
  // Relay
  for(i = 0; i < 4; i++) {
    Serial.print("Relay High: "); Serial.println(PIN_RELAYS[i]);
    digitalWrite(PIN_RELAYS[i], HIGH);
  }

  Serial.println("#######################");
  int j = 0;
  for(i = 0; i < 4; i++) {
    j = digitalRead(PIN_SENSING[i]);
    Serial.print("pin "); Serial.print(PIN_SENSING[i]); Serial.print(": "); Serial.println(j);
  }
  delay(3000);
  digitalWrite(PIN_LED, LOW);

  // Relay
  for(i = 0; i < 4; i++) {
    Serial.print("Relay Low: "); Serial.println(PIN_RELAYS[i]);
    digitalWrite(PIN_RELAYS[i], LOW);
  }


  ////////////////////////////////////////
  // SHT 40
  ////////////////////////////////////////
  if(SHT_is_working)
  {
    sensors_event_t humidity, temp;
    
    uint32_t timestamp = millis();
    sht4.getEvent(&humidity, &temp);// populate temp and humidity objects with fresh data
    timestamp = millis() - timestamp;

    Serial.print("Temperature: "); Serial.print(temp.temperature); Serial.println(" degrees C");
    Serial.print("Humidity: "); Serial.print(humidity.relative_humidity); Serial.println("% rH");

    Serial.print("Read duration (ms): ");
    Serial.println(timestamp);
  }
}
