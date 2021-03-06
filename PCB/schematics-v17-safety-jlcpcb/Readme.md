 # Home automation led controller custom module v17 (printed PCB V20220221.35)

 This circuit controll home lights following these rules:
 1. Safe: Safety is not trade in any decision.
 1. Fail safe: If this device fails, the ligts are still controllable using the mechanical switches.
 1. Follows standard instalation: This device does not require you to wire your house for it.
 1. It can be installed centrally

The circuit is placed close to the mains switching box, next to the latching relays. Wiring: 

![alt text](readme-media/relay-wiring.png)

A normal circuit sends all push buttons to the latching relay, which controlls the lights.
This circuit (ESPHome) is a side-car to the latching relay acting as an standard push button, but also sensing the output of the latching relay to detect if the lights are on or off.

# Changes in this version

This version adds:
* USB-C support
* I2C temperature IC. To alert in case the board get hot
* Debugging pins for I2C and Serial
* Led to ESP32 pin
* Fix bug: ESP32 cannot pull up on all pins - adding external pull-ups resistors

Security additions:
* Added fuses to every sensing channel
* Added littlefuse holders, for easier replacing of fuses
* Increased net clearance
* Routed mains N far from digital area
* Redesigned safety slots
* Production board is conformal coated with a silicone resin Electrolube SCC3

# Device schematics

![board-schematics](readme-media/board-schematics.svg)
![board-pcb](readme-media/board-pcb.png)
![board-pcb-3d-4](readme-media/board-pcb-3d-4.png)
![board-pcb-3d](readme-media/board-pcb-3d.png)
![board-pcb-3d-2](readme-media/board-pcb-3d-2.png)
![board-pcb-3d-2](readme-media/board-pcb-3d-3.png)

# Clearance

There are three nets: Default, Mains-LowVoltage and Mains. Even when conformal coating is added, Clearance are calculated without it for added safety. In practice, instead of using A7, A6 is being used to do the calculations:

* Default: Low voltage - 0.2mm
* Mains-LowVoltage: A6 < 2V = 0.13. For added safety 0.8 mm is used (red) 
* Mains: A6 for > 300V = 1.5mm (green)

![board-pcb-3d-2](readme-media/clearance-calculation.png)

![board-pcb-3d-2](readme-media/clearance-configuration.png)

# Development notes

## Generating fabrication files for JLCPCB
1. Plot PCB Gerber + Drill + Map:

    ![screenshot](readme-media/tutorial/plot-1.png)
    ![screenshot](readme-media/tutorial/plot-2.png)

1. Bom files
    ![screenshot](readme-media/tutorial/bom-1.png)
    ![screenshot](readme-media/tutorial/bom-2.png)

    Command: python3 "C:\Program Files\KiCad\bin\scripting\plugins/bom_csv_jlcpcb.py" "%I" "%O.csv"
    ![screenshot](readme-media/tutorial/bom-3.png)

1. Drill files
    ![screenshot](readme-media/tutorial/pos-1.png)
    ![screenshot](readme-media/tutorial/pos-2.png)
    run the python script to rotate the components
    ![screenshot](readme-media/tutorial/pos-3.png)

    PS C:\\...\smt-assembly> python3 .\kicad-to-jlcpcb-pos.py .\hamodule-top-pos.csv .\hamodule-top-pos-jlcpcb.csv

## Generate documents

schematics:
![screenshot](readme-media/tutorial/gen-images-1.png)

PCBNew:

Print to PDF, and then use an online tool to get high resolution images. For example https://pdfshelter.com/pdf-to-jpg
