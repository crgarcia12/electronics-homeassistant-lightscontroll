/*
   To make this work, you need to:
   Tutorial: https://www.youtube.com/watch?v=gXXdoeu7yWw

   1. Install this: https://github.com/SpenceKonde/ATTinyCore/blob/master/Wiring.md
   2. Tools -> Board -> ATTiny (not bootloader)
   3. Tools -> Chip -> ATTiny45
   4. Tools -> Programmer: Arduino as ISP (ATTiny Core)
   5. Tools -> Clock -> 8Mhz Internal
   6. Burn bootloader (sounds scary)
*/

#include <HCSR04.h>

#define EchoPin 1
#define TrigPin 2
#define RelayPin 3
#define HeartBeatPin 4

#define PumpOff 0
#define PumpOn 1

int pumpStartDistance = 12;
int pumpStoptDistance = 5;

int distance;
int pumpSatus = PumpOff;
int heartBeatStatus = LOW;

// Create and initialize the Ultrasonic object.
UltraSonicDistanceSensor distanceSensor(TrigPin, EchoPin);

void setup() 
{
  pinMode(RelayPin, OUTPUT);
  pinMode(HeartBeatPin, OUTPUT); 
}

void loop()
{                             
  // Range is calculated in Centimeters.
  distance = distanceSensor.measureDistanceCm();

  if (distance >= pumpStartDistance)
  {
    pumpSatus = PumpOn;
    digitalWrite(RelayPin, HIGH);
  }
  if (distance <= pumpStoptDistance)
  {
    pumpSatus = PumpOff;
    digitalWrite(RelayPin, LOW);
  }
  //HeartBeat led
  if (heartBeatStatus == LOW)
  {
    heartBeatStatus = HIGH;
  }
  else
  {
    heartBeatStatus = LOW;
  }
  digitalWrite(HeartBeatPin, heartBeatStatus);

  delay(1000);

}
