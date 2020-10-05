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
L ESP32DevKit:ESP32-DevKitC_V4 MD1
U 1 1 5F7A53BE
P 4500 2450
F 0 "MD1" H 5250 2715 50  0000 C CNN
F 1 "ESP32-DevKitC_V4" H 5250 2624 50  0000 C CNN
F 2 "ESP32 DevKit:Espressif-ESP32-DevKitC_V4-0-0-MFG" H 4500 2850 50  0001 L CNN
F 3 "https://docs.espressif.com/projects/esp-idf/en/latest/get-started/get-started-devkitc.html" H 4500 2950 50  0001 L CNN
F 4 "No" H 4500 3050 50  0001 L CNN "automotive"
F 5 "2.4-2.5GHz" H 4500 3150 50  0001 L CNN "bandwidth"
F 6 "UNK" H 4500 3250 50  0001 L CNN "category"
F 7 "Integrated Circuits (ICs)" H 4500 3350 50  0001 L CNN "device class L1"
F 8 "RF Semiconductors and Devices" H 4500 3450 50  0001 L CNN "device class L2"
F 9 "Transceivers" H 4500 3550 50  0001 L CNN "device class L3"
F 10 "I2C,SPI,UART,I2S" H 4500 3650 50  0001 L CNN "interface"
F 11 "Yes" H 4500 3750 50  0001 L CNN "lead free"
F 12 "0f6b35fd4d8e66ba" H 4500 3850 50  0001 L CNN "library id"
F 13 "Espressif" H 4500 3950 50  0001 L CNN "manufacturer"
F 14 "2.5GHz" H 4500 4050 50  0001 L CNN "max frequency"
F 15 "5V" H 4500 4150 50  0001 L CNN "max supply voltage"
F 16 "2.7V" H 4500 4250 50  0001 L CNN "min supply voltage"
F 17 "356-ESP32-DEVKITC" H 4500 4350 50  0001 L CNN "mouser part number"
F 18 "16" H 4500 4450 50  0001 L CNN "number of ADC channels"
F 19 "22" H 4500 4550 50  0001 L CNN "number of GPIO"
F 20 "PTH_WIFI-MODULE" H 4500 4650 50  0001 L CNN "package"
F 21 "Yes" H 4500 4750 50  0001 L CNN "rohs"
F 22 "-40°C" H 4500 4850 50  0001 L CNN "temperature range low"
	1    4500 2450
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x04_Female J2
U 1 1 5F7B0A60
P 7600 4100
F 0 "J2" H 7628 4076 50  0000 L CNN
F 1 "Conn_01x04_Female" H 7628 3985 50  0000 L CNN
F 2 "Connector_PinHeader_1.27mm:PinHeader_1x04_P1.27mm_Vertical" H 7600 4100 50  0001 C CNN
F 3 "~" H 7600 4100 50  0001 C CNN
	1    7600 4100
	1    0    0    -1  
$EndComp
$Comp
L power:+1V5 #PWR07
U 1 1 5F7B1305
P 8000 3900
F 0 "#PWR07" H 8000 3750 50  0001 C CNN
F 1 "+1V5" V 8015 4028 50  0000 L CNN
F 2 "" H 8000 3900 50  0001 C CNN
F 3 "" H 8000 3900 50  0001 C CNN
	1    8000 3900
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR05
U 1 1 5F7B1B47
P 7400 4100
F 0 "#PWR05" H 7400 3850 50  0001 C CNN
F 1 "GND" V 7405 3972 50  0000 R CNN
F 2 "" H 7400 4100 50  0001 C CNN
F 3 "" H 7400 4100 50  0001 C CNN
	1    7400 4100
	0    1    1    0   
$EndComp
Wire Wire Line
	6000 4350 7150 4350
Wire Wire Line
	7150 4350 7150 4200
Wire Wire Line
	7150 4200 7400 4200
Wire Wire Line
	7400 4300 7200 4300
Wire Wire Line
	7200 4300 7200 4450
Wire Wire Line
	7200 4450 6000 4450
$Comp
L power:GND #PWR04
U 1 1 5F7B3FE1
P 6000 4850
F 0 "#PWR04" H 6000 4600 50  0001 C CNN
F 1 "GND" V 6005 4722 50  0000 R CNN
F 2 "" H 6000 4850 50  0001 C CNN
F 3 "" H 6000 4850 50  0001 C CNN
	1    6000 4850
	0    -1   -1   0   
$EndComp
$Comp
L power:+1V5 #PWR02
U 1 1 5F7B51D4
P 3800 2550
F 0 "#PWR02" H 3800 2400 50  0001 C CNN
F 1 "+1V5" V 3815 2678 50  0000 L CNN
F 2 "" H 3800 2550 50  0001 C CNN
F 3 "" H 3800 2550 50  0001 C CNN
	1    3800 2550
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR01
U 1 1 5F7B5835
P 3800 2450
F 0 "#PWR01" H 3800 2200 50  0001 C CNN
F 1 "GND" V 3805 2322 50  0000 R CNN
F 2 "" H 3800 2450 50  0001 C CNN
F 3 "" H 3800 2450 50  0001 C CNN
	1    3800 2450
	0    -1   -1   0   
$EndComp
$Comp
L power:+1V5 #PWR03
U 1 1 5F7B6421
P 4500 2550
F 0 "#PWR03" H 4500 2400 50  0001 C CNN
F 1 "+1V5" V 4515 2678 50  0000 L CNN
F 2 "" H 4500 2550 50  0001 C CNN
F 3 "" H 4500 2550 50  0001 C CNN
	1    4500 2550
	0    -1   -1   0   
$EndComp
Text GLabel 4500 2450 0    50   Output ~ 0
3.3V
$Comp
L Connector:Conn_01x04_Female J3
U 1 1 5F7B7383
P 8200 3150
F 0 "J3" H 8228 3126 50  0000 L CNN
F 1 "Conn_01x04_Female" H 8228 3035 50  0000 L CNN
F 2 "Connector_PinHeader_1.27mm:PinHeader_1x04_P1.27mm_Vertical" H 8200 3150 50  0001 C CNN
F 3 "~" H 8200 3150 50  0001 C CNN
	1    8200 3150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 5F7B7EAA
P 8000 3050
F 0 "#PWR06" H 8000 2800 50  0001 C CNN
F 1 "GND" V 8005 2922 50  0000 R CNN
F 2 "" H 8000 3050 50  0001 C CNN
F 3 "" H 8000 3050 50  0001 C CNN
	1    8000 3050
	0    1    1    0   
$EndComp
Wire Wire Line
	7700 3350 8000 3350
$Comp
L Device:R R3
U 1 1 5F7B8980
P 7550 3650
F 0 "R3" V 7757 3650 50  0000 C CNN
F 1 "10k" V 7666 3650 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 7480 3650 50  0001 C CNN
F 3 "~" H 7550 3650 50  0001 C CNN
	1    7550 3650
	0    -1   -1   0   
$EndComp
Text GLabel 7400 3650 0    50   Input ~ 0
3.3V
Wire Wire Line
	7700 3350 7700 3650
Wire Wire Line
	7700 3650 7700 3750
Connection ~ 7700 3650
Wire Wire Line
	7150 3650 7150 3450
Wire Wire Line
	7150 3250 8000 3250
$Comp
L Device:R R2
U 1 1 5F7BF1BF
P 7300 3450
F 0 "R2" V 7507 3450 50  0000 C CNN
F 1 "10k" V 7416 3450 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 7230 3450 50  0001 C CNN
F 3 "~" H 7300 3450 50  0001 C CNN
	1    7300 3450
	0    -1   -1   0   
$EndComp
Connection ~ 7150 3450
Wire Wire Line
	7150 3450 7150 3250
Text GLabel 7450 3450 2    50   Input ~ 0
3.3V
Wire Wire Line
	7050 3550 7050 3450
Wire Wire Line
	7050 3150 8000 3150
$Comp
L Device:R R1
U 1 1 5F7C0148
P 6900 3450
F 0 "R1" V 7107 3450 50  0000 C CNN
F 1 "10k" V 7016 3450 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 6830 3450 50  0001 C CNN
F 3 "~" H 6900 3450 50  0001 C CNN
	1    6900 3450
	0    -1   -1   0   
$EndComp
Connection ~ 7050 3450
Wire Wire Line
	7050 3450 7050 3150
Wire Wire Line
	6000 3750 7700 3750
Wire Wire Line
	6000 3650 7150 3650
Wire Wire Line
	6000 3550 7050 3550
Text GLabel 6750 3450 0    50   Input ~ 0
3.3V
NoConn ~ 6000 2450
NoConn ~ 6000 2550
NoConn ~ 6000 2650
NoConn ~ 6000 2750
NoConn ~ 6000 2850
NoConn ~ 6000 2950
NoConn ~ 6000 3050
NoConn ~ 6000 3150
NoConn ~ 6000 3250
NoConn ~ 6000 3350
NoConn ~ 6000 3450
NoConn ~ 6000 3850
NoConn ~ 6000 3950
NoConn ~ 6000 4050
NoConn ~ 6000 4150
NoConn ~ 6000 4250
NoConn ~ 6000 4550
NoConn ~ 6000 4950
NoConn ~ 6000 5050
NoConn ~ 4500 5050
NoConn ~ 4500 4950
NoConn ~ 4500 4850
NoConn ~ 4500 4750
NoConn ~ 4500 3750
NoConn ~ 4500 3650
NoConn ~ 4500 3450
NoConn ~ 4500 3250
NoConn ~ 4500 3050
NoConn ~ 4500 2850
NoConn ~ 4500 2750
$Comp
L Connector:Conn_01x02_Female J1
U 1 1 5F7B283D
P 3600 2550
F 0 "J1" H 3492 2225 50  0000 C CNN
F 1 "Conn_01x02_Female" H 3492 2316 50  0000 C CNN
F 2 "Connector_PinHeader_1.27mm:PinHeader_1x02_P1.27mm_Vertical" H 3600 2550 50  0001 C CNN
F 3 "~" H 3600 2550 50  0001 C CNN
	1    3600 2550
	-1   0    0    1   
$EndComp
$EndSCHEMATC
