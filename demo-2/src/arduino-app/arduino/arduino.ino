#include <LiquidCrystal_I2C.h>
#include <Wire.h>

// Pin definitions
const int encoderPinA = 12;
const int encoderPinB = 11;
const int soilHumiditySensor = A0;

// Setting up the humidity Counter
int reading = 0;
int lowest = 0;
int highest = 32000;
int changeamnt = 1;
 
// Timing for polling the encoder
unsigned long currentTime;
unsigned long lastTimeEncoder;
unsigned long lastPrintedMilis;

// Storing the readings
boolean encoderA;
boolean encoderB;
boolean lastEncoderA = false;

//initialize the liquid crystal library
//the first parameter is the I2C address
//the second parameter is how many rows are on your screen
//the third parameter is how many columns are on your screen
LiquidCrystal_I2C lcd(0x27, 16, 2);

String desiredValueStr = "Desired: ";
String currentValueStr = "Value: ";
String concatStr = "";

void setup() {
  // set the encoder pins
  pinMode(encoderPinA, INPUT_PULLUP);
  pinMode(encoderPinB, INPUT_PULLUP);
  
  // Set up the timings for encoder and display
  lastPrintedMilis = currentTime = millis();
  lastTimeEncoder = currentTime; 

  // Soil sensor
  pinMode(soilHumiditySensor, INPUT);
  
  // Start the serial monitor for debugging
  Serial.begin(9600);

  //initialize lcd screen
  lcd.init();
  // turn on the backlight
  lcd.backlight();
} 


void loop()
{ 
  int humidityValue = analogRead(soilHumiditySensor);
  
  // Read elapsed time
  currentTime = millis();
 
  if (currentTime >= (lastPrintedMilis + 200))
  {
    lcd.setCursor(0,0);
    concatStr = desiredValueStr + reading;
    lcd.print(concatStr);
   
    // tell the screen to write on the bottom row
    lcd.setCursor(0,1);
    concatStr = currentValueStr + humidityValue;
    lcd.print(concatStr);
    
    lastPrintedMilis = currentTime;
  }

  // Check if it's time to read the encoder
  if (currentTime >= (lastTimeEncoder + 2))
  {
    // read the two pins
    encoderA = digitalRead(encoderPinA);
    encoderB = digitalRead(encoderPinB);
    // check if A has gone from high to low
    if ((!encoderA) && (lastEncoderA))
    {
      // check if B is high
      if (encoderB)
      {
        // clockwise
        if (reading + changeamnt <= highest)
        {
          reading = reading + changeamnt; 
        }
      }
      else
      {
        // anti-clockwise
        if (reading - changeamnt >= lowest)
        {
          reading = reading - changeamnt; 
        }
      }
      // Output reading for debugging
      Serial.println(reading);
    }
    
    // store reading of A and millis for next loop
    lastEncoderA = encoderA;
    lastTimeEncoder = currentTime;
  }
}
