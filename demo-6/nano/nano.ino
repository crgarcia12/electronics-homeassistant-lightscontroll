/*
   1. Tools -> Board -> Arduino nano
   2. Tools -> Processor -> ATmega 328P (no bootloader)
   3. Tools -> Port /dev/ttyUSB0 (Linux) (Try another usb port if it does not work - Lenovo is the right one)
   
   4. Install Library HCSR04 by Martin Soic:https://github.com/Martinsos/arduino-lib-hc-sr04
   5. Install Library LiquidCrystal_I2C
   6. Encoder code from: https://www.instructables.com/id/Improved-Arduino-Rotary-Encoder-Reading/
*/

//#define SerialDebug

// Installed libraries
#include <LiquidCrystal_I2C.h>
#include <HCSR04.h>

// Arduino Internal Libraries
#include <Wire.h> 

/*******************************
 *             PINS
 *******************************/
// 5V
// GND
// DisplaySDA A4
// DisplaySCL A5

// Encoder pins cannot be changed because arduino only have 2 pins with interrupts. Pins are hardcoded 
#define EncoderPinA 2
#define EncoderPinB 3
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
#define UserRefreshTime 200

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

// Menu
// Last Item is used to know when we should go back to the first one
enum MenuStates {Main = 0, MinDistance, MaxDistance, LastItem};
enum MenuStates MenuCurrentState;

// Encoder
volatile byte aFlag = 0;
volatile byte bFlag = 0;
volatile int encoderPos = 0;
volatile byte reading = 0;

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

  // Encoder
  pinMode(EncoderPinA, INPUT_PULLUP);
  pinMode(EncoderPinB, INPUT_PULLUP);
  attachInterrupt(digitalPinToInterrupt(EncoderPinA), EncoderPinAChanged, RISING);
  attachInterrupt(digitalPinToInterrupt(EncoderPinB), EncoderPinBChanged, RISING);

#ifdef SerialDebug
  Serial.begin(9600);
  Serial.println("Starting"); 
#endif
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
  *   Only during refresh cycles
  *********************************/
  if(!executeRefresh) 
  {
    return;
  }

  /******************************** 
  *          HeartBeat led 
  *********************************/
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
  
  /******************************** 
   *          Menu 
   *********************************/
  if (digitalRead(MenuButtonPin) == HIGH) {
    MenuCurrentState = MenuCurrentState + 1;
    encoderPos = 0;
    if(MenuCurrentState >= LastItem)
    {
      MenuCurrentState = Main;
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
#ifdef SerialDebug
  Serial.println(encoderPos);
#endif
  encoderPos = 0;

  /******************************** 
   *          Display 
   *********************************/
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

void EncoderPinAChanged(){
  //stop interrupts happening before we read pin values
  cli(); 
  
  // read all eight pin values then strip away all but pinA and pinB's values
  reading = PIND & 0xC; 

  //check that we have both pins at detent (HIGH) and that we are expecting detent on this pin's rising edge
  if(reading == B00001100 && aFlag) 
  { 
    encoderPos--; //decrement the encoder's position count
    bFlag = 0; //reset flags for the next turn
    aFlag = 0; //reset flags for the next turn
  }
  else if (reading == B00000100) 
  {
    //signal that we're expecting pinB to signal the transition to detent from free rotation
    bFlag = 1;
  }
  //restart interrupts
  sei(); 
}

void EncoderPinBChanged(){
  //stop interrupts happening before we read pin values
  cli();

  //read all eight pin values then strip away all but pinA and pinB's values
  reading = PIND & 0xC;
  
  //check that we have both pins at detent (HIGH) and that we are expecting detent on this pin's rising edge
  if (reading == B00001100 && bFlag)
  {
    encoderPos++; //increment the encoder's position count
    bFlag = 0; //reset flags for the next turn
    aFlag = 0; //reset flags for the next turn
  }
  else if (reading == B00001000)
  {
    //signal that we're expecting pinA to signal the transition to detent from free rotation
    aFlag = 1;
  }
  //restart interrupts
  sei();
}
