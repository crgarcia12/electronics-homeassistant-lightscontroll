/*
   1. Tools -> Board -> Arduino nano
   2. Tools -> Processor -> ATmega 328P (no bootloader)
   
   3. Install Library HCSR04 by Martin Soic:https://github.com/Martinsos/arduino-lib-hc-sr04
   4. Install Library LiquidCrystal_I2C
   5. Install Library Encoder: https://www.pjrc.com/teensy/td_libs_Encoder.html
*/

// Installed libraries
#include <LiquidCrystal_I2C.h>
#include <HCSR04.h>
#include <Encoder.h>

// Arduino Internal Libraries
#include <Wire.h> 

/*******************************
 *             PINS
 *******************************/
// 5V
// GND
// DisplaySDA A4
// DisplaySCL A5

#define encoderPinA 2
#define encoderPinB 3
#define MenuButtonPin 4

#define RelayPin 5

#define HeartBeatPin 7

#define EchoPin 10
#define TrigPin 11

// Pump
#define PumpOff 0
#define PumpOn 1
int pumpStartDistance = 12;
int pumpStopDistance = 5;
int pumpSatus = PumpOff;


// Refresh
#define UserRefreshTime 300

// Display
#define DisplaySize 16
LiquidCrystal_I2C lcd(0x27, DisplaySize, 2);
long lastRefresh;
char DistanceStr[]  = "Distancia:      \0";
char PumpStateStr[] = "Bomba:          \0";
char PumpStartStr[] = "Dist On:        \0";
char PumpStopStr[]  = "Dist Off:       \0";
char* displayLine2;

// HeartBeat
int heartBeatStatus = LOW;

// Ultrasonic distance
UltraSonicDistanceSensor distanceSensor(TrigPin, EchoPin);

// Encoder
#define ENCODER_OPTIMIZE_INTERRUPTS
Encoder encoder(encoderPinA, encoderPinB);

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

  pinMode (MenuButtonPin, INPUT);
 
  lcd.setCursor(0,0);
  lcd.print("HOLA");
 
  // initialize digital pin LED_BUILTIN as an output.
  pinMode(LED_BUILTIN, OUTPUT);

  //Serial.begin(9600);
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
  int encoderPos = encoder.read() / 4;
  Serial.println(encoderPos);
  encoder.write(0);
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
          printNumbersInStr(PumpStartStr, pumpStartDistance, DisplaySize);
          displayLine2 = PumpStartStr;
          break;
        case MinDistance:
          printNumbersInStr(PumpStopStr, pumpStopDistance, DisplaySize);
          displayLine2 = PumpStopStr;
          break;
    }

    printNumbersInStr(DistanceStr, distance, DisplaySize);
    lcd.setCursor(0,0);
    lcd.print(DistanceStr);
  
    lcd.setCursor(0,1);
    lcd.print(displayLine2);
  }
}

void printNumbersInStr (char *str, int number, int startPosition)
{
  // Base 0 index
  startPosition--;
  
  for (int index = startPosition; index >= startPosition -3; index--)
  {       
    int digit = number % 10;
    number = number / 10;

    if(digit == 0 && number == 0)
    {
      str[index] = ' ';
    }
    else
    {
      str[index] = '0' + digit;
    }
  }
}
