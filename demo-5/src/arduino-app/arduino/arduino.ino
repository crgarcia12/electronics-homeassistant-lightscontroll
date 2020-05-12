// Pin definitions
const int SoilHumiditySensor = A0;
const int SoilHumiditySensorSwitch = 7;
int nrOfMessurements = 0;

void setup() {
  // Soil sensor
  pinMode(SoilHumiditySensor, INPUT);
  pinMode(SoilHumiditySensorSwitch, OUTPUT);
  
  // Start the serial monitor for debugging
  Serial.begin(9600);
} 


void loop()
{ 
  digitalWrite(SoilHumiditySensorSwitch, HIGH);
  delay(2000);
  int humidityValue = analogRead(SoilHumiditySensor); 
  digitalWrite(SoilHumiditySensorSwitch, LOW);
  Serial.print("<");
  Serial.print(humidityValue);
  Serial.print(">");
  
  if(nrOfMessurements > 10)
  {
    delay(600000);
  }
  else
  {
    nrOfMessurements++;
    delay(5000);
  }
}
