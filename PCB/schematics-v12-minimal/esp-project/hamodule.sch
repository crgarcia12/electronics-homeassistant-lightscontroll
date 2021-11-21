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
NoConn ~ 11650 4450
NoConn ~ 550  2450
$Comp
L Mechanical:MountingHole_Pad H6
U 1 1 618C4621
P 1800 7500
F 0 "H6" H 1900 7549 50  0001 L CNN
F 1 "MountingHole_Pad" H 1900 7458 50  0001 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_ISO14580_Pad" H 1800 7500 50  0001 C CNN
F 3 "~" H 1800 7500 50  0001 C CNN
	1    1800 7500
	1    0    0    -1  
$EndComp
NoConn ~ 1800 7600
$Comp
L Connector_Generic:Conn_01x04 J6
U 1 1 6140A7FD
P 2650 2600
F 0 "J6" H 2568 2175 50  0001 C CNN
F 1 "Conn-Esp-Sensors" V 2750 2600 50  0000 C CNN
F 2 "Connector_JST:JST_XH_B4B-XH-A_1x04_P2.50mm_Vertical" H 2650 2600 50  0001 C CNN
F 3 "~" H 2650 2600 50  0001 C CNN
	1    2650 2600
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x04 J2
U 1 1 614144AF
P 5100 3000
F 0 "J2" H 5180 2992 50  0001 L CNN
F 1 "Conn-ESP-Relays" V 5200 2700 50  0000 L CNN
F 2 "Connector_JST:JST_XH_B4B-XH-A_1x04_P2.50mm_Vertical" H 5100 3000 50  0001 C CNN
F 3 "~" H 5100 3000 50  0001 C CNN
	1    5100 3000
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H7
U 1 1 615876D7
P 2000 7500
F 0 "H7" H 2100 7549 50  0001 L CNN
F 1 "MountingHole_Pad" H 2100 7458 50  0001 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_ISO14580_Pad" H 2000 7500 50  0001 C CNN
F 3 "~" H 2000 7500 50  0001 C CNN
	1    2000 7500
	1    0    0    -1  
$EndComp
NoConn ~ 2000 7600
$Comp
L ESP32-DEVKITC-32D:ESP32-DEVKITC-32D U1
U 1 1 614B99F7
P 3650 3100
F 0 "U1" H 3650 4267 50  0000 C CNN
F 1 "ESP32-DEVKITC-32D" H 3650 4176 50  0000 C CNN
F 2 "esp32-footprint:MODULE_ESP32-DEVKITC-32D" H 3650 3100 50  0001 L BNN
F 3 "" H 3650 3100 50  0001 L BNN
F 4 "4" H 3650 3100 50  0001 L BNN "PARTREV"
F 5 "Espressif Systems" H 3650 3100 50  0001 L BNN "MANUFACTURER"
	1    3650 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 3300 4900 3200
Wire Wire Line
	4900 3100 4850 3100
Wire Wire Line
	4850 3100 4850 3200
$Comp
L Connector_Generic:Conn_01x02 J5
U 1 1 6143ACB7
P 2750 1850
F 0 "J5" H 2668 1525 50  0000 C CNN
F 1 "Conn_01x02" H 2668 1616 50  0000 C CNN
F 2 "Connector_JST:JST_XH_B2B-XH-A_1x02_P2.50mm_Vertical" H 2750 1850 50  0001 C CNN
F 3 "~" H 2750 1850 50  0001 C CNN
	1    2750 1850
	-1   0    0    1   
$EndComp
Text GLabel 2950 1850 2    50   Input ~ 0
GND(5V)
Text GLabel 2950 1750 2    50   Input ~ 0
5V+
Text GLabel 2600 4000 0    50   Input ~ 0
5V+
Text GLabel 5050 2200 2    50   Input ~ 0
GND(5V)
$Comp
L Connector:Conn_01x19_Male J4
U 1 1 614ADAB7
P 4650 3100
F 0 "J4" H 4622 3032 50  0001 R CNN
F 1 "Conn_01x19_Male" H 4622 3123 50  0001 R CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x19_P2.54mm_Vertical" H 4650 3100 50  0001 C CNN
F 3 "~" H 4650 3100 50  0001 C CNN
	1    4650 3100
	-1   0    0    1   
$EndComp
Wire Wire Line
	4450 2900 4900 2900
Connection ~ 4450 2900
Wire Wire Line
	4450 3000 4900 3000
Connection ~ 4450 3000
Wire Wire Line
	4450 3200 4850 3200
Connection ~ 4450 3200
Wire Wire Line
	4450 3300 4900 3300
Connection ~ 4450 3300
Wire Wire Line
	4450 2200 5050 2200
Connection ~ 4450 2200
$Comp
L Connector:Conn_01x13_Male J3
U 1 1 614BEADB
P 2650 3400
F 0 "J3" H 2758 4181 50  0001 C CNN
F 1 "Conn_01x13_Male" H 2758 4090 50  0001 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x13_P2.54mm_Vertical" H 2650 3400 50  0001 C CNN
F 3 "~" H 2650 3400 50  0001 C CNN
	1    2650 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 4000 2850 4000
Connection ~ 2850 4000
$Comp
L Connector:Conn_01x02_Male J1
U 1 1 614C4A36
P 2650 2200
F 0 "J1" H 2758 2381 50  0001 C CNN
F 1 "Conn_01x02_Male" H 2758 2290 50  0001 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x02_P2.54mm_Vertical" H 2650 2200 50  0001 C CNN
F 3 "~" H 2650 2200 50  0001 C CNN
	1    2650 2200
	1    0    0    -1  
$EndComp
$EndSCHEMATC
