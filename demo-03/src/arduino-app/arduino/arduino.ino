#include <LiquidCrystal_I2C.h>
#include <Wire.h>

// Pin definitions
const int buttonPin = 7;
const int buzzerPin = 9;
const int encoderPinB = 11;
const int encoderPinA = 12;


// Setting up the encoder
int lowest = 0;
int highest = 32000;
int changeamnt = 1000;
boolean encoderA;
boolean encoderB;
boolean lastEncoderA = false;
int frequency = 3000;
 
// Timings for polling the encoder and printing the screen
unsigned long currentTime;
unsigned long lastTimeEncoder;
unsigned long lastPrintedMilis;

//initialize the liquid crystal library
//the first parameter is the I2C address
//the second parameter is how many rows are on your screen
//the third parameter is how many columns are on your screen
LiquidCrystal_I2C lcd(0x27, 16, 2);

// Display strings
String desiredValueStr = "Frequency: ";
String activatedValueStr = "Activated: ";
String concatStr = "";

// Variables
bool isActive;

void setup() {
  // set the encoder pins
  pinMode(encoderPinA, INPUT_PULLUP);
  pinMode(encoderPinB, INPUT_PULLUP);
  pinMode(buzzerPin, OUTPUT);
  pinMode(buttonPin, INPUT);
  
  // Set up the timings for encoder and display
  lastPrintedMilis = currentTime = millis();
  lastTimeEncoder = currentTime; 

  //initialize lcd screen and turn on backlight
  lcd.init();
  lcd.backlight();

  // Start the serial monitor for debugging
  Serial.begin(9600);

} 

void loop()
{ 
  // Read elapsed time
  currentTime = millis();

  // See if we got any command
  char device;
  char command;
  char * params;  
  bool commandReceived = false;
  
  commandReceived = getCommand(&device, &command, &params);
  if (commandReceived)
  {
    executeCommand(device, command, params);
    free(params);
  }

  // Should we print the screent?
  if (currentTime >= (lastPrintedMilis + 200))
  {
    lcd.setCursor(0,0);
    concatStr = desiredValueStr + frequency;
    lcd.print(concatStr);

    lcd.setCursor(0,1);
    concatStr = activatedValueStr + isActive;
    lcd.print(concatStr);
    
    lastPrintedMilis = currentTime;
  }

  // Did user pressed the button?
  if (isActive)
  {
    if(digitalRead(buttonPin) == 1)
    {
      deactivate();
    }
  }
  
  // Time to read the encoder!
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
        // clockwise, don't overflow
        if (frequency + changeamnt > 0 && frequency + changeamnt <= highest)
        {
          frequency = frequency + changeamnt; 
          activate(frequency);
        }
      }
      else
      {
        // anti-clockwise
        if (frequency - changeamnt >= lowest)
        {
          frequency = frequency - changeamnt; 
          activate(frequency);
        }
      }
      // Output frequency for debugging
      Serial.println(frequency);
    }
    
    // store reading of A and millis for next loop
    lastEncoderA = encoderA;
    lastTimeEncoder = currentTime;
  }
}

void activate(int buzzerTone)
{
  PrintSerial("[DBG: Activating.", '.', "-", '.', "-", " ", "]\0");
  tone(buzzerPin, buzzerTone); 
  isActive = true;
}

void deactivate()
{
  PrintSerial("[DBG: Deactivating.", '.', "-", '.', "-", " ", "]\0");
  noTone(buzzerPin); 
  isActive = false;  
}

bool getCommand(char * device, char * command, char * * paramsPtr)
{
  if(!Serial.available())
  {
    return false;
  }
  
  *paramsPtr  = (char*) malloc(sizeof(char) * 8);
  char * params  = * paramsPtr;
  params[0] = '\0';
  
  char entireCommandString[12];
  
  char incommingChar;
  int charIndex = 0;
  bool commandInitiated = false;


  while (true) 
  {
    // wait for the char
    while (!Serial.available()) {}
    incommingChar = Serial.read();

    // PrintSerial("[DBG: Command char arrived. Char='", incommingChar, "'. CharIndex='", charIndex, "']");

    // Until we dont get a '[' we don't react
    if (!commandInitiated)
    {
      if(incommingChar != '[')
      {
        // This was a trash character, we skip it
        free(*paramsPtr);
        return false;
      }
      commandInitiated = true;
    }

    // Did the command finished?
    if (incommingChar == ']' || charIndex > 10)
    {
      entireCommandString[charIndex++] = incommingChar;
      break;
    }

    // Where do we put the received char?
    if(charIndex < 1)
    {
      // This was the opening braket, do nothing
    }
    else if(charIndex < 2)
    {
      (*device) = incommingChar;
    }
    else if(charIndex < 3)
    {
      (*command) = incommingChar;
    }
    else
    {
      params[charIndex - 3] = incommingChar;
    } 

    entireCommandString[charIndex] = incommingChar;
    charIndex++;
  }

  // This one is -4 because the last char (']') incremented charIndex
  params[charIndex - 4] = '\0';
  entireCommandString[charIndex++] = '\0';
  return true;
}

void executeCommand(const char device, const char command, const char * params)
{
  // Aux variables
  int motorAngle = 0;
  int buzzerTone = 0;
  int RgbLedPin = 0;
  
  // PrintSerial("[DBG: Start 2processing: ", device, "-", command, "-", params, "]\0");
  switch(device) {
    case 'B':
      if(command == '0')
      {
        deactivate();
      }
      else
      {
        frequency = ((String)params).toInt();
        activate(frequency);
      }
      break;
    case 'M':
      break;
  }

  PrintSerial("[DBG: Finished processing: ", device, "-", command, "-", params, "]\0");
}

void PrintSerial(
  const char* str1,
  const char char2,
  const char* str3,
  const char char4,
  const char * str5,
  const char * str6,
  const char * str7)
{
  Serial.print(str1);
  Serial.print(char2);
  Serial.print(str3);
  Serial.print(char4);
  Serial.print(str5);
  Serial.print(str6);
  Serial.print(str7);
}
