void setup() {
  Serial.begin(9600);

}

void getCommand((char[])& device, (char[])& command, (char[])& params)
{
  device = malloc(8 * sizeof(char));
  command = malloc(8 * sizeof(char));
  params = malloc(8 * sizeof(char));

  char entireCommandString[27];
  
  int incomingByte;
  char incommingChar;
  int charIndex = 0;

  while(!Serial.available() ){}

  while (Serial.available() > 0) 
  {
    incommingChar = Serial.read();

    if(charIndex < 8)
    {
      device[charIndex] = incommingChar;
    }
    else if(charIndex >= 8 && charIndex < 16)
    {
      command[charIndex] = incommingChar;
    }
    else if(charIndex >= 16 && charIndex < 24)
    {
      param[charIndex] = incommingChar;
    } 
       
    if(charIndex < 24)
    {
      entireCommandString[charIndex] = incommingChar;
    }
    
    charIndex++;
  }

  // Confirmation of what we got
  Serial.println(entireCommandString);
}

void loop() {
  // put your main code here, to run repeatedly:

}
