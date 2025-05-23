EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text GLabel 1400 1800 2    50   Input ~ 0
220VAC(L)
NoConn ~ 11650 4450
Text GLabel 800  2950 0    50   Input ~ 0
REO3
Text GLabel 800  1800 0    50   Input ~ 0
REO1
Text GLabel 800  2350 0    50   Input ~ 0
REO2
Text GLabel 800  3550 0    50   Input ~ 0
REO4
$Comp
L power:PWR_FLAG #FLG07
U 1 1 61341516
P 9750 1350
F 0 "#FLG07" H 9750 1425 50  0001 C CNN
F 1 "PWR_FLAG" H 9750 1523 50  0001 C CNN
F 2 "" H 9750 1350 50  0001 C CNN
F 3 "~" H 9750 1350 50  0001 C CNN
	1    9750 1350
	0    1    1    0   
$EndComp
Text GLabel 1250 1250 3    50   Input ~ 0
REO1
Text GLabel 1050 1250 3    50   Input ~ 0
REO2
Text Label 7500 650  0    50   ~ 0
PowerSupply
Text Label 10700 650  0    50   ~ 0
LightInputs
Text Label 3050 650  0    50   ~ 0
Relays
Text GLabel 650  1250 3    50   Input ~ 0
REO4
Text GLabel 850  1250 3    50   Input ~ 0
REO3
$Comp
L power:PWR_FLAG #FLG05
U 1 1 61581A71
P 5950 2400
F 0 "#FLG05" H 5950 2475 50  0001 C CNN
F 1 "PWR_FLAG" H 5950 2573 50  0001 C CNN
F 2 "" H 5950 2400 50  0001 C CNN
F 3 "~" H 5950 2400 50  0001 C CNN
	1    5950 2400
	-1   0    0    1   
$EndComp
Text GLabel 8900 1050 2    50   Input ~ 0
Sens1
Text GLabel 8900 1250 2    50   Input ~ 0
Sens2
Text GLabel 8900 1450 2    50   Input ~ 0
Sens3
Text GLabel 8900 1650 2    50   Input ~ 0
Sens4
$Comp
L power:PWR_FLAG #FLG08
U 1 1 61369577
P 9750 1450
F 0 "#FLG08" H 9750 1525 50  0001 C CNN
F 1 "PWR_FLAG" H 9750 1623 50  0001 C CNN
F 2 "" H 9750 1450 50  0001 C CNN
F 3 "~" H 9750 1450 50  0001 C CNN
	1    9750 1450
	0    1    1    0   
$EndComp
$Comp
L power:PWR_FLAG #FLG09
U 1 1 613698EA
P 9750 1550
F 0 "#FLG09" H 9750 1625 50  0001 C CNN
F 1 "PWR_FLAG" H 9750 1723 50  0001 C CNN
F 2 "" H 9750 1550 50  0001 C CNN
F 3 "~" H 9750 1550 50  0001 C CNN
	1    9750 1550
	0    1    1    0   
$EndComp
$Comp
L power:PWR_FLAG #FLG010
U 1 1 61369AE5
P 9750 1650
F 0 "#FLG010" H 9750 1725 50  0001 C CNN
F 1 "PWR_FLAG" H 9750 1823 50  0001 C CNN
F 2 "" H 9750 1650 50  0001 C CNN
F 3 "~" H 9750 1650 50  0001 C CNN
	1    9750 1650
	0    1    1    0   
$EndComp
NoConn ~ 10400 6450
Text GLabel 800  2000 0    50   Input ~ 0
REI1
Wire Wire Line
	5350 1400 5550 1400
Text GLabel 5650 1400 2    50   UnSpc ~ 0
220VAC(L)
Text GLabel 7300 2150 2    50   Input ~ 0
GND
Wire Wire Line
	5350 2100 5350 2400
Wire Wire Line
	5350 2400 5550 2400
Wire Wire Line
	5550 2400 5550 2150
Connection ~ 5550 2400
Wire Wire Line
	5550 2400 5650 2400
Wire Wire Line
	5550 1400 5550 1750
Connection ~ 5550 1400
Wire Wire Line
	5550 1400 5650 1400
Text GLabel 2250 1850 0    50   Input ~ 0
5V+
Text GLabel 4150 3000 0    50   Input ~ 0
5V+
Text GLabel 5800 3000 2    50   Input ~ 0
3.3V+
Text GLabel 6600 3250 2    50   Input ~ 0
5V+
Text GLabel 4200 3400 0    50   Input ~ 0
GND
Text GLabel 1400 2000 2    50   Input ~ 0
5V+
Connection ~ 5450 3000
Wire Wire Line
	5450 3000 5400 3000
Wire Wire Line
	5100 3300 5100 3400
Wire Wire Line
	4750 3400 5100 3400
Wire Wire Line
	5100 3400 5450 3400
Connection ~ 5100 3400
Wire Wire Line
	5450 3100 5450 3000
Text GLabel 7300 1750 2    50   Input ~ 0
5V+
Connection ~ 5350 1400
Wire Wire Line
	5350 1800 5350 1400
Wire Wire Line
	7050 1750 7050 1900
Wire Wire Line
	7050 2000 6950 2000
Wire Wire Line
	6950 2000 6950 2150
Text GLabel 2250 1150 0    50   Input ~ 0
REI3
Text GLabel 2250 1250 0    50   Input ~ 0
REI2
Text GLabel 2250 1050 0    50   Input ~ 0
REI4
Text GLabel 2250 1350 0    50   Input ~ 0
REI1
Text GLabel 3050 1250 2    50   Input ~ 0
EspRel3
Text GLabel 3050 1150 2    50   Input ~ 0
EspRel2
Text GLabel 3050 1050 2    50   Input ~ 0
EspRel1
Text GLabel 3050 1350 2    50   Input ~ 0
EspRel4
Text GLabel 2800 3150 2    50   Input ~ 0
EspRel3
Text GLabel 2800 3050 2    50   Input ~ 0
EspRel2
Text GLabel 2800 2950 2    50   Input ~ 0
EspRel1
Text GLabel 2800 3250 2    50   Input ~ 0
EspRel4
Text GLabel 5950 2400 2    50   UnSpc ~ 0
220VAC(N)
$Comp
L power:PWR_FLAG #FLG02
U 1 1 619655E5
P 5350 1400
F 0 "#FLG02" H 5350 1475 50  0001 C CNN
F 1 "PWR_FLAG" H 5350 1573 50  0001 C CNN
F 2 "" H 5350 1400 50  0001 C CNN
F 3 "~" H 5350 1400 50  0001 C CNN
	1    5350 1400
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG06
U 1 1 619A2B0A
P 7300 1750
F 0 "#FLG06" H 7300 1825 50  0001 C CNN
F 1 "PWR_FLAG" H 7300 1923 50  0001 C CNN
F 2 "" H 7300 1750 50  0001 C CNN
F 3 "~" H 7300 1750 50  0001 C CNN
	1    7300 1750
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG04
U 1 1 619A4871
P 5800 3000
F 0 "#FLG04" H 5800 3075 50  0001 C CNN
F 1 "PWR_FLAG" H 5800 3173 50  0001 C CNN
F 2 "" H 5800 3000 50  0001 C CNN
F 3 "~" H 5800 3000 50  0001 C CNN
	1    5800 3000
	-1   0    0    1   
$EndComp
NoConn ~ 3050 1450
NoConn ~ 3050 1550
NoConn ~ 3050 1650
NoConn ~ 2250 1650
NoConn ~ 2250 1550
NoConn ~ 2250 1450
Wire Wire Line
	5450 3000 5700 3000
Wire Wire Line
	5700 3000 5700 3100
Connection ~ 5700 3000
Wire Wire Line
	5700 3400 5450 3400
Connection ~ 5450 3400
Wire Wire Line
	4500 3100 4500 3000
Wire Wire Line
	4500 3000 4750 3000
Connection ~ 4500 3000
Wire Wire Line
	4750 3100 4750 3000
Connection ~ 4750 3000
Wire Wire Line
	4750 3000 4800 3000
Wire Wire Line
	4750 3400 4500 3400
Connection ~ 4750 3400
Text GLabel 1400 2350 2    50   Input ~ 0
220VAC(L)
Text GLabel 800  2550 0    50   Input ~ 0
REI2
Text GLabel 1400 2550 2    50   Input ~ 0
5V+
Text GLabel 1400 2950 2    50   Input ~ 0
220VAC(L)
Text GLabel 800  3150 0    50   Input ~ 0
REI3
Text GLabel 1400 3150 2    50   Input ~ 0
5V+
Text GLabel 1400 3550 2    50   Input ~ 0
220VAC(L)
Text GLabel 800  3750 0    50   Input ~ 0
REI4
Text GLabel 1400 3750 2    50   Input ~ 0
5V+
Connection ~ 5350 2400
$Comp
L power:PWR_FLAG #FLG03
U 1 1 61963454
P 5350 2400
F 0 "#FLG03" H 5350 2475 50  0001 C CNN
F 1 "PWR_FLAG" H 5350 2573 50  0001 C CNN
F 2 "" H 5350 2400 50  0001 C CNN
F 3 "~" H 5350 2400 50  0001 C CNN
	1    5350 2400
	-1   0    0    1   
$EndComp
Text GLabel 6600 2850 2    50   Input ~ 0
GND
Text GLabel 6600 2750 2    50   Input ~ 0
3.3V+
Text GLabel 6600 3350 2    50   Input ~ 0
GND
Text GLabel 9750 1650 0    50   Input ~ 0
Sens1
Text GLabel 9750 1550 0    50   Input ~ 0
Sens2
Text GLabel 9750 1450 0    50   Input ~ 0
Sens3
Text GLabel 9750 1350 0    50   Input ~ 0
Sens4
Text GLabel 4200 1250 2    50   Input ~ 0
L_IN
Wire Wire Line
	4200 1350 4200 1250
Text GLabel 5050 1400 0    50   Input ~ 0
L_IN
Text GLabel 4200 1150 2    50   Input ~ 0
N_IN
Wire Wire Line
	4200 1050 4200 1150
Text GLabel 5350 2400 0    50   Input ~ 0
N_IN
NoConn ~ 10600 6450
Wire Wire Line
	1350 1250 1250 1250
Wire Wire Line
	1150 1250 1050 1250
Wire Wire Line
	950  1250 850  1250
Wire Wire Line
	750  1250 650  1250
Wire Wire Line
	8900 950  8900 1050
Wire Wire Line
	8900 1150 8900 1250
Wire Wire Line
	8900 1350 8900 1450
Wire Wire Line
	8900 1550 8900 1650
Wire Wire Line
	7350 1900 7350 2000
NoConn ~ 11000 6450
Wire Notes Line
	8050 4100 11150 4100
Text GLabel 10750 2600 2    50   Input ~ 0
Sens2
Text GLabel 10750 3750 2    50   Input ~ 0
Sens4
Text GLabel 10750 2050 2    50   Input ~ 0
Sens1
Text GLabel 8850 2600 0    50   Input ~ 0
GND
Text GLabel 10600 2350 2    50   Input ~ 0
220VAC(N)
Text GLabel 8850 2050 0    50   Input ~ 0
GND
Text GLabel 8850 2250 0    50   Input ~ 0
EspSens1
Text GLabel 10750 3200 2    50   Input ~ 0
Sens3
Text GLabel 8850 2400 0    50   Input ~ 0
EspSens2
Text GLabel 8850 3400 0    50   Input ~ 0
EspSens3
Text GLabel 8850 3550 0    50   Input ~ 0
EspSens4
Wire Wire Line
	9150 2250 9500 2250
Wire Wire Line
	9500 2050 9150 2050
Wire Wire Line
	9500 2600 9150 2600
Wire Wire Line
	9150 2250 8850 2250
Connection ~ 9150 2250
Text GLabel 8850 3750 0    50   Input ~ 0
GND
Text GLabel 10600 3500 2    50   Input ~ 0
220VAC(N)
Text GLabel 8850 3200 0    50   Input ~ 0
GND
Wire Wire Line
	9150 3400 9500 3400
Wire Wire Line
	9500 3200 9150 3200
Wire Wire Line
	9500 3750 9150 3750
Connection ~ 9500 2400
Connection ~ 9500 2600
Wire Wire Line
	8850 2400 9150 2400
Connection ~ 9150 2400
Wire Wire Line
	9150 2400 9500 2400
Wire Wire Line
	9150 3550 9500 3550
Connection ~ 9500 3400
Connection ~ 9500 3200
Connection ~ 9500 3550
Connection ~ 9500 3750
Wire Wire Line
	10150 2250 10250 2250
Wire Wire Line
	10250 2250 10250 2350
Wire Wire Line
	10250 2400 10150 2400
Wire Wire Line
	10150 3400 10250 3400
Wire Wire Line
	10250 3400 10250 3500
Wire Wire Line
	10250 3550 10150 3550
Wire Wire Line
	10600 3500 10250 3500
Connection ~ 10250 3500
Wire Wire Line
	10250 3500 10250 3550
Wire Wire Line
	10250 2350 10600 2350
Connection ~ 10250 2350
Wire Wire Line
	10250 2350 10250 2400
NoConn ~ 10800 6450
Text GLabel 4950 4750 0    50   Input ~ 0
D+
Text GLabel 4950 4850 0    50   Input ~ 0
D-
Text GLabel 6250 4750 2    50   Input ~ 0
DTR
NoConn ~ 5950 6450
NoConn ~ 5950 6350
NoConn ~ 5950 6250
NoConn ~ 5950 6150
NoConn ~ 5950 5950
NoConn ~ 5950 6050
NoConn ~ 5950 5650
NoConn ~ 5950 5850
Wire Wire Line
	4000 6650 4000 6700
Connection ~ 4000 6700
Wire Wire Line
	4000 6700 4000 6750
Text GLabel 4400 7500 3    50   Input ~ 0
D+
Text GLabel 4300 7500 3    50   Input ~ 0
D-
NoConn ~ 4200 7050
Wire Wire Line
	4100 7350 4400 7350
Wire Wire Line
	4400 7350 4400 7500
Wire Wire Line
	4300 7050 4300 7500
Connection ~ 4400 7350
Wire Wire Line
	4600 7200 4600 7050
Wire Wire Line
	4100 7500 4300 7500
Wire Wire Line
	3800 7500 3800 7350
Connection ~ 3800 7200
Wire Wire Line
	3800 7200 3800 6700
Connection ~ 3800 7350
Wire Wire Line
	3800 7350 3800 7200
Text GLabel 7050 4700 0    50   Input ~ 0
EN
Text GLabel 7050 5150 0    50   Input ~ 0
IO0
Wire Wire Line
	7450 4700 7700 4700
Wire Wire Line
	7700 5150 7450 5150
Wire Wire Line
	7700 4700 7700 5150
Text GLabel 8050 5950 2    50   Input ~ 0
IO0
Text GLabel 8050 5400 2    50   Input ~ 0
EN
Text GLabel 7050 5650 0    50   Input ~ 0
DTR
Text GLabel 7050 6200 0    50   Input ~ 0
RTS
Wire Wire Line
	8050 5400 7950 5400
Wire Wire Line
	7950 5400 7950 5450
Wire Wire Line
	8050 5950 7950 5950
Wire Wire Line
	7950 5950 7950 6000
Wire Wire Line
	7950 6400 7100 6400
Wire Wire Line
	7500 6200 7650 6200
Wire Wire Line
	7650 5650 7500 5650
Wire Wire Line
	7050 6200 7150 6200
Wire Wire Line
	7050 5650 7100 5650
Wire Wire Line
	7950 5850 7150 5850
Wire Wire Line
	7150 5850 7150 6200
Connection ~ 7150 6200
Wire Wire Line
	7150 6200 7200 6200
Wire Wire Line
	7100 5650 7100 6400
Connection ~ 7100 5650
Wire Wire Line
	7100 5650 7200 5650
Text GLabel 2650 4950 2    50   Input ~ 0
IO0
Wire Wire Line
	1100 4900 1100 4950
Text GLabel 1050 4950 0    50   Input ~ 0
EN
Text GLabel 3000 5100 1    50   Input ~ 0
TXD0
Text GLabel 3000 5200 3    50   Input ~ 0
RXD0
NoConn ~ 1450 5250
NoConn ~ 1450 5150
Wire Wire Line
	2350 4350 2350 4500
Connection ~ 2350 4350
Wire Wire Line
	2400 4350 2350 4350
Wire Wire Line
	2350 4150 2350 4350
Wire Wire Line
	2050 4500 2050 4750
Connection ~ 2050 4500
Wire Wire Line
	2050 4150 2050 4500
Connection ~ 2050 4150
Wire Wire Line
	2050 4050 2050 4150
Wire Wire Line
	1050 4950 1100 4950
Connection ~ 1100 4950
Wire Wire Line
	1100 4950 1100 5050
NoConn ~ 2650 5150
NoConn ~ 2650 5350
NoConn ~ 2650 5450
NoConn ~ 2650 5750
NoConn ~ 2650 5850
NoConn ~ 2650 5950
NoConn ~ 2650 6050
NoConn ~ 2650 6150
NoConn ~ 2650 6250
NoConn ~ 1450 6150
NoConn ~ 1450 6250
NoConn ~ 1450 6350
NoConn ~ 1450 6450
NoConn ~ 1450 6550
NoConn ~ 1450 6650
Connection ~ 4600 7200
Text GLabel 2650 7050 2    50   Input ~ 0
EspSens1
Text GLabel 2650 6950 2    50   Input ~ 0
EspSens2
Text GLabel 2650 7250 2    50   Input ~ 0
EspSens3
Text GLabel 2650 7150 2    50   Input ~ 0
EspSens4
Text GLabel 2650 6850 2    50   Input ~ 0
EspRel3
Text GLabel 2650 6750 2    50   Input ~ 0
EspRel2
Text GLabel 2650 6650 2    50   Input ~ 0
EspRel1
Text GLabel 2650 5550 2    50   Input ~ 0
EspRel4
Text GLabel 2250 2250 3    50   Input ~ 0
GND
Wire Wire Line
	2250 1850 2250 1950
Wire Wire Line
	8850 3750 9150 3750
Connection ~ 9150 3750
Wire Wire Line
	8850 3550 9150 3550
Connection ~ 9150 3550
Wire Wire Line
	9150 3400 8850 3400
Connection ~ 9150 3400
Wire Wire Line
	8850 3200 9150 3200
Connection ~ 9150 3200
Wire Wire Line
	9150 2600 8850 2600
Connection ~ 9150 2600
Wire Wire Line
	9150 2050 8850 2050
Connection ~ 9150 2050
Text GLabel 2050 4050 0    50   Input ~ 0
3.3V+
Text GLabel 1100 4600 1    50   Input ~ 0
3.3V+
Text GLabel 3800 6700 0    50   Input ~ 0
GND
Text GLabel 7800 4700 2    50   Input ~ 0
GND
Wire Wire Line
	7800 4700 7700 4700
Connection ~ 7700 4700
Text GLabel 5450 6650 3    50   Input ~ 0
GND
Text GLabel 2400 4350 2    50   Input ~ 0
GND
Text GLabel 1100 5350 3    50   Input ~ 0
GND
Text GLabel 2650 750  0    50   Input ~ 0
GND
Wire Wire Line
	2650 750  2650 850 
Text GLabel 2050 7550 2    50   Input ~ 0
GND
NoConn ~ 2650 6550
NoConn ~ 2650 6350
NoConn ~ 2650 6450
Text GLabel 4000 4450 0    50   Input ~ 0
3.3V+
Wire Notes Line
	500  3850 8050 3850
Wire Notes Line
	500  550  500  7750
Wire Notes Line
	500  7750 6550 7750
Wire Notes Line
	6550 7750 6550 3850
Wire Notes Line
	8500 4100 8500 6500
Wire Notes Line
	8500 6500 6550 6500
Wire Notes Line
	11150 550  11150 4100
Wire Notes Line
	8050 4100 8050 550 
Wire Notes Line
	500  550  11150 550 
Text Label 7250 4000 0    50   ~ 0
ProgramingCircuit
Text Label 6050 4000 0    50   ~ 0
UsbToSerial
Text Label 2900 4000 0    50   ~ 0
ESP32WRoom
Wire Wire Line
	4100 7200 4600 7200
Wire Wire Line
	4400 7050 4400 7350
Text GLabel 1450 4950 0    50   Input ~ 0
EN
Wire Wire Line
	6950 2150 7300 2150
Connection ~ 6950 2150
Wire Wire Line
	7050 1750 7300 1750
Connection ~ 7050 1750
Text GLabel 4250 4100 1    50   Input ~ 0
GND
Text GLabel 4600 7500 3    50   Input ~ 0
5V+
Text GLabel 3900 4900 0    50   Input ~ 0
VBUS
Text Notes 7050 7000 0    50   ~ 0
TODO:\n- ESP pinout on the internet looks different than this module. double check\n- Is VIO right? (DevKit does not has it)\n- Should we add jumper or 0Ohm to the BUS->5V? We need to protect the case this cirquit is wrong\n- Do we need resistor in suspend for the CP2102? (check devkit NoConnect resistor)
Text GLabel 4600 7200 2    50   Input ~ 0
VBUS
Text GLabel 4500 4900 2    50   Input ~ 0
GND
Wire Wire Line
	4350 4450 4150 4450
Text GLabel 10400 1150 2    50   Input ~ 0
EspSens1
Text GLabel 10400 1250 2    50   Input ~ 0
EspSens2
Text GLabel 10400 1350 2    50   Input ~ 0
EspSens3
Text GLabel 10400 1450 2    50   Input ~ 0
EspSens4
Wire Wire Line
	2650 5050 2800 5050
Wire Wire Line
	2800 5050 2800 5100
Wire Wire Line
	2800 5100 3000 5100
Wire Wire Line
	3000 5200 2800 5200
Wire Wire Line
	2800 5200 2800 5250
Wire Wire Line
	2800 5250 2650 5250
Text GLabel 2650 5650 2    50   Input ~ 0
TempIn
Text GLabel 10100 4950 2    50   Input ~ 0
TempIn
Text GLabel 9700 5250 3    50   Input ~ 0
GND
Text GLabel 9700 4650 1    50   Input ~ 0
3.3V+
Wire Notes Line
	3450 550  3450 7750
Text Label 8600 4250 0    50   ~ 0
TemperatureSensor
Text GLabel 6250 4550 2    50   Input ~ 0
RXD0
Text GLabel 6250 4450 2    50   Input ~ 0
TXD0
Text GLabel 6250 4350 2    50   Input ~ 0
RTS
Wire Wire Line
	4150 4150 4250 4150
Wire Wire Line
	4250 4100 4250 4150
Connection ~ 4250 4150
Wire Wire Line
	4250 4150 4350 4150
Wire Wire Line
	4000 4450 4150 4450
Connection ~ 4150 4450
Wire Wire Line
	4650 4450 4650 4050
Wire Wire Line
	4650 4050 5350 4050
Connection ~ 5350 4050
Wire Wire Line
	5350 4050 5450 4050
NoConn ~ 5950 5250
NoConn ~ 5950 5150
NoConn ~ 5950 5450
NoConn ~ 5950 5550
NoConn ~ 5950 4950
NoConn ~ 5950 4850
NoConn ~ 5950 4650
NoConn ~ 5950 4250
Wire Wire Line
	3950 6700 4000 6700
Wire Wire Line
	3800 6700 4000 6700
Wire Wire Line
	4950 4650 4200 4650
Wire Wire Line
	4200 4650 4200 4900
Connection ~ 4200 4900
Wire Wire Line
	4650 4450 4350 4450
Connection ~ 4650 4450
Connection ~ 4350 4450
Text GLabel 9350 6450 2    50   Input ~ 0
HeatPad
Wire Wire Line
	9350 6450 9050 6450
$Comp
L Device:CP C16
U 1 1 61AE6984
P 2200 4500
F 0 "C16" V 2100 4300 50  0000 L CNN
F 1 "100nF" V 2000 4200 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 2238 4350 50  0001 C CNN
F 3 "~" H 2200 4500 50  0001 C CNN
F 4 "C14663" H 2200 4500 50  0001 C CNN "JLCPCB"
	1    2200 4500
	0    -1   -1   0   
$EndComp
$Comp
L Device:CP C15
U 1 1 61AE697E
P 2200 4150
F 0 "C15" V 2350 3950 50  0000 L CNN
F 1 "22uF" V 2250 3900 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 2238 4000 50  0001 C CNN
F 3 "CL10A226MQ8NRNC" H 2200 4150 50  0001 C CNN
F 4 "C59461" H 2200 4150 50  0001 C CNN "JLCPCB"
	1    2200 4150
	0    -1   -1   0   
$EndComp
$Comp
L Device:CP C4
U 1 1 61AE6951
P 1100 5200
F 0 "C4" H 750 5250 50  0000 L CNN
F 1 "100nF" H 750 5150 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 1138 5050 50  0001 C CNN
F 3 "~" H 1100 5200 50  0001 C CNN
F 4 "C14663" H 1100 5200 50  0001 C CNN "JLCPCB"
	1    1100 5200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 61AE6949
P 1100 4750
F 0 "R1" V 1000 4750 50  0000 C CNN
F 1 "10kΩ" V 1100 4750 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 1030 4750 50  0001 C CNN
F 3 "0603WAF1002T5E" H 1100 4750 50  0001 C CNN
F 4 "C25804" V 1100 4750 50  0001 C CNN "JLCPCB"
	1    1100 4750
	-1   0    0    1   
$EndComp
$Comp
L Transistor_BJT:2N2219 Q2
U 1 1 61AE691E
P 7850 6200
F 0 "Q2" H 8040 6246 50  0000 L CNN
F 1 "SS8050" H 8040 6155 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 8050 6125 50  0001 L CIN
F 3 "http://www.onsemi.com/pub_link/Collateral/2N2219-D.PDF" H 7850 6200 50  0001 L CNN
F 4 "C177739" H 7850 6200 50  0001 C CNN "JLCPCB"
	1    7850 6200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 61AE690F
P 7350 5650
F 0 "R2" V 7250 5650 50  0000 C CNN
F 1 "10kΩ" V 7350 5650 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 7280 5650 50  0001 C CNN
F 3 "0603WAF1002T5E" H 7350 5650 50  0001 C CNN
F 4 "C25804" H 7350 5650 50  0001 C CNN "JLCPCB"
	1    7350 5650
	0    1    1    0   
$EndComp
$Comp
L Device:R R3
U 1 1 61AE6909
P 7350 6200
F 0 "R3" V 7250 6200 50  0000 C CNN
F 1 "10kΩ" V 7350 6200 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 7280 6200 50  0001 C CNN
F 3 "0603WAF1002T5E" H 7350 6200 50  0001 C CNN
F 4 "C25804" H 7350 6200 50  0001 C CNN "JLCPCB"
	1    7350 6200
	0    1    1    0   
$EndComp
$Comp
L Transistor_BJT:2N2219 Q1
U 1 1 61AE6901
P 7850 5650
F 0 "Q1" H 8040 5696 50  0000 L CNN
F 1 "SS8050" H 8040 5605 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 8050 5575 50  0001 L CIN
F 3 "http://www.onsemi.com/pub_link/Collateral/2N2219-D.PDF" H 7850 5650 50  0001 L CNN
F 4 "C177739" H 7850 5650 50  0001 C CNN "JLCPCB"
	1    7850 5650
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW2
U 1 1 61AE68F4
P 7250 5150
F 0 "SW2" H 7250 5435 50  0000 C CNN
F 1 "IO0" H 7250 5344 50  0000 C CNN
F 2 "Button_Switch_SMD:SW_SPST_SKQG_WithStem" H 7250 5350 50  0001 C CNN
F 3 "~" H 7250 5350 50  0001 C CNN
F 4 "C318884" H 7250 5150 50  0001 C CNN "JLCPCB"
	1    7250 5150
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW1
U 1 1 61AE68EE
P 7250 4700
F 0 "SW1" H 7250 4985 50  0000 C CNN
F 1 "EN" H 7250 4894 50  0000 C CNN
F 2 "Button_Switch_SMD:SW_SPST_SKQG_WithStem" H 7250 4900 50  0001 C CNN
F 3 "~" H 7250 4900 50  0001 C CNN
F 4 "C318884" H 7250 4700 50  0001 C CNN "JLCPCB"
	1    7250 4700
	1    0    0    -1  
$EndComp
$Comp
L Diode:BAT60A D7
U 1 1 61AE686D
P 4600 7350
F 0 "D7" V 4646 7270 50  0000 R CNN
F 1 "BAT60A-7" V 4555 7270 50  0000 R CNN
F 2 "Diode_SMD:D_SOD-323" H 4600 7175 50  0001 C CNN
F 3 "https://www.infineon.com/dgdl/Infineon-BAT60ASERIES-DS-v01_01-en.pdf?fileId=db3a304313d846880113def70c9304a9" H 4600 7350 50  0001 C CNN
F 4 "C124187" V 4600 7350 50  0001 C CNN "JLCPCB"
	1    4600 7350
	0    -1   -1   0   
$EndComp
$Comp
L Device:D_TVS D4
U 1 1 61AE6865
P 3950 7200
F 0 "D4" H 3500 7200 50  0000 C CNN
F 1 "D_TVS" H 4250 7200 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-523" H 3950 7200 50  0001 C CNN
F 3 "~" H 3950 7200 50  0001 C CNN
F 4 "C383211" H 3950 7200 50  0001 C CNN "JLCPCB"
	1    3950 7200
	-1   0    0    1   
$EndComp
$Comp
L Device:D_TVS D5
U 1 1 61AE685F
P 3950 7350
F 0 "D5" H 3500 7350 50  0000 C CNN
F 1 "D_TVS" H 4250 7350 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-523" H 3950 7350 50  0001 C CNN
F 3 "~" H 3950 7350 50  0001 C CNN
F 4 "C383211" H 3950 7350 50  0001 C CNN "JLCPCB"
	1    3950 7350
	-1   0    0    1   
$EndComp
$Comp
L Device:D_TVS D6
U 1 1 61AE6859
P 3950 7500
F 0 "D6" H 3500 7500 50  0000 C CNN
F 1 "D_TVS" H 4250 7500 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-523" H 3950 7500 50  0001 C CNN
F 3 "~" H 3950 7500 50  0001 C CNN
F 4 "C383211" H 3950 7500 50  0001 C CNN "JLCPCB"
	1    3950 7500
	-1   0    0    1   
$EndComp
$Comp
L Device:R R24
U 1 1 61AE682E
P 6100 4750
F 0 "R24" V 6200 4750 50  0000 C CNN
F 1 "1kΩ" V 6100 4750 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 6030 4750 50  0001 C CNN
F 3 "~" H 6100 4750 50  0001 C CNN
F 4 "" V 6100 4750 50  0001 C CNN "jlcpcb"
F 5 "C25585" H 6100 4750 50  0001 C CNN "JLCPCB"
	1    6100 4750
	0    1    1    0   
$EndComp
$Comp
L Device:CP C18
U 1 1 61AE6815
P 4350 4300
F 0 "C18" H 4300 4600 50  0000 L CNN
F 1 "100nF" H 4250 4500 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 4388 4150 50  0001 C CNN
F 3 "~" H 4350 4300 50  0001 C CNN
F 4 "C14663" H 4350 4300 50  0001 C CNN "JLCPCB"
	1    4350 4300
	-1   0    0    1   
$EndComp
$Comp
L LDA210-PDIP:LDA210-PDIP U7
U 1 1 61CD2F67
P 9850 3550
F 0 "U7" H 9875 4017 50  0000 C CNN
F 1 "LDA210-PDIP" H 9875 3926 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm_Socket_LongPads" H 9030 2945 50  0001 L CIN
F 3 "http://optoelectronics.liteon.com/upload/download/DS70-2001-006/S_110_LTV-355T%2020140520.pdf" H 9900 3300 50  0001 L CNN
	1    9850 3550
	-1   0    0    1   
$EndComp
$Comp
L Device:CP_Small C12
U 1 1 613B1E5B
P 9500 2500
F 0 "C12" H 9400 2550 50  0000 R CNN
F 1 "4.7uF" H 9450 2450 50  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 9500 2500 50  0001 C CNN
F 3 "https://datasheet.lcsc.com/lcsc/1811091112_FH-Guangdong-Fenghua-Advanced-Tech-1206B475K500NT_C29823.pdf" H 9500 2500 50  0001 C CNN
F 4 "C29823" H 9500 2500 50  0001 C CNN "JLCPCB"
F 5 "4.7uF" H 9500 2500 50  0001 C CNN "Value"
	1    9500 2500
	1    0    0    -1  
$EndComp
$Comp
L Device:CP_Small C9
U 1 1 61CD2F7F
P 9150 3300
F 0 "C9" H 9350 3250 50  0000 R CNN
F 1 "100nF" H 9400 3350 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 9150 3300 50  0001 C CNN
F 3 "https://www.distrelec.ch/en/ceramic-capacitor-100nf-50vdc-0805-rnd-components-rnd-1500805b104j500nt/p/30086635?q=smd+capacitor+&pos=5&origPos=990&origPageSize=50&track=true" H 9150 3300 50  0001 C CNN
F 4 "C14663" H 9150 3300 50  0001 C CNN "JLCPCB"
	1    9150 3300
	-1   0    0    1   
$EndComp
$Comp
L Device:CP_Small C10
U 1 1 61CD2F74
P 9150 3650
F 0 "C10" H 9050 3600 50  0000 R CNN
F 1 "100nF" H 9100 3700 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 9150 3650 50  0001 C CNN
F 3 "https://www.distrelec.ch/en/ceramic-capacitor-100nf-50vdc-0805-rnd-components-rnd-1500805b104j500nt/p/30086635?q=smd+capacitor+&pos=5&origPos=990&origPageSize=50&track=true" H 9150 3650 50  0001 C CNN
F 4 "C14663" H 9150 3650 50  0001 C CNN "JLCPCB"
	1    9150 3650
	1    0    0    -1  
$EndComp
$Comp
L Device:R R22
U 1 1 61CD2F61
P 10600 3200
F 0 "R22" V 10393 3200 50  0001 C CNN
F 1 "150kΩ1w" V 10500 3250 50  0000 C CNN
F 2 "Resistor_SMD:R_2512_6332Metric_Pad1.52x3.35mm_HandSolder" V 10530 3200 50  0001 C CNN
F 3 "" H 10600 3200 50  0001 C CNN
F 4 "C25719" H 10600 3200 50  0001 C CNN "JLCPCB"
	1    10600 3200
	0    1    1    0   
$EndComp
$Comp
L Device:R R23
U 1 1 61CD2F5A
P 10600 3750
F 0 "R23" V 10393 3750 50  0001 C CNN
F 1 "150kΩ1w" V 10700 3800 50  0000 C CNN
F 2 "Resistor_SMD:R_2512_6332Metric_Pad1.52x3.35mm_HandSolder" V 10530 3750 50  0001 C CNN
F 3 "" H 10600 3750 50  0001 C CNN
F 4 "C25719" H 10600 3750 50  0001 C CNN "JLCPCB"
	1    10600 3750
	0    1    1    0   
$EndComp
$Comp
L Device:R R19
U 1 1 61CD2F52
P 10300 3750
F 0 "R19" V 10093 3750 50  0001 C CNN
F 1 "150kΩ1w" V 10400 3750 50  0000 C CNN
F 2 "Resistor_SMD:R_2512_6332Metric_Pad1.52x3.35mm_HandSolder" V 10230 3750 50  0001 C CNN
F 3 "" H 10300 3750 50  0001 C CNN
F 4 "C25719" H 10300 3750 50  0001 C CNN "JLCPCB"
	1    10300 3750
	0    1    1    0   
$EndComp
$Comp
L Device:CP_Small C13
U 1 1 61CD2F4B
P 9500 3300
F 0 "C13" H 9700 3250 50  0000 R CNN
F 1 "4.7uF" H 9750 3350 50  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 9500 3300 50  0001 C CNN
F 3 "https://datasheet.lcsc.com/lcsc/1811091112_FH-Guangdong-Fenghua-Advanced-Tech-1206B475K500NT_C29823.pdf" H 9500 3300 50  0001 C CNN
F 4 "C29823" H 9500 3300 50  0001 C CNN "JLCPCB"
	1    9500 3300
	-1   0    0    1   
$EndComp
$Comp
L Device:R R18
U 1 1 61CD2F44
P 10300 3200
F 0 "R18" V 10093 3200 50  0001 C CNN
F 1 "150kΩ1w" V 10200 3200 50  0000 C CNN
F 2 "Resistor_SMD:R_2512_6332Metric_Pad1.52x3.35mm_HandSolder" V 10230 3200 50  0001 C CNN
F 3 "" H 10300 3200 50  0001 C CNN
F 4 "C25719" V 10300 3200 50  0001 C CNN "JLCPCB"
	1    10300 3200
	0    1    1    0   
$EndComp
$Comp
L Device:CP_Small C14
U 1 1 61CD2F3D
P 9500 3650
F 0 "C14" H 9400 3600 50  0000 R CNN
F 1 "4.7uF" H 9450 3700 50  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 9500 3650 50  0001 C CNN
F 3 "https://datasheet.lcsc.com/lcsc/1811091112_FH-Guangdong-Fenghua-Advanced-Tech-1206B475K500NT_C29823.pdf" H 9500 3650 50  0001 C CNN
F 4 "C29823" H 9500 3650 50  0001 C CNN "JLCPCB"
	1    9500 3650
	1    0    0    -1  
$EndComp
$Comp
L Device:CP_Small C7
U 1 1 61C06D87
P 9150 2150
F 0 "C7" H 9350 2100 50  0000 R CNN
F 1 "100nF" H 9400 2200 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 9150 2150 50  0001 C CNN
F 3 "https://www.distrelec.ch/en/ceramic-capacitor-100nf-50vdc-0805-rnd-components-rnd-1500805b104j500nt/p/30086635?q=smd+capacitor+&pos=5&origPos=990&origPageSize=50&track=true" H 9150 2150 50  0001 C CNN
F 4 "C14663" H 9150 2150 50  0001 C CNN "JLCPCB"
	1    9150 2150
	-1   0    0    1   
$EndComp
$Comp
L Device:CP_Small C8
U 1 1 61C38FE2
P 9150 2500
F 0 "C8" H 9050 2450 50  0000 R CNN
F 1 "100nF" H 9100 2550 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 9150 2500 50  0001 C CNN
F 3 "https://www.distrelec.ch/en/ceramic-capacitor-100nf-50vdc-0805-rnd-components-rnd-1500805b104j500nt/p/30086635?q=smd+capacitor+&pos=5&origPos=990&origPageSize=50&track=true" H 9150 2500 50  0001 C CNN
F 4 "C14663" H 9150 2500 50  0001 C CNN "JLCPCB"
	1    9150 2500
	1    0    0    -1  
$EndComp
$Comp
L LDA210-PDIP:LDA210-PDIP U6
U 1 1 61B6B5BB
P 9850 2400
F 0 "U6" H 9875 2867 50  0000 C CNN
F 1 "LDA210-PDIP" H 9875 2776 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm_Socket_LongPads" H 9030 1795 50  0001 L CIN
F 3 "http://optoelectronics.liteon.com/upload/download/DS70-2001-006/S_110_LTV-355T%2020140520.pdf" H 9900 2150 50  0001 L CNN
	1    9850 2400
	-1   0    0    1   
$EndComp
$Comp
L Device:R R20
U 1 1 617A141C
P 10600 2050
F 0 "R20" V 10393 2050 50  0001 C CNN
F 1 "150kΩ1w" V 10500 2100 50  0000 C CNN
F 2 "Resistor_SMD:R_2512_6332Metric_Pad1.52x3.35mm_HandSolder" V 10530 2050 50  0001 C CNN
F 3 "" H 10600 2050 50  0001 C CNN
F 4 "C25719" H 10600 2050 50  0001 C CNN "JLCPCB"
	1    10600 2050
	0    1    1    0   
$EndComp
$Comp
L Device:R R21
U 1 1 6179E8C9
P 10600 2600
F 0 "R21" V 10393 2600 50  0001 C CNN
F 1 "150kΩ1w" V 10700 2650 50  0000 C CNN
F 2 "Resistor_SMD:R_2512_6332Metric_Pad1.52x3.35mm_HandSolder" V 10530 2600 50  0001 C CNN
F 3 "" H 10600 2600 50  0001 C CNN
F 4 "C25719" H 10600 2600 50  0001 C CNN "JLCPCB"
	1    10600 2600
	0    1    1    0   
$EndComp
$Comp
L Device:R R17
U 1 1 61354B0C
P 10300 2600
F 0 "R17" V 10093 2600 50  0001 C CNN
F 1 "150kΩ1w" V 10400 2600 50  0000 C CNN
F 2 "Resistor_SMD:R_2512_6332Metric_Pad1.52x3.35mm_HandSolder" V 10230 2600 50  0001 C CNN
F 3 "" H 10300 2600 50  0001 C CNN
F 4 "C25719" H 10300 2600 50  0001 C CNN "JLCPCB"
	1    10300 2600
	0    1    1    0   
$EndComp
$Comp
L Device:CP_Small C11
U 1 1 6137D081
P 9500 2150
F 0 "C11" H 9700 2100 50  0000 R CNN
F 1 "4.7uF" H 9750 2200 50  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 9500 2150 50  0001 C CNN
F 3 "https://datasheet.lcsc.com/lcsc/1811091112_FH-Guangdong-Fenghua-Advanced-Tech-1206B475K500NT_C29823.pdf" H 9500 2150 50  0001 C CNN
F 4 "C29823" H 9500 2150 50  0001 C CNN "JLCPCB"
	1    9500 2150
	-1   0    0    1   
$EndComp
$Comp
L Device:R R16
U 1 1 613B1E37
P 10300 2050
F 0 "R16" V 10093 2050 50  0001 C CNN
F 1 "150kΩ1w" V 10200 2050 50  0000 C CNN
F 2 "Resistor_SMD:R_2512_6332Metric_Pad1.52x3.35mm_HandSolder" V 10230 2050 50  0001 C CNN
F 3 "" H 10300 2050 50  0001 C CNN
F 4 "C25719" V 10300 2050 50  0001 C CNN "JLCPCB"
	1    10300 2050
	0    1    1    0   
$EndComp
$Comp
L Mechanical:MountingHole_Pad H6
U 1 1 61AC391A
P 11000 6350
F 0 "H6" H 10950 6500 50  0000 L CNN
F 1 "MountingHole_Pad" H 11100 6308 50  0001 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_ISO14580_Pad" H 11000 6350 50  0001 C CNN
F 3 "~" H 11000 6350 50  0001 C CNN
	1    11000 6350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R11
U 1 1 619CF60C
P 7200 1900
F 0 "R11" V 6950 2050 50  0001 C CNN
F 1 "100Ω" V 7200 1900 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 7130 1900 50  0001 C CNN
F 3 "https://www.distrelec.ch/en/high-power-thick-film-smd-resistor-0805-150ohm-330mw-rnd-components-rnd-155hp05w3f1500t5e/p/30111774?q=*&pos=2&origPos=1787&origPageSize=50&track=true" H 7200 1900 50  0001 C CNN
F 4 "C17408" H 7200 1900 50  0001 C CNN "JLCPCB"
	1    7200 1900
	0    1    1    0   
$EndComp
$Comp
L Device:LED D2
U 1 1 619D076D
P 7200 2000
F 0 "D2" H 7300 2350 50  0001 C CNN
F 1 "LED" H 7350 1950 50  0001 C CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7200 2000 50  0001 C CNN
F 3 "https://www.distrelec.ch/en/smd-led-green-575nm-20ma-2v-140-everlight-electronics-17-21sygc-s530-e1-tr8/p/17531205?q=*&pos=9&origPos=371&origPageSize=50&track=true" H 7200 2000 50  0001 C CNN
F 4 "C2297" H 7200 2000 50  0001 C CNN "JLCPCB"
	1    7200 2000
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H5
U 1 1 61A2C786
P 10800 6350
F 0 "H5" H 10750 6500 50  0000 L CNN
F 1 "MountingHole_Pad" H 10900 6308 50  0001 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_ISO14580_Pad" H 10800 6350 50  0001 C CNN
F 3 "~" H 10800 6350 50  0001 C CNN
	1    10800 6350
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H4
U 1 1 61A179CD
P 10600 6350
F 0 "H4" H 10550 6500 50  0000 L CNN
F 1 "MountingHole_Pad" H 10700 6308 50  0001 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_ISO14580_Pad" H 10600 6350 50  0001 C CNN
F 3 "~" H 10600 6350 50  0001 C CNN
	1    10600 6350
	1    0    0    -1  
$EndComp
$Comp
L wago-2604-1102:2604-1102 J2
U 1 1 61964B73
P 3800 1150
F 0 "J2" H 3642 763 60  0000 C CNN
F 1 "2604-1102" H 3642 869 60  0001 C CNN
F 2 "wago-2604-1102:big_pads_2604-1102" H 3800 1090 60  0001 C CNN
F 3 "" H 3800 1150 60  0001 C CNN
F 4 "Input Connector" H 3700 900 50  0000 C CNN "Text"
	1    3800 1150
	-1   0    0    1   
$EndComp
$Comp
L wago-2604-1104:2604-1104 J1
U 1 1 61952879
P 1050 850
F 0 "J1" H 892 263 60  0000 C CNN
F 1 "2604-1104" H 892 369 60  0000 C CNN
F 2 "wago-2604-1104:big_pads_2604-1104" H 1050 790 60  0001 C CNN
F 3 "" H 1050 850 60  0000 C CNN
	1    1050 850 
	0    -1   -1   0   
$EndComp
$Comp
L wago-2604-1104:2604-1104 J9
U 1 1 61912494
P 8500 1250
F 0 "J9" H 8342 663 60  0000 C CNN
F 1 "2604-1104" H 8342 769 60  0000 C CNN
F 2 "wago-2604-1104:big_pads_2604-1104" H 8500 1190 60  0001 C CNN
F 3 "" H 8500 1250 60  0000 C CNN
	1    8500 1250
	-1   0    0    1   
$EndComp
$Comp
L Device:Fuse F2
U 1 1 618BE6D0
P 5800 2400
F 0 "F2" V 5700 2400 50  0000 C CNN
F 1 "250v50mA" V 5650 2400 50  0000 C CNN
F 2 "Fuse:Fuse_Littelfuse_372_D8.50mm" V 5730 2400 50  0001 C CNN
F 3 "~" H 5800 2400 50  0001 C CNN
	1    5800 2400
	0    -1   -1   0   
$EndComp
$Comp
L pcn-105D3:PCN-124D3MHZ,000 K3
U 1 1 6187F6F7
P 700 3550
F 0 "K3" H 1100 3775 50  0000 C CNN
F 1 "PCN-105D" H 1100 3684 50  0000 C CNN
F 2 "PCN:bigpads_TE_Connectivity-PCN-124D" H 700 3950 50  0001 L CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=showdoc&DocId=Data+Sheet%7FPCN_series_relay_data_sheet_E%7F1217%7Fpdf%7FEnglish%7FENG_DS_PCN_series_relay_data_sheet_E_1217.pdf%7F3-1461491-6" H 700 4050 50  0001 L CNN
F 4 "+85°C" H 700 4150 50  0001 L CNN "ambient temperature range high"
F 5 "-40°C" H 700 4250 50  0001 L CNN "ambient temperature range low"
F 6 "No" H 700 4350 50  0001 L CNN "automotive"
F 7 "Relay" H 700 4450 50  0001 L CNN "category"
F 8 "120mW" H 700 4550 50  0001 L CNN "coil power"
F 9 "4800Ω" H 700 4650 50  0001 L CNN "coil resistance"
F 10 "Non-Latching" H 700 4750 50  0001 L CNN "coil type"
F 11 "24V" H 700 4850 50  0001 L CNN "coil voltage"
F 12 "3A" H 700 4950 50  0001 L CNN "current rating"
F 13 "Electromechanical" H 700 5050 50  0001 L CNN "device class L1"
F 14 "Relays" H 700 5150 50  0001 L CNN "device class L2"
F 15 "Power Relays" H 700 5250 50  0001 L CNN "device class L3"
F 16 "RELAY GEN PURPOSE SPST 3A 24V" H 700 5350 50  0001 L CNN "digikey description"
F 17 "PB906-ND" H 700 5450 50  0001 L CNN "digikey part number"
F 18 "12.8mm" H 700 5550 50  0001 L CNN "height"
F 19 "Yes" H 700 5650 50  0001 L CNN "lead free"
F 20 "591278d9da046128" H 700 5750 50  0001 L CNN "library id"
F 21 "TE Connectivity" H 700 5850 50  0001 L CNN "manufacturer"
F 22 "655-PCN-124D3MHZ,000" H 700 5950 50  0001 L CNN "mouser part number"
F 23 "1" H 700 6050 50  0001 L CNN "number of contacts"
F 24 "PTH_RELAY_20MM0_5MM0" H 700 6150 50  0001 L CNN "package"
F 25 "Yes" H 700 6250 50  0001 L CNN "rohs"
F 26 "3A" H 700 6350 50  0001 L CNN "switching current"
F 27 "SPST" H 700 6450 50  0001 L CNN "throw configuration"
	1    700  3550
	1    0    0    -1  
$EndComp
$Comp
L pcn-105D3:PCN-124D3MHZ,000 K4
U 1 1 6187BE46
P 700 2950
F 0 "K4" H 1100 3175 50  0000 C CNN
F 1 "PCN-105D" H 1100 3084 50  0000 C CNN
F 2 "PCN:bigpads_TE_Connectivity-PCN-124D" H 700 3350 50  0001 L CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=showdoc&DocId=Data+Sheet%7FPCN_series_relay_data_sheet_E%7F1217%7Fpdf%7FEnglish%7FENG_DS_PCN_series_relay_data_sheet_E_1217.pdf%7F3-1461491-6" H 700 3450 50  0001 L CNN
F 4 "+85°C" H 700 3550 50  0001 L CNN "ambient temperature range high"
F 5 "-40°C" H 700 3650 50  0001 L CNN "ambient temperature range low"
F 6 "No" H 700 3750 50  0001 L CNN "automotive"
F 7 "Relay" H 700 3850 50  0001 L CNN "category"
F 8 "120mW" H 700 3950 50  0001 L CNN "coil power"
F 9 "4800Ω" H 700 4050 50  0001 L CNN "coil resistance"
F 10 "Non-Latching" H 700 4150 50  0001 L CNN "coil type"
F 11 "24V" H 700 4250 50  0001 L CNN "coil voltage"
F 12 "3A" H 700 4350 50  0001 L CNN "current rating"
F 13 "Electromechanical" H 700 4450 50  0001 L CNN "device class L1"
F 14 "Relays" H 700 4550 50  0001 L CNN "device class L2"
F 15 "Power Relays" H 700 4650 50  0001 L CNN "device class L3"
F 16 "RELAY GEN PURPOSE SPST 3A 24V" H 700 4750 50  0001 L CNN "digikey description"
F 17 "PB906-ND" H 700 4850 50  0001 L CNN "digikey part number"
F 18 "12.8mm" H 700 4950 50  0001 L CNN "height"
F 19 "Yes" H 700 5050 50  0001 L CNN "lead free"
F 20 "591278d9da046128" H 700 5150 50  0001 L CNN "library id"
F 21 "TE Connectivity" H 700 5250 50  0001 L CNN "manufacturer"
F 22 "655-PCN-124D3MHZ,000" H 700 5350 50  0001 L CNN "mouser part number"
F 23 "1" H 700 5450 50  0001 L CNN "number of contacts"
F 24 "PTH_RELAY_20MM0_5MM0" H 700 5550 50  0001 L CNN "package"
F 25 "Yes" H 700 5650 50  0001 L CNN "rohs"
F 26 "3A" H 700 5750 50  0001 L CNN "switching current"
F 27 "SPST" H 700 5850 50  0001 L CNN "throw configuration"
	1    700  2950
	1    0    0    -1  
$EndComp
$Comp
L pcn-105D3:PCN-124D3MHZ,000 K2
U 1 1 61875C62
P 700 2350
F 0 "K2" H 1100 2575 50  0000 C CNN
F 1 "PCN-105D" H 1100 2484 50  0000 C CNN
F 2 "PCN:bigpads_TE_Connectivity-PCN-124D" H 700 2750 50  0001 L CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=showdoc&DocId=Data+Sheet%7FPCN_series_relay_data_sheet_E%7F1217%7Fpdf%7FEnglish%7FENG_DS_PCN_series_relay_data_sheet_E_1217.pdf%7F3-1461491-6" H 700 2850 50  0001 L CNN
F 4 "+85°C" H 700 2950 50  0001 L CNN "ambient temperature range high"
F 5 "-40°C" H 700 3050 50  0001 L CNN "ambient temperature range low"
F 6 "No" H 700 3150 50  0001 L CNN "automotive"
F 7 "Relay" H 700 3250 50  0001 L CNN "category"
F 8 "120mW" H 700 3350 50  0001 L CNN "coil power"
F 9 "4800Ω" H 700 3450 50  0001 L CNN "coil resistance"
F 10 "Non-Latching" H 700 3550 50  0001 L CNN "coil type"
F 11 "24V" H 700 3650 50  0001 L CNN "coil voltage"
F 12 "3A" H 700 3750 50  0001 L CNN "current rating"
F 13 "Electromechanical" H 700 3850 50  0001 L CNN "device class L1"
F 14 "Relays" H 700 3950 50  0001 L CNN "device class L2"
F 15 "Power Relays" H 700 4050 50  0001 L CNN "device class L3"
F 16 "RELAY GEN PURPOSE SPST 3A 24V" H 700 4150 50  0001 L CNN "digikey description"
F 17 "PB906-ND" H 700 4250 50  0001 L CNN "digikey part number"
F 18 "12.8mm" H 700 4350 50  0001 L CNN "height"
F 19 "Yes" H 700 4450 50  0001 L CNN "lead free"
F 20 "591278d9da046128" H 700 4550 50  0001 L CNN "library id"
F 21 "TE Connectivity" H 700 4650 50  0001 L CNN "manufacturer"
F 22 "655-PCN-124D3MHZ,000" H 700 4750 50  0001 L CNN "mouser part number"
F 23 "1" H 700 4850 50  0001 L CNN "number of contacts"
F 24 "PTH_RELAY_20MM0_5MM0" H 700 4950 50  0001 L CNN "package"
F 25 "Yes" H 700 5050 50  0001 L CNN "rohs"
F 26 "3A" H 700 5150 50  0001 L CNN "switching current"
F 27 "SPST" H 700 5250 50  0001 L CNN "throw configuration"
	1    700  2350
	1    0    0    -1  
$EndComp
$Comp
L pcn-105D3:PCN-124D3MHZ,000 K1
U 1 1 618622EC
P 700 1800
F 0 "K1" H 1100 2025 50  0000 C CNN
F 1 "PCN-105D" H 1100 1934 50  0000 C CNN
F 2 "PCN:bigpads_TE_Connectivity-PCN-124D" H 700 2200 50  0001 L CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=showdoc&DocId=Data+Sheet%7FPCN_series_relay_data_sheet_E%7F1217%7Fpdf%7FEnglish%7FENG_DS_PCN_series_relay_data_sheet_E_1217.pdf%7F3-1461491-6" H 700 2300 50  0001 L CNN
F 4 "+85°C" H 700 2400 50  0001 L CNN "ambient temperature range high"
F 5 "-40°C" H 700 2500 50  0001 L CNN "ambient temperature range low"
F 6 "No" H 700 2600 50  0001 L CNN "automotive"
F 7 "Relay" H 700 2700 50  0001 L CNN "category"
F 8 "120mW" H 700 2800 50  0001 L CNN "coil power"
F 9 "4800Ω" H 700 2900 50  0001 L CNN "coil resistance"
F 10 "Non-Latching" H 700 3000 50  0001 L CNN "coil type"
F 11 "24V" H 700 3100 50  0001 L CNN "coil voltage"
F 12 "3A" H 700 3200 50  0001 L CNN "current rating"
F 13 "Electromechanical" H 700 3300 50  0001 L CNN "device class L1"
F 14 "Relays" H 700 3400 50  0001 L CNN "device class L2"
F 15 "Power Relays" H 700 3500 50  0001 L CNN "device class L3"
F 16 "RELAY GEN PURPOSE SPST 3A 24V" H 700 3600 50  0001 L CNN "digikey description"
F 17 "PB906-ND" H 700 3700 50  0001 L CNN "digikey part number"
F 18 "12.8mm" H 700 3800 50  0001 L CNN "height"
F 19 "Yes" H 700 3900 50  0001 L CNN "lead free"
F 20 "591278d9da046128" H 700 4000 50  0001 L CNN "library id"
F 21 "TE Connectivity" H 700 4100 50  0001 L CNN "manufacturer"
F 22 "655-PCN-124D3MHZ,000" H 700 4200 50  0001 L CNN "mouser part number"
F 23 "1" H 700 4300 50  0001 L CNN "number of contacts"
F 24 "PTH_RELAY_20MM0_5MM0" H 700 4400 50  0001 L CNN "package"
F 25 "Yes" H 700 4500 50  0001 L CNN "rohs"
F 26 "3A" H 700 4600 50  0001 L CNN "switching current"
F 27 "SPST" H 700 4700 50  0001 L CNN "throw configuration"
	1    700  1800
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C1
U 1 1 6181C340
P 2250 2100
F 0 "C1" H 2368 2146 50  0001 L CNN
F 1 "100nF" H 2550 2100 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 2288 1950 50  0001 C CNN
F 3 "https://www.distrelec.ch/en/ceramic-capacitor-100nf-50vdc-0805-rnd-components-rnd-1500805b104j500nt/p/30086635?q=smd+capacitor+&pos=5&origPos=990&origPageSize=50&track=true" H 2250 2100 50  0001 C CNN
F 4 "C14663" H 2250 2100 50  0001 C CNN "JLCPCB"
	1    2250 2100
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C2
U 1 1 61809E87
P 4750 3250
F 0 "C2" H 4868 3296 50  0001 L CNN
F 1 "100nF" H 4900 3400 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 4788 3100 50  0001 C CNN
F 3 "https://www.distrelec.ch/en/ceramic-capacitor-100nf-50vdc-0805-rnd-components-rnd-1500805b104j500nt/p/30086635?q=smd+capacitor+&pos=5&origPos=990&origPageSize=50&track=true" H 4750 3250 50  0001 C CNN
F 4 "C14663" H 4750 3250 50  0001 C CNN "JLCPCB"
	1    4750 3250
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C3
U 1 1 619D049D
P 5700 3250
F 0 "C3" H 5818 3296 50  0001 L CNN
F 1 "100nF" H 6000 3250 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 5738 3100 50  0001 C CNN
F 3 "https://www.distrelec.ch/en/ceramic-capacitor-100nf-50vdc-0805-rnd-components-rnd-1500805b104j500nt/p/30086635?q=smd+capacitor+&pos=5&origPos=990&origPageSize=50&track=true" H 5700 3250 50  0001 C CNN
F 4 "C14663" H 5700 3250 50  0001 C CNN "JLCPCB"
	1    5700 3250
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J5
U 1 1 6176729E
P 5800 2800
F 0 "J5" V 5750 2750 50  0001 R CNN
F 1 "Current Jumper" V 5750 3050 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 5800 2800 50  0001 C CNN
F 3 "~" H 5800 2800 50  0001 C CNN
	1    5800 2800
	0    1    1    0   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J6
U 1 1 61750993
P 6400 2850
F 0 "J6" H 6318 2525 50  0000 C CNN
F 1 "GND 3.3V" H 6318 2616 50  0000 C CNN
F 2 "Connector_JST:JST_XH_B2B-XH-A_1x02_P2.50mm_Vertical" H 6400 2850 50  0001 C CNN
F 3 "~" H 6400 2850 50  0001 C CNN
	1    6400 2850
	-1   0    0    1   
$EndComp
$Comp
L Mechanical:MountingHole_Pad H1
U 1 1 618C5DA5
P 10400 6350
F 0 "H1" H 10350 6500 50  0000 L CNN
F 1 "MountingHole_Pad" H 10500 6308 50  0001 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_ISO14580_Pad" H 10400 6350 50  0001 C CNN
F 3 "~" H 10400 6350 50  0001 C CNN
	1    10400 6350
	1    0    0    -1  
$EndComp
$Comp
L Device:Varistor RV1
U 1 1 613E75CC
P 5350 1950
F 0 "RV1" H 5229 1904 50  0000 R CNN
F 1 "400V" H 5229 1995 50  0000 R CNN
F 2 "Varistor:RV_Disc_D12mm_W4.2mm_P7.5mm" V 5280 1950 50  0001 C CNN
F 3 "~" H 5350 1950 50  0001 C CNN
	1    5350 1950
	-1   0    0    1   
$EndComp
$Comp
L Device:Fuse F1
U 1 1 613D9E49
P 5200 1400
F 0 "F1" V 5397 1400 50  0000 C CNN
F 1 "250V1A" V 5306 1400 50  0000 C CNN
F 2 "Fuse:Fuse_Littelfuse_372_D8.50mm" V 5130 1400 50  0001 C CNN
F 3 "~" H 5200 1400 50  0001 C CNN
	1    5200 1400
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J7
U 1 1 6143ACB7
P 6400 3350
F 0 "J7" H 6318 3025 50  0000 C CNN
F 1 "Conn_01x02" H 6318 3116 50  0000 C CNN
F 2 "Connector_JST:JST_XH_B2B-XH-A_1x02_P2.50mm_Vertical" H 6400 3350 50  0001 C CNN
F 3 "~" H 6400 3350 50  0001 C CNN
	1    6400 3350
	-1   0    0    1   
$EndComp
$Comp
L Device:CP 100uF_1
U 1 1 6151DFD1
P 4500 3250
F 0 "100uF_1" H 4618 3296 50  0001 L CNN
F 1 "100uF" H 4400 3400 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 4538 3100 50  0001 C CNN
F 3 "~" H 4500 3250 50  0001 C CNN
	1    4500 3250
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:LD1117S33TR_SOT223 U4
U 1 1 61434446
P 5100 3000
F 0 "U4" H 5100 3242 50  0001 C CNN
F 1 "LD1117AV33_TO220" H 5100 3151 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 5100 3200 50  0001 C CNN
F 3 "http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/CD00000544.pdf" H 5200 2750 50  0001 C CNN
	1    5100 3000
	1    0    0    -1  
$EndComp
$Comp
L Device:CP 100uF_2
U 1 1 615251C7
P 5450 3250
F 0 "100uF_2" H 5568 3296 50  0001 L CNN
F 1 "100uF" H 5150 3250 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 5488 3100 50  0001 C CNN
F 3 "~" H 5450 3250 50  0001 C CNN
	1    5450 3250
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J8
U 1 1 6159F81D
P 7050 1550
F 0 "J8" V 7000 1500 50  0001 R CNN
F 1 "Current Jumper" V 7000 1800 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 7050 1550 50  0001 C CNN
F 3 "~" H 7050 1550 50  0001 C CNN
	1    7050 1550
	0    1    1    0   
$EndComp
$Comp
L RAC05-05SK_277:RAC05-05SK_277 RA05.SK.1
U 1 1 6146ABA1
P 6250 1950
F 0 "RA05.SK.1" H 6250 2300 50  0000 C CNN
F 1 "RAC05.05SK.277" H 6250 2326 50  0001 C CNN
F 2 "rac05-05sk:277" H 6250 1950 50  0001 L BNN
F 3 "" H 6250 1950 50  0001 L BNN
F 4 "Manufacturer Recommendations" H 6250 1950 50  0001 L BNN "STANDARD"
F 5 "21.8mm" H 6250 1950 50  0001 L BNN "MAXIMUM_PACKAGE_HEIGHT"
F 6 "RECOM" H 6250 1950 50  0001 L BNN "MANUFACTURER"
F 7 "N/A" H 6250 1950 50  0001 L BNN "PARTREV"
	1    6250 1950
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 J4
U 1 1 614144AF
P 2600 3150
F 0 "J4" H 2700 2700 50  0000 L CNN
F 1 "ESP Relays" V 2700 2750 50  0000 L CNN
F 2 "Connector_JST:JST_XH_B4B-XH-A_1x04_P2.50mm_Vertical" H 2600 3150 50  0001 C CNN
F 3 "~" H 2600 3150 50  0001 C CNN
	1    2600 3150
	-1   0    0    1   
$EndComp
$Comp
L Transistor_Array:ULN2003A U1
U 1 1 61374AC1
P 2650 1450
F 0 "U1" H 2600 2100 50  0000 L CNN
F 1 "ULN2003A" H 2450 2000 50  0000 L CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 2700 900 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/uln2003a.pdf" H 2750 1250 50  0001 C CNN
F 4 "C7512" V 2650 1450 50  0001 C CNN "JLCPCB"
	1    2650 1450
	-1   0    0    1   
$EndComp
$Comp
L RF_Module:ESP32-WROOM-32D U2
U 1 1 61AE698E
P 2050 6150
F 0 "U2" H 1450 4900 50  0000 C CNN
F 1 "ESP32-WROOM-32E" H 1450 4750 50  0000 C CNN
F 2 "RF_Module:ESP32-WROOM-32" H 2050 4650 50  0001 C CNN
F 3 "https://www.espressif.com/sites/default/files/documentation/esp32-wroom-32d_esp32-wroom-32u_datasheet_en.pdf" H 1750 6200 50  0001 C CNN
F 4 "C701343" H 2050 6150 50  0001 C CNN "JLCPCB"
	1    2050 6150
	1    0    0    -1  
$EndComp
$Comp
L Connector:USB_B_Micro J3
U 1 1 61D7514B
P 4400 6750
F 0 "J3" V 4411 7080 50  0000 L CNN
F 1 "USB_B_Micro" V 4150 6600 50  0000 L CNN
F 2 "Connector_USB:USB_Micro-B_Molex-105017-0001" H 4550 6700 50  0001 C CNN
F 3 "~" H 4550 6700 50  0001 C CNN
F 4 "C132563" H 4400 6750 50  0001 C CNN "JLCPCB"
	1    4400 6750
	0    1    1    0   
$EndComp
$Comp
L Device:CP C5
U 1 1 61CA3B02
P 4150 4300
F 0 "C5" H 4150 4600 50  0000 L CNN
F 1 "4.7uF" H 4100 4500 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 4188 4150 50  0001 C CNN
F 3 "~" H 4150 4300 50  0001 C CNN
F 4 "C19666" H 4150 4300 50  0001 C CNN "JLCPCB"
	1    4150 4300
	-1   0    0    1   
$EndComp
$Comp
L Device:R R4
U 1 1 61CAA7BC
P 4800 4450
F 0 "R4" V 4900 4450 50  0000 C CNN
F 1 "1kΩ" V 4800 4450 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 4730 4450 50  0001 C CNN
F 3 "~" H 4800 4450 50  0001 C CNN
F 4 "C25585" H 4800 4450 50  0001 C CNN "JLCPCB"
	1    4800 4450
	0    1    1    0   
$EndComp
$Comp
L Device:R R9
U 1 1 61CA58EC
P 4350 4900
F 0 "R9" V 4350 4900 50  0000 C CNN
F 1 "47.5kΩ" V 4250 4900 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 4280 4900 50  0001 C CNN
F 3 "~" H 4350 4900 50  0001 C CNN
F 4 "C23061" H 4350 4900 50  0001 C CNN "JLCPCB"
	1    4350 4900
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R7
U 1 1 61CA9AAC
P 4050 4900
F 0 "R7" V 4050 4900 50  0000 C CNN
F 1 "22.1kΩ" V 3950 4900 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 3980 4900 50  0001 C CNN
F 3 "~" H 4050 4900 50  0001 C CNN
F 4 "C25961" H 4050 4900 50  0001 C CNN "JLCPCB"
	1    4050 4900
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Conn_01x04_Male J10
U 1 1 61D1E3C9
P 10200 1250
F 0 "J10" H 10308 1531 50  0000 C CNN
F 1 "EspSense" H 10308 1440 50  0000 C CNN
F 2 "Connector_PinSocket_2.00mm:PinSocket_1x04_P2.00mm_Vertical" H 10200 1250 50  0001 C CNN
F 3 "~" H 10200 1250 50  0001 C CNN
	1    10200 1250
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J11
U 1 1 61D4A67A
P 3200 5200
F 0 "J11" V 3050 5200 50  0000 R CNN
F 1 "Conn_01x02_Male" V 3150 5400 50  0000 R CNN
F 2 "Connector_PinHeader_2.00mm:PinHeader_1x02_P2.00mm_Vertical" H 3200 5200 50  0001 C CNN
F 3 "~" H 3200 5200 50  0001 C CNN
	1    3200 5200
	-1   0    0    1   
$EndComp
$Comp
L Sensor_Temperature:MCP9700T-ETT U5
U 1 1 61DD9A81
P 9700 4950
F 0 "U5" H 9371 4996 50  0000 R CNN
F 1 "MCP9700T-ETT" H 9371 4905 50  0000 R CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 9700 4550 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/21942e.pdf" H 9550 5200 50  0001 C CNN
F 4 "C42288" H 9700 4950 50  0001 C CNN "JLCPCB"
	1    9700 4950
	1    0    0    -1  
$EndComp
$Comp
L Interface_USB:CP2102N-A01-GQFN28 U8
U 1 1 61DAF948
P 5450 5350
F 0 "U8" V 5000 5150 50  0000 C CNN
F 1 "CP2102N-A01-GQFN28" V 5000 4600 50  0000 C CNN
F 2 "Package_DFN_QFN:QFN-28-1EP_5x5mm_P0.5mm_EP3.35x3.35mm" H 5900 4150 50  0001 L CNN
F 3 "https://www.silabs.com/documents/public/data-sheets/cp2102n-datasheet.pdf" H 5500 4600 50  0001 C CNN
F 4 "C105167" H 5450 5350 50  0001 C CNN "JLCPCB"
	1    5450 5350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R8
U 1 1 61DB1BBD
P 6100 4550
F 0 "R8" V 5893 4550 50  0001 C CNN
F 1 "0Ω" V 6100 4550 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 6030 4550 50  0001 C CNN
F 3 "~" H 6100 4550 50  0001 C CNN
F 4 "C17477" V 6100 4550 50  0001 C CNN "JLCPCB"
	1    6100 4550
	0    1    1    0   
$EndComp
$Comp
L Device:R R6
U 1 1 61DB1BC4
P 6100 4450
F 0 "R6" V 5893 4450 50  0001 C CNN
F 1 "0Ω" V 6100 4450 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 6030 4450 50  0001 C CNN
F 3 "~" H 6100 4450 50  0001 C CNN
F 4 "C17477" V 6100 4450 50  0001 C CNN "JLCPCB"
	1    6100 4450
	0    1    1    0   
$EndComp
$Comp
L Mechanical:MountingHole_Pad H2
U 1 1 61D119D5
P 9050 6350
F 0 "H2" H 9000 6500 50  0000 L CNN
F 1 "MountingHole_Pad" H 9150 6308 50  0001 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2_DIN965_Pad_TopOnly" H 9050 6350 50  0001 C CNN
F 3 "~" H 9050 6350 50  0001 C CNN
	1    9050 6350
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H3
U 1 1 61D16737
P 9350 6350
F 0 "H3" H 9300 6500 50  0000 L CNN
F 1 "MountingHole_Pad" H 9450 6308 50  0001 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2_DIN965_Pad_TopOnly" H 9350 6350 50  0001 C CNN
F 3 "~" H 9350 6350 50  0001 C CNN
	1    9350 6350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 61DB1BB6
P 6100 4350
F 0 "R5" V 6000 4350 50  0001 C CNN
F 1 "1kΩ" V 6100 4350 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 6030 4350 50  0001 C CNN
F 3 "~" H 6100 4350 50  0001 C CNN
F 4 "C4410" H 6100 4350 50  0001 C CNN "JLCPCB"
	1    6100 4350
	0    1    1    0   
$EndComp
Connection ~ 4500 3400
Connection ~ 9500 2250
Connection ~ 9500 2050
Wire Wire Line
	4150 3000 4250 3000
Wire Wire Line
	4200 3400 4250 3400
$Comp
L Device:CP C6
U 1 1 61E95A47
P 4250 3250
F 0 "C6" V 4400 3050 50  0000 L CNN
F 1 "22uF" V 4300 3000 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 4288 3100 50  0001 C CNN
F 3 "CL10A226MQ8NRNC" H 4250 3250 50  0001 C CNN
F 4 "C59461" H 4250 3250 50  0001 C CNN "JLCPCB"
	1    4250 3250
	1    0    0    -1  
$EndComp
Connection ~ 4250 3400
Wire Wire Line
	4250 3400 4500 3400
Wire Wire Line
	4250 3100 4250 3000
Connection ~ 4250 3000
Wire Wire Line
	4250 3000 4500 3000
$EndSCHEMATC
