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
Text GLabel 2150 2100 2    50   Input ~ 0
220VAC(L)
Wire Notes Line
	700  1550 700  2700
Wire Notes Line
	700  2700 3150 2700
Wire Notes Line
	3150 2700 3150 1550
Wire Notes Line
	3150 1550 700  1550
Wire Notes Line
	700  2750 700  3900
Wire Notes Line
	700  3900 3150 3900
Wire Notes Line
	3150 3900 3150 2750
Wire Notes Line
	3150 2750 700  2750
Wire Notes Line
	700  4000 700  5150
Wire Notes Line
	700  5150 3150 5150
Wire Notes Line
	3150 5150 3150 4000
Wire Notes Line
	3150 4000 700  4000
Wire Notes Line
	700  5250 700  6400
Wire Notes Line
	700  6400 3150 6400
Wire Notes Line
	3150 6400 3150 5250
Wire Notes Line
	3150 5250 700  5250
NoConn ~ 11650 4450
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
Text GLabel 1600 4550 0    50   Input ~ 0
REO3
Text GLabel 1550 2100 0    50   Input ~ 0
REO1
Text GLabel 1550 3250 0    50   Input ~ 0
REO2
Text GLabel 1550 5750 0    50   Input ~ 0
REO4
NoConn ~ 550  2450
Text GLabel 10700 3850 2    50   Input ~ 0
Sens2
Text GLabel 10700 5850 2    50   Input ~ 0
Sens4
Text GLabel 10700 2650 2    50   Input ~ 0
Sens1
$Comp
L power:PWR_FLAG #FLG03
U 1 1 61341516
P 10050 1300
F 0 "#FLG03" H 10050 1375 50  0001 C CNN
F 1 "PWR_FLAG" H 10050 1473 50  0001 C CNN
F 2 "" H 10050 1300 50  0001 C CNN
F 3 "~" H 10050 1300 50  0001 C CNN
	1    10050 1300
	0    1    1    0   
$EndComp
Text GLabel 1550 1200 3    50   Input ~ 0
REO1
Text GLabel 1350 1200 3    50   Input ~ 0
REO2
Wire Wire Line
	9800 2400 9800 2350
Wire Wire Line
	9800 2400 10000 2400
Wire Wire Line
	10000 2200 9800 2200
Wire Wire Line
	9800 2200 9800 2250
Text GLabel 8250 2750 0    50   Input ~ 0
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
Text GLabel 8350 4350 0    50   Input ~ 0
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
Text GLabel 8350 5350 0    50   Input ~ 0
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
Text GLabel 950  1200 3    50   Input ~ 0
REO4
Text GLabel 1150 1200 3    50   Input ~ 0
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
P 5800 1900
F 0 "#FLG02" H 5800 1975 50  0001 C CNN
F 1 "PWR_FLAG" H 5800 2073 50  0001 C CNN
F 2 "" H 5800 1900 50  0001 C CNN
F 3 "~" H 5800 1900 50  0001 C CNN
	1    5800 1900
	-1   0    0    1   
$EndComp
Text GLabel 8450 1250 2    50   Input ~ 0
Sens1
Text GLabel 8450 1450 2    50   Input ~ 0
Sens2
Text GLabel 8450 1650 2    50   Input ~ 0
Sens3
Text GLabel 8450 1850 2    50   Input ~ 0
Sens4
$Comp
L power:PWR_FLAG #FLG04
U 1 1 61369577
P 10050 1400
F 0 "#FLG04" H 10050 1475 50  0001 C CNN
F 1 "PWR_FLAG" H 10050 1573 50  0001 C CNN
F 2 "" H 10050 1400 50  0001 C CNN
F 3 "~" H 10050 1400 50  0001 C CNN
	1    10050 1400
	0    1    1    0   
$EndComp
$Comp
L power:PWR_FLAG #FLG05
U 1 1 613698EA
P 10050 1500
F 0 "#FLG05" H 10050 1575 50  0001 C CNN
F 1 "PWR_FLAG" H 10050 1673 50  0001 C CNN
F 2 "" H 10050 1500 50  0001 C CNN
F 3 "~" H 10050 1500 50  0001 C CNN
	1    10050 1500
	0    1    1    0   
$EndComp
$Comp
L power:PWR_FLAG #FLG06
U 1 1 61369AE5
P 10050 1600
F 0 "#FLG06" H 10050 1675 50  0001 C CNN
F 1 "PWR_FLAG" H 10050 1773 50  0001 C CNN
F 2 "" H 10050 1600 50  0001 C CNN
F 3 "~" H 10050 1600 50  0001 C CNN
	1    10050 1600
	0    1    1    0   
$EndComp
Text GLabel 9800 4750 2    50   Input ~ 0
220VAC(N)
Text GLabel 8250 2150 0    50   Input ~ 0
GND(5V)
NoConn ~ 800  7600
NoConn ~ 1000 7600
Text GLabel 1550 2300 0    50   Input ~ 0
REI1
Wire Wire Line
	5200 900  5400 900 
Text GLabel 5500 900  2    50   UnSpc ~ 0
220VAC(L)
Text GLabel 6800 1650 2    50   Input ~ 0
GND(5V)
Wire Wire Line
	5200 1600 5200 1900
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
Text GLabel 4350 4000 2    50   Input ~ 0
GND(5V)
Text GLabel 3950 5000 0    50   Input ~ 0
5V+
Text GLabel 4250 2500 0    50   Input ~ 0
5V+
Text GLabel 5650 2500 2    50   Input ~ 0
3.3V+
Text GLabel 6450 2750 2    50   Input ~ 0
5V+
Wire Notes Line
	7700 6300 7700 950 
Wire Notes Line
	7700 950  11000 950 
Wire Notes Line
	7700 6300 11000 6300
Text GLabel 4350 2900 0    50   Input ~ 0
GND(5V)
Wire Notes Line
	3800 550  3800 3050
Wire Notes Line
	7250 550  7250 3050
Text GLabel 8800 5650 0    50   Input ~ 0
EspSens1
Text GLabel 5750 3400 2    50   Input ~ 0
EspSens1
Text GLabel 5750 3500 2    50   Input ~ 0
EspSens2
Text GLabel 5750 3600 2    50   Input ~ 0
EspSens3
Text GLabel 5750 3700 2    50   Input ~ 0
EspSens4
Text GLabel 8700 2450 0    50   Input ~ 0
EspSens4
Text GLabel 8350 3950 0    50   Input ~ 0
3.3V+
Text GLabel 8350 4950 0    50   Input ~ 0
3.3V+
Text GLabel 8350 5950 0    50   Input ~ 0
3.3V+
Text GLabel 2150 2300 2    50   Input ~ 0
5V+
Connection ~ 5300 2500
Wire Wire Line
	5300 2500 5250 2500
Wire Wire Line
	4950 2800 4950 2900
Wire Wire Line
	4600 2900 4950 2900
Wire Wire Line
	4950 2900 5300 2900
Connection ~ 4950 2900
Wire Wire Line
	5300 2600 5300 2500
Text GLabel 9800 3750 2    50   Input ~ 0
220VAC(N)
Text GLabel 10700 4850 2    50   Input ~ 0
Sens3
Text GLabel 6900 1250 2    50   Input ~ 0
5V+
Wire Notes Line
	7250 550  3800 550 
Wire Notes Line
	3800 3050 7250 3050
Connection ~ 5200 900 
Wire Wire Line
	5200 1300 5200 900 
$Comp
L Connector_Generic:Conn_01x04 J2
U 1 1 614144AF
P 5550 4100
F 0 "J2" H 5650 3650 50  0000 L CNN
F 1 "ESP Relays" V 5650 3700 50  0000 L CNN
F 2 "Connector_JST:JST_XH_B4B-XH-A_1x04_P2.50mm_Vertical" H 5550 4100 50  0001 C CNN
F 3 "~" H 5550 4100 50  0001 C CNN
	1    5550 4100
	-1   0    0    1   
$EndComp
$Comp
L RAC05-05SK_277:RAC05-05SK_277 RA05.SK.277
U 1 1 6146ABA1
P 6100 1450
F 0 "RA05.SK.277" H 6100 1800 50  0000 C CNN
F 1 "RAC05.05SK.277" H 6100 1826 50  0001 C CNN
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
L Device:R R12
U 1 1 613B6B98
P 10250 4850
F 0 "R12" V 10043 4850 50  0001 C CNN
F 1 "39kΩ3w" V 10350 4850 50  0000 C CNN
F 2 "Resistor_SMD:R_2512_6332Metric_Pad1.52x3.35mm_HandSolder" V 10180 4850 50  0001 C CNN
F 3 "https://www.distrelec.ch/en/super-high-power-smd-resistor-2512-82kohm-3w-rnd-components-rnd-155sp123wf8202t2e/p/30150189?q=*&pos=1&origPos=3001&origPageSize=50&digitalDataLayerTerm=resistor&track=true" H 10250 4850 50  0001 C CNN
F 4 "C144424" H 10250 4850 50  0001 C CNN "JLCPCB"
	1    10250 4850
	0    1    1    0   
$EndComp
$Comp
L Device:CP 100uF_2
U 1 1 615251C7
P 5300 2750
F 0 "100uF_2" H 5418 2796 50  0001 L CNN
F 1 "100uF" H 5000 2750 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 5338 2600 50  0001 C CNN
F 3 "~" H 5300 2750 50  0001 C CNN
	1    5300 2750
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:LD1117S33TR_SOT223 U2
U 1 1 61434446
P 4950 2500
F 0 "U2" H 4950 2742 50  0001 C CNN
F 1 "LD1117AV33_TO220" H 4950 2651 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 4950 2700 50  0001 C CNN
F 3 "http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/CD00000544.pdf" H 5050 2250 50  0001 C CNN
	1    4950 2500
	1    0    0    -1  
$EndComp
$Comp
L Device:CP 100uF_1
U 1 1 6151DFD1
P 4350 2750
F 0 "100uF_1" H 4468 2796 50  0001 L CNN
F 1 "100uF" H 4000 2750 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 4388 2600 50  0001 C CNN
F 3 "~" H 4350 2750 50  0001 C CNN
	1    4350 2750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 614135F8
P 8700 2600
F 0 "R5" H 8650 2650 50  0000 L CNN
F 1 "10kΩ" V 8600 2500 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 8630 2600 50  0001 C CNN
F 3 "https://www.distrelec.ch/en/high-power-thick-film-smd-resistor-0805-62ohm-330mw-rnd-components-rnd-155hp05w3f620jt5e/p/30111853?q=*&pos=2&origPos=1629&origPageSize=50&track=true" H 8700 2600 50  0001 C CNN
F 4 "C17902" H 8700 2600 50  0001 C CNN "JLCPCB"
	1    8700 2600
	1    0    0    -1  
$EndComp
$Comp
L Device:R R6
U 1 1 614112FB
P 8800 3800
F 0 "R6" H 8750 3800 50  0000 L CNN
F 1 "10kΩ" V 8700 3700 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 8730 3800 50  0001 C CNN
F 3 "https://www.distrelec.ch/en/high-power-thick-film-smd-resistor-0805-62ohm-330mw-rnd-components-rnd-155hp05w3f620jt5e/p/30111853?q=*&pos=2&origPos=1629&origPageSize=50&track=true" H 8800 3800 50  0001 C CNN
F 4 "C17902" H 8800 3800 50  0001 C CNN "JLCPCB"
	1    8800 3800
	1    0    0    -1  
$EndComp
$Comp
L Device:R R7
U 1 1 61409E5F
P 8800 4800
F 0 "R7" H 8750 4800 50  0000 L CNN
F 1 "10kΩ" V 8700 4700 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 8730 4800 50  0001 C CNN
F 3 "https://www.distrelec.ch/en/high-power-thick-film-smd-resistor-0805-62ohm-330mw-rnd-components-rnd-155hp05w3f620jt5e/p/30111853?q=*&pos=2&origPos=1629&origPageSize=50&track=true" H 8800 4800 50  0001 C CNN
F 4 "C17902" H 8800 4800 50  0001 C CNN "JLCPCB"
	1    8800 4800
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 J6
U 1 1 6140A7FD
P 5550 3600
F 0 "J6" H 5468 3175 50  0000 C CNN
F 1 "ESP Sensors" H 5250 3250 50  0000 C CNN
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
L Device:Fuse F1
U 1 1 613D9E49
P 5050 900
F 0 "F1" V 5247 900 50  0000 C CNN
F 1 "250V1A" V 5156 900 50  0000 C CNN
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
L Device:CP_Small C11
U 1 1 613BAE65
P 10000 5500
F 0 "C11" H 9912 5454 50  0000 R CNN
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
F 1 "39kΩ3w" V 10350 5900 50  0000 C CNN
F 2 "Resistor_SMD:R_2512_6332Metric_Pad1.52x3.35mm_HandSolder" V 10180 5850 50  0001 C CNN
F 3 "https://www.distrelec.ch/en/super-high-power-smd-resistor-2512-82kohm-3w-rnd-components-rnd-155sp123wf8202t2e/p/30150189?q=*&pos=1&origPos=3001&origPageSize=50&digitalDataLayerTerm=resistor&track=true" H 10250 5850 50  0001 C CNN
F 4 "C144424" H 10250 5850 50  0001 C CNN "JLCPCB"
	1    10250 5850
	0    1    1    0   
$EndComp
$Comp
L Device:CP_Small C10
U 1 1 613B6BB6
P 10000 4500
F 0 "C10" H 9912 4454 50  0000 R CNN
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
L Device:CP_Small C9
U 1 1 613B1E5B
P 10000 3500
F 0 "C9" H 9912 3454 50  0000 R CNN
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
F 1 "39kΩ3w" V 10350 2650 50  0000 C CNN
F 2 "Resistor_SMD:R_2512_6332Metric_Pad1.52x3.35mm_HandSolder" V 10180 2650 50  0001 C CNN
F 3 "https://www.distrelec.ch/en/super-high-power-smd-resistor-2512-82kohm-3w-rnd-components-rnd-155sp123wf8202t2e/p/30150189?q=*&pos=1&origPos=3001&origPageSize=50&digitalDataLayerTerm=resistor&track=true" H 10250 2650 50  0001 C CNN
F 4 "C144424" V 10250 2650 50  0001 C CNN "JLCPCB"
	1    10250 2650
	0    1    1    0   
$EndComp
$Comp
L Device:CP_Small C8
U 1 1 6137D081
P 10000 2300
F 0 "C8" H 9912 2254 50  0000 R CNN
F 1 "22uF" H 9912 2345 50  0000 R CNN
F 2 "Capacitor_Tantalum_SMD:CP_EIA-3528-21_Kemet-B_Pad1.50x2.35mm_HandSolder" H 10000 2300 50  0001 C CNN
F 3 "https://datasheet.lcsc.com/lcsc/1809281529_KEMET-T491B226K016AT_C110051.pdf" H 10000 2300 50  0001 C CNN
F 4 "C110051" H 10000 2300 50  0001 C CNN "JLCPCB"
	1    10000 2300
	-1   0    0    1   
$EndComp
$Comp
L Device:R R14
U 1 1 61354B0C
P 10250 3850
F 0 "R14" V 10043 3850 50  0001 C CNN
F 1 "39kΩ3w" V 10350 3850 50  0000 C CNN
F 2 "Resistor_SMD:R_2512_6332Metric_Pad1.52x3.35mm_HandSolder" V 10180 3850 50  0001 C CNN
F 3 "https://www.distrelec.ch/en/super-high-power-smd-resistor-2512-82kohm-3w-rnd-components-rnd-155sp123wf8202t2e/p/30150189?q=*&pos=1&origPos=3001&origPageSize=50&digitalDataLayerTerm=resistor&track=true" H 10250 3850 50  0001 C CNN
F 4 "C144424" H 10250 3850 50  0001 C CNN "JLCPCB"
	1    10250 3850
	0    1    1    0   
$EndComp
$Comp
L Mechanical:MountingHole_Pad H2
U 1 1 618C5DAB
P 1000 7500
F 0 "H2" H 950 7650 50  0000 L CNN
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
F 0 "H1" H 750 7650 50  0000 L CNN
F 1 "MountingHole_Pad" H 900 7458 50  0001 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_ISO14580_Pad" H 800 7500 50  0001 C CNN
F 3 "~" H 800 7500 50  0001 C CNN
	1    800  7500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R8
U 1 1 613FE2E1
P 8800 5800
F 0 "R8" H 8750 5800 50  0000 L CNN
F 1 "10kΩ" V 8700 5700 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 8730 5800 50  0001 C CNN
F 3 "https://www.distrelec.ch/en/high-power-thick-film-smd-resistor-0805-62ohm-330mw-rnd-components-rnd-155hp05w3f620jt5e/p/30111853?q=*&pos=2&origPos=1629&origPageSize=50&track=true" H 8800 5800 50  0001 C CNN
F 4 "C17902" H 8800 5800 50  0001 C CNN "JLCPCB"
	1    8800 5800
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C1
U 1 1 6192260B
P 8250 2600
F 0 "C1" H 8600 2500 50  0000 R CNN
F 1 "100nF" H 8600 2600 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8288 2450 50  0001 C CNN
F 3 "https://www.distrelec.ch/en/ceramic-capacitor-100nf-50vdc-0805-rnd-components-rnd-1500805b104j500nt/p/30086635?q=smd+capacitor+&pos=5&origPos=990&origPageSize=50&track=true" H 8250 2600 50  0001 C CNN
F 4 "C28233" H 8250 2600 50  0001 C CNN "JLCPCB"
	1    8250 2600
	-1   0    0    1   
$EndComp
$Comp
L Device:CP C2
U 1 1 6192BF97
P 8350 5750
F 0 "C2" H 8468 5796 50  0001 L CNN
F 1 "100nF" H 8650 5750 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8388 5600 50  0001 C CNN
F 3 "https://www.distrelec.ch/en/ceramic-capacitor-100nf-50vdc-0805-rnd-components-rnd-1500805b104j500nt/p/30086635?q=smd+capacitor+&pos=5&origPos=990&origPageSize=50&track=true" H 8350 5750 50  0001 C CNN
F 4 "C28233" H 8350 5750 50  0001 C CNN "JLCPCB"
	1    8350 5750
	-1   0    0    1   
$EndComp
$Comp
L Device:CP C4
U 1 1 61940C95
P 8350 4800
F 0 "C4" H 8468 4846 50  0001 L CNN
F 1 "100nF" H 8650 4800 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8388 4650 50  0001 C CNN
F 3 "https://www.distrelec.ch/en/ceramic-capacitor-100nf-50vdc-0805-rnd-components-rnd-1500805b104j500nt/p/30086635?q=smd+capacitor+&pos=5&origPos=990&origPageSize=50&track=true" H 8350 4800 50  0001 C CNN
F 4 "C28233" H 8350 4800 50  0001 C CNN "JLCPCB"
	1    8350 4800
	-1   0    0    1   
$EndComp
Text GLabel 8800 4650 0    50   Input ~ 0
EspSens2
Text GLabel 8800 3650 0    50   Input ~ 0
EspSens3
$Comp
L Device:CP C3
U 1 1 6195BF13
P 8350 3750
F 0 "C3" H 8468 3796 50  0001 L CNN
F 1 "100nF" H 8650 3750 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8388 3600 50  0001 C CNN
F 3 "https://www.distrelec.ch/en/ceramic-capacitor-100nf-50vdc-0805-rnd-components-rnd-1500805b104j500nt/p/30086635?q=smd+capacitor+&pos=5&origPos=990&origPageSize=50&track=true" H 8350 3750 50  0001 C CNN
F 4 "C28233" H 8350 3750 50  0001 C CNN "JLCPCB"
	1    8350 3750
	-1   0    0    1   
$EndComp
Wire Wire Line
	8350 3600 8350 3350
Wire Wire Line
	8900 3350 8350 3350
Wire Wire Line
	8350 3900 8350 3950
Wire Wire Line
	6900 1250 6900 1400
Wire Wire Line
	6900 1500 6800 1500
Wire Wire Line
	6800 1500 6800 1650
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
$Comp
L Connector:Conn_01x02_Male J11
U 1 1 6176729E
P 5650 2300
F 0 "J11" V 5600 2250 50  0001 R CNN
F 1 "Current Jumper" V 5600 2550 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 5650 2300 50  0001 C CNN
F 3 "~" H 5650 2300 50  0001 C CNN
	1    5650 2300
	0    1    1    0   
$EndComp
$Comp
L Device:R R17
U 1 1 61799149
P 10550 5850
F 0 "R17" V 10343 5850 50  0001 C CNN
F 1 "39kΩ3w" V 10650 5900 50  0000 C CNN
F 2 "Resistor_SMD:R_2512_6332Metric_Pad1.52x3.35mm_HandSolder" V 10480 5850 50  0001 C CNN
F 3 "https://www.distrelec.ch/en/super-high-power-smd-resistor-2512-82kohm-3w-rnd-components-rnd-155sp123wf8202t2e/p/30150189?q=*&pos=1&origPos=3001&origPageSize=50&digitalDataLayerTerm=resistor&track=true" H 10550 5850 50  0001 C CNN
F 4 "C144424" H 10550 5850 50  0001 C CNN "JLCPCB"
	1    10550 5850
	0    1    1    0   
$EndComp
$Comp
L Device:R R15
U 1 1 6179BC18
P 10550 4850
F 0 "R15" V 10343 4850 50  0001 C CNN
F 1 "39kΩ3w" V 10650 4900 50  0000 C CNN
F 2 "Resistor_SMD:R_2512_6332Metric_Pad1.52x3.35mm_HandSolder" V 10480 4850 50  0001 C CNN
F 3 "https://www.distrelec.ch/en/super-high-power-smd-resistor-2512-82kohm-3w-rnd-components-rnd-155sp123wf8202t2e/p/30150189?q=*&pos=1&origPos=3001&origPageSize=50&digitalDataLayerTerm=resistor&track=true" H 10550 4850 50  0001 C CNN
F 4 "C144424" H 10550 4850 50  0001 C CNN "JLCPCB"
	1    10550 4850
	0    1    1    0   
$EndComp
$Comp
L Device:R R13
U 1 1 6179E8C9
P 10550 3850
F 0 "R13" V 10343 3850 50  0001 C CNN
F 1 "39kΩ3w" V 10650 3900 50  0000 C CNN
F 2 "Resistor_SMD:R_2512_6332Metric_Pad1.52x3.35mm_HandSolder" V 10480 3850 50  0001 C CNN
F 3 "https://www.distrelec.ch/en/super-high-power-smd-resistor-2512-82kohm-3w-rnd-components-rnd-155sp123wf8202t2e/p/30150189?q=*&pos=1&origPos=3001&origPageSize=50&digitalDataLayerTerm=resistor&track=true" H 10550 3850 50  0001 C CNN
F 4 "C144424" H 10550 3850 50  0001 C CNN "JLCPCB"
	1    10550 3850
	0    1    1    0   
$EndComp
$Comp
L Device:R R11
U 1 1 617A141C
P 10550 2650
F 0 "R11" V 10343 2650 50  0001 C CNN
F 1 "39kΩ3w" V 10650 2700 50  0000 C CNN
F 2 "Resistor_SMD:R_2512_6332Metric_Pad1.52x3.35mm_HandSolder" V 10480 2650 50  0001 C CNN
F 3 "https://www.distrelec.ch/en/super-high-power-smd-resistor-2512-82kohm-3w-rnd-components-rnd-155sp123wf8202t2e/p/30150189?q=*&pos=1&origPos=3001&origPageSize=50&digitalDataLayerTerm=resistor&track=true" H 10550 2650 50  0001 C CNN
F 4 "C144424" H 10550 2650 50  0001 C CNN "JLCPCB"
	1    10550 2650
	0    1    1    0   
$EndComp
Wire Wire Line
	8250 2150 8250 2450
Wire Wire Line
	8900 2650 8900 2750
Wire Wire Line
	8900 2750 8700 2750
Connection ~ 8700 2750
Wire Wire Line
	8250 2150 8900 2150
Wire Wire Line
	8250 2750 8700 2750
Wire Wire Line
	8700 2450 8900 2450
Text GLabel 3950 4300 0    50   Input ~ 0
REI3
Text GLabel 3950 4400 0    50   Input ~ 0
REI2
Text GLabel 3950 4200 0    50   Input ~ 0
REI4
Text GLabel 3950 4500 0    50   Input ~ 0
REI1
Text GLabel 4750 4400 2    50   Input ~ 0
EspRel3
Text GLabel 4750 4300 2    50   Input ~ 0
EspRel2
Text GLabel 4750 4200 2    50   Input ~ 0
EspRel1
$Comp
L Transistor_Array:ULN2003A U1
U 1 1 61374AC1
P 4350 4600
F 0 "U1" H 4300 5250 50  0000 L CNN
F 1 "ULN2003A" H 4150 5150 50  0000 L CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 4400 4050 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/uln2003a.pdf" H 4450 4400 50  0001 C CNN
F 4 "C7512" V 4350 4600 50  0001 C CNN "JLCPCB"
	1    4350 4600
	-1   0    0    1   
$EndComp
Text GLabel 4750 4500 2    50   Input ~ 0
EspRel4
Text GLabel 5750 4100 2    50   Input ~ 0
EspRel3
Text GLabel 5750 4000 2    50   Input ~ 0
EspRel2
Text GLabel 5750 3900 2    50   Input ~ 0
EspRel1
Text GLabel 5750 4200 2    50   Input ~ 0
EspRel4
Text GLabel 5800 1900 2    50   UnSpc ~ 0
220VAC(N)
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 61958F51
P 9800 2650
F 0 "#FLG0101" H 9800 2725 50  0001 C CNN
F 1 "PWR_FLAG" H 9800 2823 50  0000 C CNN
F 2 "" H 9800 2650 50  0001 C CNN
F 3 "~" H 9800 2650 50  0001 C CNN
	1    9800 2650
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
L power:PWR_FLAG #FLG0102
U 1 1 6195CF42
P 9800 3850
F 0 "#FLG0102" H 9800 3925 50  0001 C CNN
F 1 "PWR_FLAG" H 9800 4023 50  0001 C CNN
F 2 "" H 9800 3850 50  0001 C CNN
F 3 "~" H 9800 3850 50  0001 C CNN
	1    9800 3850
	-1   0    0    1   
$EndComp
$Comp
L power:PWR_FLAG #FLG0103
U 1 1 6195F09D
P 9800 4850
F 0 "#FLG0103" H 9800 4925 50  0001 C CNN
F 1 "PWR_FLAG" H 9800 5023 50  0001 C CNN
F 2 "" H 9800 4850 50  0001 C CNN
F 3 "~" H 9800 4850 50  0001 C CNN
	1    9800 4850
	-1   0    0    1   
$EndComp
$Comp
L power:PWR_FLAG #FLG0104
U 1 1 619612EA
P 9800 5850
F 0 "#FLG0104" H 9800 5925 50  0001 C CNN
F 1 "PWR_FLAG" H 9800 6023 50  0001 C CNN
F 2 "" H 9800 5850 50  0001 C CNN
F 3 "~" H 9800 5850 50  0001 C CNN
	1    9800 5850
	-1   0    0    1   
$EndComp
$Comp
L power:PWR_FLAG #FLG0106
U 1 1 619655E5
P 5200 900
F 0 "#FLG0106" H 5200 975 50  0001 C CNN
F 1 "PWR_FLAG" H 5200 1073 50  0001 C CNN
F 2 "" H 5200 900 50  0001 C CNN
F 3 "~" H 5200 900 50  0001 C CNN
	1    5200 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	8900 3850 8900 3950
Wire Wire Line
	8900 3950 8800 3950
Wire Wire Line
	8350 3950 8800 3950
Connection ~ 8800 3950
Wire Wire Line
	8800 3650 8900 3650
Wire Wire Line
	8350 4350 8350 4650
Wire Wire Line
	8350 4350 8900 4350
Wire Wire Line
	8350 4950 8800 4950
Wire Wire Line
	8800 4950 8900 4950
Wire Wire Line
	8900 4950 8900 4850
Connection ~ 8800 4950
Wire Wire Line
	8900 4650 8800 4650
Wire Wire Line
	8800 5650 8900 5650
Wire Wire Line
	8900 5850 8900 5950
Wire Wire Line
	8900 5950 8800 5950
Wire Wire Line
	8800 5950 8350 5950
Connection ~ 8800 5950
Wire Wire Line
	8350 5950 8350 5900
Wire Wire Line
	8350 5600 8350 5350
Wire Wire Line
	8350 5350 8900 5350
$Comp
L power:PWR_FLAG #FLG0107
U 1 1 619A2B0A
P 6900 1400
F 0 "#FLG0107" H 6900 1475 50  0001 C CNN
F 1 "PWR_FLAG" H 6900 1573 50  0001 C CNN
F 2 "" H 6900 1400 50  0001 C CNN
F 3 "~" H 6900 1400 50  0001 C CNN
	1    6900 1400
	0    -1   -1   0   
$EndComp
$Comp
L power:PWR_FLAG #FLG0108
U 1 1 619A4871
P 5650 2500
F 0 "#FLG0108" H 5650 2575 50  0001 C CNN
F 1 "PWR_FLAG" H 5650 2673 50  0001 C CNN
F 2 "" H 5650 2500 50  0001 C CNN
F 3 "~" H 5650 2500 50  0001 C CNN
	1    5650 2500
	-1   0    0    1   
$EndComp
NoConn ~ 4750 4600
NoConn ~ 4750 4700
NoConn ~ 4750 4800
NoConn ~ 3950 4800
NoConn ~ 3950 4700
NoConn ~ 3950 4600
$Comp
L Device:CP C5
U 1 1 619D049D
P 5550 2750
F 0 "C5" H 5668 2796 50  0001 L CNN
F 1 "100nF" H 5850 2750 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5588 2600 50  0001 C CNN
F 3 "https://www.distrelec.ch/en/ceramic-capacitor-100nf-50vdc-0805-rnd-components-rnd-1500805b104j500nt/p/30086635?q=smd+capacitor+&pos=5&origPos=990&origPageSize=50&track=true" H 5550 2750 50  0001 C CNN
F 4 "C28233" H 5550 2750 50  0001 C CNN "JLCPCB"
	1    5550 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 2500 5550 2500
Wire Wire Line
	5550 2500 5550 2600
Connection ~ 5550 2500
Wire Wire Line
	5550 2900 5300 2900
Connection ~ 5300 2900
$Comp
L Device:CP C7
U 1 1 61809E87
P 4600 2750
F 0 "C7" H 4718 2796 50  0001 L CNN
F 1 "100nF" H 4900 2750 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4638 2600 50  0001 C CNN
F 3 "https://www.distrelec.ch/en/ceramic-capacitor-100nf-50vdc-0805-rnd-components-rnd-1500805b104j500nt/p/30086635?q=smd+capacitor+&pos=5&origPos=990&origPageSize=50&track=true" H 4600 2750 50  0001 C CNN
F 4 "C28233" H 4600 2750 50  0001 C CNN "JLCPCB"
	1    4600 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 2600 4350 2500
Wire Wire Line
	4350 2500 4250 2500
Wire Wire Line
	4350 2500 4600 2500
Connection ~ 4350 2500
Wire Wire Line
	4600 2600 4600 2500
Connection ~ 4600 2500
Wire Wire Line
	4600 2500 4650 2500
Wire Wire Line
	4600 2900 4350 2900
Connection ~ 4600 2900
$Comp
L Device:CP C6
U 1 1 6181C340
P 3950 3950
F 0 "C6" H 4068 3996 50  0001 L CNN
F 1 "100nF" H 4250 3950 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3988 3800 50  0001 C CNN
F 3 "https://www.distrelec.ch/en/ceramic-capacitor-100nf-50vdc-0805-rnd-components-rnd-1500805b104j500nt/p/30086635?q=smd+capacitor+&pos=5&origPos=990&origPageSize=50&track=true" H 3950 3950 50  0001 C CNN
F 4 "C28233" H 3950 3950 50  0001 C CNN "JLCPCB"
	1    3950 3950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4350 4000 4100 4000
Wire Wire Line
	4100 4000 4100 3950
Wire Wire Line
	3800 3950 3650 3950
Wire Wire Line
	3650 3950 3650 4900
Wire Wire Line
	3650 4900 3950 4900
Wire Wire Line
	3950 4900 3950 5000
$Comp
L pcn-105D3:PCN-124D3MHZ,000 K1
U 1 1 618622EC
P 1450 2100
F 0 "K1" H 1850 2325 50  0000 C CNN
F 1 "PCN-105D" H 1850 2234 50  0000 C CNN
F 2 "PCN:bigpads_TE_Connectivity-PCN-124D" H 1450 2500 50  0001 L CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=showdoc&DocId=Data+Sheet%7FPCN_series_relay_data_sheet_E%7F1217%7Fpdf%7FEnglish%7FENG_DS_PCN_series_relay_data_sheet_E_1217.pdf%7F3-1461491-6" H 1450 2600 50  0001 L CNN
F 4 "+85°C" H 1450 2700 50  0001 L CNN "ambient temperature range high"
F 5 "-40°C" H 1450 2800 50  0001 L CNN "ambient temperature range low"
F 6 "No" H 1450 2900 50  0001 L CNN "automotive"
F 7 "Relay" H 1450 3000 50  0001 L CNN "category"
F 8 "120mW" H 1450 3100 50  0001 L CNN "coil power"
F 9 "4800Ω" H 1450 3200 50  0001 L CNN "coil resistance"
F 10 "Non-Latching" H 1450 3300 50  0001 L CNN "coil type"
F 11 "24V" H 1450 3400 50  0001 L CNN "coil voltage"
F 12 "3A" H 1450 3500 50  0001 L CNN "current rating"
F 13 "Electromechanical" H 1450 3600 50  0001 L CNN "device class L1"
F 14 "Relays" H 1450 3700 50  0001 L CNN "device class L2"
F 15 "Power Relays" H 1450 3800 50  0001 L CNN "device class L3"
F 16 "RELAY GEN PURPOSE SPST 3A 24V" H 1450 3900 50  0001 L CNN "digikey description"
F 17 "PB906-ND" H 1450 4000 50  0001 L CNN "digikey part number"
F 18 "12.8mm" H 1450 4100 50  0001 L CNN "height"
F 19 "Yes" H 1450 4200 50  0001 L CNN "lead free"
F 20 "591278d9da046128" H 1450 4300 50  0001 L CNN "library id"
F 21 "TE Connectivity" H 1450 4400 50  0001 L CNN "manufacturer"
F 22 "655-PCN-124D3MHZ,000" H 1450 4500 50  0001 L CNN "mouser part number"
F 23 "1" H 1450 4600 50  0001 L CNN "number of contacts"
F 24 "PTH_RELAY_20MM0_5MM0" H 1450 4700 50  0001 L CNN "package"
F 25 "Yes" H 1450 4800 50  0001 L CNN "rohs"
F 26 "3A" H 1450 4900 50  0001 L CNN "switching current"
F 27 "SPST" H 1450 5000 50  0001 L CNN "throw configuration"
	1    1450 2100
	1    0    0    -1  
$EndComp
Text GLabel 2150 3250 2    50   Input ~ 0
220VAC(L)
Text GLabel 1550 3450 0    50   Input ~ 0
REI2
$Comp
L pcn-105D3:PCN-124D3MHZ,000 K2
U 1 1 61875C62
P 1450 3250
F 0 "K2" H 1850 3475 50  0000 C CNN
F 1 "PCN-105D" H 1850 3384 50  0000 C CNN
F 2 "PCN:bigpads_TE_Connectivity-PCN-124D" H 1450 3650 50  0001 L CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=showdoc&DocId=Data+Sheet%7FPCN_series_relay_data_sheet_E%7F1217%7Fpdf%7FEnglish%7FENG_DS_PCN_series_relay_data_sheet_E_1217.pdf%7F3-1461491-6" H 1450 3750 50  0001 L CNN
F 4 "+85°C" H 1450 3850 50  0001 L CNN "ambient temperature range high"
F 5 "-40°C" H 1450 3950 50  0001 L CNN "ambient temperature range low"
F 6 "No" H 1450 4050 50  0001 L CNN "automotive"
F 7 "Relay" H 1450 4150 50  0001 L CNN "category"
F 8 "120mW" H 1450 4250 50  0001 L CNN "coil power"
F 9 "4800Ω" H 1450 4350 50  0001 L CNN "coil resistance"
F 10 "Non-Latching" H 1450 4450 50  0001 L CNN "coil type"
F 11 "24V" H 1450 4550 50  0001 L CNN "coil voltage"
F 12 "3A" H 1450 4650 50  0001 L CNN "current rating"
F 13 "Electromechanical" H 1450 4750 50  0001 L CNN "device class L1"
F 14 "Relays" H 1450 4850 50  0001 L CNN "device class L2"
F 15 "Power Relays" H 1450 4950 50  0001 L CNN "device class L3"
F 16 "RELAY GEN PURPOSE SPST 3A 24V" H 1450 5050 50  0001 L CNN "digikey description"
F 17 "PB906-ND" H 1450 5150 50  0001 L CNN "digikey part number"
F 18 "12.8mm" H 1450 5250 50  0001 L CNN "height"
F 19 "Yes" H 1450 5350 50  0001 L CNN "lead free"
F 20 "591278d9da046128" H 1450 5450 50  0001 L CNN "library id"
F 21 "TE Connectivity" H 1450 5550 50  0001 L CNN "manufacturer"
F 22 "655-PCN-124D3MHZ,000" H 1450 5650 50  0001 L CNN "mouser part number"
F 23 "1" H 1450 5750 50  0001 L CNN "number of contacts"
F 24 "PTH_RELAY_20MM0_5MM0" H 1450 5850 50  0001 L CNN "package"
F 25 "Yes" H 1450 5950 50  0001 L CNN "rohs"
F 26 "3A" H 1450 6050 50  0001 L CNN "switching current"
F 27 "SPST" H 1450 6150 50  0001 L CNN "throw configuration"
	1    1450 3250
	1    0    0    -1  
$EndComp
Text GLabel 2150 3450 2    50   Input ~ 0
5V+
Text GLabel 2200 4550 2    50   Input ~ 0
220VAC(L)
Text GLabel 1600 4750 0    50   Input ~ 0
REI3
$Comp
L pcn-105D3:PCN-124D3MHZ,000 K3
U 1 1 6187BE46
P 1500 4550
F 0 "K3" H 1900 4775 50  0000 C CNN
F 1 "PCN-105D" H 1900 4684 50  0000 C CNN
F 2 "PCN:bigpads_TE_Connectivity-PCN-124D" H 1500 4950 50  0001 L CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=showdoc&DocId=Data+Sheet%7FPCN_series_relay_data_sheet_E%7F1217%7Fpdf%7FEnglish%7FENG_DS_PCN_series_relay_data_sheet_E_1217.pdf%7F3-1461491-6" H 1500 5050 50  0001 L CNN
F 4 "+85°C" H 1500 5150 50  0001 L CNN "ambient temperature range high"
F 5 "-40°C" H 1500 5250 50  0001 L CNN "ambient temperature range low"
F 6 "No" H 1500 5350 50  0001 L CNN "automotive"
F 7 "Relay" H 1500 5450 50  0001 L CNN "category"
F 8 "120mW" H 1500 5550 50  0001 L CNN "coil power"
F 9 "4800Ω" H 1500 5650 50  0001 L CNN "coil resistance"
F 10 "Non-Latching" H 1500 5750 50  0001 L CNN "coil type"
F 11 "24V" H 1500 5850 50  0001 L CNN "coil voltage"
F 12 "3A" H 1500 5950 50  0001 L CNN "current rating"
F 13 "Electromechanical" H 1500 6050 50  0001 L CNN "device class L1"
F 14 "Relays" H 1500 6150 50  0001 L CNN "device class L2"
F 15 "Power Relays" H 1500 6250 50  0001 L CNN "device class L3"
F 16 "RELAY GEN PURPOSE SPST 3A 24V" H 1500 6350 50  0001 L CNN "digikey description"
F 17 "PB906-ND" H 1500 6450 50  0001 L CNN "digikey part number"
F 18 "12.8mm" H 1500 6550 50  0001 L CNN "height"
F 19 "Yes" H 1500 6650 50  0001 L CNN "lead free"
F 20 "591278d9da046128" H 1500 6750 50  0001 L CNN "library id"
F 21 "TE Connectivity" H 1500 6850 50  0001 L CNN "manufacturer"
F 22 "655-PCN-124D3MHZ,000" H 1500 6950 50  0001 L CNN "mouser part number"
F 23 "1" H 1500 7050 50  0001 L CNN "number of contacts"
F 24 "PTH_RELAY_20MM0_5MM0" H 1500 7150 50  0001 L CNN "package"
F 25 "Yes" H 1500 7250 50  0001 L CNN "rohs"
F 26 "3A" H 1500 7350 50  0001 L CNN "switching current"
F 27 "SPST" H 1500 7450 50  0001 L CNN "throw configuration"
	1    1500 4550
	1    0    0    -1  
$EndComp
Text GLabel 2200 4750 2    50   Input ~ 0
5V+
Text GLabel 2150 5750 2    50   Input ~ 0
220VAC(L)
Text GLabel 1550 5950 0    50   Input ~ 0
REI4
$Comp
L pcn-105D3:PCN-124D3MHZ,000 K4
U 1 1 6187F6F7
P 1450 5750
F 0 "K4" H 1850 5975 50  0000 C CNN
F 1 "PCN-105D" H 1850 5884 50  0000 C CNN
F 2 "PCN:bigpads_TE_Connectivity-PCN-124D" H 1450 6150 50  0001 L CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=showdoc&DocId=Data+Sheet%7FPCN_series_relay_data_sheet_E%7F1217%7Fpdf%7FEnglish%7FENG_DS_PCN_series_relay_data_sheet_E_1217.pdf%7F3-1461491-6" H 1450 6250 50  0001 L CNN
F 4 "+85°C" H 1450 6350 50  0001 L CNN "ambient temperature range high"
F 5 "-40°C" H 1450 6450 50  0001 L CNN "ambient temperature range low"
F 6 "No" H 1450 6550 50  0001 L CNN "automotive"
F 7 "Relay" H 1450 6650 50  0001 L CNN "category"
F 8 "120mW" H 1450 6750 50  0001 L CNN "coil power"
F 9 "4800Ω" H 1450 6850 50  0001 L CNN "coil resistance"
F 10 "Non-Latching" H 1450 6950 50  0001 L CNN "coil type"
F 11 "24V" H 1450 7050 50  0001 L CNN "coil voltage"
F 12 "3A" H 1450 7150 50  0001 L CNN "current rating"
F 13 "Electromechanical" H 1450 7250 50  0001 L CNN "device class L1"
F 14 "Relays" H 1450 7350 50  0001 L CNN "device class L2"
F 15 "Power Relays" H 1450 7450 50  0001 L CNN "device class L3"
F 16 "RELAY GEN PURPOSE SPST 3A 24V" H 1450 7550 50  0001 L CNN "digikey description"
F 17 "PB906-ND" H 1450 7650 50  0001 L CNN "digikey part number"
F 18 "12.8mm" H 1450 7750 50  0001 L CNN "height"
F 19 "Yes" H 1450 7850 50  0001 L CNN "lead free"
F 20 "591278d9da046128" H 1450 7950 50  0001 L CNN "library id"
F 21 "TE Connectivity" H 1450 8050 50  0001 L CNN "manufacturer"
F 22 "655-PCN-124D3MHZ,000" H 1450 8150 50  0001 L CNN "mouser part number"
F 23 "1" H 1450 8250 50  0001 L CNN "number of contacts"
F 24 "PTH_RELAY_20MM0_5MM0" H 1450 8350 50  0001 L CNN "package"
F 25 "Yes" H 1450 8450 50  0001 L CNN "rohs"
F 26 "3A" H 1450 8550 50  0001 L CNN "switching current"
F 27 "SPST" H 1450 8650 50  0001 L CNN "throw configuration"
	1    1450 5750
	1    0    0    -1  
$EndComp
Text GLabel 2150 5950 2    50   Input ~ 0
5V+
Connection ~ 5200 1900
$Comp
L Device:Fuse F2
U 1 1 618BE6D0
P 5650 1900
F 0 "F2" V 5550 1900 50  0000 C CNN
F 1 "250v50mA" V 5500 1900 50  0000 C CNN
F 2 "Fuse:Fuse_Littelfuse_372_D8.50mm" V 5580 1900 50  0001 C CNN
F 3 "~" H 5650 1900 50  0001 C CNN
	1    5650 1900
	0    -1   -1   0   
$EndComp
$Comp
L power:PWR_FLAG #FLG0105
U 1 1 61963454
P 5200 1900
F 0 "#FLG0105" H 5200 1975 50  0001 C CNN
F 1 "PWR_FLAG" H 5200 2073 50  0001 C CNN
F 2 "" H 5200 1900 50  0001 C CNN
F 3 "~" H 5200 1900 50  0001 C CNN
	1    5200 1900
	-1   0    0    1   
$EndComp
Text GLabel 6450 2350 2    50   Input ~ 0
GND(5V)
Text GLabel 6450 2250 2    50   Input ~ 0
3.3V+
Text GLabel 6450 2850 2    50   Input ~ 0
GND(5V)
Wire Wire Line
	9800 2650 10100 2650
Connection ~ 9800 2650
Wire Wire Line
	10100 3850 9800 3850
Connection ~ 9800 3850
Wire Wire Line
	10100 4850 9800 4850
Connection ~ 9800 4850
Wire Wire Line
	9800 5850 10100 5850
Connection ~ 9800 5850
$Comp
L wago-2604-1104:2604-1104 J4
U 1 1 61912494
P 8050 1450
F 0 "J4" H 7892 863 60  0000 C CNN
F 1 "2604-1104" H 7892 969 60  0000 C CNN
F 2 "wago-2604-1104:big_pads_2604-1104" H 8050 1390 60  0001 C CNN
F 3 "" H 8050 1450 60  0000 C CNN
	1    8050 1450
	-1   0    0    1   
$EndComp
Text GLabel 10050 1600 0    50   Input ~ 0
Sens1
Text GLabel 10050 1500 0    50   Input ~ 0
Sens2
Text GLabel 10050 1400 0    50   Input ~ 0
Sens3
Text GLabel 10050 1300 0    50   Input ~ 0
Sens4
$Comp
L wago-2604-1104:2604-1104 J1
U 1 1 61952879
P 1350 800
F 0 "J1" H 1192 213 60  0000 C CNN
F 1 "2604-1104" H 1192 319 60  0000 C CNN
F 2 "wago-2604-1104:big_pads_2604-1104" H 1350 740 60  0001 C CNN
F 3 "" H 1350 800 60  0000 C CNN
	1    1350 800 
	0    -1   -1   0   
$EndComp
$Comp
L wago-2604-1102:2604-1102 J3
U 1 1 61964B73
P 4150 1350
F 0 "J3" H 3992 963 60  0000 C CNN
F 1 "2604-1102" H 3992 1069 60  0000 C CNN
F 2 "wago-2604-1102:big_pads_2604-1102" H 4150 1290 60  0001 C CNN
F 3 "" H 4150 1350 60  0000 C CNN
	1    4150 1350
	-1   0    0    1   
$EndComp
Text GLabel 4550 1450 2    50   Input ~ 0
L_IN
Wire Wire Line
	4550 1550 4550 1450
Text GLabel 4900 900  0    50   Input ~ 0
L_IN
Text GLabel 4550 1350 2    50   Input ~ 0
N_IN
Wire Wire Line
	4550 1250 4550 1350
Text GLabel 5200 1900 0    50   Input ~ 0
N_IN
$Comp
L Device:CP_Small C13
U 1 1 619AAA89
P 5600 6250
F 0 "C13" H 5512 6204 50  0000 R CNN
F 1 "22uF" H 5512 6295 50  0000 R CNN
F 2 "Capacitor_Tantalum_SMD:CP_EIA-3528-21_Kemet-B_Pad1.50x2.35mm_HandSolder" H 5600 6250 50  0001 C CNN
F 3 "https://datasheet.lcsc.com/lcsc/1809281529_KEMET-T491B226K016AT_C110051.pdf" H 5600 6250 50  0001 C CNN
F 4 "C110051" H 5600 6250 50  0001 C CNN "JLCPCB"
	1    5600 6250
	-1   0    0    1   
$EndComp
$Comp
L Device:CP C12
U 1 1 619AF631
P 5350 6250
F 0 "C12" H 5468 6296 50  0001 L CNN
F 1 "100nF" H 5650 6250 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5388 6100 50  0001 C CNN
F 3 "https://www.distrelec.ch/en/ceramic-capacitor-100nf-50vdc-0805-rnd-components-rnd-1500805b104j500nt/p/30086635?q=smd+capacitor+&pos=5&origPos=990&origPageSize=50&track=true" H 5350 6250 50  0001 C CNN
F 4 "C28233" H 5350 6250 50  0001 C CNN "JLCPCB"
	1    5350 6250
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 619B2453
P 5050 6250
F 0 "R1" V 4800 6400 50  0001 C CNN
F 1 "100Ω" V 4950 6250 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 4980 6250 50  0001 C CNN
F 3 "https://www.distrelec.ch/en/high-power-thick-film-smd-resistor-0805-150ohm-330mw-rnd-components-rnd-155hp05w3f1500t5e/p/30111774?q=*&pos=2&origPos=1787&origPageSize=50&track=true" H 5050 6250 50  0001 C CNN
F 4 "C17408" H 5050 6250 50  0001 C CNN "JLCPCB"
	1    5050 6250
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D1
U 1 1 619B245A
P 5150 6250
F 0 "D1" H 5250 6600 50  0001 C CNN
F 1 "LED" H 5300 6200 50  0001 C CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5150 6250 50  0001 C CNN
F 3 "https://www.distrelec.ch/en/smd-led-green-575nm-20ma-2v-140-everlight-electronics-17-21sygc-s530-e1-tr8/p/17531205?q=*&pos=9&origPos=371&origPageSize=50&track=true" H 5150 6250 50  0001 C CNN
F 4 "C2297" H 5150 6250 50  0001 C CNN "JLCPCB"
	1    5150 6250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5050 6100 5150 6100
Wire Wire Line
	5150 6100 5350 6100
Connection ~ 5150 6100
Wire Wire Line
	5350 6100 5600 6100
Wire Wire Line
	5600 6100 5600 6150
Connection ~ 5350 6100
Wire Wire Line
	5600 6350 5600 6400
Wire Wire Line
	5600 6400 5350 6400
Wire Wire Line
	5350 6400 5150 6400
Connection ~ 5350 6400
$Comp
L Mechanical:MountingHole_Pad H4
U 1 1 61A179CD
P 1400 7500
F 0 "H4" H 1350 7650 50  0000 L CNN
F 1 "MountingHole_Pad" H 1500 7458 50  0001 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_ISO14580_Pad" H 1400 7500 50  0001 C CNN
F 3 "~" H 1400 7500 50  0001 C CNN
	1    1400 7500
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H5
U 1 1 61A2C786
P 1600 7500
F 0 "H5" H 1550 7650 50  0000 L CNN
F 1 "MountingHole_Pad" H 1700 7458 50  0001 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_ISO14580_Pad" H 1600 7500 50  0001 C CNN
F 3 "~" H 1600 7500 50  0001 C CNN
	1    1600 7500
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H3
U 1 1 61474CE2
P 1200 7500
F 0 "H3" H 1150 7650 50  0000 L CNN
F 1 "MountingHole_Pad" H 1300 7458 50  0001 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_ISO14580_Pad" H 1200 7500 50  0001 C CNN
F 3 "~" H 1200 7500 50  0001 C CNN
	1    1200 7500
	1    0    0    -1  
$EndComp
NoConn ~ 1200 7600
NoConn ~ 1400 7600
NoConn ~ 1600 7600
Wire Wire Line
	1650 1200 1550 1200
Wire Wire Line
	1450 1200 1350 1200
Wire Wire Line
	1250 1200 1150 1200
Wire Wire Line
	1050 1200 950  1200
NoConn ~ 5050 6400
Wire Wire Line
	8450 1150 8450 1250
Wire Wire Line
	8450 1350 8450 1450
Wire Wire Line
	8450 1550 8450 1650
Wire Wire Line
	8450 1750 8450 1850
Wire Wire Line
	7200 1400 7200 1500
$Comp
L Device:LED D9
U 1 1 619D076D
P 7050 1500
F 0 "D9" H 7150 1850 50  0001 C CNN
F 1 "LED" H 7200 1450 50  0001 C CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7050 1500 50  0001 C CNN
F 3 "https://www.distrelec.ch/en/smd-led-green-575nm-20ma-2v-140-everlight-electronics-17-21sygc-s530-e1-tr8/p/17531205?q=*&pos=9&origPos=371&origPageSize=50&track=true" H 7050 1500 50  0001 C CNN
F 4 "C2297" H 7050 1500 50  0001 C CNN "JLCPCB"
	1    7050 1500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R9
U 1 1 619CF60C
P 7050 1400
F 0 "R9" V 6800 1550 50  0001 C CNN
F 1 "100Ω" V 7000 1600 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 6980 1400 50  0001 C CNN
F 3 "https://www.distrelec.ch/en/high-power-thick-film-smd-resistor-0805-150ohm-330mw-rnd-components-rnd-155hp05w3f1500t5e/p/30111774?q=*&pos=2&origPos=1787&origPageSize=50&track=true" H 7050 1400 50  0001 C CNN
F 4 "C17408" H 7050 1400 50  0001 C CNN "JLCPCB"
	1    7050 1400
	0    1    1    0   
$EndComp
$Comp
L Mechanical:MountingHole_Pad H6
U 1 1 61AC391A
P 1800 7500
F 0 "H6" H 1750 7650 50  0000 L CNN
F 1 "MountingHole_Pad" H 1900 7458 50  0001 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_ISO14580_Pad" H 1800 7500 50  0001 C CNN
F 3 "~" H 1800 7500 50  0001 C CNN
	1    1800 7500
	1    0    0    -1  
$EndComp
NoConn ~ 1800 7600
$EndSCHEMATC
