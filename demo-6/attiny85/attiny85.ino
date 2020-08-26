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
#define MenuButtonPin 5
#define encoderPinA 6
#define encoderPinB 7

#define PumpOff 0
#define PumpOn 1

#define UserRefreshTime 20

int timer = 0;

int pumpStartDistance = 12;
int pumpStopDistance = 5;
int distance;
int pumpSatus = PumpOff;
int heartBeatStatus = LOW;

// Create and initialize the Ultrasonic object.
UltraSonicDistanceSensor distanceSensor(TrigPin, EchoPin);

// Display strings
char* DistanceStr  = "Distancia:      \0";
char* PumpStateStr = "Bomba:          \0";
char* PumpStartStr = "Dist On:        \0";
char* PumpStopStr  = "Dist Off:       \0";
char* displayLine2;

// Encoder configuration: https://playground.arduino.cc/Main/RotaryEncoders/
int encoderPos = 0;
int encoderPinALast = LOW;
int encoderPinACurrent = LOW;

// Last Item is used to know when we should go back to the first one
enum MenuStates {Main = 0, MinDistance, MaxDistance, LastItem};
enum MenuStates MenuCurrentState;

int debugCounter = 1;

void setup() 
{
  pinMode(RelayPin, OUTPUT);
  pinMode(HeartBeatPin, OUTPUT); 

  // Initialize lcd screen
  lcd.init();
  lcd.backlight();

  // Encoder 
  pinMode (encoderPinA, INPUT);
  pinMode (encoderPinB, INPUT);

  pinMode (MenuButtonPin, INPUT);
 
  lcd.setCursor(0,0);
  lcd.print("HOLA");
 
  // initialize digital pin LED_BUILTIN as an output.
  pinMode(LED_BUILTIN, OUTPUT);

  Serial.begin(9600);
  Serial.println(debugCounter); debugCounter = debugCounter + 1;
}

void loop()
{            
  /******************************** 
   *      Range calculation 
   *********************************/
  distance = distanceSensor.measureDistanceCm();

  
  if (distance >= pumpStartDistance)
  {
    pumpSatus = PumpOn;
    digitalWrite(RelayPin, HIGH);
  }
  if (distance <= pumpStopDistance)
  {
    pumpSatus = PumpOff;
    digitalWrite(RelayPin, LOW);
  }
  
  /******************************** 
  *          HeartBeat led 
  *********************************/
  if(timer == UserRefreshTime) {
    if (heartBeatStatus == LOW)
    {
      heartBeatStatus = HIGH;
    }
    else
    {
      heartBeatStatus = LOW;
    }
    digitalWrite(LED_BUILTIN, heartBeatStatus); 
    digitalWrite(HeartBeatPin, heartBeatStatus);
  }
  
  /******************************** 
   *          Encoder 
   *********************************/
  encoderPos = 0;
  encoderPinACurrent = digitalRead(encoderPinA);
  if ((encoderPinALast == LOW) && (encoderPinACurrent == HIGH)) {
    if (digitalRead(encoderPinB) == LOW) {
      encoderPos = -1;
    } else {
      encoderPos = 1;
    }
  }
  encoderPinALast = encoderPinACurrent;

  /******************************** 
   *          Menu 
   *********************************/
  if(timer == UserRefreshTime){
    if (digitalRead(MenuButtonPin) == HIGH) {
      //MenuCurrentState = MenuCurrentState + 1;
      if(MenuCurrentState >= LastItem)
      {
        MenuCurrentState = Main;
      }
    }
  }

  switch (MenuCurrentState){
    case Main:
      PumpStateStr[7] = '0' + pumpSatus;
      break;
    case MaxDistance:
      pumpStartDistance = pumpStartDistance + encoderPos;
      if(pumpStartDistance < pumpStopDistance) pumpStartDistance = pumpStopDistance + 1;
      if(pumpStartDistance > 30) pumpStartDistance = 30;
      break;
    case MinDistance:
      pumpStopDistance = pumpStopDistance + encoderPos;
      if (pumpStopDistance < 5) pumpStopDistance = 5;
      if (pumpStopDistance > pumpStartDistance) pumpStopDistance = pumpStartDistance - 1;
      break;
  }
  
  /******************************** 
   *          Display 
   *********************************/
  if(timer == UserRefreshTime)
  {
    switch (MenuCurrentState){
        case Main:
          displayLine2 = PumpStateStr;
          break;
        case MaxDistance:
          //printNumbersInStr(PumpStartStr, pumpStartDistance, 11);
          displayLine2 = PumpStartStr;
          break;
        case MinDistance:
          //printNumbersInStr(PumpStopStr, pumpStartDistance, 11);
          displayLine2 = PumpStopStr;
          break;
    }

    //printNumbersInStr(DistanceStr, distance, 11);
    lcd.setCursor(0,0);
    lcd.print(DistanceStr);
  
    lcd.setCursor(0,1);
    lcd.print(displayLine2);
  }

  timer = timer + 1;
  if(timer > UserRefreshTime) {
    timer = 0;
  }
}
