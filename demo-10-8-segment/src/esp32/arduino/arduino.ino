
//// for ESP32 Microcontrollers
int dataPin = 21;
int ShiftRegisterClockPin = 23; // SRCLK: dataPin is loaded in the register when Shift Register Clock goes low -> high, but still not stored
int ShiftStorageClockPin = 22;  // SSCLK: when goes from low-> high the register is stored and applied to the output pins
int lastValue = 0;
void setup() 
{
  pinMode(dataPin, OUTPUT);
  pinMode(ShiftRegisterClockPin, OUTPUT);  
  pinMode(ShiftStorageClockPin, OUTPUT);
  
  Serial.begin(9600);
}
 
void loop() 
{  
  String stringOne = "Output value: ";
  String stringThree = "";
  
  //count up routine
  for (int j = 0; j < 256; j++) {
    stringThree = stringOne + j;
    Serial.println(stringThree);
    //ground latchPin and hold low for as long as you are transmitting
    digitalWrite(ShiftStorageClockPin, LOW);
    shiftOut(dataPin, ShiftRegisterClockPin, LSBFIRST, j);
    //return the latch pin high to signal chip that it
    //no longer needs to listen for information
    digitalWrite(ShiftStorageClockPin, HIGH);
    delay(5);
    digitalWrite(ShiftStorageClockPin, LOW);
    delay(5);
  }
}
 
void updateShiftRegister()
{

}
