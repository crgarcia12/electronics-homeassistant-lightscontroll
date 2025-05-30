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
Text GLabel 4150 7200 0    50   UnSpc ~ 0
220VAC(L)
Text GLabel 4150 7600 0    50   UnSpc ~ 0
220VAC(N)
Text GLabel 5450 4350 3    50   Input ~ 0
5VGND
Text GLabel 3650 2750 0    50   Input ~ 0
5V+
Text GLabel 6550 7300 2    50   Input ~ 0
5V+
Text GLabel 6550 7500 2    50   Input ~ 0
5VGND
$Comp
L hamodule-rescue:ESP32-DEVKITC-32D-ESP32-DEVKITC-32D U1
U 1 1 6126231E
P 4550 3550
F 0 "U1" H 4550 4717 50  0000 C CNN
F 1 "ESP32-DEVKITC-32D" H 4550 4626 50  0000 C CNN
F 2 "esp32-footprint:MODULE_ESP32-DEVKITC-32D" H 4550 3550 50  0001 L BNN
F 3 "" H 4550 3550 50  0001 L BNN
F 4 "4" H 4550 3550 50  0001 L BNN "PARTREV"
F 5 "Espressif Systems" H 4550 3550 50  0001 L BNN "MANUFACTURER"
	1    4550 3550
	0    1    1    0   
$EndComp
Text GLabel 1750 3250 2    50   Input ~ 0
220VAC(L)
$Comp
L pspice:DIODE D1
U 1 1 612C0625
P 1900 3800
F 0 "D1" H 1900 4065 50  0000 C CNN
F 1 "DIODE" H 1900 3974 50  0000 C CNN
F 2 "Diode_THT:D_5W_P10.16mm_Horizontal" H 1900 3800 50  0001 C CNN
F 3 "~" H 1900 3800 50  0001 C CNN
	1    1900 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 3800 2100 3650
Wire Wire Line
	2100 3650 1750 3650
Text GLabel 1100 3650 0    50   Input ~ 0
5VGND
Wire Wire Line
	1150 3650 1150 3900
Wire Wire Line
	1150 3900 1700 3900
Wire Wire Line
	1700 3900 1700 3800
$Comp
L Relay:G5Q-1 K1
U 1 1 612C4AA3
P 1450 3450
F 0 "K1" V 2017 3450 50  0000 C CNN
F 1 "G5Q-1" V 1926 3450 50  0000 C CNN
F 2 "Relay_THT:Relay_SPDT_Omron-G5Q-1" H 1900 3400 50  0001 L CNN
F 3 "https://www.omron.com/ecb/products/pdf/en-g5q.pdf" H 1450 3450 50  0001 L CNN
	1    1450 3450
	0    -1   -1   0   
$EndComp
$Comp
L Transistor_BJT:2N2219 Q1
U 1 1 612CA16E
P 2700 3250
F 0 "Q1" H 2891 3204 50  0000 L CNN
F 1 "2N2219" H 2891 3295 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Wide" H 2900 3175 50  0001 L CIN
F 3 "http://www.onsemi.com/pub_link/Collateral/2N2219-D.PDF" H 2700 3250 50  0001 L CNN
	1    2700 3250
	-1   0    0    1   
$EndComp
Wire Wire Line
	2600 3050 2250 3050
Wire Wire Line
	2250 3050 2250 3350
Wire Wire Line
	2250 3650 2100 3650
Connection ~ 2100 3650
Text GLabel 2600 3500 3    50   Input ~ 0
5V+
Wire Wire Line
	2600 3500 2600 3450
$Comp
L Device:R R1
U 1 1 612DC637
P 2900 3400
F 0 "R1" H 2970 3446 50  0000 L CNN
F 1 "10K" H 2970 3355 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2830 3400 50  0001 C CNN
F 3 "~" H 2900 3400 50  0001 C CNN
	1    2900 3400
	1    0    0    -1  
$EndComp
Text GLabel 2900 3550 3    50   Input ~ 0
5VGND
Text GLabel 5450 2700 1    50   Input ~ 0
3.3V+
Wire Notes Line
	700  2800 700  3950
Wire Notes Line
	700  3950 3150 3950
Wire Notes Line
	3150 3950 3150 2800
Wire Notes Line
	3150 2800 700  2800
Text GLabel 1750 4450 2    50   Input ~ 0
220VAC(L)
$Comp
L pspice:DIODE D2
U 1 1 612DB8DB
P 1900 5000
F 0 "D2" H 1900 5265 50  0000 C CNN
F 1 "DIODE" H 1900 5174 50  0000 C CNN
F 2 "Diode_THT:D_5W_P10.16mm_Horizontal" H 1900 5000 50  0001 C CNN
F 3 "~" H 1900 5000 50  0001 C CNN
	1    1900 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 5000 2100 4850
Wire Wire Line
	2100 4850 1750 4850
Text GLabel 1100 4850 0    50   Input ~ 0
5VGND
Wire Wire Line
	1150 4850 1100 4850
Wire Wire Line
	1150 4850 1150 5100
Wire Wire Line
	1150 5100 1700 5100
Wire Wire Line
	1700 5100 1700 5000
$Comp
L Relay:G5Q-1 K2
U 1 1 612DB8E8
P 1450 4650
F 0 "K2" V 2017 4650 50  0000 C CNN
F 1 "G5Q-1" V 1926 4650 50  0000 C CNN
F 2 "Relay_THT:Relay_SPDT_Omron-G5Q-1" H 1900 4600 50  0001 L CNN
F 3 "https://www.omron.com/ecb/products/pdf/en-g5q.pdf" H 1450 4650 50  0001 L CNN
	1    1450 4650
	0    -1   -1   0   
$EndComp
Connection ~ 1150 4850
$Comp
L Transistor_BJT:2N2219 Q2
U 1 1 612DB8F0
P 2700 4450
F 0 "Q2" H 2891 4404 50  0000 L CNN
F 1 "2N2219" H 2891 4495 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Wide" H 2900 4375 50  0001 L CIN
F 3 "http://www.onsemi.com/pub_link/Collateral/2N2219-D.PDF" H 2700 4450 50  0001 L CNN
	1    2700 4450
	-1   0    0    1   
$EndComp
Wire Wire Line
	2600 4250 2250 4250
Wire Wire Line
	2250 4250 2250 4550
Wire Wire Line
	2250 4850 2100 4850
Connection ~ 2100 4850
Text GLabel 2600 4700 3    50   Input ~ 0
5V+
Wire Wire Line
	2600 4700 2600 4650
$Comp
L Device:R R2
U 1 1 612DB8FC
P 2900 4600
F 0 "R2" H 2970 4646 50  0000 L CNN
F 1 "10K" H 2970 4555 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2830 4600 50  0001 C CNN
F 3 "~" H 2900 4600 50  0001 C CNN
	1    2900 4600
	1    0    0    -1  
$EndComp
Text GLabel 2900 4750 3    50   Input ~ 0
5VGND
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
$Comp
L pspice:DIODE D3
U 1 1 612DFC74
P 1900 6250
F 0 "D3" H 1900 6515 50  0000 C CNN
F 1 "DIODE" H 1900 6424 50  0000 C CNN
F 2 "Diode_THT:D_5W_P10.16mm_Horizontal" H 1900 6250 50  0001 C CNN
F 3 "~" H 1900 6250 50  0001 C CNN
	1    1900 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 6250 2100 6100
Wire Wire Line
	2100 6100 1750 6100
Text GLabel 1100 6100 0    50   Input ~ 0
5VGND
Wire Wire Line
	1150 6100 1100 6100
Wire Wire Line
	1150 6100 1150 6350
Wire Wire Line
	1150 6350 1700 6350
Wire Wire Line
	1700 6350 1700 6250
$Comp
L Relay:G5Q-1 K3
U 1 1 612DFC81
P 1450 5900
F 0 "K3" V 2017 5900 50  0000 C CNN
F 1 "G5Q-1" V 1926 5900 50  0000 C CNN
F 2 "Relay_THT:Relay_SPDT_Omron-G5Q-1" H 1900 5850 50  0001 L CNN
F 3 "https://www.omron.com/ecb/products/pdf/en-g5q.pdf" H 1450 5900 50  0001 L CNN
	1    1450 5900
	0    -1   -1   0   
$EndComp
Connection ~ 1150 6100
$Comp
L Transistor_BJT:2N2219 Q3
U 1 1 612DFC89
P 2700 5700
F 0 "Q3" H 2891 5654 50  0000 L CNN
F 1 "2N2219" H 2891 5745 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Wide" H 2900 5625 50  0001 L CIN
F 3 "http://www.onsemi.com/pub_link/Collateral/2N2219-D.PDF" H 2700 5700 50  0001 L CNN
	1    2700 5700
	-1   0    0    1   
$EndComp
Wire Wire Line
	2600 5500 2250 5500
Wire Wire Line
	2250 5500 2250 5800
Wire Wire Line
	2250 6100 2100 6100
Connection ~ 2100 6100
Text GLabel 2600 5950 3    50   Input ~ 0
5V+
Wire Wire Line
	2600 5950 2600 5900
$Comp
L Device:R R3
U 1 1 612DFC95
P 2900 5850
F 0 "R3" H 2970 5896 50  0000 L CNN
F 1 "10K" H 2970 5805 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2830 5850 50  0001 C CNN
F 3 "~" H 2900 5850 50  0001 C CNN
	1    2900 5850
	1    0    0    -1  
$EndComp
Connection ~ 2900 5700
Text GLabel 2900 6000 3    50   Input ~ 0
5VGND
Wire Notes Line
	700  5250 700  6400
Wire Notes Line
	700  6400 3150 6400
Wire Notes Line
	3150 6400 3150 5250
Wire Notes Line
	3150 5250 700  5250
Text GLabel 1750 6950 2    50   Input ~ 0
220VAC(L)
$Comp
L pspice:DIODE D4
U 1 1 612E3AF6
P 1900 7500
F 0 "D4" H 1900 7765 50  0000 C CNN
F 1 "DIODE" H 1900 7674 50  0000 C CNN
F 2 "Diode_THT:D_5W_P10.16mm_Horizontal" H 1900 7500 50  0001 C CNN
F 3 "~" H 1900 7500 50  0001 C CNN
	1    1900 7500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 7500 2100 7350
Wire Wire Line
	2100 7350 1750 7350
Text GLabel 1100 7350 0    50   Input ~ 0
5VGND
Wire Wire Line
	1150 7350 1100 7350
Wire Wire Line
	1150 7350 1150 7600
Wire Wire Line
	1150 7600 1700 7600
Wire Wire Line
	1700 7600 1700 7500
$Comp
L Relay:G5Q-1 K4
U 1 1 612E3B03
P 1450 7150
F 0 "K4" V 2017 7150 50  0000 C CNN
F 1 "G5Q-1" V 1926 7150 50  0000 C CNN
F 2 "Relay_THT:Relay_SPDT_Omron-G5Q-1" H 1900 7100 50  0001 L CNN
F 3 "https://www.omron.com/ecb/products/pdf/en-g5q.pdf" H 1450 7150 50  0001 L CNN
	1    1450 7150
	0    -1   -1   0   
$EndComp
Connection ~ 1150 7350
$Comp
L Transistor_BJT:2N2219 Q4
U 1 1 612E3B0B
P 2700 6950
F 0 "Q4" H 2891 6904 50  0000 L CNN
F 1 "2N2219" H 2891 6995 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Wide" H 2900 6875 50  0001 L CIN
F 3 "http://www.onsemi.com/pub_link/Collateral/2N2219-D.PDF" H 2700 6950 50  0001 L CNN
	1    2700 6950
	-1   0    0    1   
$EndComp
Wire Wire Line
	2600 6750 2250 6750
Wire Wire Line
	2250 6750 2250 7050
Wire Wire Line
	2250 7350 2100 7350
Connection ~ 2100 7350
Text GLabel 2600 7200 3    50   Input ~ 0
5V+
Wire Wire Line
	2600 7200 2600 7150
$Comp
L Device:R R4
U 1 1 612E3B17
P 2900 7100
F 0 "R4" H 2970 7146 50  0000 L CNN
F 1 "10K" H 2970 7055 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2830 7100 50  0001 C CNN
F 3 "~" H 2900 7100 50  0001 C CNN
	1    2900 7100
	1    0    0    -1  
$EndComp
Text GLabel 2900 7250 3    50   Input ~ 0
5VGND
Wire Notes Line
	700  6500 700  7650
Wire Notes Line
	700  7650 3150 7650
Wire Notes Line
	3150 7650 3150 6500
Wire Notes Line
	3150 6500 700  6500
Wire Wire Line
	2900 3250 3300 3250
Connection ~ 2900 3250
Wire Wire Line
	2900 4450 3250 4450
Wire Wire Line
	3250 4450 3250 4650
Connection ~ 2900 4450
Wire Wire Line
	3250 5700 2900 5700
Wire Wire Line
	3300 6950 2900 6950
Connection ~ 2900 6950
Text GLabel 8900 2350 0    50   Input ~ 0
5VGND
Wire Wire Line
	5250 1850 5300 1850
Wire Wire Line
	4050 4350 4050 4600
Wire Wire Line
	3300 3250 3300 4600
Wire Wire Line
	4250 4350 4250 4650
Wire Wire Line
	4350 4350 4350 4700
Wire Wire Line
	3250 4700 3250 5700
Wire Wire Line
	4450 4750 4450 4350
Wire Wire Line
	3300 4750 3300 6950
NoConn ~ 5150 4350
NoConn ~ 5050 4350
NoConn ~ 4850 4350
NoConn ~ 4550 4350
NoConn ~ 4150 4350
NoConn ~ 3950 4350
NoConn ~ 3850 4350
NoConn ~ 3750 4350
NoConn ~ 3650 4350
NoConn ~ 3750 2750
NoConn ~ 3850 2750
NoConn ~ 3950 2750
NoConn ~ 4150 2750
NoConn ~ 4250 2750
NoConn ~ 4350 2750
NoConn ~ 5150 2750
NoConn ~ 5250 2750
NoConn ~ 5350 2750
NoConn ~ 11650 4450
NoConn ~ 1150 7050
NoConn ~ 1150 5800
NoConn ~ 1150 4550
NoConn ~ 1150 3350
$Comp
L Device:R R13
U 1 1 6148003D
P 2250 3500
F 0 "R13" H 2320 3546 50  0000 L CNN
F 1 "220" H 2320 3455 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2180 3500 50  0001 C CNN
F 3 "~" H 2250 3500 50  0001 C CNN
	1    2250 3500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R14
U 1 1 614803C3
P 2250 4700
F 0 "R14" H 2320 4746 50  0000 L CNN
F 1 "220" H 2320 4655 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2180 4700 50  0001 C CNN
F 3 "~" H 2250 4700 50  0001 C CNN
	1    2250 4700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R15
U 1 1 61486407
P 2250 5950
F 0 "R15" H 2320 5996 50  0000 L CNN
F 1 "220" H 2320 5905 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2180 5950 50  0001 C CNN
F 3 "~" H 2250 5950 50  0001 C CNN
	1    2250 5950
	1    0    0    -1  
$EndComp
$Comp
L Device:R R16
U 1 1 6148693D
P 2250 7200
F 0 "R16" H 2320 7246 50  0000 L CNN
F 1 "220" H 2320 7155 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2180 7200 50  0001 C CNN
F 3 "~" H 2250 7200 50  0001 C CNN
	1    2250 7200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 2750 5450 2700
$Comp
L power:PWR_FLAG #FLG0107
U 1 1 614BE8D9
P 5450 2750
F 0 "#FLG0107" H 5450 2825 50  0001 C CNN
F 1 "PWR_FLAG" V 5450 2878 50  0000 L CNN
F 2 "" H 5450 2750 50  0001 C CNN
F 3 "~" H 5450 2750 50  0001 C CNN
	1    5450 2750
	0    1    1    0   
$EndComp
Connection ~ 5450 2750
Wire Wire Line
	4050 4600 3300 4600
Wire Wire Line
	4250 4650 3250 4650
Wire Wire Line
	3250 4700 4350 4700
Wire Wire Line
	3300 4750 4450 4750
$Comp
L power:PWR_FLAG #FLG0105
U 1 1 615325C8
P 4200 6450
F 0 "#FLG0105" H 4200 6525 50  0001 C CNN
F 1 "PWR_FLAG" H 4200 6623 50  0001 C CNN
F 2 "" H 4200 6450 50  0001 C CNN
F 3 "~" H 4200 6450 50  0001 C CNN
	1    4200 6450
	0    1    1    0   
$EndComp
Text GLabel 1150 5600 0    50   Input ~ 0
REO3
Text GLabel 1150 3150 0    50   Input ~ 0
REO1
Text GLabel 1150 4350 0    50   Input ~ 0
REO2
Text GLabel 1150 6850 0    50   Input ~ 0
REO4
Wire Wire Line
	1150 3650 1100 3650
Connection ~ 1150 3650
NoConn ~ 550  3700
NoConn ~ 4450 2750
NoConn ~ 4050 2750
NoConn ~ 4550 2750
NoConn ~ 4650 2750
NoConn ~ 4650 4350
NoConn ~ 4750 4350
NoConn ~ 4950 4350
NoConn ~ 5250 4350
NoConn ~ 5350 4350
$Comp
L Mechanical:MountingHole_Pad H1
U 1 1 618C3185
P 2250 1000
F 0 "H1" H 2350 1049 50  0000 L CNN
F 1 "MountingHole_Pad" H 2350 958 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_ISO14580_Pad" H 2250 1000 50  0001 C CNN
F 3 "~" H 2250 1000 50  0001 C CNN
	1    2250 1000
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H3
U 1 1 618C3B93
P 2450 1000
F 0 "H3" H 2550 1049 50  0000 L CNN
F 1 "MountingHole_Pad" H 2550 958 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_ISO14580_Pad" H 2450 1000 50  0001 C CNN
F 3 "~" H 2450 1000 50  0001 C CNN
	1    2450 1000
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H5
U 1 1 618C4369
P 2650 1000
F 0 "H5" H 2750 1049 50  0000 L CNN
F 1 "MountingHole_Pad" H 2750 958 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_ISO14580_Pad" H 2650 1000 50  0001 C CNN
F 3 "~" H 2650 1000 50  0001 C CNN
	1    2650 1000
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H7
U 1 1 618C4621
P 2850 1000
F 0 "H7" H 2950 1049 50  0000 L CNN
F 1 "MountingHole_Pad" H 2950 958 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_ISO14580_Pad" H 2850 1000 50  0001 C CNN
F 3 "~" H 2850 1000 50  0001 C CNN
	1    2850 1000
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H2
U 1 1 618C5DA5
P 1450 1000
F 0 "H2" H 1550 1049 50  0000 L CNN
F 1 "MountingHole_Pad" H 1550 958 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_ISO14580_Pad" H 1450 1000 50  0001 C CNN
F 3 "~" H 1450 1000 50  0001 C CNN
	1    1450 1000
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H4
U 1 1 618C5DAB
P 1650 1000
F 0 "H4" H 1750 1049 50  0000 L CNN
F 1 "MountingHole_Pad" H 1750 958 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_ISO14580_Pad" H 1650 1000 50  0001 C CNN
F 3 "~" H 1650 1000 50  0001 C CNN
	1    1650 1000
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H6
U 1 1 618C5DB1
P 1850 1000
F 0 "H6" H 1950 1049 50  0000 L CNN
F 1 "MountingHole_Pad" H 1950 958 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_ISO14580_Pad" H 1850 1000 50  0001 C CNN
F 3 "~" H 1850 1000 50  0001 C CNN
	1    1850 1000
	1    0    0    -1  
$EndComp
Text GLabel 1450 1100 3    50   Input ~ 0
Earth
Text GLabel 1650 1100 3    50   Input ~ 0
Earth
Text GLabel 1850 1100 3    50   Input ~ 0
Earth
Text GLabel 2250 1100 3    50   Input ~ 0
Earth
Text GLabel 2450 1100 3    50   Input ~ 0
Earth
Text GLabel 2650 1100 3    50   Input ~ 0
Earth
Text GLabel 2850 1100 3    50   Input ~ 0
Earth
Text GLabel 9800 2850 2    50   Input ~ 0
220VAC(N)
Text GLabel 10700 3750 2    50   Input ~ 0
Sens2
Text GLabel 10700 4750 2    50   Input ~ 0
Sens3
Text GLabel 10700 5750 2    50   Input ~ 0
Sens4
$Comp
L Device:R R5
U 1 1 61354B0C
P 10550 2750
F 0 "R5" V 10343 2750 50  0001 C CNN
F 1 "47k" V 10435 2750 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 10480 2750 50  0001 C CNN
F 3 "~" H 10550 2750 50  0001 C CNN
	1    10550 2750
	0    1    1    0   
$EndComp
Text GLabel 10700 2750 2    50   Input ~ 0
Sens1
$Comp
L Device:R R6
U 1 1 61314DEF
P 10250 2750
F 0 "R6" V 10043 2750 50  0001 C CNN
F 1 "47k" V 10135 2750 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 10180 2750 50  0001 C CNN
F 3 "~" H 10250 2750 50  0001 C CNN
	1    10250 2750
	0    1    1    0   
$EndComp
$Comp
L Converter_ACDC:RAC05-05SK PS1
U 1 1 612EAA71
P 6150 7400
F 0 "PS1" V 6104 7630 50  0000 L CNN
F 1 "RAC05-05SK" V 6195 7630 50  0000 L CNN
F 2 "Converter_ACDC:Converter_ACDC_RECOM_RAC05-xxSK_THT" H 6150 7050 50  0001 C CNN
F 3 "https://www.recom-power.com/pdf/Powerline-AC-DC/RAC05-K.pdf" H 6050 7700 50  0001 C CNN
	1    6150 7400
	1    0    0    -1  
$EndComp
Wire Wire Line
	10100 2750 9800 2750
$Comp
L phoenix-1017505:1017505 J4
U 1 1 6133A647
P 10400 1650
F 0 "J4" H 10800 1085 50  0000 C CNN
F 1 "1017505" H 10800 1176 50  0000 C CNN
F 2 "Phoenix_Conn:1017505" H 11050 1750 50  0001 L CNN
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
Text GLabel 9600 1350 1    50   Input ~ 0
Sens1
Text GLabel 10400 1350 2    50   Input ~ 0
Sens1
Text GLabel 9500 1450 0    50   Input ~ 0
Sens2
Text GLabel 10400 1450 2    50   Input ~ 0
Sens2
Text GLabel 9500 1550 0    50   Input ~ 0
Sens3
Text GLabel 10400 1550 2    50   Input ~ 0
Sens3
Text GLabel 9600 1650 3    50   Input ~ 0
Sens4
Text GLabel 10400 1650 2    50   Input ~ 0
Sens4
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 61341516
P 8850 1300
F 0 "#FLG0101" H 8850 1375 50  0001 C CNN
F 1 "PWR_FLAG" H 8850 1473 50  0001 C CNN
F 2 "" H 8850 1300 50  0001 C CNN
F 3 "~" H 8850 1300 50  0001 C CNN
	1    8850 1300
	0    1    1    0   
$EndComp
Wire Wire Line
	9600 1450 9500 1450
Wire Wire Line
	9600 1550 9500 1550
$Comp
L phoenix-1017505:1017505 J1
U 1 1 6135584E
P 1900 2450
F 0 "J1" H 2300 1885 50  0000 C CNN
F 1 "1017505" H 2300 1976 50  0000 C CNN
F 2 "Phoenix_Conn:1017505" H 2550 2550 50  0001 L CNN
F 3 "https://www.phoenixcontact.com/online/portal/gb/?uri=pxc-oc-itemdetail:pid=1017505&library=gben&pcck=P-11-01-05&tab=1&selectedCategory=ALL" H 2550 2450 50  0001 L CNN
F 4 "Phoenix Contact TDPT Series 5.08mm Pitch, PCB Terminal Block, PCB Mount, 4 Way" H 2550 2350 50  0001 L CNN "Description"
F 5 "19.2" H 2550 2250 50  0001 L CNN "Height"
F 6 "Phoenix Contact" H 2550 2150 50  0001 L CNN "Manufacturer_Name"
F 7 "1017505" H 2550 2050 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "651-1017505" H 2550 1950 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/Phoenix-Contact/1017505?qs=F5EMLAvA7IDSv5uM7A6HhA%3D%3D" H 2550 1850 50  0001 L CNN "Mouser Price/Stock"
F 10 "1017505" H 2550 1750 50  0001 L CNN "Arrow Part Number"
F 11 "https://www.arrow.com/en/products/1017505/phoenix-contact" H 2550 1650 50  0001 L CNN "Arrow Price/Stock"
	1    1900 2450
	-1   0    0    1   
$EndComp
Text GLabel 1900 2350 2    50   Input ~ 0
REO3
Text GLabel 1900 2150 2    50   Input ~ 0
REO1
Text GLabel 1900 2250 2    50   Input ~ 0
REO2
Text GLabel 1900 2450 2    50   Input ~ 0
REO4
$Comp
L phoenix-1017505:1017505 J2
U 1 1 61366C48
P 5050 7550
F 0 "J2" H 5450 6985 50  0000 C CNN
F 1 "1017505" H 5450 7076 50  0000 C CNN
F 2 "Phoenix_Conn:1017505" H 5700 7650 50  0001 L CNN
F 3 "https://www.phoenixcontact.com/online/portal/gb/?uri=pxc-oc-itemdetail:pid=1017505&library=gben&pcck=P-11-01-05&tab=1&selectedCategory=ALL" H 5700 7550 50  0001 L CNN
F 4 "Phoenix Contact TDPT Series 5.08mm Pitch, PCB Terminal Block, PCB Mount, 4 Way" H 5700 7450 50  0001 L CNN "Description"
F 5 "19.2" H 5700 7350 50  0001 L CNN "Height"
F 6 "Phoenix Contact" H 5700 7250 50  0001 L CNN "Manufacturer_Name"
F 7 "1017505" H 5700 7150 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "651-1017505" H 5700 7050 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/Phoenix-Contact/1017505?qs=F5EMLAvA7IDSv5uM7A6HhA%3D%3D" H 5700 6950 50  0001 L CNN "Mouser Price/Stock"
F 10 "1017505" H 5700 6850 50  0001 L CNN "Arrow Part Number"
F 11 "https://www.arrow.com/en/products/1017505/phoenix-contact" H 5700 6750 50  0001 L CNN "Arrow Price/Stock"
	1    5050 7550
	-1   0    0    1   
$EndComp
Text GLabel 5050 7350 2    50   UnSpc ~ 0
Earth
Text GLabel 5050 7450 2    50   UnSpc ~ 0
Earth
Text GLabel 5050 7550 2    50   UnSpc ~ 0
220VAC(N)
Text GLabel 5050 7250 2    50   UnSpc ~ 0
220VAC(L)
Wire Wire Line
	5050 7250 5050 7150
Wire Wire Line
	5750 7150 5750 7300
Wire Wire Line
	5050 7150 5750 7150
Wire Wire Line
	5050 7550 5050 7650
Wire Wire Line
	5750 7650 5750 7500
Wire Wire Line
	5050 7650 5750 7650
Text GLabel 4150 7350 0    50   UnSpc ~ 0
Earth
$Comp
L power:PWR_FLAG #FLG0103
U 1 1 613786F8
P 4200 6350
F 0 "#FLG0103" H 4200 6425 50  0001 C CNN
F 1 "PWR_FLAG" H 4200 6523 50  0001 C CNN
F 2 "" H 4200 6350 50  0001 C CNN
F 3 "~" H 4200 6350 50  0001 C CNN
	1    4200 6350
	0    1    1    0   
$EndComp
Text GLabel 4150 7450 0    50   UnSpc ~ 0
Earth
Wire Wire Line
	4250 7250 4250 7200
Wire Wire Line
	4250 7200 4150 7200
Wire Wire Line
	4250 7350 4150 7350
Wire Wire Line
	4250 7450 4150 7450
Wire Wire Line
	4250 7550 4250 7600
Wire Wire Line
	4250 7600 4150 7600
Text GLabel 5050 2750 1    50   Input ~ 0
GPIO34
Text GLabel 4750 2750 1    50   Input ~ 0
GPIO33
Text GLabel 8700 5650 0    50   Input ~ 0
GPIO33
Text GLabel 4950 2750 1    50   Input ~ 0
GPIO35
Text GLabel 4850 2750 1    50   Input ~ 0
GPIO32
Text GLabel 8700 4650 0    50   Input ~ 0
GPIO32
Text GLabel 8700 3650 0    50   Input ~ 0
GPIO35
$Comp
L HCPL-3700-000:HCPL3700 U2
U 1 1 613556E0
P 9900 2850
F 0 "U2" H 10450 2085 50  0000 C CNN
F 1 "HCPL3700" H 10450 2176 50  0000 C CNN
F 2 "HCPL:ON_Semi-CASE_62605_ISSUE_P-0-0-0" H 9900 3250 50  0001 L CNN
F 3 "http://www.onsemi.ru.com/pub/Collateral/HCPL3700-D.pdf" H 9900 3350 50  0001 L CNN
F 4 "30mA" H 9900 3450 50  0001 L CNN "Current - Output / Channel"
F 5 "Darlington" H 9900 3550 50  0001 L CNN "Output Type"
F 6 "2500Vrms" H 9900 3650 50  0001 L CNN "Voltage - Isolation"
F 7 "20V" H 9900 3750 50  0001 L CNN "Voltage - Output (Max)"
F 8 "IC" H 9900 3850 50  0001 L CNN "category"
F 9 "Optoisolator Darlington Output 2500Vrms 1 Channel 8-DIP" H 9900 3950 50  0001 L CNN "digikey description"
F 10 "HCPL3700-ND" H 9900 4050 50  0001 L CNN "digikey part number"
F 11 "DIP794W46P254L959H533Q8" H 9900 4150 50  0001 L CNN "ipc land pattern name"
F 12 "yes" H 9900 4250 50  0001 L CNN "lead free"
F 13 "eacaf3d134f71bf1" H 9900 4350 50  0001 L CNN "library id"
F 14 "ON Semi" H 9900 4450 50  0001 L CNN "manufacturer"
F 15 "512-HCPL-3700" H 9900 4550 50  0001 L CNN "mouser part number"
F 16 "PDIP8" H 9900 4650 50  0001 L CNN "package"
F 17 "yes" H 9900 4750 50  0001 L CNN "rohs"
F 18 "+70°C" H 9900 4850 50  0001 L CNN "temperature range high"
F 19 "0°C" H 9900 4950 50  0001 L CNN "temperature range low"
F 20 "" H 9900 5050 50  0001 L CNN "voltage"
	1    9900 2850
	-1   0    0    1   
$EndComp
$Comp
L Device:CP_Small 22uF1
U 1 1 6137D081
P 10000 2500
F 0 "22uF1" H 9912 2454 50  0000 R CNN
F 1 "CP_Small" H 9912 2545 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 10000 2500 50  0001 C CNN
F 3 "~" H 10000 2500 50  0001 C CNN
	1    10000 2500
	-1   0    0    1   
$EndComp
Wire Wire Line
	9800 2600 9800 2550
Wire Wire Line
	9800 2600 10000 2600
Wire Wire Line
	10000 2400 9800 2400
Wire Wire Line
	9800 2400 9800 2450
Text GLabel 8700 2950 3    50   Input ~ 0
3.3V+
$Comp
L Device:R R7
U 1 1 6139B189
P 8700 2800
F 0 "R7" V 8493 2800 50  0000 C CNN
F 1 "10K" V 8584 2800 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 8630 2800 50  0001 C CNN
F 3 "~" H 8700 2800 50  0001 C CNN
	1    8700 2800
	1    0    0    -1  
$EndComp
Text GLabel 8700 2650 0    50   Input ~ 0
GPIO34
Wire Wire Line
	8700 2950 8900 2950
Wire Wire Line
	8900 2950 8900 2850
Wire Wire Line
	8700 2650 8900 2650
NoConn ~ 8900 2550
Text GLabel 8900 3350 0    50   Input ~ 0
5VGND
Text GLabel 9800 3850 2    50   Input ~ 0
220VAC(N)
$Comp
L Device:R R18
U 1 1 613B1E37
P 10550 3750
F 0 "R18" V 10343 3750 50  0001 C CNN
F 1 "47k" V 10435 3750 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 10480 3750 50  0001 C CNN
F 3 "~" H 10550 3750 50  0001 C CNN
	1    10550 3750
	0    1    1    0   
$EndComp
$Comp
L Device:R R11
U 1 1 613B1E3D
P 10250 3750
F 0 "R11" V 10043 3750 50  0001 C CNN
F 1 "47k" V 10135 3750 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 10180 3750 50  0001 C CNN
F 3 "~" H 10250 3750 50  0001 C CNN
	1    10250 3750
	0    1    1    0   
$EndComp
Wire Wire Line
	10100 3750 9800 3750
$Comp
L HCPL-3700-000:HCPL3700 U3
U 1 1 613B1E55
P 9900 3850
F 0 "U3" H 10450 3085 50  0000 C CNN
F 1 "HCPL3700" H 10450 3176 50  0000 C CNN
F 2 "HCPL:ON_Semi-CASE_62605_ISSUE_P-0-0-0" H 9900 4250 50  0001 L CNN
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
L Device:CP_Small 22uF2
U 1 1 613B1E5B
P 10000 3500
F 0 "22uF2" H 9912 3454 50  0000 R CNN
F 1 "CP_Small" H 9912 3545 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 10000 3500 50  0001 C CNN
F 3 "~" H 10000 3500 50  0001 C CNN
	1    10000 3500
	-1   0    0    1   
$EndComp
Wire Wire Line
	9800 3600 9800 3550
Wire Wire Line
	9800 3600 10000 3600
Wire Wire Line
	10000 3400 9800 3400
Wire Wire Line
	9800 3400 9800 3450
Text GLabel 8700 3950 3    50   Input ~ 0
3.3V+
$Comp
L Device:R R8
U 1 1 613B1E66
P 8700 3800
F 0 "R8" V 8493 3800 50  0000 C CNN
F 1 "10K" V 8584 3800 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 8630 3800 50  0001 C CNN
F 3 "~" H 8700 3800 50  0001 C CNN
	1    8700 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 3950 8900 3950
Wire Wire Line
	8900 3950 8900 3850
Wire Wire Line
	8700 3650 8900 3650
NoConn ~ 8900 3550
Text GLabel 8900 4350 0    50   Input ~ 0
5VGND
Text GLabel 9800 4850 2    50   Input ~ 0
220VAC(N)
$Comp
L Device:R R19
U 1 1 613B6B92
P 10550 4750
F 0 "R19" V 10343 4750 50  0001 C CNN
F 1 "47k" V 10435 4750 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 10480 4750 50  0001 C CNN
F 3 "~" H 10550 4750 50  0001 C CNN
	1    10550 4750
	0    1    1    0   
$EndComp
$Comp
L Device:R R12
U 1 1 613B6B98
P 10250 4750
F 0 "R12" V 10043 4750 50  0001 C CNN
F 1 "47k" V 10135 4750 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 10180 4750 50  0001 C CNN
F 3 "~" H 10250 4750 50  0001 C CNN
	1    10250 4750
	0    1    1    0   
$EndComp
Wire Wire Line
	10100 4750 9800 4750
$Comp
L HCPL-3700-000:HCPL3700 U4
U 1 1 613B6BB0
P 9900 4850
F 0 "U4" H 10450 4085 50  0000 C CNN
F 1 "HCPL3700" H 10450 4176 50  0000 C CNN
F 2 "HCPL:ON_Semi-CASE_62605_ISSUE_P-0-0-0" H 9900 5250 50  0001 L CNN
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
L Device:CP_Small 22uF3
U 1 1 613B6BB6
P 10000 4500
F 0 "22uF3" H 9912 4454 50  0000 R CNN
F 1 "CP_Small" H 9912 4545 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 10000 4500 50  0001 C CNN
F 3 "~" H 10000 4500 50  0001 C CNN
	1    10000 4500
	-1   0    0    1   
$EndComp
Wire Wire Line
	9800 4600 9800 4550
Wire Wire Line
	9800 4600 10000 4600
Wire Wire Line
	10000 4400 9800 4400
Wire Wire Line
	9800 4400 9800 4450
Text GLabel 8700 4950 3    50   Input ~ 0
3.3V+
$Comp
L Device:R R9
U 1 1 613B6BC1
P 8700 4800
F 0 "R9" V 8493 4800 50  0000 C CNN
F 1 "10K" V 8584 4800 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 8630 4800 50  0001 C CNN
F 3 "~" H 8700 4800 50  0001 C CNN
	1    8700 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 4950 8900 4950
Wire Wire Line
	8900 4950 8900 4850
Wire Wire Line
	8700 4650 8900 4650
NoConn ~ 8900 4550
Text GLabel 8900 5350 0    50   Input ~ 0
5VGND
Text GLabel 9800 5850 2    50   Input ~ 0
220VAC(N)
$Comp
L Device:R R20
U 1 1 613BAE41
P 10550 5750
F 0 "R20" V 10343 5750 50  0001 C CNN
F 1 "47k" V 10435 5750 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 10480 5750 50  0001 C CNN
F 3 "~" H 10550 5750 50  0001 C CNN
	1    10550 5750
	0    1    1    0   
$EndComp
$Comp
L Device:R R17
U 1 1 613BAE47
P 10250 5750
F 0 "R17" V 10043 5750 50  0001 C CNN
F 1 "47k" V 10135 5750 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 10180 5750 50  0001 C CNN
F 3 "~" H 10250 5750 50  0001 C CNN
	1    10250 5750
	0    1    1    0   
$EndComp
Wire Wire Line
	10100 5750 9800 5750
$Comp
L HCPL-3700-000:HCPL3700 U5
U 1 1 613BAE5F
P 9900 5850
F 0 "U5" H 10450 5085 50  0000 C CNN
F 1 "HCPL3700" H 10450 5176 50  0000 C CNN
F 2 "HCPL:ON_Semi-CASE_62605_ISSUE_P-0-0-0" H 9900 6250 50  0001 L CNN
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
L Device:CP_Small 22uF4
U 1 1 613BAE65
P 10000 5500
F 0 "22uF4" H 9912 5454 50  0000 R CNN
F 1 "CP_Small" H 9912 5545 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 10000 5500 50  0001 C CNN
F 3 "~" H 10000 5500 50  0001 C CNN
	1    10000 5500
	-1   0    0    1   
$EndComp
Wire Wire Line
	9800 5600 9800 5550
Wire Wire Line
	9800 5600 10000 5600
Wire Wire Line
	10000 5400 9800 5400
Wire Wire Line
	9800 5400 9800 5450
Text GLabel 8700 5950 3    50   Input ~ 0
3.3V+
$Comp
L Device:R R10
U 1 1 613BAE70
P 8700 5800
F 0 "R10" V 8493 5800 50  0000 C CNN
F 1 "10K" V 8584 5800 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 8630 5800 50  0001 C CNN
F 3 "~" H 8700 5800 50  0001 C CNN
	1    8700 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 5950 8900 5950
Wire Wire Line
	8900 5950 8900 5850
Wire Wire Line
	8700 5650 8900 5650
NoConn ~ 8900 5550
Wire Notes Line
	3650 7700 3650 6100
Wire Notes Line
	3650 6100 6850 6100
Wire Notes Line
	6850 6100 6850 7700
Wire Notes Line
	6850 7700 3650 7700
Text Label 6350 6250 0    50   ~ 0
PowerSupply
Wire Notes Line
	8300 950  11000 950 
Wire Notes Line
	11000 6300 8300 6300
Text Label 10550 1050 0    50   ~ 0
LightInputs
Text Label 3050 1900 0    50   ~ 0
Relays
Text GLabel 1100 2450 0    50   Input ~ 0
REO4
Text GLabel 1100 2250 0    50   Input ~ 0
REO2
Text GLabel 1100 2150 0    50   Input ~ 0
REO1
Text GLabel 1100 2350 0    50   Input ~ 0
REO3
Wire Notes Line
	3400 7750 600  7750
Wire Notes Line
	600  1800 600  7750
Wire Notes Line
	600  1800 3400 1800
Wire Notes Line
	3400 1800 3400 7750
Wire Notes Line
	11000 950  11000 6300
Wire Notes Line
	8300 950  8300 6300
Text GLabel 4200 6350 0    50   UnSpc ~ 0
Earth
Text GLabel 4200 6450 0    50   UnSpc ~ 0
220VAC(L)
Text GLabel 4200 6550 0    50   UnSpc ~ 0
220VAC(N)
$Comp
L power:PWR_FLAG #FLG0110
U 1 1 61581A71
P 4200 6550
F 0 "#FLG0110" H 4200 6625 50  0001 C CNN
F 1 "PWR_FLAG" H 4200 6723 50  0001 C CNN
F 2 "" H 4200 6550 50  0001 C CNN
F 3 "~" H 4200 6550 50  0001 C CNN
	1    4200 6550
	0    1    1    0   
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
L power:PWR_FLAG #FLG0102
U 1 1 61369577
P 8850 1400
F 0 "#FLG0102" H 8850 1475 50  0001 C CNN
F 1 "PWR_FLAG" H 8850 1573 50  0001 C CNN
F 2 "" H 8850 1400 50  0001 C CNN
F 3 "~" H 8850 1400 50  0001 C CNN
	1    8850 1400
	0    1    1    0   
$EndComp
$Comp
L power:PWR_FLAG #FLG0104
U 1 1 613698EA
P 8850 1500
F 0 "#FLG0104" H 8850 1575 50  0001 C CNN
F 1 "PWR_FLAG" H 8850 1673 50  0001 C CNN
F 2 "" H 8850 1500 50  0001 C CNN
F 3 "~" H 8850 1500 50  0001 C CNN
	1    8850 1500
	0    1    1    0   
$EndComp
$Comp
L power:PWR_FLAG #FLG0106
U 1 1 61369AE5
P 8850 1600
F 0 "#FLG0106" H 8850 1675 50  0001 C CNN
F 1 "PWR_FLAG" H 8850 1773 50  0001 C CNN
F 2 "" H 8850 1600 50  0001 C CNN
F 3 "~" H 8850 1600 50  0001 C CNN
	1    8850 1600
	0    1    1    0   
$EndComp
$Comp
L Mechanical:MountingHole_Pad H8
U 1 1 613DB028
P 3050 1000
F 0 "H8" H 3150 1049 50  0000 L CNN
F 1 "MountingHole_Pad" H 3150 958 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_ISO14580_Pad" H 3050 1000 50  0001 C CNN
F 3 "~" H 3050 1000 50  0001 C CNN
	1    3050 1000
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H9
U 1 1 613DB02E
P 3250 1000
F 0 "H9" H 3350 1049 50  0000 L CNN
F 1 "MountingHole_Pad" H 3350 958 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_ISO14580_Pad" H 3250 1000 50  0001 C CNN
F 3 "~" H 3250 1000 50  0001 C CNN
	1    3250 1000
	1    0    0    -1  
$EndComp
Text GLabel 3050 1100 3    50   Input ~ 0
Earth
Text GLabel 3250 1100 3    50   Input ~ 0
Earth
$EndSCHEMATC
