 # Home automation led controller custom module

 This circuit controll home lights following these rules:
 1. Safe: Safety is not trade in any decision.
 1. Fail safe: If this device fails, the ligts are still controllable using the mechanical switches.
 1. Follows standard instalation: This device does not require you to wire your house for it.
 1. It can be installed centrally

 Following those rules and using as a reference a multi-switch light controlled with a mechanical latching relay, this is the wiring idea:

![alt text](PCB/schematics-v19-jlcpcb/readme-media/relay-wiring.png)

A normal circuit sends all push buttons to the latching relay, which controlls the lights.
This circuit (ESPHome) is a side-car to the latching relay acting as an standard push button, but also sensing the output of the latching relay to detect if the lights are on or off.
# Version 19
[Detailed information](PCB/schematics-v19-jlcpcb/)

Since Version 17: 
* Adding fuses the relay outputs, specially to protect in case two relays are closed with different voltage
* Moving SHT40 and extending the footprint to make it easier to be solder
* Moving LDA to make it easier to fit in the case

![board-schematics](PCB/schematics-v19-jlcpcb/readme-media/board-schematics.svg)
![board-pcb](PCB/schematics-v19-jlcpcb/readme-media/board-pcb.png)
![board-pcb-3d](PCB/schematics-v18-jlcpcbreadme-media/board-pcb-3d.png)
![board-pcb-3d](PCB/schematics-v19-jlcpcb/readme-media/board-pcb-3d-3.png)
![board-pcb-3d](PCB/schematics-v19-jlcpcb/readme-media/board-pcb-3d-4.png)
![board-pcb-3d](PCB/schematics-v19-jlcpcb/readme-media/board-pcb-3d-2.png)

## How to order from JLCPCB:
![how-to-order-from-jlcpcb](PCB/schematics-v19-jlcpcb/readme-media/jlcpcb-how-to-order.gif)

# Older versions: Version 17
[Detailed information](PCB/schematics-v17-safety-jlcpcb/)

Since Version 13 there were many changes: 
* Changed optocoupler for another one with less current requirements.
* Change resistors to 150k x 2
* Adding fuses to every sensing channel, and remove fuse in N
* Adding a separate fuse for 5V and 3.3V track
* Littlefuse have a holder, instead of solder directly to PCB
* Adding ESP32 onboard module
* Adding Temperature sensor, to detect if the board gets too hot
* Adding USB-C powered by CP2102N UART chip
* Remove capacitors from 5v->3.3 converter, to avoid inrush current at the USB
* Adding external pull-up resistors for ESP32, some pins do not have internal pull-ups
* Adding mains nets with creepage and clearance  
* Replacing mains connectors by Wago with levers. They are super reliable and easy to use!
* Replace analog temperature sensor by SHT40 using I2C protocol.
* Also adding I2C terminal, so we can plug any I2C sensor
![board-schematics](PCB/schematics-v17-safety-jlcpcb/readme-media/board-schematics.svg)
![board-pcb](PCB/schematics-v17-safety-jlcpcb/readme-media/board-pcb.png)
![board-pcb-3d](PCB/schematics-v17-safety-jlcpcb/readme-media/board-pcb-3d.png)

![board-pcb-3d](PCB/schematics-v17-safety-jlcpcb/readme-media/enclosure.jpg)

The enclosure compared with a DIN relay. Size is perfect :)
![board-pcb-3d](PCB/schematics-v17-safety-jlcpcb/readme-media/cage-vs-relay.jpg)

# Older version: Version 16
Size comparison between V16 and V13:

![board-pcb-3d](PCB/schematics-v16-espinside-jlcpcb/readme-media/V16-v-sV2.jpg)

# Older versions: Version 13

This version was minimized by:
* Using SPST-NO 3A smaller relays
* Using SMD 3W 29k resistors instead of THT
* Removed external buttons connector
* Removed external leds connector
* Using SMD ULN2003A instead of THT
* HCPL3700 THT capacitors replaced by Tantalum SMD

Security additions:
* Added fuse at the neutral return from the sensors (F2)
* Resistors are before HCPL3700, to make them work with less than 4V to N, instead of 110V to N

Stability:
* Added filter capacitor to ULN2003A
* Added filter capacitors to LD1117AV33

Others:
* Added led indicator when powered-on

![v2-board-schematics](readme-media/v2-board-schematics.png)
![v2-board-pcb](readme-media/v2-board-pcb.png)
![v2-board-pcb-3d](readme-media/v2-board-pcb-3d.png)
![v2-board-pcb-3d](PCB/schematics-v13-new-relays-jlcpcb/readme-media/PCB.jpg)

# Older versions: Version 9

Device schematics (under development) 

![v1-board-schematics](readme-media/v1-board-schematics.png)
![v1-board-pcb](readme-media/v1-board-pcb.png)
![v1-board-pcb-3d](readme-media/v1-board-pcb-3d.png)
![v2-board-pcb-3d](PCB/schematics-v02/readme-media/PCBs.jpg)

# Older versions: Versions 1
I have no clue what I was thinking when I did this. I guess I put it here to show how much I had to learn :) 

![v1-board-schematics](PCB/schematics-v01/readme-media/schematic.png)
![v1-board-layouts](PCB/schematics-v01/readme-media/pcb-layout.png)