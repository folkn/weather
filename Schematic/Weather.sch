EESchema Schematic File Version 4
LIBS:Weather-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Folk2 Weather Station"
Date "2018-12-05"
Rev "2"
Comp "Thammasat University"
Comment1 "Department of Electrical and Computer Engineering"
Comment2 "5910756062 Chayatorn Naithong"
Comment3 "5910751485 Warapong Narongrit"
Comment4 ""
$EndDescr
$Comp
L Sensor:DHT11 U2
U 1 1 5BE11633
P 10600 2150
F 0 "U2" H 10370 2196 50  0000 R CNN
F 1 "DHT11" H 10370 2105 50  0000 R CNN
F 2 "" H 10750 2400 50  0001 C CNN
F 3 "http://akizukidenshi.com/download/ds/aosong/DHT11.pdf" H 10750 2400 50  0001 C CNN
	1    10600 2150
	-1   0    0    -1  
$EndComp
$Comp
L Arduino:Arduino_Mega2560_Shield XA1
U 1 1 5BE1B984
P 7900 3200
F 0 "XA1" V 7800 3500 60  0000 C CNN
F 1 "Arduino_Mega2560_Shield" V 7700 3450 60  0000 C CNN
F 2 "Connector:Arduino_Mega2560_Shield" H 8600 5950 60  0001 C CNN
F 3 "https://store.arduino.cc/arduino-mega-2560-rev3" H 8600 5950 60  0001 C CNN
	1    7900 3200
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x04_Counter_Clockwise J1
U 1 1 5BE1CBBB
P 5250 4600
F 0 "J1" H 5300 4917 50  0000 C CNN
F 1 "Connector" H 5300 4826 50  0000 C CNN
F 2 "Connector_IDC:IDC-Header_2x04_P2.54mm_Vertical" H 5250 4600 50  0001 C CNN
F 3 "~" H 5250 4600 50  0001 C CNN
	1    5250 4600
	1    0    0    -1  
$EndComp
$Comp
L Connector:AudioJack3_Ground J?
U 1 1 5BE3336C
P 2850 3050
F 0 "J?" H 2800 3392 50  0000 C CNN
F 1 "PJ313" H 2800 3301 50  0000 C CNN
F 2 "" H 2850 3050 50  0001 C CNN
F 3 "~" H 2850 3050 50  0001 C CNN
	1    2850 3050
	1    0    0    -1  
$EndComp
$Comp
L Sensors:BMP280_Breakout U?
U 1 1 5BE33CDD
P 4900 3000
F 0 "U?" H 5128 2690 50  0000 L CNN
F 1 "BMP280_Breakout" H 5128 2599 50  0000 L CNN
F 2 "" H 4900 3000 50  0001 C CNN
F 3 "" H 4900 3000 50  0001 C CNN
	1    4900 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 3650 5050 3900
Wire Wire Line
	4950 3650 4950 3900
Text Label 5050 3900 1    50   ~ 0
SDA
Text Label 4950 3900 1    50   ~ 0
SCL
Wire Wire Line
	6600 1850 6400 1850
Wire Wire Line
	6600 1950 6400 1950
Text Label 6400 1850 0    50   ~ 0
SDA
Text Label 6400 1950 0    50   ~ 0
SCL
Wire Wire Line
	6600 4950 6350 4950
$Comp
L power:+5V #PWR?
U 1 1 5BEA50AA
P 6200 5050
F 0 "#PWR?" H 6200 4900 50  0001 C CNN
F 1 "+5V" H 6215 5223 50  0000 C CNN
F 2 "" H 6200 5050 50  0001 C CNN
F 3 "" H 6200 5050 50  0001 C CNN
	1    6200 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 5050 6600 5050
$Comp
L power:+3.3V #PWR?
U 1 1 5BEA513E
P 6350 4950
F 0 "#PWR?" H 6350 4800 50  0001 C CNN
F 1 "+3.3V" H 6365 5123 50  0000 C CNN
F 2 "" H 6350 4950 50  0001 C CNN
F 3 "" H 6350 4950 50  0001 C CNN
	1    6350 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 4450 6400 4450
Wire Wire Line
	6400 4450 6400 4500
$Comp
L power:GND #PWR?
U 1 1 5BEA51C7
P 6400 4500
F 0 "#PWR?" H 6400 4250 50  0001 C CNN
F 1 "GND" H 6405 4327 50  0000 C CNN
F 2 "" H 6400 4500 50  0001 C CNN
F 3 "" H 6400 4500 50  0001 C CNN
	1    6400 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 3650 4850 3950
$Comp
L power:GND #PWR?
U 1 1 5BEA53D4
P 4850 3950
F 0 "#PWR?" H 4850 3700 50  0001 C CNN
F 1 "GND" H 4855 3777 50  0000 C CNN
F 2 "" H 4850 3950 50  0001 C CNN
F 3 "" H 4850 3950 50  0001 C CNN
	1    4850 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 3650 4750 3700
Wire Wire Line
	4750 3700 4550 3700
$Comp
L power:+3.3V #PWR?
U 1 1 5BEA54E8
P 4550 3700
F 0 "#PWR?" H 4550 3550 50  0001 C CNN
F 1 "+3.3V" H 4565 3873 50  0000 C CNN
F 2 "" H 4550 3700 50  0001 C CNN
F 3 "" H 4550 3700 50  0001 C CNN
	1    4550 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	10700 1850 10700 1750
$Comp
L power:+5V #PWR?
U 1 1 5BEA5D22
P 10700 1750
F 0 "#PWR?" H 10700 1600 50  0001 C CNN
F 1 "+5V" H 10715 1923 50  0000 C CNN
F 2 "" H 10700 1750 50  0001 C CNN
F 3 "" H 10700 1750 50  0001 C CNN
	1    10700 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	10700 2450 10700 2550
$Comp
L power:GND #PWR?
U 1 1 5BEA5E2C
P 10700 2550
F 0 "#PWR?" H 10700 2300 50  0001 C CNN
F 1 "GND" H 10705 2377 50  0000 C CNN
F 2 "" H 10700 2550 50  0001 C CNN
F 3 "" H 10700 2550 50  0001 C CNN
	1    10700 2550
	1    0    0    -1  
$EndComp
$Comp
L Sensors:RainSensorADC U?
U 1 1 5BEA6AB0
P 3750 2500
F 0 "U?" V 3375 2075 50  0000 C CNN
F 1 "RainSensorADC" V 3466 2075 50  0000 C CNN
F 2 "" H 3750 2500 50  0001 C CNN
F 3 "" H 3750 2500 50  0001 C CNN
	1    3750 2500
	0    1    1    0   
$EndComp
Wire Wire Line
	3750 2550 4200 2550
Wire Wire Line
	4200 2550 4200 2650
$Comp
L power:GND #PWR?
U 1 1 5BEA7307
P 4200 2650
F 0 "#PWR?" H 4200 2400 50  0001 C CNN
F 1 "GND" H 4205 2477 50  0000 C CNN
F 2 "" H 4200 2650 50  0001 C CNN
F 3 "" H 4200 2650 50  0001 C CNN
	1    4200 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 2650 3900 2650
$Comp
L power:+5V #PWR?
U 1 1 5BEA75F0
P 3900 2650
F 0 "#PWR?" H 3900 2500 50  0001 C CNN
F 1 "+5V" H 3915 2823 50  0000 C CNN
F 2 "" H 3900 2650 50  0001 C CNN
F 3 "" H 3900 2650 50  0001 C CNN
	1    3900 2650
	1    0    0    -1  
$EndComp
NoConn ~ 3750 2450
$Comp
L Sensors:RainSensorPad U?
U 1 1 5BEA7C56
P 3350 3950
F 0 "U?" H 3023 3422 50  0000 R CNN
F 1 "RainSensorPad" H 3023 3513 50  0000 R CNN
F 2 "" H 3350 3950 50  0001 C CNN
F 3 "" H 3350 3950 50  0001 C CNN
	1    3350 3950
	1    0    0    1   
$EndComp
Wire Wire Line
	2900 2450 2400 2450
Wire Wire Line
	2400 2450 2400 3050
Wire Wire Line
	2400 3050 2550 3050
Wire Wire Line
	2900 2550 2500 2550
Wire Wire Line
	2500 2550 2500 2950
Wire Wire Line
	2500 2950 2550 2950
Wire Wire Line
	3050 3050 3300 3050
Wire Wire Line
	3300 3050 3300 3100
Wire Wire Line
	3050 2950 3400 2950
Wire Wire Line
	3400 2950 3400 3100
NoConn ~ 3050 3150
NoConn ~ 2550 3150
$Comp
L freetronics_schematic:RES_PHOTO_LDR R?
U 1 1 5BEA9B74
P 1350 4800
F 0 "R?" V 1250 4750 50  0000 L CNN
F 1 "RES_PHOTO_LDR" V 1500 4750 24  0001 L CNN
F 2 "" H 1350 4800 60  0000 C CNN
F 3 "" H 1350 4800 60  0000 C CNN
	1    1350 4800
	0    -1   1    0   
$EndComp
$Comp
L Connector_Generic:Conn_02x04_Counter_Clockwise J?
U 1 1 5BEAA00A
P 2950 4600
F 0 "J?" H 3000 4917 50  0000 C CNN
F 1 "Connector" H 3000 4826 50  0000 C CNN
F 2 "Connector_IDC:IDC-Header_2x04_P2.54mm_Vertical" H 2950 4600 50  0001 C CNN
F 3 "~" H 2950 4600 50  0001 C CNN
	1    2950 4600
	1    0    0    -1  
$EndComp
$Comp
L freetronics_schematic:RES_PHOTO_LDR R?
U 1 1 5BEAB19C
P 1900 4800
F 0 "R?" V 1800 4750 50  0000 L CNN
F 1 "RES_PHOTO_LDR" H 2086 4754 24  0001 L CNN
F 2 "" H 1900 4800 60  0000 C CNN
F 3 "" H 1900 4800 60  0000 C CNN
	1    1900 4800
	0    1    1    0   
$EndComp
Wire Wire Line
	2750 4500 2650 4500
Wire Wire Line
	1650 4500 1650 4800
Wire Wire Line
	1650 4800 1600 4800
Connection ~ 1650 4800
Wire Wire Line
	2750 4600 2250 4600
Wire Wire Line
	2250 4600 2250 4800
Wire Wire Line
	2250 4800 2150 4800
Wire Wire Line
	2750 4700 2350 4700
Wire Wire Line
	2350 4700 2350 5000
Wire Wire Line
	2350 5000 1100 5000
Wire Wire Line
	1100 5000 1100 4800
$Comp
L Sensors:LCDI2C U?
U 1 1 5BEB2385
P 2700 6000
F 0 "U?" V 2746 5423 50  0000 R CNN
F 1 "LCDI2C" V 2655 5423 50  0000 R CNN
F 2 "" H 2700 6000 50  0001 C CNN
F 3 "" H 2700 6000 50  0001 C CNN
	1    2700 6000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2750 4800 2750 4950
Wire Wire Line
	2750 4950 3050 4950
Wire Wire Line
	3050 4950 3050 5100
Wire Wire Line
	3250 4800 3250 4950
Wire Wire Line
	3250 4950 3150 4950
Wire Wire Line
	3150 4950 3150 5100
Wire Wire Line
	2650 4500 2650 5000
Wire Wire Line
	2650 5000 2950 5000
Wire Wire Line
	2950 5000 2950 5100
Connection ~ 2650 4500
Wire Wire Line
	2650 4500 1650 4500
Wire Wire Line
	3250 4500 3450 4500
Wire Wire Line
	3450 4500 3450 5050
Wire Wire Line
	3450 5050 2850 5050
Wire Wire Line
	2850 5050 2850 5100
$Comp
L Display_Character:RC1602A U?
U 1 1 5BEB4F4F
P 1450 5800
F 0 "U?" V 1450 5950 50  0000 C CNN
F 1 "LCD" V 1450 5800 50  0000 C CNN
F 2 "Display:RC1602A" H 1550 5000 50  0001 C CNN
F 3 "http://www.raystar-optronics.com/down.php?ProID=18" H 1550 5700 50  0001 C CNN
	1    1450 5800
	-1   0    0    -1  
$EndComp
Wire Bus Line
	1850 5200 2650 5200
Wire Bus Line
	2650 5200 2650 6750
Wire Bus Line
	1850 6500 1050 6500
Wire Bus Line
	1050 5100 1450 5100
Wire Bus Line
	1850 5200 1850 6500
Wire Bus Line
	1050 5100 1050 6500
NoConn ~ 3250 4600
NoConn ~ 3250 4700
Wire Wire Line
	4800 4800 5050 4800
Wire Wire Line
	5550 4800 5850 4800
Text Label 4800 4800 0    50   ~ 0
SDA
Text Label 5850 4800 2    50   ~ 0
SCL
Wire Wire Line
	5050 4500 4850 4500
Wire Wire Line
	4850 4500 4850 4450
$Comp
L power:+5V #PWR?
U 1 1 5BEBBDFE
P 4850 4450
F 0 "#PWR?" H 4850 4300 50  0001 C CNN
F 1 "+5V" H 4865 4623 50  0000 C CNN
F 2 "" H 4850 4450 50  0001 C CNN
F 3 "" H 4850 4450 50  0001 C CNN
	1    4850 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 4500 5850 4500
$Comp
L power:GND #PWR?
U 1 1 5BEBCCC8
P 5850 4500
F 0 "#PWR?" H 5850 4250 50  0001 C CNN
F 1 "GND" H 5855 4327 50  0000 C CNN
F 2 "" H 5850 4500 50  0001 C CNN
F 3 "" H 5850 4500 50  0001 C CNN
	1    5850 4500
	1    0    0    -1  
$EndComp
NoConn ~ 5550 4600
NoConn ~ 5550 4700
Wire Wire Line
	6600 2450 6400 2450
Wire Wire Line
	6600 2550 6400 2550
Text Label 6400 2450 0    50   ~ 0
A1
Text Label 6400 2550 0    50   ~ 0
A2
Wire Wire Line
	5050 4700 4450 4700
$Comp
L Device:R R?
U 1 1 5BEC4909
P 4450 4950
F 0 "R?" H 4520 4996 50  0000 L CNN
F 1 "10k" H 4520 4905 50  0000 L CNN
F 2 "" V 4380 4950 50  0001 C CNN
F 3 "~" H 4450 4950 50  0001 C CNN
	1    4450 4950
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5BEC49A1
P 4100 4950
F 0 "R?" H 4170 4996 50  0000 L CNN
F 1 "10k" H 4170 4905 50  0000 L CNN
F 2 "" V 4030 4950 50  0001 C CNN
F 3 "~" H 4100 4950 50  0001 C CNN
	1    4100 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 4700 4450 4800
Connection ~ 4450 4700
Wire Wire Line
	4350 4700 4450 4700
Text Label 4350 4700 0    50   ~ 0
A1
Wire Wire Line
	4100 4600 4100 4800
Wire Wire Line
	4100 4600 5050 4600
Wire Wire Line
	4100 4600 4000 4600
Connection ~ 4100 4600
Text Label 4000 4600 0    50   ~ 0
A2
$Comp
L power:GND #PWR?
U 1 1 5BEC962D
P 4100 5200
F 0 "#PWR?" H 4100 4950 50  0001 C CNN
F 1 "GND" H 4105 5027 50  0000 C CNN
F 2 "" H 4100 5200 50  0001 C CNN
F 3 "" H 4100 5200 50  0001 C CNN
	1    4100 5200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5BEC96A3
P 4450 5200
F 0 "#PWR?" H 4450 4950 50  0001 C CNN
F 1 "GND" H 4455 5027 50  0000 C CNN
F 2 "" H 4450 5200 50  0001 C CNN
F 3 "" H 4450 5200 50  0001 C CNN
	1    4450 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 5100 4100 5200
Wire Wire Line
	4450 5100 4450 5200
NoConn ~ 6600 4150
NoConn ~ 6600 4250
NoConn ~ 6600 4550
NoConn ~ 6600 4650
NoConn ~ 6600 4750
NoConn ~ 6600 4850
NoConn ~ 6600 5150
NoConn ~ 6600 5250
NoConn ~ 6600 5350
NoConn ~ 6600 3950
NoConn ~ 6600 2050
NoConn ~ 6600 2150
NoConn ~ 6600 1050
NoConn ~ 6600 1150
$Comp
L Device:R R?
U 1 1 5BEE01B5
P 4700 5050
F 0 "R?" H 4770 5096 50  0000 L CNN
F 1 "10k" H 4770 5005 50  0000 L CNN
F 2 "" V 4630 5050 50  0001 C CNN
F 3 "~" H 4700 5050 50  0001 C CNN
	1    4700 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	9550 4950 9550 4900
$Comp
L power:+5V #PWR?
U 1 1 5BEEF623
P 9550 4900
F 0 "#PWR?" H 9550 4750 50  0001 C CNN
F 1 "+5V" H 9565 5073 50  0000 C CNN
F 2 "" H 9550 4900 50  0001 C CNN
F 3 "" H 9550 4900 50  0001 C CNN
	1    9550 4900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5BEF0E3C
P 9750 4850
F 0 "#PWR?" H 9750 4600 50  0001 C CNN
F 1 "GND" H 9750 4900 50  0000 C CNN
F 2 "" H 9750 4850 50  0001 C CNN
F 3 "" H 9750 4850 50  0001 C CNN
	1    9750 4850
	1    0    0    -1  
$EndComp
$Comp
L Sensors:Catalex_SD U?
U 1 1 5BEF40BE
P 9800 4000
F 0 "U?" V 10700 3550 50  0000 L CNN
F 1 "Catalex_SD" V 10600 3200 50  0000 L CNN
F 2 "" H 9800 4000 50  0001 C CNN
F 3 "" H 9800 4000 50  0001 C CNN
	1    9800 4000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2950 6900 3050 6900
$Comp
L Timer_RTC:DS3231M U?
U 1 1 5BEF8436
P 1200 1850
F 0 "U?" H 1450 1850 50  0000 C CNN
F 1 "DS3231M" H 1200 1850 50  0000 C CNN
F 2 "Package_SO:SOIC-16W_7.5x10.3mm_P1.27mm" H 1200 1250 50  0001 C CNN
F 3 "http://datasheets.maximintegrated.com/en/ds/DS3231.pdf" H 1470 1900 50  0001 C CNN
	1    1200 1850
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1700 1650 1900 1650
Wire Wire Line
	1700 1750 1900 1750
Text Label 1900 1650 2    50   ~ 0
SCL
Text Label 1900 1750 2    50   ~ 0
SDA
NoConn ~ 1200 1450
$Comp
L power:+5V #PWR?
U 1 1 5BF01C90
P 1300 1400
F 0 "#PWR?" H 1300 1250 50  0001 C CNN
F 1 "+5V" H 1315 1573 50  0000 C CNN
F 2 "" H 1300 1400 50  0001 C CNN
F 3 "" H 1300 1400 50  0001 C CNN
	1    1300 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 1400 1300 1450
NoConn ~ 700  1650
NoConn ~ 700  1950
NoConn ~ 1700 2050
$Comp
L power:GND #PWR?
U 1 1 5BF084FD
P 1200 2350
F 0 "#PWR?" H 1200 2100 50  0001 C CNN
F 1 "GND" H 1205 2177 50  0000 C CNN
F 2 "" H 1200 2350 50  0001 C CNN
F 3 "" H 1200 2350 50  0001 C CNN
	1    1200 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1200 2350 1200 2250
$Comp
L ESP8266:ESP-01v090 U?
U 1 1 5BF0A1D3
P 3150 1050
F 0 "U?" H 3150 1565 50  0000 C CNN
F 1 "ESP-01v090" H 3150 1474 50  0000 C CNN
F 2 "" H 3150 1050 50  0001 C CNN
F 3 "http://l0l.org.uk/2014/12/esp8266-modules-hardware-guide-gotta-catch-em-all/" H 3150 1050 50  0001 C CNN
	1    3150 1050
	1    0    0    -1  
$EndComp
$Comp
L Sensors:5V-3V_Bidirectional_Converter U?
U 1 1 5BF19124
P 5400 1250
F 0 "U?" V 4750 1650 50  0000 C CNN
F 1 "5V-3V_Bidirectional_Converter" V 4900 1600 50  0000 C CNN
F 2 "" H 5400 1250 50  0001 C CNN
F 3 "" H 5400 1250 50  0001 C CNN
	1    5400 1250
	0    1    1    0   
$EndComp
Wire Wire Line
	10700 5350 10700 4800
Wire Wire Line
	9200 5350 10700 5350
Wire Wire Line
	10600 4800 10600 5250
Wire Wire Line
	9200 5250 10600 5250
Wire Wire Line
	10500 5150 10500 4800
Wire Wire Line
	9200 5150 10500 5150
Wire Wire Line
	10400 4800 10400 5050
Wire Wire Line
	9200 5050 10400 5050
Wire Wire Line
	10300 4800 10300 4950
Wire Wire Line
	9550 4950 10300 4950
Wire Wire Line
	10200 4850 10200 4800
Wire Wire Line
	9750 4850 10200 4850
Wire Wire Line
	9200 2150 10300 2150
$Comp
L power:GND #PWR?
U 1 1 5BF2E184
P 4950 1850
F 0 "#PWR?" H 4950 1600 50  0001 C CNN
F 1 "GND" H 4955 1677 50  0000 C CNN
F 2 "" H 4950 1850 50  0001 C CNN
F 3 "" H 4950 1850 50  0001 C CNN
	1    4950 1850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5BF2E1CC
P 5100 1850
F 0 "#PWR?" H 5100 1600 50  0001 C CNN
F 1 "GND" H 5105 1677 50  0000 C CNN
F 2 "" H 5100 1850 50  0001 C CNN
F 3 "" H 5100 1850 50  0001 C CNN
	1    5100 1850
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5BF2E28D
P 5100 750
F 0 "#PWR?" H 5100 600 50  0001 C CNN
F 1 "+5V" H 5150 900 50  0000 C CNN
F 2 "" H 5100 750 50  0001 C CNN
F 3 "" H 5100 750 50  0001 C CNN
	1    5100 750 
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 750  5100 800 
Wire Wire Line
	4950 750  4950 800 
Wire Wire Line
	4950 1700 4950 1850
Wire Wire Line
	5100 1850 5100 1700
$Comp
L power:GND #PWR?
U 1 1 5BF39F80
P 4350 900
F 0 "#PWR?" H 4350 650 50  0001 C CNN
F 1 "GND" H 4355 727 50  0000 C CNN
F 2 "" H 4350 900 50  0001 C CNN
F 3 "" H 4350 900 50  0001 C CNN
	1    4350 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 900  2200 750 
Wire Wire Line
	2200 750  4600 750 
Wire Wire Line
	4600 750  4600 1000
Wire Wire Line
	4600 1000 4700 1000
Wire Wire Line
	4100 1200 4700 1200
Wire Wire Line
	4700 1200 4700 1100
$Comp
L power:+3.3V #PWR?
U 1 1 5BF3EA66
P 1750 1100
F 0 "#PWR?" H 1750 950 50  0001 C CNN
F 1 "+3.3V" H 1765 1273 50  0000 C CNN
F 2 "" H 1750 1100 50  0001 C CNN
F 3 "" H 1750 1100 50  0001 C CNN
	1    1750 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 1100 1750 1200
Wire Wire Line
	1750 1200 2200 1200
Wire Wire Line
	2200 1000 2000 1000
Wire Wire Line
	2000 1000 2000 950 
$Comp
L power:+3.3V #PWR?
U 1 1 5BF43D34
P 2000 950
F 0 "#PWR?" H 2000 800 50  0001 C CNN
F 1 "+3.3V" H 2015 1123 50  0000 C CNN
F 2 "" H 2000 950 50  0001 C CNN
F 3 "" H 2000 950 50  0001 C CNN
	1    2000 950 
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 900  4350 900 
NoConn ~ 4100 1000
NoConn ~ 4100 1100
$Comp
L power:+3.3V #PWR?
U 1 1 5BF4BDC9
P 4950 750
F 0 "#PWR?" H 4950 600 50  0001 C CNN
F 1 "+3.3V" H 4850 900 50  0000 C CNN
F 2 "" H 4950 750 50  0001 C CNN
F 3 "" H 4950 750 50  0001 C CNN
	1    4950 750 
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 1000 6400 1000
Wire Wire Line
	6400 1000 6400 1750
Wire Wire Line
	6400 1750 6600 1750
Wire Wire Line
	6600 1650 6150 1650
Wire Wire Line
	6150 1650 6150 1100
Wire Wire Line
	6150 1100 5350 1100
Wire Wire Line
	3750 2350 6600 2350
$Comp
L Connector:Conn_01x05_Male J?
U 1 1 5BF61C50
P 9800 1550
F 0 "J?" H 9773 1573 50  0000 R CNN
F 1 "PushButtons" H 9773 1482 50  0000 R CNN
F 2 "" H 9800 1550 50  0001 C CNN
F 3 "~" H 9800 1550 50  0001 C CNN
	1    9800 1550
	-1   0    0    -1  
$EndComp
Wire Wire Line
	9600 1350 9200 1350
Wire Wire Line
	9600 1450 9200 1450
Wire Wire Line
	9600 1550 9200 1550
Wire Wire Line
	9600 1650 9200 1650
Wire Wire Line
	9600 1750 9600 1850
$Comp
L power:GND #PWR?
U 1 1 5BF816A2
P 9600 1850
F 0 "#PWR?" H 9600 1600 50  0001 C CNN
F 1 "GND" H 9605 1677 50  0000 C CNN
F 2 "" H 9600 1850 50  0001 C CNN
F 3 "" H 9600 1850 50  0001 C CNN
	1    9600 1850
	1    0    0    -1  
$EndComp
$EndSCHEMATC
