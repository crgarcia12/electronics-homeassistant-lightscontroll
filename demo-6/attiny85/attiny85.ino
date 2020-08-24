/*
   To make this work, you need to:
   Tutorial: https://www.youtube.com/watch?v=gXXdoeu7yWw

   1. Install this: https://github.com/SpenceKonde/ATTinyCore/blob/master/Wiring.md
   2. Tools -> Board -> ATTiny (not bootloader)
   3. Tools -> Chip -> ATTiny45
   4. Tools -> Programmer: Arduino as ISP (ATTiny Core)
   5. Tools -> Clock -> 8Mhz Internal
   6. Burn bootloader (sounds scary)

   7. Install Library HCSR04 by Martin Soic:https://github.com/Martinsos/arduino-lib-hc-sr04
   8. Install Library LiquidCrystal_I2C
*/

// Installed libraries
#include <LiquidCrystal_I2C.h>
#include <HCSR04.h>

// Arduino Internal Libraries
#include <Wire.h> 

LiquidCrystal_I2C lcd(0x27, 16, 2);


#define EchoPin 1
#define TrigPin 2
#define RelayPin 3
#define HeartBeatPin 4

#define PumpOff 0
#define PumpOn 1

int pumpStartDistance = 12;
int pumpStoptDistance = 5;

int distance;
int pumpSatus = PumpOff;
int heartBeatStatus = LOW;

// Create and initialize the Ultrasonic object.
UltraSonicDistanceSensor distanceSensor(TrigPin, EchoPin);

String DistanceStr = "Distancia: ";
String PumpStateStr = "Bomba: ";
String concatStr = "";

void setup() 
{
  pinMode(RelayPin, OUTPUT);
  pinMode(HeartBeatPin, OUTPUT); 

  //initialize lcd screen
  lcd.init();
  // turn on the backlight
  lcd.backlight();
}

void loop()
{                             
  // Range is calculated in Centimeters.
  distance = distanceSensor.measureDistanceCm();

  if (distance >= pumpStartDistance)
  {
    pumpSatus = PumpOn;
    digitalWrite(RelayPin, HIGH);
  }
  if (distance <= pumpStoptDistance)
  {
    pumpSatus = PumpOff;
    digitalWrite(RelayPin, LOW);
  }
  //HeartBeat led
  if (heartBeatStatus == LOW)
  {
    heartBeatStatus = HIGH;
  }
  else
  {
    heartBeatStatus = LOW;
  }

  digitalWrite(HeartBeatPin, heartBeatStatus);

  concatStr = DistanceStr + distance;
  lcd.setCursor(0,0);
  lcd.print(concatStr);

  concatStr = PumpStateStr + pumpSatus;
  lcd.setCursor(0,1);
  lcd.print(concatStr);

  delay(1000);

}
