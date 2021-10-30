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
Text GLabel 1750 2000 2    50   Input ~ 0
220VAC(L)
Wire Notes Line
	700  1550 700  2700
Wire Notes Line
	700  2700 3150 2700
Wire Notes Line
	3150 2700 3150 1550
Wire Notes Line
	3150 1550 700  1550
Text GLabel 1750 3200 2    50   Input ~ 0
220VAC(L)
Wire Wire Line
	1150 3600 1100 3600
Wire Notes Line
	700  2750 700  3900
Wire Notes Line
	700  3900 3150 3900
Wire Notes Line
	3150 3900 3150 2750
Wire Notes Line
	3150 2750 700  2750
Text GLabel 1750 4450 2    50   Input ~ 0
220VAC(L)
Wire Wire Line
	1150 4850 1100 4850
Wire Notes Line
	700  4000 700  5150
Wire Notes Line
	700  5150 3150 5150
Wire Notes Line
	3150 5150 3150 4000
Wire Notes Line
	3150 4000 700  4000
Text GLabel 1750 5700 2    50   Input ~ 0
220VAC(L)
Wire Wire Line
	1150 6100 1100 6100
Wire Notes Line
	700  5250 700  6400
Wire Notes Line
	700  6400 3150 6400
Wire Notes Line
	3150 6400 3150 5250
Wire Notes Line
	3150 5250 700  5250
NoConn ~ 11650 4450
NoConn ~ 1150 5800
NoConn ~ 1150 4550
NoConn ~ 1150 3300
NoConn ~ 1150 2100
$Comp
L power:PWR_FLAG #FLG01
U 1 1 615325C8
P 4900 900
F 0 "#FLG01" H 4900 975 50  0001 C CNN
F 1 "PWR_FLAG" H 4900 1073 50  0001 C CNN
F 2 "" H 4900 900 50  0001 C CNN
F 3 "~" H 4900 900 50  0001 C CNN
	1    4900 900 
	1    0    0    -1  
$EndComp
Text GLabel 1150 4350 0    50   Input ~ 0
REO3
Text GLabel 1150 1900 0    50   Input ~ 0
REO1
Text GLabel 1150 3100 0    50   Input ~ 0
REO2
Text GLabel 1150 5600 0    50   Input ~ 0
REO4
Wire Wire Line
	1150 2400 1100 2400
NoConn ~ 550  2450
Text GLabel 10700 2650 2    50   Input ~ 0
Sens2
Text GLabel 10700 5850 2    50   Input ~ 0
Sens4
Text GLabel 10700 3850 2    50   Input ~ 0
Sens1
$Comp
L power:PWR_FLAG #FLG03
U 1 1 61341516
P 8850 1300
F 0 "#FLG03" H 8850 1375 50  0001 C CNN
F 1 "PWR_FLAG" H 8850 1473 50  0001 C CNN
F 2 "" H 8850 1300 50  0001 C CNN
F 3 "~" H 8850 1300 50  0001 C CNN
	1    8850 1300
	0    1    1    0   
$EndComp
Text GLabel 1900 1100 2    50   Input ~ 0
REO3
Text GLabel 1900 900  2    50   Input ~ 0
REO1
Text GLabel 1900 1000 2    50   Input ~ 0
REO2
Text GLabel 1900 1200 2    50   Input ~ 0
REO4
Wire Wire Line
	9800 2400 9800 2350
Wire Wire Line
	9800 2400 10000 2400
Wire Wire Line
	10000 2200 9800 2200
Wire Wire Line
	9800 2200 9800 2250
Text GLabel 8250 3050 0    50   Input ~ 0
3.3V+
NoConn ~ 8900 2350
Text GLabel 8350 3350 0    50   Input ~ 0
GND(5V)
Text GLabel 9800 5750 2    50   Input ~ 0
220VAC(N)
Wire Wire Line
	9800 3600 9800 3550
Wire Wire Line
	9800 3600 10000 3600
Wire Wire Line
	10000 3400 9800 3400
Wire Wire Line
	9800 3400 9800 3450
NoConn ~ 8900 3550
Text GLabel 8400 4350 0    50   Input ~ 0
GND(5V)
Wire Wire Line
	9800 4600 9800 4550
Wire Wire Line
	9800 4600 10000 4600
Wire Wire Line
	10000 4400 9800 4400
Wire Wire Line
	9800 4400 9800 4450
NoConn ~ 8900 4550
Text GLabel 8400 5350 0    50   Input ~ 0
GND(5V)
Text GLabel 9800 2550 2    50   Input ~ 0
220VAC(N)
Wire Wire Line
	9800 5600 9800 5550
Wire Wire Line
	9800 5600 10000 5600
Wire Wire Line
	10000 5400 9800 5400
Wire Wire Line
	9800 5400 9800 5450
NoConn ~ 8900 5550
Text Label 6750 650  0    50   ~ 0
PowerSupply
Text Label 10550 1050 0    50   ~ 0
LightInputs
Text Label 3050 650  0    50   ~ 0
Relays
Text GLabel 1100 1200 0    50   Input ~ 0
REO4
Text GLabel 1100 1000 0    50   Input ~ 0
REO2
Text GLabel 1100 900  0    50   Input ~ 0
REO1
Text GLabel 1100 1100 0    50   Input ~ 0
REO3
Wire Notes Line
	3400 6500 600  6500
Wire Notes Line
	600  550  600  6500
Wire Notes Line
	600  550  3400 550 
Wire Notes Line
	3400 550  3400 6500
Wire Notes Line
	11000 950  11000 6300
$Comp
L power:PWR_FLAG #FLG02
U 1 1 61581A71
P 4900 1900
F 0 "#FLG02" H 4900 1975 50  0001 C CNN
F 1 "PWR_FLAG" H 4900 2073 50  0001 C CNN
F 2 "" H 4900 1900 50  0001 C CNN
F 3 "~" H 4900 1900 50  0001 C CNN
	1    4900 1900
	-1   0    0    1   
$EndComp
Text GLabel 8850 1600 0    50   Input ~ 0
Sens1
Text GLabel 8850 1500 0    50   Input ~ 0
Sens2
Text GLabel 8850 1400 0    50   Input ~ 0
Sens3
Text GLabel 8850 1300 0    50   Input ~ 0
Sens4
$Comp
L power:PWR_FLAG #FLG04
U 1 1 61369577
P 8850 1400
F 0 "#FLG04" H 8850 1475 50  0001 C CNN
F 1 "PWR_FLAG" H 8850 1573 50  0001 C CNN
F 2 "" H 8850 1400 50  0001 C CNN
F 3 "~" H 8850 1400 50  0001 C CNN
	1    8850 1400
	0    1    1    0   
$EndComp
$Comp
L power:PWR_FLAG #FLG05
U 1 1 613698EA
P 8850 1500
F 0 "#FLG05" H 8850 1575 50  0001 C CNN
F 1 "PWR_FLAG" H 8850 1673 50  0001 C CNN
F 2 "" H 8850 1500 50  0001 C CNN
F 3 "~" H 8850 1500 50  0001 C CNN
	1    8850 1500
	0    1    1    0   
$EndComp
$Comp
L power:PWR_FLAG #FLG06
U 1 1 61369AE5
P 8850 1600
F 0 "#FLG06" H 8850 1675 50  0001 C CNN
F 1 "PWR_FLAG" H 8850 1773 50  0001 C CNN
F 2 "" H 8850 1600 50  0001 C CNN
F 3 "~" H 8850 1600 50  0001 C CNN
	1    8850 1600
	0    1    1    0   
$EndComp
Text GLabel 9800 4750 2    50   Input ~ 0
220VAC(N)
Text GLabel 8250 2150 0    50   Input ~ 0
GND(5V)
NoConn ~ 800  7600
NoConn ~ 1000 7600
NoConn ~ 1400 7600
NoConn ~ 1600 7600
Text GLabel 1750 2400 2    50   Input ~ 0
REI1
Text GLabel 1750 3600 2    50   Input ~ 0
REI2
Text GLabel 1750 4850 2    50   Input ~ 0
REI3
Text GLabel 1750 6100 2    50   Input ~ 0
REI4
Wire Wire Line
	5200 900  5400 900 
Wire Wire Line
	4100 900  4900 900 
Connection ~ 4900 900 
NoConn ~ 4900 1500
NoConn ~ 4900 1400
Text GLabel 5500 900  2    50   UnSpc ~ 0
220VAC(L)
Text GLabel 6800 1650 2    50   Input ~ 0
GND(5V)
Text GLabel 5800 1900 2    50   UnSpc ~ 0
220VAC(N)
Wire Wire Line
	4100 1900 4900 1900
Connection ~ 4900 1900
Wire Wire Line
	4900 1900 5200 1900
Wire Wire Line
	5200 1600 5200 1900
Connection ~ 5200 1900
Wire Wire Line
	5200 1900 5400 1900
Wire Wire Line
	5400 1900 5400 1650
Connection ~ 5400 1900
Wire Wire Line
	5400 1900 5500 1900
Wire Wire Line
	5400 900  5400 1250
Connection ~ 5400 900 
Wire Wire Line
	5400 900  5500 900 
Wire Wire Line
	4100 900  4100 1300
Wire Wire Line
	4100 1600 4100 1900
Text GLabel 4350 4000 2    50   Input ~ 0
GND(5V)
Text GLabel 4750 4700 2    50   Input ~ 0
GND(5V)
Text GLabel 4750 4600 2    50   Input ~ 0
GND(5V)
Text GLabel 4750 4800 2    50   Input ~ 0
GND(5V)
Text GLabel 3950 4800 0    50   Input ~ 0
GND(5V)
Text GLabel 3950 4700 0    50   Input ~ 0
GND(5V)
Text GLabel 3950 4600 0    50   Input ~ 0
GND(5V)
Text GLabel 3950 5000 0    50   Input ~ 0
5V+
NoConn ~ 4100 1400
NoConn ~ 4100 1500
Text GLabel 4200 2250 0    50   Input ~ 0
5V+
Text GLabel 5100 2250 2    50   Input ~ 0
3.3V+
Text GLabel 6450 2750 2    50   Input ~ 0
5V+
Text GLabel 6450 2850 2    50   Input ~ 0
GND(5V)
Wire Notes Line
	7700 6300 7700 950 
Wire Notes Line
	7700 950  11000 950 
Wire Notes Line
	7700 6300 11000 6300
Text GLabel 4600 2650 3    50   Input ~ 0
GND(5V)
Wire Notes Line
	3800 550  3800 3050
Wire Notes Line
	7250 550  7250 3050
Text GLabel 8900 5650 0    50   Input ~ 0
EspSens1
Text GLabel 5750 3400 2    50   Input ~ 0
EspSens1
Text GLabel 5750 3500 2    50   Input ~ 0
EspSens2
Text GLabel 5750 3600 2    50   Input ~ 0
EspSens3
Text GLabel 5750 3700 2    50   Input ~ 0
EspSens4
Text GLabel 6050 4100 2    50   Input ~ 0
EspSens1
Text GLabel 6050 4200 2    50   Input ~ 0
EspSens2
Text GLabel 6050 4300 2    50   Input ~ 0
EspSens3
Text GLabel 6050 4400 2    50   Input ~ 0
EspSens4
Text GLabel 8200 4500 0    50   Input ~ 0
EspSens2
Text GLabel 8200 3500 0    50   Input ~ 0
EspSens3
Text GLabel 8700 2450 0    50   Input ~ 0
EspSens4
Text GLabel 8200 4100 0    50   Input ~ 0
3.3V+
Wire Wire Line
	8600 4100 8350 4100
Wire Wire Line
	8900 3850 8600 3850
Wire Wire Line
	8600 3850 8600 4100
Text GLabel 8200 5100 0    50   Input ~ 0
3.3V+
Wire Wire Line
	8600 5100 8400 5100
Wire Wire Line
	8900 4850 8600 4850
Wire Wire Line
	8600 4850 8600 5100
Text GLabel 8200 6100 0    50   Input ~ 0
3.3V+
Wire Wire Line
	8600 6100 8400 6100
Wire Wire Line
	8900 5850 8600 5850
Wire Wire Line
	8600 5850 8600 6100
Text GLabel 5750 4500 2    50   Input ~ 0
3.3V+
Text GLabel 1100 6100 0    50   Input ~ 0
5V+
Text GLabel 1100 4850 0    50   Input ~ 0
5V+
Text GLabel 1100 3600 0    50   Input ~ 0
5V+
Text GLabel 1100 2400 0    50   Input ~ 0
5V+
Text GLabel 9600 1650 0    50   Input ~ 0
Sens4
Text GLabel 9600 1550 0    50   Input ~ 0
Sens3
Text GLabel 9600 1350 0    50   Input ~ 0
Sens2
Text GLabel 9600 1450 0    50   Input ~ 0
Sens1
Text GLabel 10400 1350 2    50   Input ~ 0
Sens2
Text GLabel 10400 1550 2    50   Input ~ 0
Sens3
Text GLabel 10400 1650 2    50   Input ~ 0
Sens4
Text GLabel 10400 1450 2    50   Input ~ 0
Sens1
Wire Wire Line
	4900 1600 4900 1900
NoConn ~ 1200 7600
Wire Wire Line
	5000 2250 4950 2250
Connection ~ 4950 2250
Wire Wire Line
	4950 2250 4900 2250
Wire Wire Line
	4600 2550 4600 2650
Wire Wire Line
	4250 2550 4250 2650
Wire Wire Line
	4250 2650 4600 2650
Wire Wire Line
	4600 2650 4950 2650
Wire Wire Line
	4950 2650 4950 2550
Connection ~ 4600 2650
Wire Wire Line
	4950 2350 4950 2250
Wire Wire Line
	4200 2250 4250 2250
Wire Wire Line
	4250 2350 4250 2250
Connection ~ 4250 2250
Wire Wire Line
	4250 2250 4300 2250
Text GLabel 9800 3750 2    50   Input ~ 0
220VAC(N)
Text GLabel 10700 4850 2    50   Input ~ 0
Sens3
NoConn ~ 1800 7600
Text GLabel 6900 1250 2    50   Input ~ 0
5V+
Wire Notes Line
	7250 550  3800 550 
Wire Notes Line
	3800 3050 7250 3050
Text GLabel 4500 5900 3    50   Input ~ 0
3.3V+
Wire Wire Line
	4900 6200 4400 6200
Wire Wire Line
	4400 6200 4400 5900
Wire Wire Line
	4550 6250 4300 6250
Wire Wire Line
	4300 6250 4300 5900
Wire Wire Line
	4150 6250 4200 6250
Wire Wire Line
	4200 6250 4200 5900
Wire Wire Line
	3750 6200 4100 6200
Wire Wire Line
	4100 6200 4100 5900
Wire Wire Line
	3750 6350 3750 6200
Wire Wire Line
	4150 6350 4150 6250
Wire Wire Line
	4550 6350 4550 6250
Wire Wire Line
	4900 6350 4900 6200
Text GLabel 4700 6650 1    50   Input ~ 0
EspRel4
Text GLabel 4350 6650 1    50   Input ~ 0
EspRel3
Text GLabel 3950 6650 1    50   Input ~ 0
EspRel2
Text GLabel 3550 6650 1    50   Input ~ 0
EspRel1
Text GLabel 4150 6950 3    50   Input ~ 0
EspR2
Text GLabel 4250 7450 3    50   Input ~ 0
EspR2
Text GLabel 4350 7450 3    50   Input ~ 0
EspR3
Text GLabel 4550 6950 3    50   Input ~ 0
EspR3
Connection ~ 5200 900 
Wire Wire Line
	5200 1300 5200 900 
Wire Wire Line
	4900 900  4900 1300
$Comp
L Connector_Generic:Conn_01x04 J2
U 1 1 614144AF
P 4250 7250
F 0 "J2" H 4350 6800 50  0000 L CNN
F 1 "Conn-ESP-Relays" V 4350 6850 50  0000 L CNN
F 2 "Connector_JST:JST_XH_B4B-XH-A_1x04_P2.50mm_Vertical" H 4250 7250 50  0001 C CNN
F 3 "~" H 4250 7250 50  0001 C CNN
	1    4250 7250
	0    -1   -1   0   
$EndComp
$Comp
L Device:D_Schottky_x2_KCom_AAK D4
U 1 1 61777BAD
P 3750 6650
F 0 "D4" V 3704 6730 50  0001 L CNN
F 1 "D_Schottky_x2_KCom_AAK" V 3795 6730 50  0001 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 3750 6650 50  0001 C CNN
F 3 "https://www.distrelec.ch/en/schottky-diode-2a-30v-sot-23-diotec-bat54c/p/30110669?q=diode&pos=1&origPos=1446&origPageSize=50&track=true" H 3750 6650 50  0001 C CNN
	1    3750 6650
	0    1    1    0   
$EndComp
$Comp
L Device:D_Schottky_x2_KCom_AAK D3
U 1 1 61792D0A
P 4150 6650
F 0 "D3" V 4104 6730 50  0001 L CNN
F 1 "D_Schottky_x2_KCom_AAK" V 4195 6730 50  0001 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 4150 6650 50  0001 C CNN
F 3 "~" H 4150 6650 50  0001 C CNN
	1    4150 6650
	0    1    1    0   
$EndComp
$Comp
L Device:D_Schottky_x2_KCom_AAK D2
U 1 1 61795151
P 4550 6650
F 0 "D2" V 4504 6730 50  0001 L CNN
F 1 "D_Schottky_x2_KCom_AAK" V 4595 6730 50  0001 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 4550 6650 50  0001 C CNN
F 3 "~" H 4550 6650 50  0001 C CNN
F 4 "C37704" V 4550 6650 50  0001 C CNN "JLCPCB"
	1    4550 6650
	0    1    1    0   
$EndComp
$Comp
L Device:D_Schottky_x2_KCom_AAK D1
U 1 1 61795AC7
P 4900 6650
F 0 "D1" V 4854 6730 50  0001 L CNN
F 1 "D_Schottky_x2_KCom_AAK" V 4945 6730 50  0001 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 4900 6650 50  0001 C CNN
F 3 "~" H 4900 6650 50  0001 C CNN
	1    4900 6650
	0    1    1    0   
$EndComp
$Comp
L Connector_Generic:Conn_01x05 J4
U 1 1 61516260
P 4300 5700
F 0 "J4" H 4400 5350 50  0000 C CNN
F 1 "Conn-Buttons" V 4400 5650 50  0000 C CNN
F 2 "Connector_JST:JST_XH_B5B-XH-A_1x05_P2.50mm_Vertical" H 4300 5700 50  0001 C CNN
F 3 "~" H 4300 5700 50  0001 C CNN
	1    4300 5700
	0    -1   -1   0   
$EndComp
$Comp
L Device:Fuse F3
U 1 1 61742087
P 9950 2650
F 0 "F3" V 9753 2650 50  0000 C CNN
F 1 "Fuse" V 10050 2650 50  0000 C CNN
F 2 "Fuse:Fuse_1812_4532Metric_Pad1.30x3.40mm_HandSolder" V 9880 2650 50  0001 C CNN
F 3 "https://www.distrelec.ch/en/resettable-smd-fuse-60v-400ma-bel-fuse-0zcg0020af2c/p/30127324?q=fuse+smd&pos=4&origPos=112&origPageSize=50&track=true" H 9950 2650 50  0001 C CNN
	1    9950 2650
	0    1    1    0   
$EndComp
$Comp
L Device:Fuse F4
U 1 1 6174141D
P 9950 3850
F 0 "F4" V 9753 3850 50  0000 C CNN
F 1 "Fuse" V 10050 3850 50  0000 C CNN
F 2 "Fuse:Fuse_1812_4532Metric_Pad1.30x3.40mm_HandSolder" V 9880 3850 50  0001 C CNN
F 3 "https://www.distrelec.ch/en/resettable-smd-fuse-60v-400ma-bel-fuse-0zcg0020af2c/p/30127324?q=fuse+smd&pos=4&origPos=112&origPageSize=50&track=true" H 9950 3850 50  0001 C CNN
	1    9950 3850
	0    1    1    0   
$EndComp
$Comp
L Device:Fuse F6
U 1 1 6173B2BF
P 9950 5850
F 0 "F6" V 9753 5850 50  0001 C CNN
F 1 "Fuse" V 10050 5850 50  0000 C CNN
F 2 "Fuse:Fuse_1812_4532Metric_Pad1.30x3.40mm_HandSolder" V 9880 5850 50  0001 C CNN
F 3 "https://www.distrelec.ch/en/resettable-smd-fuse-60v-400ma-bel-fuse-0zcg0020af2c/p/30127324?q=fuse+smd&pos=4&origPos=112&origPageSize=50&track=true" H 9950 5850 50  0001 C CNN
	1    9950 5850
	0    1    1    0   
$EndComp
$Comp
L Device:Fuse F5
U 1 1 6173596B
P 9950 4850
F 0 "F5" V 9753 4850 50  0000 C CNN
F 1 "Fuse" V 10050 4850 50  0000 C CNN
F 2 "Fuse:Fuse_1812_4532Metric_Pad1.30x3.40mm_HandSolder" V 9880 4850 50  0001 C CNN
F 3 "https://www.distrelec.ch/en/resettable-smd-fuse-60v-400ma-bel-fuse-0zcg0020af2c/p/30127324?q=fuse+smd&pos=4&origPos=112&origPageSize=50&track=true" H 9950 4850 50  0001 C CNN
	1    9950 4850
	0    1    1    0   
$EndComp
$Comp
L RAC05-05SK_277:RAC05-05SK_277 RA05-05-SK1
U 1 1 6146ABA1
P 6100 1450
F 0 "RA05-05-SK1" H 6100 1800 50  0000 C CNN
F 1 "RAC05-05SK_277" H 6100 1826 50  0001 C CNN
F 2 "rac05-05sk:277" H 6100 1450 50  0001 L BNN
F 3 "" H 6100 1450 50  0001 L BNN
F 4 "Manufacturer Recommendations" H 6100 1450 50  0001 L BNN "STANDARD"
F 5 "21.8mm" H 6100 1450 50  0001 L BNN "MAXIMUM_PACKAGE_HEIGHT"
F 6 "RECOM" H 6100 1450 50  0001 L BNN "MANUFACTURER"
F 7 "N/A" H 6100 1450 50  0001 L BNN "PARTREV"
	1    6100 1450
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J9
U 1 1 6159F81D
P 6900 1050
F 0 "J9" V 6850 1000 50  0001 R CNN
F 1 "Current Jumper" V 6850 1300 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 6900 1050 50  0001 C CNN
F 3 "~" H 6900 1050 50  0001 C CNN
	1    6900 1050
	0    1    1    0   
$EndComp
$Comp
L Mechanical:MountingHole_Pad H7
U 1 1 615876D7
P 1800 7500
F 0 "H7" H 1900 7549 50  0001 L CNN
F 1 "MountingHole_Pad" H 1900 7458 50  0001 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_ISO14580_Pad" H 1800 7500 50  0001 C CNN
F 3 "~" H 1800 7500 50  0001 C CNN
	1    1800 7500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R12
U 1 1 613B6B98
P 10250 4850
F 0 "R12" V 10043 4850 50  0001 C CNN
F 1 "39kΩ1w" V 10350 4850 50  0000 C CNN
F 2 "Resistor_SMD:R_2512_6332Metric_Pad1.52x3.35mm_HandSolder" V 10180 4850 50  0001 C CNN
F 3 "https://www.distrelec.ch/en/super-high-power-smd-resistor-2512-82kohm-3w-rnd-components-rnd-155sp123wf8202t2e/p/30150189?q=*&pos=1&origPos=3001&origPageSize=50&digitalDataLayerTerm=resistor&track=true" H 10250 4850 50  0001 C CNN
F 4 "C25723" H 10250 4850 50  0001 C CNN "JLCPCB"
	1    10250 4850
	0    1    1    0   
$EndComp
$Comp
L Device:CP 100uF_2
U 1 1 615251C7
P 4950 2500
F 0 "100uF_2" H 5068 2546 50  0001 L CNN
F 1 "100uF" H 5068 2500 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 4988 2350 50  0001 C CNN
F 3 "~" H 4950 2500 50  0001 C CNN
	1    4950 2500
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:LD1117S33TR_SOT223 U2
U 1 1 61434446
P 4600 2250
F 0 "U2" H 4600 2492 50  0001 C CNN
F 1 "LD1117S33TR_SOT223" H 4600 2401 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 4600 2450 50  0001 C CNN
F 3 "http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/CD00000544.pdf" H 4700 2000 50  0001 C CNN
	1    4600 2250
	1    0    0    -1  
$EndComp
$Comp
L Device:CP 100uF_1
U 1 1 6151DFD1
P 4250 2500
F 0 "100uF_1" H 4368 2546 50  0001 L CNN
F 1 "100uF" H 3900 2500 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 4288 2350 50  0001 C CNN
F 3 "~" H 4250 2500 50  0001 C CNN
	1    4250 2500
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x05 J7
U 1 1 614FF62B
P 5550 4300
F 0 "J7" H 5468 3875 50  0000 C CNN
F 1 "Conn-LedIndicators" H 5468 3966 50  0000 C CNN
F 2 "Connector_JST:JST_XH_B5B-XH-A_1x05_P2.50mm_Vertical" H 5550 4300 50  0001 C CNN
F 3 "~" H 5550 4300 50  0001 C CNN
	1    5550 4300
	-1   0    0    1   
$EndComp
$Comp
L Mechanical:MountingHole_Pad H3
U 1 1 61474CE2
P 1200 7500
F 0 "H3" H 1300 7549 50  0001 L CNN
F 1 "MountingHole_Pad" H 1300 7458 50  0001 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_ISO14580_Pad" H 1200 7500 50  0001 C CNN
F 3 "~" H 1200 7500 50  0001 C CNN
	1    1200 7500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 6141EF53
P 5900 4100
F 0 "R1" V 5693 4100 50  0001 C CNN
F 1 "62Ω" V 5900 4100 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5830 4100 50  0001 C CNN
F 3 "https://www.distrelec.ch/en/high-power-thick-film-smd-resistor-0805-62ohm-330mw-rnd-components-rnd-155hp05w3f620jt5e/p/30111853?q=*&pos=2&origPos=1629&origPageSize=50&track=true" H 5900 4100 50  0001 C CNN
	1    5900 4100
	0    1    1    0   
$EndComp
$Comp
L Device:R R2
U 1 1 6141EDC4
P 5900 4200
F 0 "R2" V 5693 4200 50  0001 C CNN
F 1 "62Ω" V 5900 4200 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5830 4200 50  0001 C CNN
F 3 "https://www.distrelec.ch/en/high-power-thick-film-smd-resistor-0805-62ohm-330mw-rnd-components-rnd-155hp05w3f620jt5e/p/30111853?q=*&pos=2&origPos=1629&origPageSize=50&track=true" H 5900 4200 50  0001 C CNN
	1    5900 4200
	0    1    1    0   
$EndComp
$Comp
L Device:R R3
U 1 1 6141EC21
P 5900 4300
F 0 "R3" V 5693 4300 50  0001 C CNN
F 1 "62Ω" V 5900 4300 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5830 4300 50  0001 C CNN
F 3 "https://www.distrelec.ch/en/high-power-thick-film-smd-resistor-0805-62ohm-330mw-rnd-components-rnd-155hp05w3f620jt5e/p/30111853?q=*&pos=2&origPos=1629&origPageSize=50&track=true" H 5900 4300 50  0001 C CNN
	1    5900 4300
	0    1    1    0   
$EndComp
$Comp
L Device:R R4
U 1 1 6141E5EE
P 5900 4400
F 0 "R4" V 5693 4400 50  0001 C CNN
F 1 "62Ω" V 5900 4400 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5830 4400 50  0001 C CNN
F 3 "https://www.distrelec.ch/en/high-power-thick-film-smd-resistor-0805-62ohm-330mw-rnd-components-rnd-155hp05w3f620jt5e/p/30111853?q=*&pos=2&origPos=1629&origPageSize=50&track=true" H 5900 4400 50  0001 C CNN
	1    5900 4400
	0    1    1    0   
$EndComp
$Comp
L Device:R R5
U 1 1 614135F8
P 8700 2900
F 0 "R5" H 8550 2950 50  0000 L CNN
F 1 "62Ω" H 8500 2850 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 8630 2900 50  0001 C CNN
F 3 "https://www.distrelec.ch/en/high-power-thick-film-smd-resistor-0805-62ohm-330mw-rnd-components-rnd-155hp05w3f620jt5e/p/30111853?q=*&pos=2&origPos=1629&origPageSize=50&track=true" H 8700 2900 50  0001 C CNN
	1    8700 2900
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D5
U 1 1 614135F2
P 8700 2600
F 0 "D5" V 8650 2400 50  0000 L CNN
F 1 "LED" V 8750 2400 50  0000 L CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8700 2600 50  0001 C CNN
F 3 "https://www.distrelec.ch/en/smd-led-green-575nm-20ma-2v-140-everlight-electronics-17-21sygc-s530-e1-tr8/p/17531205?q=*&pos=9&origPos=371&origPageSize=50&track=true" H 8700 2600 50  0001 C CNN
	1    8700 2600
	0    1    1    0   
$EndComp
$Comp
L Device:R R6
U 1 1 614112FB
P 8200 3950
F 0 "R6" H 8050 4050 50  0000 L CNN
F 1 "62Ω" H 8000 3950 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 8130 3950 50  0001 C CNN
F 3 "https://www.distrelec.ch/en/high-power-thick-film-smd-resistor-0805-62ohm-330mw-rnd-components-rnd-155hp05w3f620jt5e/p/30111853?q=*&pos=2&origPos=1629&origPageSize=50&track=true" H 8200 3950 50  0001 C CNN
	1    8200 3950
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D6
U 1 1 614112F5
P 8200 3650
F 0 "D6" V 8150 3500 50  0000 L CNN
F 1 "LED" V 8250 3450 50  0000 L CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8200 3650 50  0001 C CNN
F 3 "https://www.distrelec.ch/en/smd-led-green-575nm-20ma-2v-140-everlight-electronics-17-21sygc-s530-e1-tr8/p/17531205?q=*&pos=9&origPos=371&origPageSize=50&track=true" H 8200 3650 50  0001 C CNN
	1    8200 3650
	0    1    1    0   
$EndComp
$Comp
L Device:R R7
U 1 1 61409E5F
P 8200 4950
F 0 "R7" H 8000 5000 50  0000 L CNN
F 1 "62Ω" H 7950 4900 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 8130 4950 50  0001 C CNN
F 3 "https://www.distrelec.ch/en/high-power-thick-film-smd-resistor-0805-62ohm-330mw-rnd-components-rnd-155hp05w3f620jt5e/p/30111853?q=*&pos=2&origPos=1629&origPageSize=50&track=true" H 8200 4950 50  0001 C CNN
	1    8200 4950
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D7
U 1 1 61409E59
P 8200 4650
F 0 "D7" V 8150 4500 50  0000 L CNN
F 1 "LED" V 8250 4450 50  0000 L CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8200 4650 50  0001 C CNN
F 3 "https://www.distrelec.ch/en/smd-led-green-575nm-20ma-2v-140-everlight-electronics-17-21sygc-s530-e1-tr8/p/17531205?q=*&pos=9&origPos=371&origPageSize=50&track=true" H 8200 4650 50  0001 C CNN
	1    8200 4650
	0    1    1    0   
$EndComp
$Comp
L Device:LED D8
U 1 1 613FCCDC
P 8200 5650
F 0 "D8" V 8150 5450 50  0000 L CNN
F 1 "LED" V 8250 5450 50  0000 L CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8200 5650 50  0001 C CNN
F 3 "https://www.distrelec.ch/en/smd-led-green-575nm-20ma-2v-140-everlight-electronics-17-21sygc-s530-e1-tr8/p/17531205?q=*&pos=9&origPos=371&origPageSize=50&track=true" H 8200 5650 50  0001 C CNN
	1    8200 5650
	0    1    1    0   
$EndComp
$Comp
L Connector_Generic:Conn_01x04 J6
U 1 1 6140A7FD
P 5550 3600
F 0 "J6" H 5468 3175 50  0000 C CNN
F 1 "Conn-Esp-Sensors" H 5250 3250 50  0000 C CNN
F 2 "Connector_JST:JST_XH_B4B-XH-A_1x04_P2.50mm_Vertical" H 5550 3600 50  0001 C CNN
F 3 "~" H 5550 3600 50  0001 C CNN
	1    5550 3600
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J5
U 1 1 6143ACB7
P 6250 2850
F 0 "J5" H 6168 2525 50  0000 C CNN
F 1 "Conn_01x02" H 6168 2616 50  0000 C CNN
F 2 "Connector_JST:JST_XH_B2B-XH-A_1x02_P2.50mm_Vertical" H 6250 2850 50  0001 C CNN
F 3 "~" H 6250 2850 50  0001 C CNN
	1    6250 2850
	-1   0    0    1   
$EndComp
$Comp
L phoenix-1017505:1017505 J3
U 1 1 61366C48
P 4100 1300
F 0 "J3" H 4500 735 50  0000 C CNN
F 1 "1017505" H 4500 826 50  0000 C CNN
F 2 "1017505_updated_pretty:1017505_pretty" H 4750 1400 50  0001 L CNN
F 3 "https://www.phoenixcontact.com/online/portal/gb/?uri=pxc-oc-itemdetail:pid=1017505&library=gben&pcck=P-11-01-05&tab=1&selectedCategory=ALL" H 4750 1300 50  0001 L CNN
F 4 "Phoenix Contact TDPT Series 5.08mm Pitch, PCB Terminal Block, PCB Mount, 4 Way" H 4750 1200 50  0001 L CNN "Description"
F 5 "19.2" H 4750 1100 50  0001 L CNN "Height"
F 6 "Phoenix Contact" H 4750 1000 50  0001 L CNN "Manufacturer_Name"
F 7 "1017505" H 4750 900 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "651-1017505" H 4750 800 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/Phoenix-Contact/1017505?qs=F5EMLAvA7IDSv5uM7A6HhA%3D%3D" H 4750 700 50  0001 L CNN "Mouser Price/Stock"
F 10 "1017505" H 4750 600 50  0001 L CNN "Arrow Part Number"
F 11 "https://www.arrow.com/en/products/1017505/phoenix-contact" H 4750 500 50  0001 L CNN "Arrow Price/Stock"
	1    4100 1300
	1    0    0    -1  
$EndComp
$Comp
L Device:Fuse F1
U 1 1 613D9E49
P 5050 900
F 0 "F1" V 5247 900 50  0000 C CNN
F 1 "F250V" V 5156 900 50  0000 C CNN
F 2 "Fuse:Fuse_Littelfuse_372_D8.50mm" V 4980 900 50  0001 C CNN
F 3 "~" H 5050 900 50  0001 C CNN
	1    5050 900 
	0    -1   -1   0   
$EndComp
$Comp
L Device:Varistor RV1
U 1 1 613E75CC
P 5200 1450
F 0 "RV1" H 5079 1404 50  0000 R CNN
F 1 "400V" H 5079 1495 50  0000 R CNN
F 2 "Varistor:RV_Disc_D12mm_W4.2mm_P7.5mm" V 5130 1450 50  0001 C CNN
F 3 "~" H 5200 1450 50  0001 C CNN
	1    5200 1450
	-1   0    0    1   
$EndComp
$Comp
L Device:CP_Small 22uF4
U 1 1 613BAE65
P 10000 5500
F 0 "22uF4" H 9912 5454 50  0000 R CNN
F 1 "22uF" H 9912 5545 50  0000 R CNN
F 2 "Capacitor_Tantalum_SMD:CP_EIA-3528-21_Kemet-B_Pad1.50x2.35mm_HandSolder" H 10000 5500 50  0001 C CNN
F 3 "https://datasheet.lcsc.com/lcsc/1809281529_KEMET-T491B226K016AT_C110051.pdf" H 10000 5500 50  0001 C CNN
F 4 "C110051" H 10000 5500 50  0001 C CNN "JLCPCB"
	1    10000 5500
	-1   0    0    1   
$EndComp
$Comp
L HCPL-3700-000:HCPL3700 U6
U 1 1 613BAE5F
P 9900 5850
F 0 "U6" H 10450 5085 50  0000 C CNN
F 1 "HCPL3700" H 10450 5176 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm_Socket_LongPads" H 9900 6250 50  0001 L CNN
F 3 "http://www.onsemi.ru.com/pub/Collateral/HCPL3700-D.pdf" H 9900 6350 50  0001 L CNN
F 4 "30mA" H 9900 6450 50  0001 L CNN "Current - Output / Channel"
F 5 "Darlington" H 9900 6550 50  0001 L CNN "Output Type"
F 6 "2500Vrms" H 9900 6650 50  0001 L CNN "Voltage - Isolation"
F 7 "20V" H 9900 6750 50  0001 L CNN "Voltage - Output (Max)"
F 8 "IC" H 9900 6850 50  0001 L CNN "category"
F 9 "Optoisolator Darlington Output 2500Vrms 1 Channel 8-DIP" H 9900 6950 50  0001 L CNN "digikey description"
F 10 "HCPL3700-ND" H 9900 7050 50  0001 L CNN "digikey part number"
F 11 "DIP794W46P254L959H533Q8" H 9900 7150 50  0001 L CNN "ipc land pattern name"
F 12 "yes" H 9900 7250 50  0001 L CNN "lead free"
F 13 "eacaf3d134f71bf1" H 9900 7350 50  0001 L CNN "library id"
F 14 "ON Semi" H 9900 7450 50  0001 L CNN "manufacturer"
F 15 "512-HCPL-3700" H 9900 7550 50  0001 L CNN "mouser part number"
F 16 "PDIP8" H 9900 7650 50  0001 L CNN "package"
F 17 "yes" H 9900 7750 50  0001 L CNN "rohs"
F 18 "+70°C" H 9900 7850 50  0001 L CNN "temperature range high"
F 19 "0°C" H 9900 7950 50  0001 L CNN "temperature range low"
F 20 "" H 9900 8050 50  0001 L CNN "voltage"
	1    9900 5850
	-1   0    0    1   
$EndComp
$Comp
L Device:R R10
U 1 1 613BAE41
P 10250 5850
F 0 "R10" V 10043 5850 50  0001 C CNN
F 1 "39kΩ1w" V 10350 5900 50  0000 C CNN
F 2 "Resistor_SMD:R_2512_6332Metric_Pad1.52x3.35mm_HandSolder" V 10180 5850 50  0001 C CNN
F 3 "https://www.distrelec.ch/en/super-high-power-smd-resistor-2512-82kohm-3w-rnd-components-rnd-155sp123wf8202t2e/p/30150189?q=*&pos=1&origPos=3001&origPageSize=50&digitalDataLayerTerm=resistor&track=true" H 10250 5850 50  0001 C CNN
F 4 "C25723" H 10250 5850 50  0001 C CNN "JLCPCB"
	1    10250 5850
	0    1    1    0   
$EndComp
$Comp
L Device:CP_Small 22uF3
U 1 1 613B6BB6
P 10000 4500
F 0 "22uF3" H 9912 4454 50  0000 R CNN
F 1 "22uF" H 9912 4545 50  0000 R CNN
F 2 "Capacitor_Tantalum_SMD:CP_EIA-3528-21_Kemet-B_Pad1.50x2.35mm_HandSolder" H 10000 4500 50  0001 C CNN
F 3 "https://datasheet.lcsc.com/lcsc/1809281529_KEMET-T491B226K016AT_C110051.pdf" H 10000 4500 50  0001 C CNN
F 4 "C110051" H 10000 4500 50  0001 C CNN "JLCPCB"
	1    10000 4500
	-1   0    0    1   
$EndComp
$Comp
L HCPL-3700-000:HCPL3700 U5
U 1 1 613B6BB0
P 9900 4850
F 0 "U5" H 10450 4085 50  0000 C CNN
F 1 "HCPL3700" H 10450 4176 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm_Socket_LongPads" H 9900 5250 50  0001 L CNN
F 3 "http://www.onsemi.ru.com/pub/Collateral/HCPL3700-D.pdf" H 9900 5350 50  0001 L CNN
F 4 "30mA" H 9900 5450 50  0001 L CNN "Current - Output / Channel"
F 5 "Darlington" H 9900 5550 50  0001 L CNN "Output Type"
F 6 "2500Vrms" H 9900 5650 50  0001 L CNN "Voltage - Isolation"
F 7 "20V" H 9900 5750 50  0001 L CNN "Voltage - Output (Max)"
F 8 "IC" H 9900 5850 50  0001 L CNN "category"
F 9 "Optoisolator Darlington Output 2500Vrms 1 Channel 8-DIP" H 9900 5950 50  0001 L CNN "digikey description"
F 10 "HCPL3700-ND" H 9900 6050 50  0001 L CNN "digikey part number"
F 11 "DIP794W46P254L959H533Q8" H 9900 6150 50  0001 L CNN "ipc land pattern name"
F 12 "yes" H 9900 6250 50  0001 L CNN "lead free"
F 13 "eacaf3d134f71bf1" H 9900 6350 50  0001 L CNN "library id"
F 14 "ON Semi" H 9900 6450 50  0001 L CNN "manufacturer"
F 15 "512-HCPL-3700" H 9900 6550 50  0001 L CNN "mouser part number"
F 16 "PDIP8" H 9900 6650 50  0001 L CNN "package"
F 17 "yes" H 9900 6750 50  0001 L CNN "rohs"
F 18 "+70°C" H 9900 6850 50  0001 L CNN "temperature range high"
F 19 "0°C" H 9900 6950 50  0001 L CNN "temperature range low"
F 20 "" H 9900 7050 50  0001 L CNN "voltage"
	1    9900 4850
	-1   0    0    1   
$EndComp
$Comp
L Device:CP_Small 22uF2
U 1 1 613B1E5B
P 10000 3500
F 0 "22uF2" H 9912 3454 50  0000 R CNN
F 1 "22uF" H 9912 3545 50  0000 R CNN
F 2 "Capacitor_Tantalum_SMD:CP_EIA-3528-21_Kemet-B_Pad1.50x2.35mm_HandSolder" H 10000 3500 50  0001 C CNN
F 3 "https://datasheet.lcsc.com/lcsc/1809281529_KEMET-T491B226K016AT_C110051.pdf" H 10000 3500 50  0001 C CNN
F 4 "C110051" H 10000 3500 50  0001 C CNN "JLCPCB"
	1    10000 3500
	-1   0    0    1   
$EndComp
$Comp
L HCPL-3700-000:HCPL3700 U4
U 1 1 613B1E55
P 9900 3850
F 0 "U4" H 10450 3085 50  0000 C CNN
F 1 "HCPL3700" H 10450 3176 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm_Socket_LongPads" H 9900 4250 50  0001 L CNN
F 3 "http://www.onsemi.ru.com/pub/Collateral/HCPL3700-D.pdf" H 9900 4350 50  0001 L CNN
F 4 "30mA" H 9900 4450 50  0001 L CNN "Current - Output / Channel"
F 5 "Darlington" H 9900 4550 50  0001 L CNN "Output Type"
F 6 "2500Vrms" H 9900 4650 50  0001 L CNN "Voltage - Isolation"
F 7 "20V" H 9900 4750 50  0001 L CNN "Voltage - Output (Max)"
F 8 "IC" H 9900 4850 50  0001 L CNN "category"
F 9 "Optoisolator Darlington Output 2500Vrms 1 Channel 8-DIP" H 9900 4950 50  0001 L CNN "digikey description"
F 10 "HCPL3700-ND" H 9900 5050 50  0001 L CNN "digikey part number"
F 11 "DIP794W46P254L959H533Q8" H 9900 5150 50  0001 L CNN "ipc land pattern name"
F 12 "yes" H 9900 5250 50  0001 L CNN "lead free"
F 13 "eacaf3d134f71bf1" H 9900 5350 50  0001 L CNN "library id"
F 14 "ON Semi" H 9900 5450 50  0001 L CNN "manufacturer"
F 15 "512-HCPL-3700" H 9900 5550 50  0001 L CNN "mouser part number"
F 16 "PDIP8" H 9900 5650 50  0001 L CNN "package"
F 17 "yes" H 9900 5750 50  0001 L CNN "rohs"
F 18 "+70°C" H 9900 5850 50  0001 L CNN "temperature range high"
F 19 "0°C" H 9900 5950 50  0001 L CNN "temperature range low"
F 20 "" H 9900 6050 50  0001 L CNN "voltage"
	1    9900 3850
	-1   0    0    1   
$EndComp
$Comp
L Device:R R16
U 1 1 613B1E37
P 10250 2650
F 0 "R16" V 10043 2650 50  0001 C CNN
F 1 "39kΩ1w" V 10350 2650 50  0000 C CNN
F 2 "Resistor_SMD:R_2512_6332Metric_Pad1.52x3.35mm_HandSolder" V 10180 2650 50  0001 C CNN
F 3 "https://www.distrelec.ch/en/super-high-power-smd-resistor-2512-82kohm-3w-rnd-components-rnd-155sp123wf8202t2e/p/30150189?q=*&pos=1&origPos=3001&origPageSize=50&digitalDataLayerTerm=resistor&track=true" H 10250 2650 50  0001 C CNN
F 4 "C25723" V 10250 2650 50  0001 C CNN "JLCPCB"
	1    10250 2650
	0    1    1    0   
$EndComp
$Comp
L Device:CP_Small 22uF1
U 1 1 6137D081
P 10000 2300
F 0 "22uF1" H 9912 2254 50  0000 R CNN
F 1 "22uF" H 9912 2345 50  0000 R CNN
F 2 "Capacitor_Tantalum_SMD:CP_EIA-3528-21_Kemet-B_Pad1.50x2.35mm_HandSolder" H 10000 2300 50  0001 C CNN
F 3 "https://datasheet.lcsc.com/lcsc/1809281529_KEMET-T491B226K016AT_C110051.pdf" H 10000 2300 50  0001 C CNN
F 4 "C110051" H 10000 2300 50  0001 C CNN "JLCPCB"
	1    10000 2300
	-1   0    0    1   
$EndComp
$Comp
L HCPL-3700-000:HCPL3700 U3
U 1 1 613556E0
P 9900 2650
F 0 "U3" H 10450 1885 50  0000 C CNN
F 1 "HCPL3700" H 10450 1976 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm_Socket_LongPads" H 9900 3050 50  0001 L CNN
F 3 "http://www.onsemi.ru.com/pub/Collateral/HCPL3700-D.pdf" H 9900 3150 50  0001 L CNN
F 4 "30mA" H 9900 3250 50  0001 L CNN "Current - Output / Channel"
F 5 "Darlington" H 9900 3350 50  0001 L CNN "Output Type"
F 6 "2500Vrms" H 9900 3450 50  0001 L CNN "Voltage - Isolation"
F 7 "20V" H 9900 3550 50  0001 L CNN "Voltage - Output (Max)"
F 8 "IC" H 9900 3650 50  0001 L CNN "category"
F 9 "Optoisolator Darlington Output 2500Vrms 1 Channel 8-DIP" H 9900 3750 50  0001 L CNN "digikey description"
F 10 "HCPL3700-ND" H 9900 3850 50  0001 L CNN "digikey part number"
F 11 "DIP794W46P254L959H533Q8" H 9900 3950 50  0001 L CNN "ipc land pattern name"
F 12 "yes" H 9900 4050 50  0001 L CNN "lead free"
F 13 "eacaf3d134f71bf1" H 9900 4150 50  0001 L CNN "library id"
F 14 "ON Semi" H 9900 4250 50  0001 L CNN "manufacturer"
F 15 "512-HCPL-3700" H 9900 4350 50  0001 L CNN "mouser part number"
F 16 "PDIP8" H 9900 4450 50  0001 L CNN "package"
F 17 "yes" H 9900 4550 50  0001 L CNN "rohs"
F 18 "+70°C" H 9900 4650 50  0001 L CNN "temperature range high"
F 19 "0°C" H 9900 4750 50  0001 L CNN "temperature range low"
F 20 "" H 9900 4850 50  0001 L CNN "voltage"
	1    9900 2650
	-1   0    0    1   
$EndComp
$Comp
L phoenix-1017505:1017505 J1
U 1 1 6135584E
P 1900 1200
F 0 "J1" H 2300 635 50  0000 C CNN
F 1 "1017505" H 2300 726 50  0000 C CNN
F 2 "1017505_updated_pretty:1017505_pretty" H 2550 1300 50  0001 L CNN
F 3 "https://www.phoenixcontact.com/online/portal/gb/?uri=pxc-oc-itemdetail:pid=1017505&library=gben&pcck=P-11-01-05&tab=1&selectedCategory=ALL" H 2550 1200 50  0001 L CNN
F 4 "Phoenix Contact TDPT Series 5.08mm Pitch, PCB Terminal Block, PCB Mount, 4 Way" H 2550 1100 50  0001 L CNN "Description"
F 5 "19.2" H 2550 1000 50  0001 L CNN "Height"
F 6 "Phoenix Contact" H 2550 900 50  0001 L CNN "Manufacturer_Name"
F 7 "1017505" H 2550 800 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "651-1017505" H 2550 700 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/Phoenix-Contact/1017505?qs=F5EMLAvA7IDSv5uM7A6HhA%3D%3D" H 2550 600 50  0001 L CNN "Mouser Price/Stock"
F 10 "1017505" H 2550 500 50  0001 L CNN "Arrow Part Number"
F 11 "https://www.arrow.com/en/products/1017505/phoenix-contact" H 2550 400 50  0001 L CNN "Arrow Price/Stock"
	1    1900 1200
	-1   0    0    1   
$EndComp
$Comp
L phoenix-1017505:1017505 J8
U 1 1 6133A647
P 10400 1650
F 0 "J8" H 10800 1085 50  0000 C CNN
F 1 "1017505" H 10800 1176 50  0000 C CNN
F 2 "1017505_updated_pretty:1017505_pretty" H 11050 1750 50  0001 L CNN
F 3 "https://www.phoenixcontact.com/online/portal/gb/?uri=pxc-oc-itemdetail:pid=1017505&library=gben&pcck=P-11-01-05&tab=1&selectedCategory=ALL" H 11050 1650 50  0001 L CNN
F 4 "Phoenix Contact TDPT Series 5.08mm Pitch, PCB Terminal Block, PCB Mount, 4 Way" H 11050 1550 50  0001 L CNN "Description"
F 5 "19.2" H 11050 1450 50  0001 L CNN "Height"
F 6 "Phoenix Contact" H 11050 1350 50  0001 L CNN "Manufacturer_Name"
F 7 "1017505" H 11050 1250 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "651-1017505" H 11050 1150 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/Phoenix-Contact/1017505?qs=F5EMLAvA7IDSv5uM7A6HhA%3D%3D" H 11050 1050 50  0001 L CNN "Mouser Price/Stock"
F 10 "1017505" H 11050 950 50  0001 L CNN "Arrow Part Number"
F 11 "https://www.arrow.com/en/products/1017505/phoenix-contact" H 11050 850 50  0001 L CNN "Arrow Price/Stock"
	1    10400 1650
	-1   0    0    1   
$EndComp
$Comp
L Device:R R14
U 1 1 61354B0C
P 10250 3850
F 0 "R14" V 10043 3850 50  0001 C CNN
F 1 "39kΩ1w" V 10350 3850 50  0000 C CNN
F 2 "Resistor_SMD:R_2512_6332Metric_Pad1.52x3.35mm_HandSolder" V 10180 3850 50  0001 C CNN
F 3 "https://www.distrelec.ch/en/super-high-power-smd-resistor-2512-82kohm-3w-rnd-components-rnd-155sp123wf8202t2e/p/30150189?q=*&pos=1&origPos=3001&origPageSize=50&digitalDataLayerTerm=resistor&track=true" H 10250 3850 50  0001 C CNN
F 4 "C25723" H 10250 3850 50  0001 C CNN "JLCPCB"
	1    10250 3850
	0    1    1    0   
$EndComp
$Comp
L Mechanical:MountingHole_Pad H2
U 1 1 618C5DAB
P 1000 7500
F 0 "H2" H 1100 7549 50  0001 L CNN
F 1 "MountingHole_Pad" H 1100 7458 50  0001 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_ISO14580_Pad" H 1000 7500 50  0001 C CNN
F 3 "~" H 1000 7500 50  0001 C CNN
	1    1000 7500
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H1
U 1 1 618C5DA5
P 800 7500
F 0 "H1" H 900 7549 50  0001 L CNN
F 1 "MountingHole_Pad" H 900 7458 50  0001 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_ISO14580_Pad" H 800 7500 50  0001 C CNN
F 3 "~" H 800 7500 50  0001 C CNN
	1    800  7500
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H6
U 1 1 618C4621
P 1600 7500
F 0 "H6" H 1700 7549 50  0001 L CNN
F 1 "MountingHole_Pad" H 1700 7458 50  0001 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_ISO14580_Pad" H 1600 7500 50  0001 C CNN
F 3 "~" H 1600 7500 50  0001 C CNN
	1    1600 7500
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H5
U 1 1 618C3B93
P 1400 7500
F 0 "H5" H 1500 7549 50  0001 L CNN
F 1 "MountingHole_Pad" H 1500 7458 50  0001 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_ISO14580_Pad" H 1400 7500 50  0001 C CNN
F 3 "~" H 1400 7500 50  0001 C CNN
	1    1400 7500
	1    0    0    -1  
$EndComp
$Comp
L Relay:G5Q-1 K4
U 1 1 612E3B03
P 1450 5900
F 0 "K4" V 2017 5900 50  0000 C CNN
F 1 "G5Q-1" V 1926 5900 50  0000 C CNN
F 2 "Relay_THT:Relay_SPDT_Omron-G5Q-1" H 1900 5850 50  0001 L CNN
F 3 "https://www.omron.com/ecb/products/pdf/en-g5q.pdf" H 1450 5900 50  0001 L CNN
	1    1450 5900
	0    -1   -1   0   
$EndComp
$Comp
L Relay:G5Q-1 K3
U 1 1 612DFC81
P 1450 4650
F 0 "K3" V 2017 4650 50  0000 C CNN
F 1 "G5Q-1" V 1926 4650 50  0000 C CNN
F 2 "Relay_THT:Relay_SPDT_Omron-G5Q-1" H 1900 4600 50  0001 L CNN
F 3 "https://www.omron.com/ecb/products/pdf/en-g5q.pdf" H 1450 4650 50  0001 L CNN
	1    1450 4650
	0    -1   -1   0   
$EndComp
$Comp
L Relay:G5Q-1 K2
U 1 1 612DB8E8
P 1450 3400
F 0 "K2" V 2017 3400 50  0000 C CNN
F 1 "G5Q-1" V 1926 3400 50  0000 C CNN
F 2 "Relay_THT:Relay_SPDT_Omron-G5Q-1" H 1900 3350 50  0001 L CNN
F 3 "https://www.omron.com/ecb/products/pdf/en-g5q.pdf" H 1450 3400 50  0001 L CNN
	1    1450 3400
	0    -1   -1   0   
$EndComp
$Comp
L Relay:G5Q-1 K1
U 1 1 612C4AA3
P 1450 2200
F 0 "K1" V 2017 2200 50  0000 C CNN
F 1 "G5Q-1" V 1926 2200 50  0000 C CNN
F 2 "Relay_THT:Relay_SPDT_Omron-G5Q-1" H 1900 2150 50  0001 L CNN
F 3 "https://www.omron.com/ecb/products/pdf/en-g5q.pdf" H 1450 2200 50  0001 L CNN
	1    1450 2200
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R8
U 1 1 613FE2E1
P 8200 5950
F 0 "R8" H 8050 6000 50  0000 L CNN
F 1 "62Ω" H 8000 5900 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 8130 5950 50  0001 C CNN
F 3 "https://www.distrelec.ch/en/high-power-thick-film-smd-resistor-0805-62ohm-330mw-rnd-components-rnd-155hp05w3f620jt5e/p/30111853?q=*&pos=2&origPos=1629&origPageSize=50&track=true" H 8200 5950 50  0001 C CNN
	1    8200 5950
	1    0    0    -1  
$EndComp
$Comp
L Device:Fuse F2
U 1 1 618BE6D0
P 5650 1900
F 0 "F2" V 5450 1900 50  0000 C CNN
F 1 "7V-100mA" V 5550 1900 50  0000 C CNN
F 2 "Fuse:Fuse_Littelfuse_372_D8.50mm" V 5580 1900 50  0001 C CNN
F 3 "~" H 5650 1900 50  0001 C CNN
	1    5650 1900
	0    -1   -1   0   
$EndComp
$Comp
L Device:CP C1
U 1 1 6192260B
P 8250 2600
F 0 "C1" H 8600 2500 50  0000 R CNN
F 1 "0.1uF" H 8600 2600 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8288 2450 50  0001 C CNN
F 3 "https://www.distrelec.ch/en/ceramic-capacitor-100nf-50vdc-0805-rnd-components-rnd-1500805b104j500nt/p/30086635?q=smd+capacitor+&pos=5&origPos=990&origPageSize=50&track=true" H 8250 2600 50  0001 C CNN
F 4 "C235777" H 8250 2600 50  0001 C CNN "JLCPCB"
	1    8250 2600
	-1   0    0    1   
$EndComp
$Comp
L Device:CP C2
U 1 1 6192BF97
P 8400 5750
F 0 "C2" H 8518 5796 50  0001 L CNN
F 1 "0.1uF" H 8282 5750 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8438 5600 50  0001 C CNN
F 3 "https://www.distrelec.ch/en/ceramic-capacitor-100nf-50vdc-0805-rnd-components-rnd-1500805b104j500nt/p/30086635?q=smd+capacitor+&pos=5&origPos=990&origPageSize=50&track=true" H 8400 5750 50  0001 C CNN
F 4 "C235777" H 8400 5750 50  0001 C CNN "JLCPCB"
	1    8400 5750
	-1   0    0    1   
$EndComp
Wire Wire Line
	8400 5600 8400 5350
Wire Wire Line
	8400 5350 8900 5350
Text GLabel 8200 5500 0    50   Input ~ 0
EspSens1
$Comp
L Device:CP C4
U 1 1 61940C95
P 8400 4750
F 0 "C4" H 8518 4796 50  0001 L CNN
F 1 "0.1uF" H 8282 4750 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8438 4600 50  0001 C CNN
F 3 "https://www.distrelec.ch/en/ceramic-capacitor-100nf-50vdc-0805-rnd-components-rnd-1500805b104j500nt/p/30086635?q=smd+capacitor+&pos=5&origPos=990&origPageSize=50&track=true" H 8400 4750 50  0001 C CNN
F 4 "C235777" H 8400 4750 50  0001 C CNN "JLCPCB"
	1    8400 4750
	-1   0    0    1   
$EndComp
Text GLabel 8900 4650 0    50   Input ~ 0
EspSens2
Wire Wire Line
	8400 4600 8400 4350
Wire Wire Line
	8400 4350 8900 4350
Wire Wire Line
	8400 4900 8400 5100
Connection ~ 8400 5100
Wire Wire Line
	8400 5100 8200 5100
Text GLabel 8900 3650 0    50   Input ~ 0
EspSens3
$Comp
L Device:CP C3
U 1 1 6195BF13
P 8350 3750
F 0 "C3" H 8468 3796 50  0001 L CNN
F 1 "0.1uF" H 8232 3750 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8388 3600 50  0001 C CNN
F 3 "https://www.distrelec.ch/en/ceramic-capacitor-100nf-50vdc-0805-rnd-components-rnd-1500805b104j500nt/p/30086635?q=smd+capacitor+&pos=5&origPos=990&origPageSize=50&track=true" H 8350 3750 50  0001 C CNN
F 4 "C235777" H 8350 3750 50  0001 C CNN "JLCPCB"
	1    8350 3750
	-1   0    0    1   
$EndComp
Wire Wire Line
	8350 3600 8350 3350
Wire Wire Line
	8900 3350 8350 3350
Wire Wire Line
	8350 3900 8350 4100
Connection ~ 8350 4100
Wire Wire Line
	8350 4100 8200 4100
Connection ~ 8400 6100
Wire Wire Line
	8400 6100 8200 6100
Wire Wire Line
	8400 5900 8400 6100
$Comp
L Device:R R9
U 1 1 619CF60C
P 7050 1400
F 0 "R9" V 6800 1550 50  0001 C CNN
F 1 "150Ω" V 7050 1400 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 6980 1400 50  0001 C CNN
F 3 "https://www.distrelec.ch/en/high-power-thick-film-smd-resistor-0805-150ohm-330mw-rnd-components-rnd-155hp05w3f1500t5e/p/30111774?q=*&pos=2&origPos=1787&origPageSize=50&track=true" H 7050 1400 50  0001 C CNN
	1    7050 1400
	0    1    1    0   
$EndComp
$Comp
L Device:LED D9
U 1 1 619D076D
P 7050 1500
F 0 "D9" H 7150 1850 50  0001 C CNN
F 1 "LED" H 7200 1450 50  0001 C CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7050 1500 50  0001 C CNN
F 3 "https://www.distrelec.ch/en/smd-led-green-575nm-20ma-2v-140-everlight-electronics-17-21sygc-s530-e1-tr8/p/17531205?q=*&pos=9&origPos=371&origPageSize=50&track=true" H 7050 1500 50  0001 C CNN
	1    7050 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6900 1250 6900 1400
Wire Wire Line
	7200 1400 7200 1500
Wire Wire Line
	6900 1500 6800 1500
Wire Wire Line
	6800 1500 6800 1650
Text GLabel 6450 2350 2    50   Input ~ 0
GND(5V)
$Comp
L Connector_Generic:Conn_01x02 J10
U 1 1 61750993
P 6250 2350
F 0 "J10" H 6168 2025 50  0000 C CNN
F 1 "GND 3.3V" H 6168 2116 50  0000 C CNN
F 2 "Connector_JST:JST_XH_B2B-XH-A_1x02_P2.50mm_Vertical" H 6250 2350 50  0001 C CNN
F 3 "~" H 6250 2350 50  0001 C CNN
	1    6250 2350
	-1   0    0    1   
$EndComp
Text GLabel 6450 2250 2    50   Input ~ 0
3.3V+
$Comp
L Connector:Conn_01x02_Male J11
U 1 1 6176729E
P 5100 2050
F 0 "J11" V 5050 2000 50  0001 R CNN
F 1 "Current Jumper" V 5050 2300 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 5100 2050 50  0001 C CNN
F 3 "~" H 5100 2050 50  0001 C CNN
	1    5100 2050
	0    1    1    0   
$EndComp
$Comp
L Device:R R17
U 1 1 61799149
P 10550 5850
F 0 "R17" V 10343 5850 50  0001 C CNN
F 1 "39kΩ1w" V 10650 5900 50  0000 C CNN
F 2 "Resistor_SMD:R_2512_6332Metric_Pad1.52x3.35mm_HandSolder" V 10480 5850 50  0001 C CNN
F 3 "https://www.distrelec.ch/en/super-high-power-smd-resistor-2512-82kohm-3w-rnd-components-rnd-155sp123wf8202t2e/p/30150189?q=*&pos=1&origPos=3001&origPageSize=50&digitalDataLayerTerm=resistor&track=true" H 10550 5850 50  0001 C CNN
F 4 "C25723" H 10550 5850 50  0001 C CNN "JLCPCB"
	1    10550 5850
	0    1    1    0   
$EndComp
$Comp
L Device:R R15
U 1 1 6179BC18
P 10550 4850
F 0 "R15" V 10343 4850 50  0001 C CNN
F 1 "39kΩ1w" V 10650 4900 50  0000 C CNN
F 2 "Resistor_SMD:R_2512_6332Metric_Pad1.52x3.35mm_HandSolder" V 10480 4850 50  0001 C CNN
F 3 "https://www.distrelec.ch/en/super-high-power-smd-resistor-2512-82kohm-3w-rnd-components-rnd-155sp123wf8202t2e/p/30150189?q=*&pos=1&origPos=3001&origPageSize=50&digitalDataLayerTerm=resistor&track=true" H 10550 4850 50  0001 C CNN
F 4 "C25723" H 10550 4850 50  0001 C CNN "JLCPCB"
	1    10550 4850
	0    1    1    0   
$EndComp
$Comp
L Device:R R13
U 1 1 6179E8C9
P 10550 3850
F 0 "R13" V 10343 3850 50  0001 C CNN
F 1 "39kΩ1w" V 10650 3900 50  0000 C CNN
F 2 "Resistor_SMD:R_2512_6332Metric_Pad1.52x3.35mm_HandSolder" V 10480 3850 50  0001 C CNN
F 3 "https://www.distrelec.ch/en/super-high-power-smd-resistor-2512-82kohm-3w-rnd-components-rnd-155sp123wf8202t2e/p/30150189?q=*&pos=1&origPos=3001&origPageSize=50&digitalDataLayerTerm=resistor&track=true" H 10550 3850 50  0001 C CNN
F 4 "C25723" H 10550 3850 50  0001 C CNN "JLCPCB"
	1    10550 3850
	0    1    1    0   
$EndComp
$Comp
L Device:R R11
U 1 1 617A141C
P 10550 2650
F 0 "R11" V 10343 2650 50  0001 C CNN
F 1 "39kΩ1w" V 10650 2700 50  0000 C CNN
F 2 "Resistor_SMD:R_2512_6332Metric_Pad1.52x3.35mm_HandSolder" V 10480 2650 50  0001 C CNN
F 3 "https://www.distrelec.ch/en/super-high-power-smd-resistor-2512-82kohm-3w-rnd-components-rnd-155sp123wf8202t2e/p/30150189?q=*&pos=1&origPos=3001&origPageSize=50&digitalDataLayerTerm=resistor&track=true" H 10550 2650 50  0001 C CNN
F 4 "C25723" H 10550 2650 50  0001 C CNN "JLCPCB"
	1    10550 2650
	0    1    1    0   
$EndComp
Wire Wire Line
	4900 6950 4900 7450
Wire Wire Line
	4900 7450 4450 7450
Wire Wire Line
	3750 6950 3750 7450
Wire Wire Line
	3750 7450 4150 7450
Text GLabel 4150 7450 3    50   Input ~ 0
EspR1
Text GLabel 4450 7450 3    50   Input ~ 0
EspR4
Wire Wire Line
	8250 2150 8250 2450
Wire Wire Line
	8900 2650 8900 3050
Wire Wire Line
	8900 3050 8700 3050
Connection ~ 8700 3050
Wire Wire Line
	8250 2750 8250 3050
Wire Wire Line
	8250 2150 8900 2150
Wire Wire Line
	8250 3050 8700 3050
Wire Wire Line
	8700 2450 8900 2450
Text GLabel 3950 4400 0    50   Input ~ 0
REI3
Text GLabel 3950 4300 0    50   Input ~ 0
REI2
Text GLabel 3950 4500 0    50   Input ~ 0
REI4
Text GLabel 3950 4200 0    50   Input ~ 0
REI1
Text GLabel 4750 4400 2    50   Input ~ 0
EspRel3
Text GLabel 4750 4500 2    50   Input ~ 0
EspRel4
Text GLabel 4750 4300 2    50   Input ~ 0
EspRel2
Text GLabel 4750 4200 2    50   Input ~ 0
EspRel1
$Comp
L Transistor_Array:ULN2003A U1
U 1 1 61374AC1
P 4350 4600
F 0 "U1" H 4300 5200 50  0000 L CNN
F 1 "ULN2003A" H 4150 5150 50  0000 L CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 4400 4050 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/uln2003a.pdf" H 4450 4400 50  0001 C CNN
F 4 "C7512" V 4350 4600 50  0001 C CNN "JLCPCB"
	1    4350 4600
	-1   0    0    1   
$EndComp
$EndSCHEMATC
