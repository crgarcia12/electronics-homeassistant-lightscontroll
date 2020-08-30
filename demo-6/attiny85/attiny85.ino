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
*/
#include <HCSR04.h>

#define HeartBeatPin 4
#define MenuButtonPin 5
#define RelayPin 6
#define EchoPin 10
#define TrigPin 11

// Pump
#define PumpOff 0
#define PumpOn 1
int pumpStartDistance = 12;
int pumpStopDistance = 5;
int pumpSatus = PumpOff;

// Refresh and Display
#define UserRefreshTime 300

// HeartBeat
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
    digitalWrite(HeartBeatPin, heartBeatStatus);
  }
 
}

