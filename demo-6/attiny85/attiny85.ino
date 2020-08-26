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

#define RelayPin 3
#define HeartBeatPin 4
#define MenuButtonPin 5
#define encoderPinA 6
#define encoderPinB 7
#define EchoPin 10
#define TrigPin 11

// Pump
#define PumpOff 0
#define PumpOn 1
int pumpStartDistance = 12;
int pumpStopDistance = 5;
int pumpSatus = PumpOff;

// Refresh and Display
#define UserRefreshTime 500
LiquidCrystal_I2C lcd(0x27, 16, 2);
long lastRefresh;
char DistanceStr[]  = "Distancia:      \0";
char PumpStateStr[] = "Bomba:          \0";
char PumpStartStr[] = "Dist On:        \0";
char PumpStopStr[]  = "Dist Off:       \0";
char* displayLine2;

// HeartBeat
int heartBeatStatus = LOW;

// Create and initialize the Ultrasonic object.
UltraSonicDistanceSensor distanceSensor(TrigPin, EchoPin);

// Encoder
boolean encoderA;
boolean encoderB;
boolean lastEncoderA = false;

// Menu
// Last Item is used to know when we should go back to the first one
enum MenuStates {Main = 0, MinDistance, MaxDistance, LastItem};
enum MenuStates MenuCurrentState;

void setup() 
{
  pinMode(RelayPin, OUTPUT);
  pinMode(HeartBeatPin, OUTPUT); 

  // Initialize lcd screen
  lcd.init();
  lcd.backlight();

  // Encoder 
  pinMode (encoderPinA, INPUT_PULLUP);
  pinMode (encoderPinB, INPUT_PULLUP);

  pinMode (MenuButtonPin, INPUT);
 
  lcd.setCursor(0,0);
  lcd.print("HOLA");
 
  // initialize digital pin LED_BUILTIN as an output.
  pinMode(LED_BUILTIN, OUTPUT);

  Serial.begin(9600);
  //Serial.println(debugCounter); debugCounter = debugCounter + 1;
}

void loop()
{     
  /******************************** 
  *      Refresh Time
  *********************************/
  bool executeRefresh = false;
  if (millis() - lastRefresh > UserRefreshTime)
  {
    executeRefresh = true;
    lastRefresh = millis();
  }


  /******************************** 
   *      Range calculation 
   *********************************/
  int distance = distanceSensor.measureDistanceCm();

  
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
  if(executeRefresh) {
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
  int encoderPos = readEncoder();
  
  /******************************** 
   *          Menu 
   *********************************/
  if(executeRefresh){
    if (digitalRead(MenuButtonPin) == HIGH) {
      MenuCurrentState = MenuCurrentState + 1;
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
  if(executeRefresh)
  {
    switch (MenuCurrentState){
        case Main:
          displayLine2 = PumpStateStr;
          break;
        case MaxDistance:
          printNumbersInStr(PumpStartStr, pumpStartDistance, 11);
          displayLine2 = PumpStartStr;
          break;
        case MinDistance:
          printNumbersInStr(PumpStopStr, pumpStopDistance, 11);
          displayLine2 = PumpStopStr;
          break;
    }

    printNumbersInStr(DistanceStr, distance, 11);
    lcd.setCursor(0,0);
    lcd.print(DistanceStr);
  
    lcd.setCursor(0,1);
    lcd.print(displayLine2);
  }
}

void printNumbersInStr (char *str, int number, int startPosition)
{
  int digit = number % 10;
  number = number / 10;

  str = str + startPosition;
  while (digit > 0 || number > 0)
  {
    *str = '0' + digit;
    str = str - 1;
    
    digit = number % 10;
    number = number / 10;
  }
}

int readEncoder ()
{
    Serial.println("Reading encoder");
  
     // read the two pins
    encoderA = digitalRead(encoderPinA);
    encoderB = digitalRead(encoderPinB);

    Serial.println(encoderA);
    Serial.println(encoderB);
    Serial.println(lastEncoderA);
    
    // check if A has gone from high to low
    if ((!encoderA) && (lastEncoderA))
    {
      // check if B is high
      if (encoderB)
      {
        // clockwise
        Serial.println(1);
        return 1;
      }
      else
      {
        Serial.println(-1);
        return -1;
      }
    }
    
    lastEncoderA = encoderA;
}
