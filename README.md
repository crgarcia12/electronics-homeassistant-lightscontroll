# Home Automation Lights Controller - ESPHome & Home Assistant Compatible

A smart lighting controllerr PCB that integrates seamlessly with ESPHome and Home Assistant while maintaining full compatibility with traditional mechanical switches. This device acts as a "sidecar" to existing latching relays, adding smart home capabilities without compromising safety or requiring rewiring.

## Table of Contents

- [Overview](#overview)
- [Key Features](#key-features)
- [Quick Start](#quick-start)
- [Prerequisites](#prerequisites)
- [Available Versions](#available-versions)
- [How It Works](#how-it-works)
- [Installation Guide](#installation-guide)
- [Configuration](#configuration)
- [Technical Specifications](#technical-specifications)
- [Ordering from JLCPCB](#how-to-order-from-jlcpcb)
- [Development](#development-notes)
- [Version History](#version-history)
- [Contributing](#contributing)

## Overview

This circuit controls home lights following these core principles:

1. **Safe**: Safety is first and is not compromised in any decision
2. **Fail-safe**: If this device fails, the lights are still controllable using the mechanical switches
3. **Follows standard installation**: This device does not require you to rewire your house
4. **Centrally installable**: Can be installed in a central electrical panel

Following those principles and using as a reference a multi-switch light controllerd with a mechanical latching relay, this is the wiring concept:

![Relay wiring diagram showing how the controllerr integrates with existing latching relay setup](PCB/schematics-v19-jlcpcb/readme-media/relay-wiring.png)

A normal circuit sends all push buttons to the latching relay, which controls the lights. This circuit (ESPHome) acts as a sidecar to the latching relay, functioning as a standard push button while also sensing the output of the latching relay to detect whether the lights are on or off.

## Key Features

### Hardware Features

- **Extensible design**:
  - Exposed I2C pins
  - Exposed Serial pins
  - Multiple GPIO pins available
  - 3.3V jumper: Allows disconnecting the internal ESP32 and replacing it with any other microcontroller
  - Relay pins (4-channel version): Relays can be controllerd with an external microcontroller or device directly
  - Current sensing pins: Current sensing information is exposed for external microcontroller or device integration
  - Provides both 3.3V and 5V power rails
- **ESPHome compatible**: Easy integration with Home Assistant
- **Latest versions use ESP32-S3**: A powerful microcontroller with extensive features

### Safety Features

This device incorporates multiple layers of protection:

- Input fast-blow fuse
- Input MOV (Metal Oxide Varistor) for surge protection
- Slow fuses in every relay output
- Slow fuses in every mains detection input
- 4kV insulated power supply for low voltage isolation
- Conformal coating with 90kV/mm² insulation
- High-precision temperature sensor (SHT40)

## Available Versions

There are two main versions of the board:
- **4-channel version**: Compact design for smaller installations
- **8-channel version**: Extended capacity for larger installations

Latest versions use the ESP32-S3, which is a powerful microcontroller with WiFi, Bluetooth, and extensive GPIO capabilities.

## Quick Start

### What You'll Need

- One of the PCB versions (4 or 8 channels)
- Existing installation with mechanical latching relays
- WiFi network for ESPHome connectivity
- Home Assistant instance (optional, but recommended)

### Basic Setup Steps

1. **Order the PCB**: See [Ordering from JLCPCB](#how-to-order-from-jlcpcb) section
2. **Wire the device**: Connect to your existing latching relay setup
3. **Flash ESPHome**: Upload the ESPHome configuration (see [Configuration](#configuration))
4. **Integrate with Home Assistant**: The device will auto-discover in Home Assistant

For detailed instructions, see the [Installation Guide](#installation-guide) section below.

## Prerequisites

Before installing this controllerr, ensure you have:

- Basic understanding of electrical wiring and safety
- Existing mechanical latching relay installation
- Access to your electrical panel
- **Safety equipment**: Insulated tools, voltage tester
- **Knowledge**: Only qualified electricians should work with mains voltage
- ESPHome installed (for firmware flashing)
- Home Assistant (optional, for smart home integration)

## Current Version: Version 27

Version 27 is an evolution of version 26.1, optimized to fit perfectly in the standard DIN rail enclosure.

**Hardware**: Uses SN74LVCH8 level shifter with OUTPUT_ENABLED feature

![Board schematics for version 27](PCB/schematics-v27/readme-media/schematics.svg)
![PCB layout for version 27](PCB/schematics-v27/readme-media/board.png)
![Front view of PCB version 27](PCB/schematics-v27/readme-media/board-front.svg)
![Back view of PCB version 27](PCB/schematics-v27/readme-media/board-back.svg)
![3D render of board - angle 1](PCB/schematics-v27/readme-media/board-3d-1.png)
![3D render of board - angle 2](PCB/schematics-v27/readme-media/board-3d-2.png)
![3D render of board - angle 3](PCB/schematics-v27/readme-media/board-3d-3.png)
![3D render of board - angle 4](PCB/schematics-v27/readme-media/board-3d-4.png)
![3D render of board - angle 5](PCB/schematics-v27/readme-media/board-3d-5.png)

## How It Works

### Mains Sensing
The PCB uses an optocoupler (LDA210 or ILD755) to detect the presence of mains voltage. These Darlington optocouplers are chosen specifically for their low current requirements, drawing only 0.7mA at less than 2V. This low-power design allows for efficient sensing without overheating components.

To reduce the mains voltage to a safe level for the optocoupler, a 300kΩ resistance setup is used. This configuration dissipates only 0.17W, which is split across two resistors. Each resistor, therefore, dissipates about 0.08W, preventing overheating issues commonly seen with other designs (such as those using the HCP chip). This improvement enhances both the safety and longevity of the PCB.

Each mains sensing channel is equipped with a fuse to protect against failures. In the event that one of the resistors fails short, the remaining resistor can carry up to 1.5mA until the fuse burns out, effectively preventing further damage. During this failure condition, the resistor would dissipate about 0.4W, so large resistors are used to withstand this potential load.

### Optocoupler and Capacitor Behavior

This PCB uses a Darlington optocoupler (LDA210), chosen for its high-gain behavior, which allows the system to react more quickly when mains power is turned on and requires less current on the LED side.

The oscilloscope images below show two different channels after the optocoupler while they are sensing mains. The yellow channel does not have any capacitors on the output, while the blue line has the capacitors.

In the first image, the optocoupler’s response to the sine wave is shown when mains power is ON. The blue line illustrates how capacitors help maintain the output in a high state when the AC cycle is crossing zero. This capacitor-induced holding effect ensures that the output remains stable, preventing fluctuations in the DC output that could cause false OFF triggers. However, this design means the line must be off for several cycles before the microcontroller can reliably detect the "off" state. Using excessively large capacitors can increase the detection delay to a noticeable extent, so capacitor size must be carefully selected to balance responsiveness and stability.

![oscilloscope-sensing-mains-1](PCB/schematics-v22-jlcpcb/readme-media/osc-sens-on.jpg)

When mains power is first applied (yellow line), the capacitor requires time to charge before the optocoupler’s output reaches a high state (blue line). This results in a slight delay before the microcontroller detects the power-on state. If overly large capacitors are used, this delay becomes more pronounced, which can reduce responsiveness. The capacitor size must be carefully selected to minimize this delay while ensuring system stability.

![oscilloscope-sensing-mains-2](PCB/schematics-v22-jlcpcb/readme-media/osc-sens-switch-on.jpg)

Switching off mains power can generate noise, particularly depending on where in the sine wave the power is cut (e.g., at zero-crossing). Capacitors on the PCB help absorb much of this noise, reducing the likelihood of transient spikes or false "on" triggers that could interfere with other components or the microcontroller. This filtering helps improve system reliability, especially in noisy environments.

![oscilloscope-sensing-mains-3](PCB/schematics-v22-jlcpcb/readme-media/osc-sens-switch-off.jpg)

### Relays
The initial design for this system included small PCB-mounted mechanical relays, such as the PCN105D model. These relays, while compact and effective for basic switching, generated significant electromagnetic interference (EMI) due to the mechanical contacts. Despite efforts to mitigate this noise by adding flyback diodes and isolating the ground plane, the interference remained high. Under certain conditions, EMI levels were high enough to cause the microcontroller to reset, making this setup unreliable for stable home automation.

The image below illustrates the noise generated by the PCN105D mechanical relay during operation. This noise spike, especially during switching events, demonstrated the limitations of PCB-mounted relays in applications requiring low EMI.

These PCB relays are intended to trigger DIN-mounted latching relays, which are commonly used in electrical installations typically without flyback diodes, resulting in voltage spikes of several KV when switched off.

This picture shows PCN105D relays when switched off:

![Oscilloscope showing EMI noise from PCN105D mechanical relay](readme-media/relay-analysis/Mechanical-PCN-105D.png)

To address the noise and stability issues, the design was upgraded to use AQG22205 solid-state relays. These relays are only rated at 2A, but they incorporate an internal snubber circuit, making them far more resistant to voltage spikes on the mains side. Unlike mechanical relays, these solid-state relays do not generate any noise during switching.

![Oscilloscope showing clean switching with AQG12105 solid-state relay](readme-media/relay-analysis/SSR-AQG12105.png)

## Installation Guide

> **⚠️ WARNING**: Installation involves working with mains voltage. Only qualified electricians should perform this installation. Improper installation can result in serious injury or death.

### Wiring Instructions

1. **Power off** all circuits at the breaker
2. **Verify** power is off using a voltage tester
3. Connect the controller to your existing latching relay setup following the wiring diagram above
4. Connect each mains sensing input to the appropriate circuit outputs
5. Ensure all connections are secure and properly insulated
6. **Double-check** all wiring before applying power

### First Power-On

1. Apply power to the device
2. The device should create a WiFi access point named "Hamodule Fallback Hotspot"
3. Connect to this access point and configure your WiFi credentials
4. The device will restart and connect to your network

## Configuration

### ESPHome Configuration

Example configuration files are provided in the [`esphome-configurations`](esphome-configurations/) directory:

- [`EspHome.yml`](esphome-configurations/EspHome.yml) - Basic 4-channel configuration
- [`EspHome-v22.yml`](esphome-configurations/EspHome-v22.yml) - Configuration for version 22

#### Basic Configuration Example

```yaml
esphome:
  name: hamodule
  platform: ESP32
  board: esp32dev

wifi:
  ssid: "YOUR_WIFI_SSID"
  password: "YOUR_WIFI_PASSWORD"

api:
ota:

# Temperature sensor
sensor:
  - platform: sht4x
    temperature:
      name: "Temperature"
    humidity:
      name: "Relative Humidity"

# Light sensing and control
binary_sensor:
  - platform: gpio
    name: "Light 1 Status"
    pin: GPIO_PIN_NUMBER

switch:
  - platform: gpio
    name: "Light 1"
    pin: GPIO_PIN_NUMBER
```

### Home Assistant Integration

Once configured with ESPHome, the device will automatically be discovered by Home Assistant. You can then:

1. Go to **Settings** → **Devices & Services**
2. Look for the ESPHome integration
3. Click **Configure** on your device
4. Add it to your dashboard

Example floorplan integrations are available in the [`home-assistant`](home-assistant/) directory.

## Technical Specifications

### Circuit Simulation

If you want to understand how the mains sensing circuit works, you can use this simulation: [lushprojects circuit simulator](http://lushprojects.com/circuitjs/circuitjs.html?ctz=CQAgjCAMB0l3BWEBmGZkDYAcmte2AJwYYgDskISClCApgLRhgBQAbiA8Stp91pUoQaIAEyookmAhYB3EABYsIAYuVgFCqCwAma8JvBhRYyMpM66AMwCGAVwA2AF137RZE8xOizYkJdtHFz0mUh9lJQMtC2t7Z1dQ0wjzDz8AuJd5SPcTSNxtLOV8rlJ8yDlOMDDfRNQtcvkvJPAMSnCCytLIaNEtOu0AJz5SVUjVSlR4coAPEAxkZBQECDIRZAQtaMoAUQBlAAVkUQAdAGcAcX2ASQB5FgVIMkVs3wRRc19WeVFesQexX79cocVbeVKg5qCRQTaCLKHSCoYX7tDZbZTlIZI6Lgt5iVK0KYVVF-WiGHLaADGc2RvixeJMglgUwUhFZbPZHNIaDAZkwGh5ZiwZAoXKZXyoZNSdPJDWpaPIuPa5VO9OaC2q6MktgcpzoLExgJ8CpMRyhAsJ8mlUsNggqEPJENN2lmPkI4CwSAeWjAeEUphAAFkbABLAB2pzOuzo4bDAHNI7Jg04KQALCqaD5FTCQirk9pVNq+WUZkkA6L-coAe0kGHq0NZKCNMHgZCwxiQbUkyBY1bAT1rkgeDY7TLghDIGAQSKQEE8T271fEczrQ7dI6m48n0783kW3aAA).

<details>
<summary>Circuit simulation code</summary>

```
$ 1 0.000005 30.13683688681966 70 5 50 5e-11
v -96 368 -96 80 0 1 50 230 0 0 0.5
w 48 80 48 144 0
d 48 144 112 208 2 default
d 48 272 112 208 2 default
d -16 208 48 144 2 default
d -16 208 48 272 2 default
w 48 272 48 368 0
w 48 368 -96 368 0
w -16 208 -16 304 0
w 112 208 160 208 0
w -16 304 224 304 0
r -96 80 48 80 0 300000
x 633 351 750 354 4 20 ESP32\sGPIO
407 448 208 528 208 1
w 224 240 224 304 0
v 752 272 752 208 0 0 40 3.3 0 0 0.5
w 624 208 544 208 0
r 624 272 752 272 0 50000
w 544 240 544 272 0
c 624 208 624 272 0 0.0000049999999999999996 0.08913507182464649 0.001
w 544 272 624 272 0
w 624 208 752 208 0
s 272 208 336 208 0 0 false
r 624 320 752 320 0 1000000
w 624 272 624 320 0
w 752 272 752 320 0
x 209 185 404 188 4 20 Mains\sSensing\sSwitch
w 448 208 336 208 0
w 272 208 160 208 0
w 448 240 224 240 0
o 0 64 0 4099 320 0.00078125 0 2 0 3
o 17 64 0 4099 5 0.00009765625 1 2 17 3
o 23 64 0 4099 5 0.00009765625 2 2 23 3
```
</details>

## How to Order from JLCPCB
![Step-by-step guide for ordering PCB from JLCPCB](readme-media/jlcpcb-how-to-order.gif)

For detailed fabrication files and assembly instructions, see the [Development Notes](#development-notes) section below.

## Development Notes

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

### Generate Documentation

**Schematics:**
![Screenshot showing schematic generation](readme-media/tutorial/gen-images-1.png)

**PCB:**
Print to PDF, and use a high-resolution PDF to JPG converting website like: https://pdf2jpg.net/

---

## Version History

This section documents the evolution of the board design through multiple iterations.

### Older Versions: 26.1, 26.2, 26.3 - Eight Channels with IO Expander
**Changes compared to version 23:**
- Using TCAL6416A instead of MCP23108 due to having push-pull instead of open-drain outputs
- MCP23017 has released an amendment to the datasheet declaring a bug in two pins, making them read-only
- Adjusted the border cut-outs to fit the middle mounting hole
- Fixed a bug in the TXB0108 implementation: OE and DIR pins should reference VccA (requires voltage divider: VccA = 3V, not 3.3V)
- Added descriptions in the schematics
- Created 3 subversions by JLCPCB to test fitting in the case (all the same circuit, different board sizes)
- **Known Bug**: The resistors R27-R34 are too weak because the 74LVCH8T245PWE4 level shifter has bus voltage holder

Version 26.1 (SN74LVCH8 + OUTPUT_ENABLED)
![board-schematics](PCB/schematics-v26.1-jlcpcb/readme-media/schematics.svg)
![board-pcb](PCB/schematics-v26.1-jlcpcb/readme-media/board.png)
![board-pcb](PCB/schematics-v26.1-jlcpcb/readme-media/board-front.svg)
![board-pcb](PCB/schematics-v26.1-jlcpcb/readme-media/board-back.svg)
![board-pcb](PCB/schematics-v26.1-jlcpcb/readme-media/board-3d-1.png)
![board-pcb](PCB/schematics-v26.1-jlcpcb/readme-media/board-3d-2.png)
![board-pcb](PCB/schematics-v26.1-jlcpcb/readme-media/board-3d-3.png)
![board-pcb](PCB/schematics-v26.1-jlcpcb/readme-media/board-3d-4.png)
![board-pcb](PCB/schematics-v26.1-jlcpcb/readme-media/board-3d-5.png)

### Older Versions: 24 - Eight Channels with IO Expander

**Changes compared to version 23:**
- Using TCAL6416A instead of MCP23108 due to having push-pull instead of open-drain outputs
- MCP23017 has released an amendment to the datasheet declaring a bug in two pins, making them read-only
- Adjusted the border cut-outs to fit the middle mounting hole
- There are two versions of this board: one using SN74LVCH8 and the other one using TXB0108. To compare them, switch between the two schematics in two browser tabs

Version 24.8-1 (TXB0108)
![board-schematics](PCB/schematics-v24-1-jlcpcb/readme-media/schematics.svg)
![board-pcb](PCB/schematics-v24-1-jlcpcb/readme-media/board.png)

Version 24.8-2 (SN74LVCH8 + OUTPUT_ENABLED)
![board-schematics](PCB/schematics-v24-2-jlcpcb/readme-media/schematics.svg)
![board-pcb](PCB/schematics-v24-2-jlcpcb/readme-media/board.png)
![board-pcb](PCB/schematics-v24-2-jlcpcb/readme-media/3d-board-1.png)
![board-pcb](PCB/schematics-v24-2-jlcpcb/readme-media/3d-board-2.png)
![board-pcb](PCB/schematics-v24-2-jlcpcb/readme-media/3d-board-3.png)
![board-pcb](PCB/schematics-v24-2-jlcpcb/readme-media/3d-board-4.png)

### Older Versions: 23 - Eight Channels

**Changes compared to version 22:**
* Eight channels controllerd via I2C for relays and mains sensing
* Added RGB Led controllerr
* Capacitor for 5v line
* Compatible with case: RS PRO Modular Enclosure for DIN rail Stock number: 1862291 (https://uk.rs-online.com/web/p/din-rail-enclosures/1862291/)
* Added MCP23018 as IO expander and TXB0108PW to shift the output of the Darlington (~2.5V) to the logical high (3.3V)

Bugs
* MCP23018 is open drain and not a direct replace from MCP23017: Outputs are GND or disconnected, not Vcc
* Mid-PCB mounting hole in the cut version is not properly placed

![board-schematics](PCB/schematics-v23.8/-jlcpcbreadme-media/hamodule.svg)
![board-pcb](PCB/schematics-v23.8-jlcpcb/readme-media/board.png)
![board-pcb](PCB/schematics-v23.8-jlcpcb/readme-media/3d_board_2.png)
![board-pcb](PCB/schematics-v23.8-jlcpcb/readme-media/3d_board_3.png)
![board-pcb](PCB/schematics-v23.8-jlcpcb/readme-media/3d_board_4.png)


### Older Versions: 22 - Four Channels
[Detailed information](PCB/schematics-v22-jlcpcb/)

**Changes since Version 17:**
- Cut-out ESP32 antenna area
- Moved silkscreen for better readability
- Improved schematic readability
- Added LEDs to indicate when relays are ON

![board-schematics](PCB/schematics-v22-jlcpcb/readme-media/board-schematics.svg)
![board-pcb](PCB/schematics-v22-jlcpcb/readme-media/board-pcb.jpg)
![board-pcb-3d](PCB/schematics-v22-jlcpcb/readme-media/board-pcb-3d-4.png)
![board-pcb-3d](PCB/schematics-v22-jlcpcb/readme-media/board-pcb-3d-5.png)
![board-pcb-3d](PCB/schematics-v22-jlcpcb/readme-media/board-pcb-3d-2.png)
![board-pcb-3d](PCB/schematics-v22-jlcpcb/readme-media/board-pcb-3d.png)
![board-pcb-3d](PCB/schematics-v22-jlcpcb/readme-media/board-pcb-3d-3.png)
![board-real-image](PCB/schematics-v22-jlcpcb/readme-media/board-real-1.jpg)
![board-real-image](PCB/schematics-v22-jlcpcb/readme-media/board-real-2.jpg)
![board-real-image](PCB/schematics-v22-jlcpcb/readme-media/board-real-3.jpg)
![board-real-image](PCB/schematics-v22-jlcpcb/readme-media/board-real-4.jpg)

### Older Versions: 21

**Key Changes:**
- Using the new ESP32-S3 microcontroller
- Replaced CP2102 with ESP integrated USB support
- Replaced USB protection diodes with an IC

![board-schematics](PCB/schematics-v21-esp32s3-pcbway/readme-media/board-schematics.svg)
![board-pcb](PCB/schematics-v21-esp32s3-pcbway/readme-media/board-pcb.png)
![board-pcb-3d](PCB/schematics-v21-esp32s3-pcbway/readme-media/board-pcb-3d.png)
![board-pcb-3d](PCB/schematics-v21-esp32s3-pcbway/readme-media/board-pcb-3d-3.png)
![board-pcb-3d](PCB/schematics-v21-esp32s3-pcbway/readme-media/board-pcb-3d-4.png)
![board-pcb-3d](PCB/schematics-v21-esp32s3-pcbway/readme-media/board-pcb-3d-2.png)

### Older Versions: 20
[Detailed information](PCB/schematics-v20-pcbway/)

**Changes since Version 17:**
- Mains sensing is inverted to make better use of rectifier capacitors and have constant reading
- Removed low-voltage fuse (having only one fuse is sufficient since PS has overcurrent protection and >4kV insulation)
- Moved screws - now has one extra holding point
- Exposed GPIO12 and GPIO33 for better board extensibility
- Moved to SSR with integrated snubber instead of mechanical relays (the kickback of the inductive load from latching relays was creating spikes and restarting the ESP32)
- Added SMD capacitors to the 3.3V and 5V lines for noisy conditions
- Separated GND for relays and ULN from the digital signal plane to reduce noise 

![board-schematics](PCB/schematics-v20-pcbway/readme-media/board-schematics.svg)
![board-pcb](PCB/schematics-v20-pcbway/readme-media/board-pcb.png)
![board-pcb-3d](PCB/schematics-v20-pcbway/readme-media/board-pcb-3d.png)
![board-pcb-3d](PCB/schematics-v20-pcbway/readme-media/board-pcb-3d-3.png)
![board-pcb-3d](PCB/schematics-v20-pcbway/readme-media/board-pcb-3d-4.png)
![board-pcb-3d](PCB/schematics-v20-pcbway/readme-media/board-pcb-3d-2.png)

### Older Versions: 19
[Detailed information](PCB/schematics-v19-jlcpcb/)

**Changes since Version 17:**
- Added fuses to every relay output (protection in case two relays are closed simultaneously and one is accidentally wired to N - current could flow from one to the other)
- Moved SHT40 and extended the footprint for easier soldering
- Moved LD11 for easier fitting in the case
- Tested with both optocouplers: LDA210 and ILD755-D

![board-schematics](PCB/schematics-v19-jlcpcb/readme-media/board-schematics.svg)
![board-pcb](PCB/schematics-v19-jlcpcb/readme-media/board-pcb.png)
![board-pcb-3d](PCB/schematics-v19-jlcpcb/readme-media/board-pcb-3d.png)
![board-pcb-3d](PCB/schematics-v19-jlcpcb/readme-media/board-pcb-3d-3.png)
![board-pcb-3d](PCB/schematics-v19-jlcpcb/readme-media/board-pcb-3d-4.png)
![board-pcb-3d](PCB/schematics-v19-jlcpcb/readme-media/board-pcb-3d-2.png)


### Older Versions: 17
[Detailed information](PCB/schematics-v17-safety-jlcpcb/)

**Major changes since Version 13:**
- Changed optocoupler to one with lower current requirements
- Changed resistors to 150kΩ × 2
- Added fuses to every sensing channel and removed fuse in N
- Added a separate fuse for 5V and 3.3V track
- Littlefuse now has a holder instead of being soldered directly to PCB
- Added ESP32 onboard module
- Added temperature sensor to detect if the board gets too hot
- Added USB-C powered by CP2102N UART chip
- Removed capacitors from 5V→3.3V converter to avoid inrush current at the USB
- Added external pull-up resistors for ESP32 (some pins do not have internal pull-ups)
- Added mains nets with proper creepage and clearance
- Replaced mains connectors with Wago lever connectors (super reliable and easy to use!)
- Replaced analog temperature sensor with SHT40 using I2C protocol
- Added I2C terminal so any I2C sensor can be plugged in
![board-schematics](PCB/schematics-v17-safety-jlcpcb/readme-media/board-schematics.svg)
![board-pcb](PCB/schematics-v17-safety-jlcpcb/readme-media/board-pcb.png)
![board-pcb-3d](PCB/schematics-v17-safety-jlcpcb/readme-media/board-pcb-3d.png)

![board-pcb-3d](PCB/schematics-v17-safety-jlcpcb/readme-media/enclosure.jpg)

The enclosure compared with a DIN relay. Size is perfect :)
![board-pcb-3d](PCB/schematics-v17-safety-jlcpcb/readme-media/cage-vs-relay.jpg)

### Older Versions: 16
Size comparison between V16 and V13:

![board-pcb-3d](PCB/schematics-v16-espinside-jlcpcb/readme-media/V16-v-sV2.jpg)

### Older Versions: 13

**Miniaturization improvements:**
- Using SPST-NO 3A smaller relays
- Using SMD 3W 29kΩ resistors instead of THT
- Removed external buttons connector
- Removed external LEDs connector
- Using SMD ULN2003A instead of THT
- HCPL3700 THT capacitors replaced by Tantalum SMD

**Security additions:**
- Added fuse at the neutral return from the sensors (F2)
- Resistors are placed before HCPL3700 to work with less than 4V to N instead of 110V to N

**Stability improvements:**
- Added filter capacitor to ULN2003A
- Added filter capacitors to LD1117AV33

**Other changes:**
- Added LED indicator when powered on

![v2-board-schematics](readme-media/v2-board-schematics.png)
![v2-board-pcb](readme-media/v2-board-pcb.png)
![v2-board-pcb-3d](readme-media/v2-board-pcb-3d.png)
![v2-board-pcb-3d](PCB/schematics-v13-new-relays-jlcpcb/readme-media/PCB.jpg)

### Older Versions: 9

Early development version. 

![v1-board-schematics](readme-media/v1-board-schematics.png)
![v1-board-pcb](readme-media/v1-board-pcb.png)
![v1-board-pcb-3d](readme-media/v1-board-pcb-3d.png)
![v2-board-pcb-3d](PCB/schematics-v02/readme-media/PCBs.jpg)

### Older Versions: 1

Initial prototype version (included to show the evolution of the project). 

![Version 1 board schematics](PCB/schematics-v01/readme-media/schematic.png)
![Version 1 PCB layout](PCB/schematics-v01/readme-media/pcb-layout.png)

---

## Contributing

Contributions are welcome! If you have improvements, bug fixes, or new features to propose:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/your-feature`)
3. Make your changes
4. Test thoroughly (especially if working with mains voltage)
5. Submit a pull request with a clear description of your changes

**Please note:** Any contributions involving electrical safety must be thoroughly tested and documented.

## Safety Disclaimer

⚠️ **WARNING**: This device works with mains voltage which can be lethal. Only qualified electricians should install, modify, or work on this device. The authors assume no liability for any damage, injury, or death resulting from the use of this device. Use at your own risk.

## License

This project is open source. Please check the repository for specific license information.

---

## Support

For questions, issues, or discussions:
- Open an issue on GitHub
- Review existing issues and documentation
- Check the ESPHome and Home Assistant communities for integration help

---

**Project maintained by the community. Star ⭐ this repository if you find it useful!**
