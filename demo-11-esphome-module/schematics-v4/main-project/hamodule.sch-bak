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
Text GLabel 7750 4750 0    50   Input ~ 0
220VAC(L)
Text GLabel 7750 5150 0    50   Input ~ 0
220VAC(N)
Text GLabel 6350 4400 3    50   Input ~ 0
5VGND
Text GLabel 4550 2800 0    50   Input ~ 0
5V+
Text GLabel 10150 4850 2    50   Input ~ 0
5V+
Text GLabel 10150 5050 2    50   Input ~ 0
5VGND
$Comp
L hamodule-rescue:ESP32-DEVKITC-32D-ESP32-DEVKITC-32D U1
U 1 1 6126231E
P 5450 3600
F 0 "U1" H 5450 4767 50  0000 C CNN
F 1 "ESP32-DEVKITC-32D" H 5450 4676 50  0000 C CNN
F 2 "esp32-footprint:MODULE_ESP32-DEVKITC-32D" H 5450 3600 50  0001 L BNN
F 3 "" H 5450 3600 50  0001 L BNN
F 4 "4" H 5450 3600 50  0001 L BNN "PARTREV"
F 5 "Espressif Systems" H 5450 3600 50  0001 L BNN "MANUFACTURER"
	1    5450 3600
	0    1    1    0   
$EndComp
Text GLabel 2650 3300 2    50   Input ~ 0
220VAC(L)
$Comp
L pspice:DIODE D1
U 1 1 612C0625
P 2800 3850
F 0 "D1" H 2800 4115 50  0000 C CNN
F 1 "DIODE" H 2800 4024 50  0000 C CNN
F 2 "Diode_THT:D_5W_P10.16mm_Horizontal" H 2800 3850 50  0001 C CNN
F 3 "~" H 2800 3850 50  0001 C CNN
	1    2800 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 3850 3000 3700
Wire Wire Line
	3000 3700 2650 3700
Text GLabel 2000 3700 0    50   Input ~ 0
5VGND
Wire Wire Line
	2050 3700 2050 3950
Wire Wire Line
	2050 3950 2600 3950
Wire Wire Line
	2600 3950 2600 3850
$Comp
L Relay:G5Q-1 K1
U 1 1 612C4AA3
P 2350 3500
F 0 "K1" V 2917 3500 50  0000 C CNN
F 1 "G5Q-1" V 2826 3500 50  0000 C CNN
F 2 "Relay_THT:Relay_SPDT_Omron-G5Q-1" H 2800 3450 50  0001 L CNN
F 3 "https://www.omron.com/ecb/products/pdf/en-g5q.pdf" H 2350 3500 50  0001 L CNN
	1    2350 3500
	0    -1   -1   0   
$EndComp
$Comp
L Transistor_BJT:2N2219 Q1
U 1 1 612CA16E
P 3600 3300
F 0 "Q1" H 3791 3254 50  0000 L CNN
F 1 "2N2219" H 3791 3345 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Wide" H 3800 3225 50  0001 L CIN
F 3 "http://www.onsemi.com/pub_link/Collateral/2N2219-D.PDF" H 3600 3300 50  0001 L CNN
	1    3600 3300
	-1   0    0    1   
$EndComp
Wire Wire Line
	3500 3100 3150 3100
Wire Wire Line
	3150 3100 3150 3400
Wire Wire Line
	3150 3700 3000 3700
Connection ~ 3000 3700
Text GLabel 3500 3550 3    50   Input ~ 0
5V+
Wire Wire Line
	3500 3550 3500 3500
$Comp
L Device:R R1
U 1 1 612DC637
P 3800 3450
F 0 "R1" H 3870 3496 50  0000 L CNN
F 1 "10K" H 3870 3405 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 3730 3450 50  0001 C CNN
F 3 "~" H 3800 3450 50  0001 C CNN
	1    3800 3450
	1    0    0    -1  
$EndComp
Text GLabel 3800 3600 3    50   Input ~ 0
5VGND
Text GLabel 6350 2750 1    50   Input ~ 0
3.3V+
Text GLabel 7150 3200 0    50   Input ~ 0
3.3V+
Wire Notes Line
	1600 2850 1600 4000
Wire Notes Line
	1600 4000 4050 4000
Wire Notes Line
	4050 4000 4050 2850
Wire Notes Line
	4050 2850 1600 2850
Text GLabel 2650 4500 2    50   Input ~ 0
220VAC(L)
$Comp
L pspice:DIODE D2
U 1 1 612DB8DB
P 2800 5050
F 0 "D2" H 2800 5315 50  0000 C CNN
F 1 "DIODE" H 2800 5224 50  0000 C CNN
F 2 "Diode_THT:D_5W_P10.16mm_Horizontal" H 2800 5050 50  0001 C CNN
F 3 "~" H 2800 5050 50  0001 C CNN
	1    2800 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 5050 3000 4900
Wire Wire Line
	3000 4900 2650 4900
Text GLabel 2000 4900 0    50   Input ~ 0
5VGND
Wire Wire Line
	2050 4900 2000 4900
Wire Wire Line
	2050 4900 2050 5150
Wire Wire Line
	2050 5150 2600 5150
Wire Wire Line
	2600 5150 2600 5050
$Comp
L Relay:G5Q-1 K2
U 1 1 612DB8E8
P 2350 4700
F 0 "K2" V 2917 4700 50  0000 C CNN
F 1 "G5Q-1" V 2826 4700 50  0000 C CNN
F 2 "Relay_THT:Relay_SPDT_Omron-G5Q-1" H 2800 4650 50  0001 L CNN
F 3 "https://www.omron.com/ecb/products/pdf/en-g5q.pdf" H 2350 4700 50  0001 L CNN
	1    2350 4700
	0    -1   -1   0   
$EndComp
Connection ~ 2050 4900
$Comp
L Transistor_BJT:2N2219 Q2
U 1 1 612DB8F0
P 3600 4500
F 0 "Q2" H 3791 4454 50  0000 L CNN
F 1 "2N2219" H 3791 4545 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Wide" H 3800 4425 50  0001 L CIN
F 3 "http://www.onsemi.com/pub_link/Collateral/2N2219-D.PDF" H 3600 4500 50  0001 L CNN
	1    3600 4500
	-1   0    0    1   
$EndComp
Wire Wire Line
	3500 4300 3150 4300
Wire Wire Line
	3150 4300 3150 4600
Wire Wire Line
	3150 4900 3000 4900
Connection ~ 3000 4900
Text GLabel 3500 4750 3    50   Input ~ 0
5V+
Wire Wire Line
	3500 4750 3500 4700
$Comp
L Device:R R2
U 1 1 612DB8FC
P 3800 4650
F 0 "R2" H 3870 4696 50  0000 L CNN
F 1 "10K" H 3870 4605 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 3730 4650 50  0001 C CNN
F 3 "~" H 3800 4650 50  0001 C CNN
	1    3800 4650
	1    0    0    -1  
$EndComp
Text GLabel 3800 4800 3    50   Input ~ 0
5VGND
Wire Notes Line
	1600 4050 1600 5200
Wire Notes Line
	1600 5200 4050 5200
Wire Notes Line
	4050 5200 4050 4050
Wire Notes Line
	4050 4050 1600 4050
Text GLabel 2650 5750 2    50   Input ~ 0
220VAC(L)
$Comp
L pspice:DIODE D3
U 1 1 612DFC74
P 2800 6300
F 0 "D3" H 2800 6565 50  0000 C CNN
F 1 "DIODE" H 2800 6474 50  0000 C CNN
F 2 "Diode_THT:D_5W_P10.16mm_Horizontal" H 2800 6300 50  0001 C CNN
F 3 "~" H 2800 6300 50  0001 C CNN
	1    2800 6300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 6300 3000 6150
Wire Wire Line
	3000 6150 2650 6150
Text GLabel 2000 6150 0    50   Input ~ 0
5VGND
Wire Wire Line
	2050 6150 2000 6150
Wire Wire Line
	2050 6150 2050 6400
Wire Wire Line
	2050 6400 2600 6400
Wire Wire Line
	2600 6400 2600 6300
$Comp
L Relay:G5Q-1 K3
U 1 1 612DFC81
P 2350 5950
F 0 "K3" V 2917 5950 50  0000 C CNN
F 1 "G5Q-1" V 2826 5950 50  0000 C CNN
F 2 "Relay_THT:Relay_SPDT_Omron-G5Q-1" H 2800 5900 50  0001 L CNN
F 3 "https://www.omron.com/ecb/products/pdf/en-g5q.pdf" H 2350 5950 50  0001 L CNN
	1    2350 5950
	0    -1   -1   0   
$EndComp
Connection ~ 2050 6150
$Comp
L Transistor_BJT:2N2219 Q3
U 1 1 612DFC89
P 3600 5750
F 0 "Q3" H 3791 5704 50  0000 L CNN
F 1 "2N2219" H 3791 5795 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Wide" H 3800 5675 50  0001 L CIN
F 3 "http://www.onsemi.com/pub_link/Collateral/2N2219-D.PDF" H 3600 5750 50  0001 L CNN
	1    3600 5750
	-1   0    0    1   
$EndComp
Wire Wire Line
	3500 5550 3150 5550
Wire Wire Line
	3150 5550 3150 5850
Wire Wire Line
	3150 6150 3000 6150
Connection ~ 3000 6150
Text GLabel 3500 6000 3    50   Input ~ 0
5V+
Wire Wire Line
	3500 6000 3500 5950
$Comp
L Device:R R3
U 1 1 612DFC95
P 3800 5900
F 0 "R3" H 3870 5946 50  0000 L CNN
F 1 "10K" H 3870 5855 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 3730 5900 50  0001 C CNN
F 3 "~" H 3800 5900 50  0001 C CNN
	1    3800 5900
	1    0    0    -1  
$EndComp
Connection ~ 3800 5750
Text GLabel 3800 6050 3    50   Input ~ 0
5VGND
Wire Notes Line
	1600 5300 1600 6450
Wire Notes Line
	1600 6450 4050 6450
Wire Notes Line
	4050 6450 4050 5300
Wire Notes Line
	4050 5300 1600 5300
Text GLabel 2650 7000 2    50   Input ~ 0
220VAC(L)
$Comp
L pspice:DIODE D4
U 1 1 612E3AF6
P 2800 7550
F 0 "D4" H 2800 7815 50  0000 C CNN
F 1 "DIODE" H 2800 7724 50  0000 C CNN
F 2 "Diode_THT:D_5W_P10.16mm_Horizontal" H 2800 7550 50  0001 C CNN
F 3 "~" H 2800 7550 50  0001 C CNN
	1    2800 7550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 7550 3000 7400
Wire Wire Line
	3000 7400 2650 7400
Text GLabel 2000 7400 0    50   Input ~ 0
5VGND
Wire Wire Line
	2050 7400 2000 7400
Wire Wire Line
	2050 7400 2050 7650
Wire Wire Line
	2050 7650 2600 7650
Wire Wire Line
	2600 7650 2600 7550
$Comp
L Relay:G5Q-1 K4
U 1 1 612E3B03
P 2350 7200
F 0 "K4" V 2917 7200 50  0000 C CNN
F 1 "G5Q-1" V 2826 7200 50  0000 C CNN
F 2 "Relay_THT:Relay_SPDT_Omron-G5Q-1" H 2800 7150 50  0001 L CNN
F 3 "https://www.omron.com/ecb/products/pdf/en-g5q.pdf" H 2350 7200 50  0001 L CNN
	1    2350 7200
	0    -1   -1   0   
$EndComp
Connection ~ 2050 7400
$Comp
L Transistor_BJT:2N2219 Q4
U 1 1 612E3B0B
P 3600 7000
F 0 "Q4" H 3791 6954 50  0000 L CNN
F 1 "2N2219" H 3791 7045 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Wide" H 3800 6925 50  0001 L CIN
F 3 "http://www.onsemi.com/pub_link/Collateral/2N2219-D.PDF" H 3600 7000 50  0001 L CNN
	1    3600 7000
	-1   0    0    1   
$EndComp
Wire Wire Line
	3500 6800 3150 6800
Wire Wire Line
	3150 6800 3150 7100
Wire Wire Line
	3150 7400 3000 7400
Connection ~ 3000 7400
Text GLabel 3500 7250 3    50   Input ~ 0
5V+
Wire Wire Line
	3500 7250 3500 7200
$Comp
L Device:R R4
U 1 1 612E3B17
P 3800 7150
F 0 "R4" H 3870 7196 50  0000 L CNN
F 1 "10K" H 3870 7105 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 3730 7150 50  0001 C CNN
F 3 "~" H 3800 7150 50  0001 C CNN
	1    3800 7150
	1    0    0    -1  
$EndComp
Text GLabel 3800 7300 3    50   Input ~ 0
5VGND
Wire Notes Line
	1600 6550 1600 7700
Wire Notes Line
	1600 7700 4050 7700
Wire Notes Line
	4050 7700 4050 6550
Wire Notes Line
	4050 6550 1600 6550
Wire Wire Line
	3800 3300 4200 3300
Connection ~ 3800 3300
Wire Wire Line
	3800 4500 4150 4500
Wire Wire Line
	4150 4500 4150 4700
Connection ~ 3800 4500
Wire Wire Line
	4150 5750 3800 5750
Wire Wire Line
	4200 7000 3800 7000
Connection ~ 3800 7000
Text GLabel 7450 800  0    50   Input ~ 0
5VGND
$Comp
L Device:R R12
U 1 1 6133C9F4
P 7300 3200
F 0 "R12" V 7093 3200 50  0000 C CNN
F 1 "10K" V 7184 3200 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 7230 3200 50  0001 C CNN
F 3 "~" H 7300 3200 50  0001 C CNN
	1    7300 3200
	0    1    1    0   
$EndComp
Text GLabel 7150 2500 0    50   Input ~ 0
3.3V+
$Comp
L Device:R R11
U 1 1 6137EFCB
P 7300 2500
F 0 "R11" V 7093 2500 50  0000 C CNN
F 1 "10K" V 7184 2500 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 7230 2500 50  0001 C CNN
F 3 "~" H 7300 2500 50  0001 C CNN
	1    7300 2500
	0    1    1    0   
$EndComp
Text GLabel 7150 1800 0    50   Input ~ 0
3.3V+
$Comp
L Device:R R10
U 1 1 61385C88
P 7300 1800
F 0 "R10" V 7093 1800 50  0000 C CNN
F 1 "10K" V 7184 1800 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 7230 1800 50  0001 C CNN
F 3 "~" H 7300 1800 50  0001 C CNN
	1    7300 1800
	0    1    1    0   
$EndComp
Text GLabel 7150 1100 0    50   Input ~ 0
3.3V+
$Comp
L Device:R R9
U 1 1 613892F5
P 7300 1100
F 0 "R9" V 7093 1100 50  0000 C CNN
F 1 "10K" V 7184 1100 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 7230 1100 50  0001 C CNN
F 3 "~" H 7300 1100 50  0001 C CNN
	1    7300 1100
	0    1    1    0   
$EndComp
Wire Wire Line
	6150 1900 6200 1900
Wire Wire Line
	4950 4400 4950 4650
Wire Wire Line
	4200 3300 4200 4650
Wire Wire Line
	5150 4400 5150 4700
Wire Wire Line
	5250 4400 5250 4750
Wire Wire Line
	4150 4750 4150 5750
Wire Wire Line
	5350 4800 5350 4400
Wire Wire Line
	4200 4800 4200 7000
NoConn ~ 6050 4400
NoConn ~ 5950 4400
NoConn ~ 5750 4400
NoConn ~ 5450 4400
NoConn ~ 5050 4400
NoConn ~ 4850 4400
NoConn ~ 4750 4400
NoConn ~ 4650 4400
NoConn ~ 4550 4400
NoConn ~ 4650 2800
NoConn ~ 4750 2800
NoConn ~ 4850 2800
NoConn ~ 5050 2800
NoConn ~ 5150 2800
NoConn ~ 5250 2800
NoConn ~ 6050 2800
NoConn ~ 6150 2800
NoConn ~ 6250 2800
NoConn ~ 11650 4450
NoConn ~ 2050 7100
NoConn ~ 2050 5850
NoConn ~ 2050 4600
NoConn ~ 2050 3400
$Comp
L Device:R R13
U 1 1 6148003D
P 3150 3550
F 0 "R13" H 3220 3596 50  0000 L CNN
F 1 "220" H 3220 3505 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 3080 3550 50  0001 C CNN
F 3 "~" H 3150 3550 50  0001 C CNN
	1    3150 3550
	1    0    0    -1  
$EndComp
$Comp
L Device:R R14
U 1 1 614803C3
P 3150 4750
F 0 "R14" H 3220 4796 50  0000 L CNN
F 1 "220" H 3220 4705 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 3080 4750 50  0001 C CNN
F 3 "~" H 3150 4750 50  0001 C CNN
	1    3150 4750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R15
U 1 1 61486407
P 3150 6000
F 0 "R15" H 3220 6046 50  0000 L CNN
F 1 "220" H 3220 5955 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 3080 6000 50  0001 C CNN
F 3 "~" H 3150 6000 50  0001 C CNN
	1    3150 6000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R16
U 1 1 6148693D
P 3150 7250
F 0 "R16" H 3220 7296 50  0000 L CNN
F 1 "220" H 3220 7205 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 3080 7250 50  0001 C CNN
F 3 "~" H 3150 7250 50  0001 C CNN
	1    3150 7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 2800 6350 2750
$Comp
L power:PWR_FLAG #FLG0107
U 1 1 614BE8D9
P 6350 2800
F 0 "#FLG0107" H 6350 2875 50  0001 C CNN
F 1 "PWR_FLAG" V 6350 2928 50  0000 L CNN
F 2 "" H 6350 2800 50  0001 C CNN
F 3 "~" H 6350 2800 50  0001 C CNN
	1    6350 2800
	0    1    1    0   
$EndComp
Connection ~ 6350 2800
Wire Wire Line
	4950 4650 4200 4650
Wire Wire Line
	5150 4700 4150 4700
Wire Wire Line
	4150 4750 5250 4750
Wire Wire Line
	4200 4800 5350 4800
$Comp
L power:PWR_FLAG #FLG0105
U 1 1 615325C8
P 7750 4900
F 0 "#FLG0105" H 7750 4975 50  0001 C CNN
F 1 "PWR_FLAG" H 7750 5073 50  0000 C CNN
F 2 "" H 7750 4900 50  0001 C CNN
F 3 "~" H 7750 4900 50  0001 C CNN
	1    7750 4900
	1    0    0    -1  
$EndComp
Text GLabel 2000 2400 0    50   Input ~ 0
REO3
Text GLabel 2050 5650 0    50   Input ~ 0
REO3
Text GLabel 2000 2200 0    50   Input ~ 0
REO1
Text GLabel 2050 3200 0    50   Input ~ 0
REO1
Text GLabel 2050 4400 0    50   Input ~ 0
REO2
Text GLabel 2000 2300 0    50   Input ~ 0
REO2
Text GLabel 2000 2500 0    50   Input ~ 0
REO4
Text GLabel 2050 6900 0    50   Input ~ 0
REO4
Wire Wire Line
	2050 3700 2000 3700
Connection ~ 2050 3700
NoConn ~ 400  3750
NoConn ~ 5350 2800
NoConn ~ 4950 2800
NoConn ~ 5450 2800
NoConn ~ 5550 2800
NoConn ~ 5550 4400
NoConn ~ 5650 4400
NoConn ~ 5850 4400
NoConn ~ 6150 4400
NoConn ~ 6250 4400
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
$Comp
L Device:D_Bridge_+-AA D6
U 1 1 612D1A94
P 9350 1700
F 0 "D6" V 9304 2044 50  0000 L CNN
F 1 "D_Bridge_+-AA" V 9395 2044 50  0000 L CNN
F 2 "Diode_THT:Diode_Bridge_Round_D8.9mm" H 9350 1700 50  0001 C CNN
F 3 "~" H 9350 1700 50  0001 C CNN
	1    9350 1700
	0    1    1    0   
$EndComp
$Comp
L Device:D_Bridge_+-AA D7
U 1 1 612D5311
P 9350 2400
F 0 "D7" V 9304 2744 50  0000 L CNN
F 1 "D_Bridge_+-AA" V 9395 2744 50  0000 L CNN
F 2 "Diode_THT:Diode_Bridge_Round_D8.9mm" H 9350 2400 50  0001 C CNN
F 3 "~" H 9350 2400 50  0001 C CNN
	1    9350 2400
	0    1    1    0   
$EndComp
$Comp
L Device:D_Bridge_+-AA D8
U 1 1 612D5DEC
P 9350 3100
F 0 "D8" V 9304 3444 50  0000 L CNN
F 1 "D_Bridge_+-AA" V 9395 3444 50  0000 L CNN
F 2 "Diode_THT:Diode_Bridge_Round_D8.9mm" H 9350 3100 50  0001 C CNN
F 3 "~" H 9350 3100 50  0001 C CNN
	1    9350 3100
	0    1    1    0   
$EndComp
Text GLabel 9050 1000 0    50   Input ~ 0
220VAC(N)
Text GLabel 9050 1700 0    50   Input ~ 0
220VAC(N)
Text GLabel 9650 1700 2    50   Input ~ 0
Sens2
Text GLabel 9650 2400 2    50   Input ~ 0
Sens3
Text GLabel 9650 3100 2    50   Input ~ 0
Sens4
$Comp
L Device:D_Bridge_+-AA D5
U 1 1 612D0C17
P 9350 1000
F 0 "D5" V 9304 1344 50  0000 L CNN
F 1 "D_Bridge_+-AA" V 9395 1344 50  0000 L CNN
F 2 "Diode_THT:Diode_Bridge_Round_D8.9mm" H 9350 1000 50  0001 C CNN
F 3 "~" H 9350 1000 50  0001 C CNN
	1    9350 1000
	0    1    1    0   
$EndComp
$Comp
L Device:R R5
U 1 1 61354B0C
P 9200 700
F 0 "R5" V 8993 700 50  0001 C CNN
F 1 "110k" V 9085 700 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 9130 700 50  0001 C CNN
F 3 "~" H 9200 700 50  0001 C CNN
	1    9200 700 
	0    1    1    0   
$EndComp
Text GLabel 9650 1000 2    50   Input ~ 0
Sens1
Text GLabel 9050 2400 0    50   Input ~ 0
220VAC(N)
Text GLabel 9050 3100 0    50   Input ~ 0
220VAC(N)
$Comp
L Device:R R6
U 1 1 61314DEF
P 8900 700
F 0 "R6" V 8693 700 50  0001 C CNN
F 1 "110k" V 8785 700 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 8830 700 50  0001 C CNN
F 3 "~" H 8900 700 50  0001 C CNN
	1    8900 700 
	0    1    1    0   
$EndComp
$Comp
L Device:R R7
U 1 1 61315234
P 9200 1400
F 0 "R7" V 8993 1400 50  0001 C CNN
F 1 "110k" V 9085 1400 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 9130 1400 50  0001 C CNN
F 3 "~" H 9200 1400 50  0001 C CNN
	1    9200 1400
	0    1    1    0   
$EndComp
$Comp
L Device:R R8
U 1 1 61315822
P 8900 1400
F 0 "R8" V 8693 1400 50  0001 C CNN
F 1 "110k" V 8785 1400 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 8830 1400 50  0001 C CNN
F 3 "~" H 8900 1400 50  0001 C CNN
	1    8900 1400
	0    1    1    0   
$EndComp
$Comp
L Device:R R17
U 1 1 61315D52
P 9200 2100
F 0 "R17" V 8993 2100 50  0001 C CNN
F 1 "110k" V 9085 2100 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 9130 2100 50  0001 C CNN
F 3 "~" H 9200 2100 50  0001 C CNN
	1    9200 2100
	0    1    1    0   
$EndComp
$Comp
L Device:R R18
U 1 1 6131A108
P 8900 2100
F 0 "R18" V 8693 2100 50  0001 C CNN
F 1 "110k" V 8785 2100 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 8830 2100 50  0001 C CNN
F 3 "~" H 8900 2100 50  0001 C CNN
	1    8900 2100
	0    1    1    0   
$EndComp
$Comp
L Device:R R19
U 1 1 6131A6C4
P 9200 2800
F 0 "R19" V 8993 2800 50  0001 C CNN
F 1 "110k" V 9085 2800 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 9130 2800 50  0001 C CNN
F 3 "~" H 9200 2800 50  0001 C CNN
	1    9200 2800
	0    1    1    0   
$EndComp
$Comp
L Device:R R20
U 1 1 6131AADA
P 8900 2800
F 0 "R20" V 8693 2800 50  0001 C CNN
F 1 "110k" V 8785 2800 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 8830 2800 50  0001 C CNN
F 3 "~" H 8900 2800 50  0001 C CNN
	1    8900 2800
	0    1    1    0   
$EndComp
$Comp
L Isolator:4N35 U2
U 1 1 6131D6F6
P 8150 1000
F 0 "U2" H 8150 683 50  0000 C CNN
F 1 "4N35" H 8150 774 50  0000 C CNN
F 2 "Package_DIP:DIP-6_W7.62mm" H 7950 800 50  0001 L CIN
F 3 "https://www.vishay.com/docs/81181/4n35.pdf" H 8150 1000 50  0001 L CNN
	1    8150 1000
	-1   0    0    1   
$EndComp
Wire Wire Line
	8450 700  8450 900 
Wire Wire Line
	8450 1300 8450 1100
NoConn ~ 7850 1100
$Comp
L Device:CP C1
U 1 1 613378ED
P 7450 950
F 0 "C1" H 7332 904 50  0000 R CNN
F 1 "4.7uF" H 7332 995 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D10.0mm_P3.50mm" H 7488 800 50  0001 C CNN
F 3 "~" H 7450 950 50  0001 C CNN
	1    7450 950 
	-1   0    0    1   
$EndComp
Wire Wire Line
	7850 900  7750 900 
Wire Wire Line
	7750 900  7750 800 
Wire Wire Line
	7750 800  7450 800 
Wire Wire Line
	7850 1000 7750 1000
Wire Wire Line
	7750 1000 7750 1100
Wire Wire Line
	7750 1100 7450 1100
Text GLabel 7450 1500 0    50   Input ~ 0
5VGND
Text GLabel 9050 1700 0    50   Input ~ 0
220VAC(N)
$Comp
L Isolator:4N35 U3
U 1 1 61343D97
P 8150 1700
F 0 "U3" H 8150 1383 50  0000 C CNN
F 1 "4N35" H 8150 1474 50  0000 C CNN
F 2 "Package_DIP:DIP-6_W7.62mm" H 7950 1500 50  0001 L CIN
F 3 "https://www.vishay.com/docs/81181/4n35.pdf" H 8150 1700 50  0001 L CNN
	1    8150 1700
	-1   0    0    1   
$EndComp
Wire Wire Line
	8450 1400 8450 1600
Wire Wire Line
	8450 2000 8450 1800
NoConn ~ 7850 1800
$Comp
L Device:CP C2
U 1 1 61343DA2
P 7450 1650
F 0 "C2" H 7332 1604 50  0000 R CNN
F 1 "4.7uF" H 7332 1695 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D10.0mm_P3.50mm" H 7488 1500 50  0001 C CNN
F 3 "~" H 7450 1650 50  0001 C CNN
	1    7450 1650
	-1   0    0    1   
$EndComp
Wire Wire Line
	7850 1600 7750 1600
Wire Wire Line
	7750 1600 7750 1500
Wire Wire Line
	7750 1500 7450 1500
Wire Wire Line
	7850 1700 7750 1700
Wire Wire Line
	7750 1700 7750 1800
Wire Wire Line
	7750 1800 7450 1800
Text GLabel 7450 2200 0    50   Input ~ 0
5VGND
Text GLabel 9050 2400 0    50   Input ~ 0
220VAC(N)
$Comp
L Isolator:4N35 U4
U 1 1 613483EE
P 8150 2400
F 0 "U4" H 8150 2083 50  0000 C CNN
F 1 "4N35" H 8150 2174 50  0000 C CNN
F 2 "Package_DIP:DIP-6_W7.62mm" H 7950 2200 50  0001 L CIN
F 3 "https://www.vishay.com/docs/81181/4n35.pdf" H 8150 2400 50  0001 L CNN
	1    8150 2400
	-1   0    0    1   
$EndComp
Wire Wire Line
	8450 2100 8450 2300
Wire Wire Line
	8450 2700 8450 2500
NoConn ~ 7850 2500
$Comp
L Device:CP C3
U 1 1 613483F9
P 7450 2350
F 0 "C3" H 7332 2304 50  0000 R CNN
F 1 "4.7uF" H 7332 2395 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D10.0mm_P3.50mm" H 7488 2200 50  0001 C CNN
F 3 "~" H 7450 2350 50  0001 C CNN
	1    7450 2350
	-1   0    0    1   
$EndComp
Wire Wire Line
	7850 2300 7750 2300
Wire Wire Line
	7750 2300 7750 2200
Wire Wire Line
	7750 2200 7450 2200
Wire Wire Line
	7850 2400 7750 2400
Wire Wire Line
	7750 2400 7750 2500
Wire Wire Line
	7750 2500 7450 2500
Text GLabel 7450 2900 0    50   Input ~ 0
5VGND
Text GLabel 9050 3100 0    50   Input ~ 0
220VAC(N)
$Comp
L Isolator:4N35 U5
U 1 1 6134C957
P 8150 3100
F 0 "U5" H 8150 2783 50  0000 C CNN
F 1 "4N35" H 8150 2874 50  0000 C CNN
F 2 "Package_DIP:DIP-6_W7.62mm" H 7950 2900 50  0001 L CIN
F 3 "https://www.vishay.com/docs/81181/4n35.pdf" H 8150 3100 50  0001 L CNN
	1    8150 3100
	-1   0    0    1   
$EndComp
Wire Wire Line
	8450 2800 8450 3000
Wire Wire Line
	8450 3400 8450 3200
NoConn ~ 7850 3200
$Comp
L Device:CP C4
U 1 1 6134C962
P 7450 3050
F 0 "C4" H 7332 3004 50  0000 R CNN
F 1 "4.7uF" H 7332 3095 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D10.0mm_P3.50mm" H 7488 2900 50  0001 C CNN
F 3 "~" H 7450 3050 50  0001 C CNN
	1    7450 3050
	-1   0    0    1   
$EndComp
Wire Wire Line
	7850 3000 7750 3000
Wire Wire Line
	7750 3000 7750 2900
Wire Wire Line
	7750 2900 7450 2900
Wire Wire Line
	7850 3100 7750 3100
Wire Wire Line
	7750 3100 7750 3200
Connection ~ 7450 3200
$Comp
L Converter_ACDC:RAC05-05SK PS1
U 1 1 612EAA71
P 9750 4950
F 0 "PS1" V 9704 5180 50  0000 L CNN
F 1 "RAC05-05SK" V 9795 5180 50  0000 L CNN
F 2 "Converter_ACDC:Converter_ACDC_RECOM_RAC05-xxSK_THT" H 9750 4600 50  0001 C CNN
F 3 "https://www.recom-power.com/pdf/Powerline-AC-DC/RAC05-K.pdf" H 9650 5250 50  0001 C CNN
	1    9750 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	8750 700  8450 700 
Wire Wire Line
	8750 1400 8450 1400
Wire Wire Line
	8750 2100 8450 2100
Wire Wire Line
	8750 2800 8450 2800
Wire Wire Line
	8450 1300 9350 1300
Wire Wire Line
	8450 2000 9350 2000
Wire Wire Line
	8450 2700 9350 2700
Wire Wire Line
	8450 3400 9350 3400
$Comp
L phoenix-1017505:1017505 J4
U 1 1 6133A647
P 8650 4300
F 0 "J4" H 9050 3735 50  0000 C CNN
F 1 "1017505" H 9050 3826 50  0000 C CNN
F 2 "1017505" H 9300 4400 50  0001 L CNN
F 3 "https://www.phoenixcontact.com/online/portal/gb/?uri=pxc-oc-itemdetail:pid=1017505&library=gben&pcck=P-11-01-05&tab=1&selectedCategory=ALL" H 9300 4300 50  0001 L CNN
F 4 "Phoenix Contact TDPT Series 5.08mm Pitch, PCB Terminal Block, PCB Mount, 4 Way" H 9300 4200 50  0001 L CNN "Description"
F 5 "19.2" H 9300 4100 50  0001 L CNN "Height"
F 6 "Phoenix Contact" H 9300 4000 50  0001 L CNN "Manufacturer_Name"
F 7 "1017505" H 9300 3900 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "651-1017505" H 9300 3800 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/Phoenix-Contact/1017505?qs=F5EMLAvA7IDSv5uM7A6HhA%3D%3D" H 9300 3700 50  0001 L CNN "Mouser Price/Stock"
F 10 "1017505" H 9300 3600 50  0001 L CNN "Arrow Part Number"
F 11 "https://www.arrow.com/en/products/1017505/phoenix-contact" H 9300 3500 50  0001 L CNN "Arrow Price/Stock"
	1    8650 4300
	-1   0    0    1   
$EndComp
Text GLabel 7850 4000 1    50   Input ~ 0
Sens1
Text GLabel 8650 4000 2    50   Input ~ 0
Sens1
Text GLabel 7750 4100 0    50   Input ~ 0
Sens2
Text GLabel 8650 4100 2    50   Input ~ 0
Sens2
Text GLabel 7750 4200 0    50   Input ~ 0
Sens3
Text GLabel 8650 4200 2    50   Input ~ 0
Sens3
Text GLabel 7850 4300 3    50   Input ~ 0
Sens4
Text GLabel 8650 4300 2    50   Input ~ 0
Sens4
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 61341516
P 7750 4100
F 0 "#FLG0101" H 7750 4175 50  0001 C CNN
F 1 "PWR_FLAG" H 7750 4273 50  0000 C CNN
F 2 "" H 7750 4100 50  0001 C CNN
F 3 "~" H 7750 4100 50  0001 C CNN
	1    7750 4100
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 613428C9
P 7750 4200
F 0 "#FLG0102" H 7750 4275 50  0001 C CNN
F 1 "PWR_FLAG" H 7750 4373 50  0000 C CNN
F 2 "" H 7750 4200 50  0001 C CNN
F 3 "~" H 7750 4200 50  0001 C CNN
	1    7750 4200
	-1   0    0    1   
$EndComp
Wire Wire Line
	7850 4100 7750 4100
Wire Wire Line
	7850 4200 7750 4200
$Comp
L phoenix-1017505:1017505 J1
U 1 1 6135584E
P 2800 2500
F 0 "J1" H 3200 1935 50  0000 C CNN
F 1 "1017505" H 3200 2026 50  0000 C CNN
F 2 "1017505" H 3450 2600 50  0001 L CNN
F 3 "https://www.phoenixcontact.com/online/portal/gb/?uri=pxc-oc-itemdetail:pid=1017505&library=gben&pcck=P-11-01-05&tab=1&selectedCategory=ALL" H 3450 2500 50  0001 L CNN
F 4 "Phoenix Contact TDPT Series 5.08mm Pitch, PCB Terminal Block, PCB Mount, 4 Way" H 3450 2400 50  0001 L CNN "Description"
F 5 "19.2" H 3450 2300 50  0001 L CNN "Height"
F 6 "Phoenix Contact" H 3450 2200 50  0001 L CNN "Manufacturer_Name"
F 7 "1017505" H 3450 2100 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "651-1017505" H 3450 2000 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/Phoenix-Contact/1017505?qs=F5EMLAvA7IDSv5uM7A6HhA%3D%3D" H 3450 1900 50  0001 L CNN "Mouser Price/Stock"
F 10 "1017505" H 3450 1800 50  0001 L CNN "Arrow Part Number"
F 11 "https://www.arrow.com/en/products/1017505/phoenix-contact" H 3450 1700 50  0001 L CNN "Arrow Price/Stock"
	1    2800 2500
	-1   0    0    1   
$EndComp
Text GLabel 2800 2400 2    50   Input ~ 0
REO3
Text GLabel 2800 2200 2    50   Input ~ 0
REO1
Text GLabel 2800 2300 2    50   Input ~ 0
REO2
Text GLabel 2800 2500 2    50   Input ~ 0
REO4
$Comp
L phoenix-1017505:1017505 J2
U 1 1 61366C48
P 8650 5100
F 0 "J2" H 9050 4535 50  0000 C CNN
F 1 "1017505" H 9050 4626 50  0000 C CNN
F 2 "1017505" H 9300 5200 50  0001 L CNN
F 3 "https://www.phoenixcontact.com/online/portal/gb/?uri=pxc-oc-itemdetail:pid=1017505&library=gben&pcck=P-11-01-05&tab=1&selectedCategory=ALL" H 9300 5100 50  0001 L CNN
F 4 "Phoenix Contact TDPT Series 5.08mm Pitch, PCB Terminal Block, PCB Mount, 4 Way" H 9300 5000 50  0001 L CNN "Description"
F 5 "19.2" H 9300 4900 50  0001 L CNN "Height"
F 6 "Phoenix Contact" H 9300 4800 50  0001 L CNN "Manufacturer_Name"
F 7 "1017505" H 9300 4700 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "651-1017505" H 9300 4600 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/Phoenix-Contact/1017505?qs=F5EMLAvA7IDSv5uM7A6HhA%3D%3D" H 9300 4500 50  0001 L CNN "Mouser Price/Stock"
F 10 "1017505" H 9300 4400 50  0001 L CNN "Arrow Part Number"
F 11 "https://www.arrow.com/en/products/1017505/phoenix-contact" H 9300 4300 50  0001 L CNN "Arrow Price/Stock"
	1    8650 5100
	-1   0    0    1   
$EndComp
Text GLabel 8650 4900 2    50   Input ~ 0
Earth
Text GLabel 8650 5000 2    50   Input ~ 0
Earth
Text GLabel 8650 5100 2    50   Input ~ 0
220VAC(N)
Text GLabel 8650 4800 2    50   Input ~ 0
220VAC(L)
Wire Wire Line
	8650 4800 8650 4700
Wire Wire Line
	9350 4700 9350 4850
Wire Wire Line
	8650 4700 9350 4700
Wire Wire Line
	8650 5100 8650 5200
Wire Wire Line
	9350 5200 9350 5050
Wire Wire Line
	8650 5200 9350 5200
Text GLabel 7750 4900 0    50   Input ~ 0
Earth
$Comp
L power:PWR_FLAG #FLG0103
U 1 1 613786F8
P 7750 5000
F 0 "#FLG0103" H 7750 5075 50  0001 C CNN
F 1 "PWR_FLAG" H 7750 5173 50  0000 C CNN
F 2 "" H 7750 5000 50  0001 C CNN
F 3 "~" H 7750 5000 50  0001 C CNN
	1    7750 5000
	-1   0    0    1   
$EndComp
Text GLabel 7750 5000 0    50   Input ~ 0
Earth
Wire Wire Line
	7850 4800 7850 4750
Wire Wire Line
	7850 4750 7750 4750
Wire Wire Line
	7850 4900 7750 4900
Wire Wire Line
	7850 5000 7750 5000
Wire Wire Line
	7850 5100 7850 5150
Wire Wire Line
	7850 5150 7750 5150
Text GLabel 5950 2800 1    50   Input ~ 0
GPIO34
Text GLabel 7450 1100 3    50   Input ~ 0
GPIO34
Text GLabel 5650 2800 1    50   Input ~ 0
GPIO33
Text GLabel 7450 3200 3    50   Input ~ 0
GPIO33
Text GLabel 5850 2800 1    50   Input ~ 0
GPIO35
Text GLabel 5750 2800 1    50   Input ~ 0
GPIO32
Text GLabel 7450 2500 3    50   Input ~ 0
GPIO32
Text GLabel 7450 1800 3    50   Input ~ 0
GPIO35
Wire Wire Line
	7550 3200 7450 3200
Wire Wire Line
	7450 3200 7750 3200
Connection ~ 7450 2500
$EndSCHEMATC
