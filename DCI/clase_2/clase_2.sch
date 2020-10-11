EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Ejercicio kicak tour k5"
Date "2020-10-08"
Rev ""
Comp "Jorge Munoz - Diseño PCB - CESE"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:D D2
U 1 1 5F7FE2E5
P 5300 3000
F 0 "D2" H 5300 3217 50  0000 C CNN
F 1 "1N4148" H 5300 3126 50  0000 C CNN
F 2 "" H 5300 3000 50  0001 C CNN
F 3 "~" H 5300 3000 50  0001 C CNN
	1    5300 3000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 5F7FE786
P 5400 2400
F 0 "C1" V 5148 2400 50  0000 C CNN
F 1 "100nF" V 5239 2400 50  0000 C CNN
F 2 "Capacitor_THT:CP_Radial_Tantal_D4.5mm_P5.00mm" H 5438 2250 50  0001 C CNN
F 3 "~" H 5400 2400 50  0001 C CNN
	1    5400 2400
	0    1    1    0   
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J1
U 1 1 5F7FFD59
P 4450 2700
F 0 "J1" H 4368 3017 50  0000 C CNN
F 1 "Conn_01x03" H 4368 2926 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 4450 2700 50  0001 C CNN
F 3 "~" H 4450 2700 50  0001 C CNN
	1    4450 2700
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5F7FC212
P 5800 2600
F 0 "R1" H 5870 2646 50  0000 L CNN
F 1 "100K" H 5870 2555 50  0000 L CNN
F 2 "" V 5730 2600 50  0001 C CNN
F 3 "~" H 5800 2600 50  0001 C CNN
	1    5800 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 2000 5800 2000
Wire Wire Line
	5800 2000 5800 2400
Wire Wire Line
	5550 2400 5800 2400
Connection ~ 5800 2400
Wire Wire Line
	5800 2400 5800 2450
Wire Wire Line
	5250 2400 5050 2400
Wire Wire Line
	5050 2400 5050 2000
Wire Wire Line
	5050 2000 5150 2000
Wire Wire Line
	4650 2600 5050 2600
Wire Wire Line
	5050 2600 5050 2400
Connection ~ 5050 2400
Wire Wire Line
	5800 2750 5800 3000
Wire Wire Line
	5800 3000 5450 3000
Wire Wire Line
	5150 3000 4650 3000
Wire Wire Line
	4650 3000 4650 2800
$Comp
L Device:LED D1
U 1 1 5F7FF4FE
P 5300 2000
F 0 "D1" H 5293 1745 50  0000 C CNN
F 1 "LED ROJO 3mm" H 5293 1836 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm_IRGrey" H 5300 2000 50  0001 C CNN
F 3 "~" H 5300 2000 50  0001 C CNN
	1    5300 2000
	-1   0    0    1   
$EndComp
NoConn ~ 4650 2700
$EndSCHEMATC
