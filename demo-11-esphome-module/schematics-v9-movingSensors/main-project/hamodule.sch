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
$Comp
L Mechanical:MountingHole_Pad H4
U 1 1 618C3185
P 1400 7500
F 0 "H4" H 1500 7549 50  0001 L CNN
F 1 "MountingHole_Pad" H 1500 7458 50  0001 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_ISO14580_Pad" H 1400 7500 50  0001 C CNN
F 3 "~" H 1400 7500 50  0001 C CNN
	1    1400 7500
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H5
U 1 1 618C3B93
P 1600 7500
F 0 "H5" H 1700 7549 50  0001 L CNN
F 1 "MountingHole_Pad" H 1700 7458 50  0001 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_ISO14580_Pad" H 1600 7500 50  0001 C CNN
F 3 "~" H 1600 7500 50  0001 C CNN
	1    1600 7500
	1    0    0    -1  
$EndComp
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
Text GLabel 10100 5750 2    50   Input ~ 0
Sens2
Text GLabel 10100 3750 2    50   Input ~ 0
Sens3
Text GLabel 10100 2750 2    50   Input ~ 0
Sens4
$Comp
L Device:R R14
U 1 1 61354B0C
P 9950 4850
F 0 "R14" V 9743 4850 50  0001 C CNN
F 1 "39k2w" V 10050 4850 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0516_L15.5mm_D5.0mm_P20.32mm_Horizontal" V 9880 4850 50  0001 C CNN
F 3 "~" H 9950 4850 50  0001 C CNN
	1    9950 4850
	0    1    1    0   
$EndComp
Text GLabel 10100 4750 2    50   Input ~ 0
Sens1
$Comp
L phoenix-1017505:1017505 J8
U 1 1 6133A647
P 10400 1650
F 0 "J8" H 10800 1085 50  0000 C CNN
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
$Comp
L phoenix-1017505:1017505 J1
U 1 1 6135584E
P 1900 1200
F 0 "J1" H 2300 635 50  0000 C CNN
F 1 "1017505" H 2300 726 50  0000 C CNN
F 2 "Phoenix_Conn:1017505" H 2550 1300 50  0001 L CNN
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
Text GLabel 1900 1100 2    50   Input ~ 0
REO3
Text GLabel 1900 900  2    50   Input ~ 0
REO1
Text GLabel 1900 1000 2    50   Input ~ 0
REO2
Text GLabel 1900 1200 2    50   Input ~ 0
REO4
$Comp
L HCPL-3700-000:HCPL3700 U3
U 1 1 613556E0
P 9900 2850
F 0 "U3" H 10450 2085 50  0000 C CNN
F 1 "HCPL3700" H 10450 2176 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm_Socket_LongPads" H 9900 3250 50  0001 L CNN
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
F 2 "Capacitor_THT:CP_Radial_D10.0mm_P5.00mm" H 10000 2500 50  0001 C CNN
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
Text GLabel 8150 3150 0    50   Input ~ 0
3.3V+
NoConn ~ 8900 2550
Text GLabel 8900 3350 0    50   Input ~ 0
GND(5V)
Text GLabel 10100 5850 2    50   Input ~ 0
220VAC(N)
$Comp
L Device:R R16
U 1 1 613B1E37
P 9950 5850
F 0 "R16" V 9743 5850 50  0001 C CNN
F 1 "39k2w" V 10050 5850 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0516_L15.5mm_D5.0mm_P20.32mm_Horizontal" V 9880 5850 50  0001 C CNN
F 3 "~" H 9950 5850 50  0001 C CNN
	1    9950 5850
	0    1    1    0   
$EndComp
$Comp
L Device:R R15
U 1 1 613B1E3D
P 9950 5750
F 0 "R15" V 9743 5750 50  0001 C CNN
F 1 "39k2w" V 9850 5750 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0516_L15.5mm_D5.0mm_P20.32mm_Horizontal" V 9880 5750 50  0001 C CNN
F 3 "~" H 9950 5750 50  0001 C CNN
	1    9950 5750
	0    1    1    0   
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
L Device:CP_Small 22uF2
U 1 1 613B1E5B
P 10000 3500
F 0 "22uF2" H 9912 3454 50  0000 R CNN
F 1 "CP_Small" H 9912 3545 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D10.0mm_P5.00mm" H 10000 3500 50  0001 C CNN
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
NoConn ~ 8900 3550
Text GLabel 8900 4350 0    50   Input ~ 0
GND(5V)
Text GLabel 10100 3850 2    50   Input ~ 0
220VAC(N)
$Comp
L Device:R R11
U 1 1 613B6B92
P 9950 3750
F 0 "R11" V 9743 3750 50  0001 C CNN
F 1 "39k2w" V 10050 3750 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0516_L15.5mm_D5.0mm_P20.32mm_Horizontal" V 9880 3750 50  0001 C CNN
F 3 "~" H 9950 3750 50  0001 C CNN
	1    9950 3750
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R12
U 1 1 613B6B98
P 9950 3850
F 0 "R12" V 9743 3850 50  0001 C CNN
F 1 "39k2w" V 9850 3850 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0516_L15.5mm_D5.0mm_P20.32mm_Horizontal" V 9880 3850 50  0001 C CNN
F 3 "~" H 9950 3850 50  0001 C CNN
	1    9950 3850
	0    -1   -1   0   
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
L Device:CP_Small 22uF3
U 1 1 613B6BB6
P 10000 4500
F 0 "22uF3" H 9912 4454 50  0000 R CNN
F 1 "CP_Small" H 9912 4545 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D10.0mm_P5.00mm" H 10000 4500 50  0001 C CNN
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
NoConn ~ 8900 4550
Text GLabel 8900 5350 0    50   Input ~ 0
GND(5V)
Text GLabel 10100 2850 2    50   Input ~ 0
220VAC(N)
$Comp
L Device:R R10
U 1 1 613BAE41
P 9950 2850
F 0 "R10" V 9743 2850 50  0001 C CNN
F 1 "39k2w" V 10050 2850 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0516_L15.5mm_D5.0mm_P20.32mm_Horizontal" V 9880 2850 50  0001 C CNN
F 3 "~" H 9950 2850 50  0001 C CNN
	1    9950 2850
	0    1    1    0   
$EndComp
$Comp
L Device:R R9
U 1 1 613BAE47
P 9950 2750
F 0 "R9" V 9743 2750 50  0001 C CNN
F 1 "39k2w" V 9850 2750 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0516_L15.5mm_D5.0mm_P20.32mm_Horizontal" V 9880 2750 50  0001 C CNN
F 3 "~" H 9950 2750 50  0001 C CNN
	1    9950 2750
	0    1    1    0   
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
L Device:CP_Small 22uF4
U 1 1 613BAE65
P 10000 5500
F 0 "22uF4" H 9912 5454 50  0000 R CNN
F 1 "CP_Small" H 9912 5545 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D10.0mm_P5.00mm" H 10000 5500 50  0001 C CNN
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
NoConn ~ 8900 5550
Wire Notes Line
	3800 550  7000 550 
Text Label 6500 700  0    50   ~ 0
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
Text GLabel 10100 4850 2    50   Input ~ 0
220VAC(N)
$Comp
L Device:R R13
U 1 1 61314DEF
P 9950 4750
F 0 "R13" V 9743 4750 50  0001 C CNN
F 1 "39k2w" V 9850 4750 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0516_L15.5mm_D5.0mm_P20.32mm_Horizontal" V 9880 4750 50  0001 C CNN
F 3 "~" H 9950 4750 50  0001 C CNN
	1    9950 4750
	0    1    1    0   
$EndComp
Text GLabel 8900 2350 0    50   Input ~ 0
GND(5V)
Wire Wire Line
	8700 2650 8900 2650
NoConn ~ 800  7600
NoConn ~ 1000 7600
NoConn ~ 1400 7600
NoConn ~ 1600 7600
NoConn ~ 1800 7600
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
$Comp
L Device:Varistor RV1
U 1 1 613E75CC
P 5200 1450
F 0 "RV1" H 5079 1404 50  0000 R CNN
F 1 "Varistor250v" H 5079 1495 50  0000 R CNN
F 2 "Varistor:RV_Disc_D12mm_W4.2mm_P7.5mm" V 5130 1450 50  0001 C CNN
F 3 "~" H 5200 1450 50  0001 C CNN
	1    5200 1450
	-1   0    0    1   
$EndComp
Connection ~ 4900 900 
$Comp
L Device:Fuse F1
U 1 1 613D9E49
P 5050 900
F 0 "F1" V 5247 900 50  0000 C CNN
F 1 "Fuse" V 5156 900 50  0000 C CNN
F 2 "Fuse:Fuse_Littelfuse_372_D8.50mm" V 4980 900 50  0001 C CNN
F 3 "~" H 5050 900 50  0001 C CNN
	1    5050 900 
	0    -1   -1   0   
$EndComp
NoConn ~ 4500 1350
NoConn ~ 4500 1450
NoConn ~ 4900 1500
NoConn ~ 4900 1400
$Comp
L phoenix-1017505:1017505 J3
U 1 1 61366C48
P 4100 1300
F 0 "J3" H 4500 735 50  0000 C CNN
F 1 "1017505" H 4500 826 50  0000 C CNN
F 2 "Phoenix_Conn:1017505" H 4750 1400 50  0001 L CNN
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
Text GLabel 5500 900  2    50   UnSpc ~ 0
220VAC(L)
Text GLabel 6800 1650 3    50   Input ~ 0
GND(5V)
Text GLabel 6800 1250 1    50   Input ~ 0
5V+
Text GLabel 5500 1900 2    50   UnSpc ~ 0
220VAC(N)
Wire Wire Line
	4100 1900 4900 1900
Connection ~ 4900 1900
Wire Wire Line
	4900 1900 5200 1900
Wire Wire Line
	5200 1300 5200 900 
Connection ~ 5200 900 
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
	4900 900  4900 1300
Wire Wire Line
	4100 900  4100 1300
Wire Wire Line
	4100 1600 4100 1900
Text GLabel 4450 5050 2    50   Input ~ 0
GND(5V)
Text GLabel 4850 5750 2    50   Input ~ 0
GND(5V)
Text GLabel 4850 5650 2    50   Input ~ 0
GND(5V)
Text GLabel 4850 5850 2    50   Input ~ 0
GND(5V)
Text GLabel 4050 5850 0    50   Input ~ 0
GND(5V)
Text GLabel 4050 5750 0    50   Input ~ 0
GND(5V)
Text GLabel 4050 5650 0    50   Input ~ 0
GND(5V)
Text GLabel 4050 5550 0    50   Input ~ 0
REI4
Text GLabel 4050 5450 0    50   Input ~ 0
REI3
Text GLabel 4050 5350 0    50   Input ~ 0
REI2
Text GLabel 4050 5250 0    50   Input ~ 0
REI1
Text GLabel 4050 6050 0    50   Input ~ 0
5V+
$Comp
L Transistor_Array:ULN2003A U1
U 1 1 61374AC1
P 4450 5650
F 0 "U1" V 4404 6180 50  0000 L CNN
F 1 "ULN2003A" V 4495 6180 50  0000 L CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 4500 5100 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/uln2003a.pdf" H 4550 5450 50  0001 C CNN
	1    4450 5650
	-1   0    0    1   
$EndComp
NoConn ~ 4100 1400
NoConn ~ 4100 1500
$Comp
L RAC05-05SK_277:RAC05-05SK_277 RA05-05-SK1
U 1 1 6146ABA1
P 6100 1450
F 0 "RA05-05-SK1" H 6100 1917 50  0000 C CNN
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
Text GLabel 4300 2650 0    50   Input ~ 0
5V+
Text GLabel 4900 2650 2    50   Input ~ 0
3.3V+
$Comp
L Connector_Generic:Conn_01x02 J5
U 1 1 6143ACB7
P 5900 2750
F 0 "J5" H 5818 2425 50  0000 C CNN
F 1 "Conn_01x02" H 5818 2516 50  0000 C CNN
F 2 "Connector_JST:JST_XH_B2B-XH-A_1x02_P2.50mm_Vertical" H 5900 2750 50  0001 C CNN
F 3 "~" H 5900 2750 50  0001 C CNN
	1    5900 2750
	-1   0    0    1   
$EndComp
Text GLabel 6100 2650 2    50   Input ~ 0
5V+
Text GLabel 6100 2750 2    50   Input ~ 0
GND(5V)
Wire Notes Line
	7700 6300 7700 950 
Wire Notes Line
	7700 950  11000 950 
Wire Notes Line
	7700 6300 11000 6300
$Comp
L Regulator_Linear:LD1117S33TR_SOT223 U2
U 1 1 61434446
P 4600 2650
F 0 "U2" H 4600 2892 50  0000 C CNN
F 1 "LD1117S33TR_SOT223" H 4600 2801 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 4600 2850 50  0001 C CNN
F 3 "http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/CD00000544.pdf" H 4700 2400 50  0001 C CNN
	1    4600 2650
	1    0    0    -1  
$EndComp
Text GLabel 4600 2950 2    50   Input ~ 0
GND(5V)
Wire Notes Line
	3800 3050 7000 3050
Wire Notes Line
	3800 550  3800 3050
Wire Notes Line
	7000 550  7000 3050
Text GLabel 8200 5500 0    50   Input ~ 0
EspSens1
$Comp
L Connector_Generic:Conn_01x04 J6
U 1 1 6140A7FD
P 6750 3800
F 0 "J6" H 6668 3375 50  0000 C CNN
F 1 "Conn-Esp-Sensors" H 6668 3466 50  0000 C CNN
F 2 "Connector_JST:JST_XH_B4B-XH-A_1x04_P2.50mm_Vertical" H 6750 3800 50  0001 C CNN
F 3 "~" H 6750 3800 50  0001 C CNN
	1    6750 3800
	-1   0    0    1   
$EndComp
Text GLabel 6950 3600 2    50   Input ~ 0
EspSens1
Text GLabel 6950 3700 2    50   Input ~ 0
EspSens2
Text GLabel 6950 3800 2    50   Input ~ 0
EspSens3
Text GLabel 6950 3900 2    50   Input ~ 0
EspSens4
Text GLabel 7250 4300 2    50   Input ~ 0
EspSens1
Text GLabel 7250 4400 2    50   Input ~ 0
EspSens2
Text GLabel 7250 4500 2    50   Input ~ 0
EspSens3
Text GLabel 7250 4600 2    50   Input ~ 0
EspSens4
$Comp
L Connector_Generic:Conn_01x05 J4
U 1 1 61516260
P 5550 5600
F 0 "J4" H 5468 5175 50  0000 C CNN
F 1 "Conn-Buttons" H 5468 5266 50  0000 C CNN
F 2 "Connector_JST:JST_XH_B5B-XH-A_1x05_P2.50mm_Vertical" H 5550 5600 50  0001 C CNN
F 3 "~" H 5550 5600 50  0001 C CNN
	1    5550 5600
	-1   0    0    1   
$EndComp
Text GLabel 5750 5500 2    50   Input ~ 0
EspRel1
Text GLabel 5750 5600 2    50   Input ~ 0
EspRel2
Text GLabel 5750 5700 2    50   Input ~ 0
EspRel3
Text GLabel 5750 5800 2    50   Input ~ 0
EspRel4
Text GLabel 8200 4500 0    50   Input ~ 0
EspSens2
Text GLabel 8200 3500 0    50   Input ~ 0
EspSens3
Text GLabel 8150 2550 0    50   Input ~ 0
EspSens4
$Comp
L Device:LED D8
U 1 1 613FCCDC
P 8200 5650
F 0 "D8" V 8147 5730 50  0000 L CNN
F 1 "LED" V 8238 5730 50  0000 L CNN
F 2 "LED_THT:LED_D3.0mm" H 8200 5650 50  0001 C CNN
F 3 "~" H 8200 5650 50  0001 C CNN
	1    8200 5650
	0    1    1    0   
$EndComp
$Comp
L Device:R R8
U 1 1 613FE2E1
P 8200 5950
F 0 "R8" H 8270 5996 50  0000 L CNN
F 1 "100" H 8270 5905 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 8130 5950 50  0001 C CNN
F 3 "~" H 8200 5950 50  0001 C CNN
	1    8200 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 2550 8700 2650
Wire Wire Line
	8900 2850 8700 2850
Wire Wire Line
	8700 2850 8700 3150
Text GLabel 8200 4100 0    50   Input ~ 0
3.3V+
$Comp
L Device:LED D7
U 1 1 61409E59
P 8200 4650
F 0 "D7" V 8147 4730 50  0000 L CNN
F 1 "LED" V 8238 4730 50  0000 L CNN
F 2 "LED_THT:LED_D3.0mm" H 8200 4650 50  0001 C CNN
F 3 "~" H 8200 4650 50  0001 C CNN
	1    8200 4650
	0    1    1    0   
$EndComp
$Comp
L Device:R R7
U 1 1 61409E5F
P 8200 4950
F 0 "R7" H 8270 4996 50  0000 L CNN
F 1 "100" H 8270 4905 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 8130 4950 50  0001 C CNN
F 3 "~" H 8200 4950 50  0001 C CNN
	1    8200 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	8600 4100 8200 4100
Wire Wire Line
	8900 3850 8600 3850
Wire Wire Line
	8600 3850 8600 4100
Wire Wire Line
	8600 3650 8600 3500
Wire Wire Line
	8600 3500 8200 3500
Wire Wire Line
	8600 3650 8900 3650
Text GLabel 8200 5100 0    50   Input ~ 0
3.3V+
$Comp
L Device:LED D6
U 1 1 614112F5
P 8200 3650
F 0 "D6" V 8147 3730 50  0000 L CNN
F 1 "LED" V 8238 3730 50  0000 L CNN
F 2 "LED_THT:LED_D3.0mm" H 8200 3650 50  0001 C CNN
F 3 "~" H 8200 3650 50  0001 C CNN
	1    8200 3650
	0    1    1    0   
$EndComp
$Comp
L Device:R R6
U 1 1 614112FB
P 8200 3950
F 0 "R6" H 8270 3996 50  0000 L CNN
F 1 "100" H 8270 3905 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 8130 3950 50  0001 C CNN
F 3 "~" H 8200 3950 50  0001 C CNN
	1    8200 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	8600 5100 8200 5100
Wire Wire Line
	8900 4850 8600 4850
Wire Wire Line
	8600 4850 8600 5100
Wire Wire Line
	8600 4650 8600 4500
Wire Wire Line
	8600 4650 8900 4650
Text GLabel 8200 6100 0    50   Input ~ 0
3.3V+
$Comp
L Device:LED D5
U 1 1 614135F2
P 8150 2700
F 0 "D5" V 8097 2780 50  0000 L CNN
F 1 "LED" V 8188 2780 50  0000 L CNN
F 2 "LED_THT:LED_D3.0mm" H 8150 2700 50  0001 C CNN
F 3 "~" H 8150 2700 50  0001 C CNN
	1    8150 2700
	0    1    1    0   
$EndComp
$Comp
L Device:R R5
U 1 1 614135F8
P 8150 3000
F 0 "R5" H 8220 3046 50  0000 L CNN
F 1 "100" H 8220 2955 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 8080 3000 50  0001 C CNN
F 3 "~" H 8150 3000 50  0001 C CNN
	1    8150 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	8600 6100 8200 6100
Wire Wire Line
	8900 5850 8600 5850
Wire Wire Line
	8600 5850 8600 6100
Wire Wire Line
	8600 5650 8600 5500
Wire Wire Line
	8600 5650 8900 5650
Wire Wire Line
	8600 4500 8200 4500
Wire Wire Line
	8200 5500 8600 5500
Wire Wire Line
	8150 2550 8700 2550
Wire Wire Line
	8150 3150 8700 3150
Text GLabel 6950 4700 2    50   Input ~ 0
3.3V+
$Comp
L Device:R R4
U 1 1 6141E5EE
P 7100 4600
F 0 "R4" V 6893 4600 50  0000 C CNN
F 1 "100" V 7100 4600 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 7030 4600 50  0001 C CNN
F 3 "~" H 7100 4600 50  0001 C CNN
	1    7100 4600
	0    1    1    0   
$EndComp
$Comp
L Device:R R3
U 1 1 6141EC21
P 7100 4500
F 0 "R3" V 6893 4500 50  0000 C CNN
F 1 "100" V 7100 4500 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 7030 4500 50  0001 C CNN
F 3 "~" H 7100 4500 50  0001 C CNN
	1    7100 4500
	0    1    1    0   
$EndComp
$Comp
L Device:R R2
U 1 1 6141EDC4
P 7100 4400
F 0 "R2" V 6893 4400 50  0000 C CNN
F 1 "100" V 6984 4400 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 7030 4400 50  0001 C CNN
F 3 "~" H 7100 4400 50  0001 C CNN
	1    7100 4400
	0    1    1    0   
$EndComp
$Comp
L Device:R R1
U 1 1 6141EF53
P 7100 4300
F 0 "R1" V 6893 4300 50  0000 C CNN
F 1 "100" V 6984 4300 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 7030 4300 50  0001 C CNN
F 3 "~" H 7100 4300 50  0001 C CNN
	1    7100 4300
	0    1    1    0   
$EndComp
Text GLabel 1100 6100 0    50   Input ~ 0
5V+
Text GLabel 1100 4850 0    50   Input ~ 0
5V+
Text GLabel 1100 3600 0    50   Input ~ 0
5V+
Text GLabel 1100 2400 0    50   Input ~ 0
5V+
Text GLabel 4500 3900 2    50   Input ~ 0
EspRel1
Text GLabel 4500 4050 2    50   Input ~ 0
EspRel2
Text GLabel 4500 4250 2    50   Input ~ 0
EspRel3
Text GLabel 4500 4400 2    50   Input ~ 0
EspRel4
Text GLabel 4850 5550 2    50   Input ~ 0
EspRel1
Text GLabel 4850 5450 2    50   Input ~ 0
EspRel2
Text GLabel 4850 5350 2    50   Input ~ 0
EspRel3
Text GLabel 4850 5250 2    50   Input ~ 0
EspRel4
Text GLabel 5750 5400 2    50   Input ~ 0
3.3V+
Wire Wire Line
	4200 4100 4100 4100
Wire Wire Line
	4100 4200 4200 4200
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
NoConn ~ 1200 7600
$Comp
L Connector_Generic:Conn_01x05 J7
U 1 1 614FF62B
P 6750 4500
F 0 "J7" H 6668 4075 50  0000 C CNN
F 1 "Conn-LedIndicators" H 6668 4166 50  0000 C CNN
F 2 "Connector_JST:JST_XH_B5B-XH-A_1x05_P2.50mm_Vertical" H 6750 4500 50  0001 C CNN
F 3 "~" H 6750 4500 50  0001 C CNN
	1    6750 4500
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x04 J2
U 1 1 614144AF
P 3900 4200
F 0 "J2" H 3980 4192 50  0000 L CNN
F 1 "Conn-ESP-Relays" H 3980 4101 50  0000 L CNN
F 2 "Connector_JST:JST_XH_B4B-XH-A_1x04_P2.50mm_Vertical" H 3900 4200 50  0001 C CNN
F 3 "~" H 3900 4200 50  0001 C CNN
	1    3900 4200
	-1   0    0    1   
$EndComp
$Comp
L Device:D D1
U 1 1 615714B6
P 4350 3900
F 0 "D1" H 4350 3683 50  0000 C CNN
F 1 "D" H 4350 3774 50  0000 C CNN
F 2 "Diode_THT:D_A-405_P7.62mm_Horizontal" H 4350 3900 50  0001 C CNN
F 3 "~" H 4350 3900 50  0001 C CNN
	1    4350 3900
	-1   0    0    1   
$EndComp
$Comp
L Device:D D2
U 1 1 615764D6
P 4350 4050
F 0 "D2" H 4350 3833 50  0000 C CNN
F 1 "D" H 4350 3924 50  0000 C CNN
F 2 "Diode_THT:D_A-405_P7.62mm_Horizontal" H 4350 4050 50  0001 C CNN
F 3 "~" H 4350 4050 50  0001 C CNN
	1    4350 4050
	-1   0    0    1   
$EndComp
$Comp
L Device:D D3
U 1 1 615780DE
P 4350 4250
F 0 "D3" H 4350 4033 50  0000 C CNN
F 1 "D" H 4350 4124 50  0000 C CNN
F 2 "Diode_THT:D_A-405_P7.62mm_Horizontal" H 4350 4250 50  0001 C CNN
F 3 "~" H 4350 4250 50  0001 C CNN
	1    4350 4250
	-1   0    0    1   
$EndComp
$Comp
L Device:D D4
U 1 1 6157A0C6
P 4350 4400
F 0 "D4" H 4350 4183 50  0000 C CNN
F 1 "D" H 4350 4274 50  0000 C CNN
F 2 "Diode_THT:D_A-405_P7.62mm_Horizontal" H 4350 4400 50  0001 C CNN
F 3 "~" H 4350 4400 50  0001 C CNN
	1    4350 4400
	-1   0    0    1   
$EndComp
Wire Wire Line
	4200 3900 4100 3900
Wire Wire Line
	4100 3900 4100 4000
Wire Wire Line
	4200 4400 4100 4400
Wire Wire Line
	4100 4400 4100 4300
Wire Wire Line
	4200 4250 4200 4200
Wire Wire Line
	4200 4050 4200 4100
$EndSCHEMATC
