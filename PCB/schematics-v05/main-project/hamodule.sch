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
Text GLabel 6800 3550 3    50   Input ~ 0
GND(5V)
Text GLabel 5000 1950 1    50   Input ~ 0
5V+
$Comp
L hamodule-rescue:ESP32-DEVKITC-32D-ESP32-DEVKITC-32D U1
U 1 1 6126231E
P 5900 2750
F 0 "U1" H 5900 3917 50  0000 C CNN
F 1 "ESP32-DEVKITC-32D" H 5900 3826 50  0000 C CNN
F 2 "esp32-footprint:MODULE_ESP32-DEVKITC-32D" H 5900 2750 50  0001 L BNN
F 3 "" H 5900 2750 50  0001 L BNN
F 4 "4" H 5900 2750 50  0001 L BNN "PARTREV"
F 5 "Espressif Systems" H 5900 2750 50  0001 L BNN "MANUFACTURER"
	1    5900 2750
	0    1    1    0   
$EndComp
Text GLabel 1750 3250 2    50   Input ~ 0
220VAC(L)
Text GLabel 1100 3650 0    50   Input ~ 0
GND(5V)
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
Text GLabel 6800 1900 1    50   Input ~ 0
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
Text GLabel 1100 4850 0    50   Input ~ 0
GND(5V)
Wire Wire Line
	1150 4850 1100 4850
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
Text GLabel 1100 6100 0    50   Input ~ 0
GND(5V)
Wire Wire Line
	1150 6100 1100 6100
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
Text GLabel 1100 7350 0    50   Input ~ 0
GND(5V)
Wire Wire Line
	1150 7350 1100 7350
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
Wire Notes Line
	700  6500 700  7650
Wire Notes Line
	700  7650 3150 7650
Wire Notes Line
	3150 7650 3150 6500
Wire Notes Line
	3150 6500 700  6500
NoConn ~ 6500 3550
NoConn ~ 6400 3550
NoConn ~ 6200 3550
NoConn ~ 5900 3550
NoConn ~ 5500 3550
NoConn ~ 5300 3550
NoConn ~ 5200 3550
NoConn ~ 5100 3550
NoConn ~ 5000 3550
NoConn ~ 5100 1950
NoConn ~ 5200 1950
NoConn ~ 5300 1950
NoConn ~ 5500 1950
NoConn ~ 5600 1950
NoConn ~ 5700 1950
NoConn ~ 6500 1950
NoConn ~ 6600 1950
NoConn ~ 6700 1950
NoConn ~ 11650 4450
NoConn ~ 1150 7050
NoConn ~ 1150 5800
NoConn ~ 1150 4550
NoConn ~ 1150 3350
Wire Wire Line
	6800 1950 6800 1900
$Comp
L power:PWR_FLAG #FLG0107
U 1 1 614BE8D9
P 6800 1950
F 0 "#FLG0107" H 6800 2025 50  0001 C CNN
F 1 "PWR_FLAG" V 6800 2078 50  0000 L CNN
F 2 "" H 6800 1950 50  0001 C CNN
F 3 "~" H 6800 1950 50  0001 C CNN
	1    6800 1950
	0    1    1    0   
$EndComp
Connection ~ 6800 1950
$Comp
L power:PWR_FLAG #FLG0105
U 1 1 615325C8
P 4750 6450
F 0 "#FLG0105" H 4750 6525 50  0001 C CNN
F 1 "PWR_FLAG" H 4750 6623 50  0001 C CNN
F 2 "" H 4750 6450 50  0001 C CNN
F 3 "~" H 4750 6450 50  0001 C CNN
	1    4750 6450
	1    0    0    -1  
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
NoConn ~ 550  3700
NoConn ~ 5800 1950
NoConn ~ 5400 1950
NoConn ~ 5900 1950
NoConn ~ 6000 1950
NoConn ~ 6000 3550
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
Text GLabel 10400 3750 2    50   Input ~ 0
Sens2
Text GLabel 10400 4750 2    50   Input ~ 0
Sens3
Text GLabel 10400 5750 2    50   Input ~ 0
Sens4
$Comp
L Device:R R5
U 1 1 61354B0C
P 10250 2750
F 0 "R5" V 10043 2750 50  0001 C CNN
F 1 "47k" V 10250 2750 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 10180 2750 50  0001 C CNN
F 3 "~" H 10250 2750 50  0001 C CNN
	1    10250 2750
	0    1    1    0   
$EndComp
Text GLabel 10400 2750 2    50   Input ~ 0
Sens1
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
Text GLabel 9600 1350 0    50   Input ~ 0
Sens1
Text GLabel 10400 1350 2    50   Input ~ 0
Sens1
Text GLabel 9600 1450 0    50   Input ~ 0
Sens2
Text GLabel 10400 1450 2    50   Input ~ 0
Sens2
Text GLabel 9600 1550 0    50   Input ~ 0
Sens3
Text GLabel 10400 1550 2    50   Input ~ 0
Sens3
Text GLabel 9600 1650 0    50   Input ~ 0
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
Text GLabel 6100 3550 3    50   Input ~ 0
GPIO34
Text GLabel 6700 3550 3    50   Input ~ 0
GPIO33
Text GLabel 8700 5650 0    50   Input ~ 0
GPIO33
Text GLabel 6300 3550 3    50   Input ~ 0
GPIO35
Text GLabel 6600 3550 3    50   Input ~ 0
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
Text GLabel 8700 2950 0    50   Input ~ 0
3.3V+
Wire Wire Line
	8700 2950 8900 2950
Wire Wire Line
	8900 2950 8900 2850
NoConn ~ 8900 2550
Text GLabel 8900 3350 0    50   Input ~ 0
GND(5V)
Text GLabel 9800 3850 2    50   Input ~ 0
220VAC(N)
$Comp
L Device:R R18
U 1 1 613B1E37
P 10250 3750
F 0 "R18" V 10043 3750 50  0001 C CNN
F 1 "47k" V 10250 3750 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 10180 3750 50  0001 C CNN
F 3 "~" H 10250 3750 50  0001 C CNN
	1    10250 3750
	0    1    1    0   
$EndComp
$Comp
L Device:R R11
U 1 1 613B1E3D
P 9950 3750
F 0 "R11" V 9743 3750 50  0001 C CNN
F 1 "47k" V 9950 3750 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 9880 3750 50  0001 C CNN
F 3 "~" H 9950 3750 50  0001 C CNN
	1    9950 3750
	0    1    1    0   
$EndComp
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
Text GLabel 8700 3950 0    50   Input ~ 0
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
GND(5V)
Text GLabel 9800 4850 2    50   Input ~ 0
220VAC(N)
$Comp
L Device:R R19
U 1 1 613B6B92
P 10250 4750
F 0 "R19" V 10043 4750 50  0001 C CNN
F 1 "47k" V 10250 4750 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 10180 4750 50  0001 C CNN
F 3 "~" H 10250 4750 50  0001 C CNN
	1    10250 4750
	0    1    1    0   
$EndComp
$Comp
L Device:R R12
U 1 1 613B6B98
P 9950 4750
F 0 "R12" V 9743 4750 50  0001 C CNN
F 1 "47k" V 9950 4750 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 9880 4750 50  0001 C CNN
F 3 "~" H 9950 4750 50  0001 C CNN
	1    9950 4750
	0    1    1    0   
$EndComp
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
Text GLabel 8700 4950 0    50   Input ~ 0
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
GND(5V)
Text GLabel 9800 5850 2    50   Input ~ 0
220VAC(N)
$Comp
L Device:R R20
U 1 1 613BAE41
P 10250 5750
F 0 "R20" V 10043 5750 50  0001 C CNN
F 1 "47k" V 10250 5750 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 10180 5750 50  0001 C CNN
F 3 "~" H 10250 5750 50  0001 C CNN
	1    10250 5750
	0    1    1    0   
$EndComp
$Comp
L Device:R R17
U 1 1 613BAE47
P 9950 5750
F 0 "R17" V 9743 5750 50  0001 C CNN
F 1 "47k" V 9950 5750 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 9880 5750 50  0001 C CNN
F 3 "~" H 9950 5750 50  0001 C CNN
	1    9950 5750
	0    1    1    0   
$EndComp
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
Text GLabel 8700 5950 0    50   Input ~ 0
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
$Comp
L power:PWR_FLAG #FLG0110
U 1 1 61581A71
P 4750 7450
F 0 "#FLG0110" H 4750 7525 50  0001 C CNN
F 1 "PWR_FLAG" H 4750 7623 50  0001 C CNN
F 2 "" H 4750 7450 50  0001 C CNN
F 3 "~" H 4750 7450 50  0001 C CNN
	1    4750 7450
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
Text GLabel 9800 2850 2    50   Input ~ 0
220VAC(N)
$Comp
L Device:R R6
U 1 1 61314DEF
P 9950 2750
F 0 "R6" V 9743 2750 50  0001 C CNN
F 1 "47k" V 9950 2750 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 9880 2750 50  0001 C CNN
F 3 "~" H 9950 2750 50  0001 C CNN
	1    9950 2750
	0    1    1    0   
$EndComp
Text GLabel 8900 2350 0    50   Input ~ 0
GND(5V)
Wire Wire Line
	8700 2650 8900 2650
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
NoConn ~ 1450 1100
NoConn ~ 1650 1100
NoConn ~ 1850 1100
NoConn ~ 2250 1100
NoConn ~ 2450 1100
NoConn ~ 2650 1100
NoConn ~ 2850 1100
NoConn ~ 3050 1100
NoConn ~ 3250 1100
Text GLabel 1750 3650 2    50   Input ~ 0
REI1
Text GLabel 1750 4850 2    50   Input ~ 0
REI2
Text GLabel 1750 6100 2    50   Input ~ 0
REI3
Text GLabel 1750 7350 2    50   Input ~ 0
REI4
Wire Wire Line
	5050 6450 5250 6450
Wire Wire Line
	3950 6450 4750 6450
$Comp
L Device:Varistor RV1
U 1 1 613E75CC
P 5050 7000
F 0 "RV1" H 4929 6954 50  0000 R CNN
F 1 "Varistor" H 4929 7045 50  0000 R CNN
F 2 "Varistor:RV_Disc_D21.5mm_W5.3mm_P10mm" V 4980 7000 50  0001 C CNN
F 3 "~" H 5050 7000 50  0001 C CNN
	1    5050 7000
	-1   0    0    1   
$EndComp
Connection ~ 4750 6450
$Comp
L Device:Fuse F1
U 1 1 613D9E49
P 4900 6450
F 0 "F1" V 5097 6450 50  0000 C CNN
F 1 "Fuse" V 5006 6450 50  0000 C CNN
F 2 "Fuse:Fuse_Littelfuse_372_D8.50mm" V 4830 6450 50  0001 C CNN
F 3 "~" H 4900 6450 50  0001 C CNN
	1    4900 6450
	0    -1   -1   0   
$EndComp
NoConn ~ 4750 7050
NoConn ~ 4750 6950
$Comp
L phoenix-1017505:1017505 J2
U 1 1 61366C48
P 4750 7150
F 0 "J2" H 5150 6585 50  0000 C CNN
F 1 "1017505" H 5150 6676 50  0000 C CNN
F 2 "Phoenix_Conn:1017505" H 5400 7250 50  0001 L CNN
F 3 "https://www.phoenixcontact.com/online/portal/gb/?uri=pxc-oc-itemdetail:pid=1017505&library=gben&pcck=P-11-01-05&tab=1&selectedCategory=ALL" H 5400 7150 50  0001 L CNN
F 4 "Phoenix Contact TDPT Series 5.08mm Pitch, PCB Terminal Block, PCB Mount, 4 Way" H 5400 7050 50  0001 L CNN "Description"
F 5 "19.2" H 5400 6950 50  0001 L CNN "Height"
F 6 "Phoenix Contact" H 5400 6850 50  0001 L CNN "Manufacturer_Name"
F 7 "1017505" H 5400 6750 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "651-1017505" H 5400 6650 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/Phoenix-Contact/1017505?qs=F5EMLAvA7IDSv5uM7A6HhA%3D%3D" H 5400 6550 50  0001 L CNN "Mouser Price/Stock"
F 10 "1017505" H 5400 6450 50  0001 L CNN "Arrow Part Number"
F 11 "https://www.arrow.com/en/products/1017505/phoenix-contact" H 5400 6350 50  0001 L CNN "Arrow Price/Stock"
	1    4750 7150
	-1   0    0    1   
$EndComp
Wire Notes Line
	6850 7700 3650 7700
Text GLabel 5350 6450 2    50   UnSpc ~ 0
220VAC(L)
Text GLabel 6650 7200 3    50   Input ~ 0
GND(5V)
Text GLabel 6650 6800 1    50   Input ~ 0
5V+
Text GLabel 5350 7450 2    50   UnSpc ~ 0
220VAC(N)
Wire Wire Line
	3950 7450 4750 7450
Wire Wire Line
	4750 7150 4750 7450
Connection ~ 4750 7450
Wire Wire Line
	4750 7450 5050 7450
Wire Wire Line
	5050 6850 5050 6450
Connection ~ 5050 6450
Wire Wire Line
	5050 7150 5050 7450
Connection ~ 5050 7450
Wire Wire Line
	5050 7450 5250 7450
Wire Wire Line
	5250 7450 5250 7200
Connection ~ 5250 7450
Wire Wire Line
	5250 7450 5350 7450
Wire Wire Line
	5250 6450 5250 6800
Connection ~ 5250 6450
Wire Wire Line
	5250 6450 5350 6450
Wire Wire Line
	4750 6450 4750 6850
Wire Wire Line
	3950 6450 3950 6850
Wire Wire Line
	3950 7150 3950 7450
Text GLabel 6050 5150 0    50   Input ~ 0
GND(5V)
Text GLabel 6750 4750 1    50   Input ~ 0
GND(5V)
Text GLabel 6650 4750 1    50   Input ~ 0
GND(5V)
Text GLabel 6850 4750 1    50   Input ~ 0
GND(5V)
Text GLabel 6850 5550 3    50   Input ~ 0
GND(5V)
Text GLabel 6750 5550 3    50   Input ~ 0
GND(5V)
Text GLabel 6650 5550 3    50   Input ~ 0
GND(5V)
Text GLabel 6250 5550 3    50   Input ~ 0
REI4
Text GLabel 6350 5550 3    50   Input ~ 0
REI3
Text GLabel 6450 5550 3    50   Input ~ 0
REI2
Text GLabel 6550 5550 3    50   Input ~ 0
REI1
Text GLabel 7050 5550 3    50   Input ~ 0
5V+
$Comp
L Transistor_Array:ULN2003A U6
U 1 1 61374AC1
P 6650 5150
F 0 "U6" V 6604 5680 50  0000 L CNN
F 1 "ULN2003A" V 6695 5680 50  0000 L CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 6700 4600 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/uln2003a.pdf" H 6750 4950 50  0001 C CNN
	1    6650 5150
	0    1    1    0   
$EndComp
NoConn ~ 6100 1950
NoConn ~ 6200 1950
NoConn ~ 6300 1950
NoConn ~ 6400 1950
NoConn ~ 3950 6950
NoConn ~ 3950 7050
$Comp
L RAC05-05SK_277:RAC05-05SK_277 PS1
U 1 1 6146ABA1
P 5950 7000
F 0 "PS1" H 5950 7467 50  0000 C CNN
F 1 "RAC05-05SK_277" H 5950 7376 50  0000 C CNN
F 2 "rac05-05sk:277" H 5950 7000 50  0001 L BNN
F 3 "" H 5950 7000 50  0001 L BNN
F 4 "Manufacturer Recommendations" H 5950 7000 50  0001 L BNN "STANDARD"
F 5 "21.8mm" H 5950 7000 50  0001 L BNN "MAXIMUM_PACKAGE_HEIGHT"
F 6 "RECOM" H 5950 7000 50  0001 L BNN "MANUFACTURER"
F 7 "N/A" H 5950 7000 50  0001 L BNN "PARTREV"
	1    5950 7000
	1    0    0    -1  
$EndComp
Text GLabel 5400 3550 3    50   Input ~ 0
GPIO19
Text GLabel 6550 4750 1    50   Input ~ 0
GPIO19
Text GLabel 5600 3550 3    50   Input ~ 0
GPIO21
Text GLabel 6450 4750 1    50   Input ~ 0
GPIO21
Text GLabel 5700 3550 3    50   Input ~ 0
GPIO22
Text GLabel 5800 3550 3    50   Input ~ 0
GPIO23
Text GLabel 6250 4750 1    50   Input ~ 0
GPIO23
Text GLabel 6350 4750 1    50   Input ~ 0
GPIO22
$EndSCHEMATC
