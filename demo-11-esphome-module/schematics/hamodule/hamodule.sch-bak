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
$Comp
L RAC15-05SK:RAC15-05SK PS5
U 1 1 61265DDA
P 10150 5100
F 0 "PS5" V 10104 5430 50  0000 L CNN
F 1 "RAC15-05SK" V 10195 5430 50  0000 L CNN
F 2 "RAC15-05SK:CONV_RAC15-05SK" H 10150 5100 50  0001 L BNN
F 3 "" H 10150 5100 50  0001 L BNN
F 4 "23.0mm" H 10150 5100 50  0001 L BNN "MAXIMUM_PACKAGE_HEIGHT"
F 5 "Manufacturer Recommendations" H 10150 5100 50  0001 L BNN "STANDARD"
F 6 "3" H 10150 5100 50  0001 L BNN "PARTREV"
F 7 "RECOM" H 10150 5100 50  0001 L BNN "MANUFACTURER"
	1    10150 5100
	0    1    1    0   
$EndComp
Text GLabel 10350 4350 2    50   Input ~ 0
220VAC(L)
Text GLabel 9950 4350 0    50   Input ~ 0
220VAC(N)
Text GLabel 6350 4400 3    50   Input ~ 0
5VGND
Text GLabel 4550 2800 0    50   Input ~ 0
5V+
Text GLabel 10350 6000 3    50   Input ~ 0
5V+
Text GLabel 9950 6000 3    50   Input ~ 0
5VGND
Wire Wire Line
	9950 6000 9950 5800
Wire Wire Line
	10350 6000 10350 5800
$Comp
L ESP32-DEVKITC-32D:ESP32-DEVKITC-32D U1
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
$Comp
L Converter_ACDC:RAC05-05SK PS1
U 1 1 612E6ABE
P 9800 950
F 0 "PS1" H 9800 583 50  0000 C CNN
F 1 "RAC05-05SK" H 9800 674 50  0000 C CNN
F 2 "Converter_ACDC:Converter_ACDC_RECOM_RAC05-xxSK_THT" H 9800 600 50  0001 C CNN
F 3 "https://www.recom-power.com/pdf/Powerline-AC-DC/RAC05-K.pdf" H 9700 1250 50  0001 C CNN
	1    9800 950 
	-1   0    0    1   
$EndComp
$Comp
L Converter_ACDC:RAC05-05SK PS2
U 1 1 612F0ADD
P 9800 1600
F 0 "PS2" H 9800 1233 50  0000 C CNN
F 1 "RAC05-05SK" H 9800 1324 50  0000 C CNN
F 2 "Converter_ACDC:Converter_ACDC_RECOM_RAC05-xxSK_THT" H 9800 1250 50  0001 C CNN
F 3 "https://www.recom-power.com/pdf/Powerline-AC-DC/RAC05-K.pdf" H 9700 1900 50  0001 C CNN
	1    9800 1600
	-1   0    0    1   
$EndComp
$Comp
L Converter_ACDC:RAC05-05SK PS3
U 1 1 612F15B0
P 9800 2300
F 0 "PS3" H 9800 1933 50  0000 C CNN
F 1 "RAC05-05SK" H 9800 2024 50  0000 C CNN
F 2 "Converter_ACDC:Converter_ACDC_RECOM_RAC05-xxSK_THT" H 9800 1950 50  0001 C CNN
F 3 "https://www.recom-power.com/pdf/Powerline-AC-DC/RAC05-K.pdf" H 9700 2600 50  0001 C CNN
	1    9800 2300
	-1   0    0    1   
$EndComp
$Comp
L Converter_ACDC:RAC05-05SK PS4
U 1 1 612F1D1F
P 9800 3000
F 0 "PS4" H 9800 2633 50  0000 C CNN
F 1 "RAC05-05SK" H 9800 2724 50  0000 C CNN
F 2 "Converter_ACDC:Converter_ACDC_RECOM_RAC05-xxSK_THT" H 9800 2650 50  0001 C CNN
F 3 "https://www.recom-power.com/pdf/Powerline-AC-DC/RAC05-K.pdf" H 9700 3300 50  0001 C CNN
	1    9800 3000
	-1   0    0    1   
$EndComp
Text GLabel 10200 850  2    50   Input ~ 0
220VAC(N)
Text GLabel 10200 1500 2    50   Input ~ 0
220VAC(N)
Text GLabel 10200 2200 2    50   Input ~ 0
220VAC(N)
Text GLabel 10200 2900 2    50   Input ~ 0
220VAC(N)
$Comp
L Device:R R8
U 1 1 61353CF0
P 9250 3100
F 0 "R8" V 9043 3100 50  0001 C CNN
F 1 "425" V 9135 3100 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 9180 3100 50  0001 C CNN
F 3 "~" H 9250 3100 50  0001 C CNN
	1    9250 3100
	0    1    1    0   
$EndComp
$Comp
L Device:R R7
U 1 1 613540B8
P 9250 2400
F 0 "R7" V 9043 2400 50  0001 C CNN
F 1 "425" V 9135 2400 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 9180 2400 50  0001 C CNN
F 3 "~" H 9250 2400 50  0001 C CNN
	1    9250 2400
	0    1    1    0   
$EndComp
$Comp
L Device:R R6
U 1 1 613548DB
P 9250 1700
F 0 "R6" V 9043 1700 50  0001 C CNN
F 1 "425" V 9135 1700 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 9180 1700 50  0001 C CNN
F 3 "~" H 9250 1700 50  0001 C CNN
	1    9250 1700
	0    1    1    0   
$EndComp
$Comp
L Device:R R5
U 1 1 61354B0C
P 9250 1050
F 0 "R5" V 9043 1050 50  0001 C CNN
F 1 "425" V 9135 1050 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 9180 1050 50  0001 C CNN
F 3 "~" H 9250 1050 50  0001 C CNN
	1    9250 1050
	0    1    1    0   
$EndComp
Wire Wire Line
	9400 850  8950 850 
Wire Wire Line
	8950 850  8950 1600
Wire Wire Line
	9100 1050 9000 1050
Wire Wire Line
	9000 1050 9000 1700
Wire Wire Line
	9000 1700 8950 1700
Wire Wire Line
	9400 1500 9050 1500
Wire Wire Line
	9050 1500 9050 1800
Wire Wire Line
	9050 1800 8950 1800
Wire Wire Line
	9100 1700 9100 1900
Wire Wire Line
	9100 1900 8950 1900
Wire Wire Line
	9400 2200 9350 2200
Wire Wire Line
	9350 2200 9350 2000
Wire Wire Line
	9350 2000 8950 2000
Wire Wire Line
	8950 2100 9100 2100
Wire Wire Line
	9100 2100 9100 2400
Wire Wire Line
	8950 2200 9050 2200
Wire Wire Line
	9050 2200 9050 2900
Wire Wire Line
	9050 2900 9400 2900
Wire Wire Line
	9100 3100 9000 3100
Wire Wire Line
	9000 3100 9000 2300
Wire Wire Line
	9000 2300 8950 2300
Text GLabel 6350 2750 1    50   Input ~ 0
3.3V+
Text GLabel 6600 2300 0    50   Input ~ 0
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
Text GLabel 7150 1600 0    50   Input ~ 0
5VGND
$Comp
L Device:R R12
U 1 1 6133C9F4
P 6750 2300
F 0 "R12" V 6543 2300 50  0000 C CNN
F 1 "10K" V 6634 2300 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 6680 2300 50  0001 C CNN
F 3 "~" H 6750 2300 50  0001 C CNN
	1    6750 2300
	0    1    1    0   
$EndComp
Text GLabel 7150 1800 0    50   Input ~ 0
5VGND
Text GLabel 7150 2200 0    50   Input ~ 0
5VGND
Text GLabel 7150 2000 0    50   Input ~ 0
5VGND
Text GLabel 6250 2100 0    50   Input ~ 0
3.3V+
$Comp
L Device:R R11
U 1 1 6137EFCB
P 6400 2100
F 0 "R11" V 6193 2100 50  0000 C CNN
F 1 "10K" V 6284 2100 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 6330 2100 50  0001 C CNN
F 3 "~" H 6400 2100 50  0001 C CNN
	1    6400 2100
	0    1    1    0   
$EndComp
Text GLabel 5850 1900 0    50   Input ~ 0
3.3V+
$Comp
L Device:R R10
U 1 1 61385C88
P 6000 1900
F 0 "R10" V 5793 1900 50  0000 C CNN
F 1 "10K" V 5884 1900 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 5930 1900 50  0001 C CNN
F 3 "~" H 6000 1900 50  0001 C CNN
	1    6000 1900
	0    1    1    0   
$EndComp
Text GLabel 5350 1700 0    50   Input ~ 0
3.3V+
$Comp
L Device:R R9
U 1 1 613892F5
P 5500 1700
F 0 "R9" V 5293 1700 50  0000 C CNN
F 1 "10K" V 5384 1700 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 5430 1700 50  0001 C CNN
F 3 "~" H 5500 1700 50  0001 C CNN
	1    5500 1700
	0    1    1    0   
$EndComp
Wire Wire Line
	7000 2300 7000 2350
Wire Wire Line
	7150 2100 6600 2100
Wire Wire Line
	6150 1900 6200 1900
Wire Wire Line
	7150 1700 5700 1700
Wire Wire Line
	6600 2100 6600 2200
Connection ~ 6600 2100
Wire Wire Line
	6600 2100 6550 2100
Wire Wire Line
	6200 1900 6200 2000
Connection ~ 6200 1900
Wire Wire Line
	6200 1900 7150 1900
Wire Wire Line
	5700 1700 5700 1800
Wire Wire Line
	5700 1800 5550 1800
Connection ~ 5700 1700
Wire Wire Line
	5700 1700 5650 1700
Wire Wire Line
	6900 2300 6950 2300
Wire Wire Line
	6950 2300 6950 2400
Wire Wire Line
	6950 2400 5950 2400
Wire Wire Line
	5950 2400 5950 2800
Connection ~ 6950 2300
Wire Wire Line
	6950 2300 7150 2300
Wire Wire Line
	5850 2200 5850 2800
Wire Wire Line
	5850 2200 6600 2200
Wire Wire Line
	5750 2000 5750 2800
Wire Wire Line
	5750 2000 6200 2000
Wire Wire Line
	5550 1800 5550 2000
Wire Wire Line
	5550 2000 5650 2000
Wire Wire Line
	5650 2000 5650 2800
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
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 6149F0EA
P 10900 1950
F 0 "#FLG0101" H 10900 2025 50  0001 C CNN
F 1 "PWR_FLAG" V 10900 2077 50  0000 L CNN
F 2 "" H 10900 1950 50  0001 C CNN
F 3 "~" H 10900 1950 50  0001 C CNN
	1    10900 1950
	0    -1   -1   0   
$EndComp
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 6149FF6D
P 11000 1950
F 0 "#FLG0102" H 11000 2025 50  0001 C CNN
F 1 "PWR_FLAG" V 11000 2078 50  0000 L CNN
F 2 "" H 11000 1950 50  0001 C CNN
F 3 "~" H 11000 1950 50  0001 C CNN
	1    11000 1950
	0    1    1    0   
$EndComp
$Comp
L power:PWR_FLAG #FLG0103
U 1 1 614A098C
P 10900 2750
F 0 "#FLG0103" H 10900 2825 50  0001 C CNN
F 1 "PWR_FLAG" V 10900 2877 50  0000 L CNN
F 2 "" H 10900 2750 50  0001 C CNN
F 3 "~" H 10900 2750 50  0001 C CNN
	1    10900 2750
	0    -1   -1   0   
$EndComp
$Comp
L power:PWR_FLAG #FLG0104
U 1 1 614A13D9
P 11000 2750
F 0 "#FLG0104" H 11000 2825 50  0001 C CNN
F 1 "PWR_FLAG" V 11000 2878 50  0000 L CNN
F 2 "" H 11000 2750 50  0001 C CNN
F 3 "~" H 11000 2750 50  0001 C CNN
	1    11000 2750
	0    1    1    0   
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
L wire-to-pcb-phoenix:1864053 J2
U 1 1 6151A763
P 10200 3450
F 0 "J2" V 10554 3578 50  0000 L CNN
F 1 "1864053" V 10645 3578 50  0000 L CNN
F 2 "1864053:1864053" H 10850 3550 50  0001 L CNN
F 3 "https://www.phoenixcontact.com/online/portal/gb?uri=pxc-oc-itemdetail:pid=1864053&library=gben&tab=1" H 10850 3450 50  0001 L CNN
F 4 "Push spring connector 5mm pitch 4 way Phoenix Contact SDC Series 5mm Pitch Straight Pluggable Terminal Block, Plug with Plug In Termination, PCB Mount, 4 Way" H 10850 3350 50  0001 L CNN "Description"
F 5 "16.2" H 10850 3250 50  0001 L CNN "Height"
F 6 "Phoenix Contact" H 10850 3150 50  0001 L CNN "Manufacturer_Name"
F 7 "1864053" H 10850 3050 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "651-1864053" H 10850 2950 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/Phoenix-Contact/1864053?qs=k%252BwXAfPrzCnElnWx0AGzqw%3D%3D" H 10850 2850 50  0001 L CNN "Mouser Price/Stock"
F 10 "1864053" H 10850 2750 50  0001 L CNN "Arrow Part Number"
F 11 "https://www.arrow.com/en/products/1864053/phoenix-contact" H 10850 2650 50  0001 L CNN "Arrow Price/Stock"
	1    10200 3450
	0    1    1    0   
$EndComp
$Comp
L power:PWR_FLAG #FLG0106
U 1 1 614BE1E4
P 10350 4250
F 0 "#FLG0106" H 10350 4325 50  0001 C CNN
F 1 "PWR_FLAG" V 10350 4378 50  0000 L CNN
F 2 "" H 10350 4250 50  0001 C CNN
F 3 "~" H 10350 4250 50  0001 C CNN
	1    10350 4250
	0    1    1    0   
$EndComp
$Comp
L power:PWR_FLAG #FLG0105
U 1 1 615325C8
P 9950 4250
F 0 "#FLG0105" H 9950 4325 50  0001 C CNN
F 1 "PWR_FLAG" V 9950 4377 50  0000 L CNN
F 2 "" H 9950 4250 50  0001 C CNN
F 3 "~" H 9950 4250 50  0001 C CNN
	1    9950 4250
	0    -1   -1   0   
$EndComp
NoConn ~ 10500 3900
Wire Wire Line
	10100 4250 9950 4250
Connection ~ 9950 4250
Wire Wire Line
	9950 4250 9950 4400
Wire Wire Line
	10200 4250 10350 4250
Connection ~ 10350 4250
Wire Wire Line
	10350 4250 10350 4400
Text GLabel 10100 3300 0    50   Input ~ 0
Earth
$Comp
L wire-to-pcb-phoenix:1864053 J3
U 1 1 61519CCA
P 11000 1950
F 0 "J3" V 11354 2078 50  0000 L CNN
F 1 "1864053" V 11400 1400 50  0000 L CNN
F 2 "1864053:1864053" H 11650 2050 50  0001 L CNN
F 3 "https://www.phoenixcontact.com/online/portal/gb?uri=pxc-oc-itemdetail:pid=1864053&library=gben&tab=1" H 11650 1950 50  0001 L CNN
F 4 "Push spring connector 5mm pitch 4 way Phoenix Contact SDC Series 5mm Pitch Straight Pluggable Terminal Block, Plug with Plug In Termination, PCB Mount, 4 Way" H 11650 1850 50  0001 L CNN "Description"
F 5 "16.2" H 11650 1750 50  0001 L CNN "Height"
F 6 "Phoenix Contact" H 11650 1650 50  0001 L CNN "Manufacturer_Name"
F 7 "1864053" H 11650 1550 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "651-1864053" H 11650 1450 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/Phoenix-Contact/1864053?qs=k%252BwXAfPrzCnElnWx0AGzqw%3D%3D" H 11650 1350 50  0001 L CNN "Mouser Price/Stock"
F 10 "1864053" H 11650 1250 50  0001 L CNN "Arrow Part Number"
F 11 "https://www.arrow.com/en/products/1864053/phoenix-contact" H 11650 1150 50  0001 L CNN "Arrow Price/Stock"
	1    11000 1950
	0    1    1    0   
$EndComp
$Comp
L 2021-08-26_19-10-02:K847PH U2
U 1 1 61365E02
P 8950 2300
F 0 "U2" H 9850 1213 60  0000 C CNN
F 1 "K847PH" H 9850 1319 60  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 9850 2540 60  0001 C CNN
F 3 "" H 8950 2300 60  0000 C CNN
	1    8950 2300
	-1   0    0    1   
$EndComp
Text GLabel 11000 2750 3    50   Input ~ 0
Sens1
Text GLabel 10900 2750 3    50   Input ~ 0
Sens3
Text GLabel 10900 1950 1    50   Input ~ 0
Sens4
Text GLabel 11000 1950 1    50   Input ~ 0
Sens2
Text GLabel 10200 3100 2    50   Input ~ 0
Sens1
Text GLabel 10200 1700 2    50   Input ~ 0
Sens2
Text GLabel 10200 1050 2    50   Input ~ 0
Sens3
Text GLabel 10200 2400 2    50   Input ~ 0
Sens4
$Comp
L wire-to-pcb-phoenix:1864053 J1
U 1 1 614FCDBA
P 1000 5150
F 0 "J1" V 1446 4922 50  0000 R CNN
F 1 "1864053" V 1355 4922 50  0000 R CNN
F 2 "1864053:1864053" H 1650 5250 50  0001 L CNN
F 3 "https://www.phoenixcontact.com/online/portal/gb?uri=pxc-oc-itemdetail:pid=1864053&library=gben&tab=1" H 1650 5150 50  0001 L CNN
F 4 "Push spring connector 5mm pitch 4 way Phoenix Contact SDC Series 5mm Pitch Straight Pluggable Terminal Block, Plug with Plug In Termination, PCB Mount, 4 Way" H 1650 5050 50  0001 L CNN "Description"
F 5 "16.2" H 1650 4950 50  0001 L CNN "Height"
F 6 "Phoenix Contact" H 1650 4850 50  0001 L CNN "Manufacturer_Name"
F 7 "1864053" H 1650 4750 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "651-1864053" H 1650 4650 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/Phoenix-Contact/1864053?qs=k%252BwXAfPrzCnElnWx0AGzqw%3D%3D" H 1650 4550 50  0001 L CNN "Mouser Price/Stock"
F 10 "1864053" H 1650 4450 50  0001 L CNN "Arrow Part Number"
F 11 "https://www.arrow.com/en/products/1864053/phoenix-contact" H 1650 4350 50  0001 L CNN "Arrow Price/Stock"
	1    1000 5150
	0    -1   -1   0   
$EndComp
Text GLabel 1100 4350 1    50   Input ~ 0
REO3
Text GLabel 2050 5650 0    50   Input ~ 0
REO3
Text GLabel 1000 4350 1    50   Input ~ 0
REO1
Text GLabel 2050 3200 0    50   Input ~ 0
REO1
Text GLabel 2050 4400 0    50   Input ~ 0
REO2
Text GLabel 1000 5150 3    50   Input ~ 0
REO2
Text GLabel 1100 5150 3    50   Input ~ 0
REO4
Text GLabel 2050 6900 0    50   Input ~ 0
REO4
Wire Wire Line
	2050 3700 2000 3700
Connection ~ 2050 3700
$Comp
L power:PWR_FLAG #FLG0108
U 1 1 61871BD7
P 10100 3400
F 0 "#FLG0108" H 10100 3475 50  0001 C CNN
F 1 "PWR_FLAG" V 10100 3527 50  0000 L CNN
F 2 "" H 10100 3400 50  0001 C CNN
F 3 "~" H 10100 3400 50  0001 C CNN
	1    10100 3400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10100 3300 10100 3400
Connection ~ 10100 3400
Wire Wire Line
	10100 3400 10100 3450
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
Text GLabel 10200 3450 2    50   Input ~ 0
Earth
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
$Comp
L Mechanical:MountingHole_Pad H8
U 1 1 618C5DB7
P 2050 1000
F 0 "H8" H 2150 1049 50  0000 L CNN
F 1 "MountingHole_Pad" H 2150 958 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_ISO14580_Pad" H 2050 1000 50  0001 C CNN
F 3 "~" H 2050 1000 50  0001 C CNN
	1    2050 1000
	1    0    0    -1  
$EndComp
Text GLabel 1450 1100 3    50   Input ~ 0
Earth
Text GLabel 1650 1100 3    50   Input ~ 0
Earth
Text GLabel 1850 1100 3    50   Input ~ 0
Earth
Text GLabel 2050 1100 3    50   Input ~ 0
Earth
Text GLabel 2250 1100 3    50   Input ~ 0
Earth
Text GLabel 2450 1100 3    50   Input ~ 0
Earth
Text GLabel 2650 1100 3    50   Input ~ 0
Earth
Text GLabel 2850 1100 3    50   Input ~ 0
Earth
$EndSCHEMATC
