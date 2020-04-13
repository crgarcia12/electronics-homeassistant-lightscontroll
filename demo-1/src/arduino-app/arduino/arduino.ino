int RedLightPin = 7;
int YellowLightPin = 6;
int GreenLightPin = 5;

void setup() {
  Serial.begin(9600);
  pinMode(RedLightPin, OUTPUT);
  pinMode(YellowLightPin, OUTPUT);
  pinMode(GreenLightPin, OUTPUT);  
}

void loop() 
{ 
  char device;
  char command;
  char * params;
  getCommand(&device, &command, &params);

  PrintSerial("[DBG: Start processing: ", device, "-", command, "-", params, "]\0");
  switch(device) {
    case 'R':
      if(command == '1')
      {
        digitalWrite(RedLightPin, HIGH);
      }
      else
      {
        digitalWrite(RedLightPin, LOW);
      }
      break;
    case 'Y':
      if(command == '1')
      {
        digitalWrite(YellowLightPin, HIGH);
      }
      else
      {
        digitalWrite(YellowLightPin, LOW);
      }
      break;
    case 'G':
      if(command == '1')
      {
        digitalWrite(GreenLightPin, HIGH);
      }
      else
      {
        digitalWrite(GreenLightPin, LOW);
      }
      break;
  }

  PrintSerial("[DBG: Finished processing: ", device, "-", command, "-", params, "]\0");
  
  free(params);
}

void getCommand(char * device, char * command, char * * paramsPtr)
{
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

    PrintSerial("[DBG: Command char arrived. Char='", incommingChar, "'. CharIndex='", charIndex, "']");

    // Until we dont get a '[' we don't react
    if (!commandInitiated)
    {
      if(incommingChar != '[')
      {
        continue;
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

  params[charIndex - 3] = '\0';
  entireCommandString[charIndex++] = '\0';
  
  
  // Confirmation of what we are going to process
  PrintSerial("[confirm:", entireCommandString);
}

void PrintSerial(const char* str1, const char* str2)
{
  Serial.print(str1);
  Serial.print(str2);
}

void PrintSerial(
  const char* str1,
  const char char2,
  const char* str3,
  const int int4,
  const char * str5)
{
  Serial.print(str1);
  Serial.print(char2);
  Serial.print(str3);
  Serial.print(int4, DEC);
  Serial.print(str5);
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
