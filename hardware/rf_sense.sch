EESchema Schematic File Version 4
LIBS:remote-sequencer-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 3
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
L Connector_Generic:Conn_01x03 J?
U 1 1 5C254D3D
P 1600 3200
AR Path="/5C254D3D" Ref="J?"  Part="1" 
AR Path="/5C24E8B1/5C254D3D" Ref="J301"  Part="1" 
F 0 "J301" H 1520 3517 50  0000 C CNN
F 1 "RF_SENSE_BOARD" H 2000 3300 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 1600 3200 50  0001 C CNN
F 3 "~" H 1600 3200 50  0001 C CNN
	1    1600 3200
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5C254D44
P 1850 3200
AR Path="/5C254D44" Ref="#PWR?"  Part="1" 
AR Path="/5C24E8B1/5C254D44" Ref="#PWR0305"  Part="1" 
F 0 "#PWR0305" H 1850 2950 50  0001 C CNN
F 1 "GND" H 1855 3027 50  0000 C CNN
F 2 "" H 1850 3200 50  0001 C CNN
F 3 "" H 1850 3200 50  0001 C CNN
	1    1850 3200
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5C254D62
P 1800 2500
AR Path="/5C254D62" Ref="#PWR?"  Part="1" 
AR Path="/5C24E8B1/5C254D62" Ref="#PWR0302"  Part="1" 
F 0 "#PWR0302" H 1800 2350 50  0001 C CNN
F 1 "+5V" H 1815 2673 50  0000 C CNN
F 2 "" H 1800 2500 50  0001 C CNN
F 3 "" H 1800 2500 50  0001 C CNN
	1    1800 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 3100 1800 2550
Wire Wire Line
	1800 3200 1850 3200
$Comp
L Comparator:LM393 U301
U 1 1 5C255253
P 2850 3300
F 0 "U301" H 2850 3667 50  0000 C CNN
F 1 "LM393" H 2850 3576 50  0000 C CNN
F 2 "Housings_DIP:DIP-8_W7.62mm_Socket_LongPads" H 2850 3300 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm393-n.pdf" H 2850 3300 50  0001 C CNN
	1    2850 3300
	-1   0    0    -1  
$EndComp
$Comp
L Comparator:LM393 U301
U 3 1 5C2552C6
P 5550 2600
F 0 "U301" H 5750 2650 50  0000 R CNN
F 1 "LM393" H 5750 2550 50  0000 R CNN
F 2 "" H 5550 2600 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm393-n.pdf" H 5550 2600 50  0001 C CNN
	3    5550 2600
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2550 3300 2250 3300
$Comp
L Device:C C?
U 1 1 5C255A28
P 5850 2600
AR Path="/5C255A28" Ref="C?"  Part="1" 
AR Path="/5C24E8B1/5C255A28" Ref="C301"  Part="1" 
F 0 "C301" H 5965 2646 50  0000 L CNN
F 1 "100n" H 5965 2555 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Disc_D4.7mm_W2.5mm_P5.00mm" H 5888 2450 50  0001 C CNN
F 3 "~" H 5850 2600 50  0001 C CNN
	1    5850 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 2900 5850 2750
Wire Wire Line
	5850 2450 5850 2300
Wire Wire Line
	5650 2300 5850 2300
Wire Wire Line
	5650 2900 5850 2900
$Comp
L power:+5V #PWR?
U 1 1 5C2560BA
P 5650 2300
AR Path="/5C2560BA" Ref="#PWR?"  Part="1" 
AR Path="/5C24E8B1/5C2560BA" Ref="#PWR0301"  Part="1" 
F 0 "#PWR0301" H 5650 2150 50  0001 C CNN
F 1 "+5V" H 5665 2473 50  0000 C CNN
F 2 "" H 5650 2300 50  0001 C CNN
F 3 "" H 5650 2300 50  0001 C CNN
	1    5650 2300
	1    0    0    -1  
$EndComp
Connection ~ 5650 2300
$Comp
L power:GND #PWR?
U 1 1 5C2560F9
P 5650 2900
AR Path="/5C2560F9" Ref="#PWR?"  Part="1" 
AR Path="/5C24E8B1/5C2560F9" Ref="#PWR0304"  Part="1" 
F 0 "#PWR0304" H 5650 2650 50  0001 C CNN
F 1 "GND" H 5655 2727 50  0000 C CNN
F 2 "" H 5650 2900 50  0001 C CNN
F 3 "" H 5650 2900 50  0001 C CNN
	1    5650 2900
	1    0    0    -1  
$EndComp
Connection ~ 5650 2900
$Comp
L Comparator:LM393 U301
U 2 1 5C256EB1
P 6150 3600
F 0 "U301" H 6150 3967 50  0000 C CNN
F 1 "LM393" H 6150 3876 50  0000 C CNN
F 2 "Housings_DIP:DIP-8_W10.16mm_LongPads" H 6150 3600 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm393-n.pdf" H 6150 3600 50  0001 C CNN
	2    6150 3600
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6450 3500 6600 3500
Wire Wire Line
	6600 3500 6600 3700
Wire Wire Line
	6450 3700 6600 3700
Connection ~ 6600 3700
Wire Wire Line
	6600 3700 6600 3800
$Comp
L power:GND #PWR?
U 1 1 5C257013
P 6600 3800
AR Path="/5C257013" Ref="#PWR?"  Part="1" 
AR Path="/5C24E8B1/5C257013" Ref="#PWR0307"  Part="1" 
F 0 "#PWR0307" H 6600 3550 50  0001 C CNN
F 1 "GND" H 6605 3627 50  0000 C CNN
F 2 "" H 6600 3800 50  0001 C CNN
F 3 "" H 6600 3800 50  0001 C CNN
	1    6600 3800
	1    0    0    -1  
$EndComp
NoConn ~ 5850 3600
$Comp
L Connector_Generic:Conn_01x02 J?
U 1 1 5C258384
P 1300 4050
AR Path="/5C258384" Ref="J?"  Part="1" 
AR Path="/5C24E8B1/5C258384" Ref="J302"  Part="1" 
F 0 "J302" H 1300 4150 50  0000 C CNN
F 1 "RF_PROBE_IN" H 1650 4050 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_1x02_Pitch2.54mm" H 1300 4050 50  0001 C CNN
F 3 "~" H 1300 4050 50  0001 C CNN
	1    1300 4050
	-1   0    0    -1  
$EndComp
$Comp
L Diode:1N4007 D?
U 1 1 5C25839E
P 2800 4400
AR Path="/5C25839E" Ref="D?"  Part="1" 
AR Path="/5C24E8B1/5C25839E" Ref="D302"  Part="1" 
F 0 "D302" H 2700 4300 50  0000 C CNN
F 1 "1N4148" H 2950 4300 50  0000 C CNN
F 2 "Diodes_ThroughHole:D_DO-41_SOD81_P2.54mm_Vertical_AnodeUp" H 2800 4225 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 2800 4400 50  0001 C CNN
	1    2800 4400
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5C2583A8
P 3150 4400
AR Path="/5C2583A8" Ref="R?"  Part="1" 
AR Path="/5C24E8B1/5C2583A8" Ref="R304"  Part="1" 
F 0 "R304" V 3250 4400 50  0000 C CNN
F 1 "100K" V 3050 4400 50  0000 C CNN
F 2 "Resistors_ThroughHole:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 3080 4400 50  0001 C CNN
F 3 "~" H 3150 4400 50  0001 C CNN
	1    3150 4400
	-1   0    0    1   
$EndComp
$Comp
L Device:C C?
U 1 1 5C259203
P 2450 4050
AR Path="/5C259203" Ref="C?"  Part="1" 
AR Path="/5C24E8B1/5C259203" Ref="C303"  Part="1" 
F 0 "C303" H 2565 4096 50  0000 L CNN
F 1 "100n" H 2565 4005 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Disc_D4.7mm_W2.5mm_P5.00mm" H 2488 3900 50  0001 C CNN
F 3 "~" H 2450 4050 50  0001 C CNN
	1    2450 4050
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5C2598A2
P 2050 4550
AR Path="/5C2598A2" Ref="R?"  Part="1" 
AR Path="/5C24E8B1/5C2598A2" Ref="R305"  Part="1" 
F 0 "R305" V 2150 4600 50  0000 C CNN
F 1 "51" V 1950 4600 50  0000 C CNN
F 2 "Resistors_ThroughHole:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 1980 4550 50  0001 C CNN
F 3 "~" H 2050 4550 50  0001 C CNN
	1    2050 4550
	-1   0    0    1   
$EndComp
Wire Wire Line
	1500 4050 2050 4050
$Comp
L Connector_Generic:Conn_01x02 J?
U 1 1 5C259993
P 1850 4300
AR Path="/5C259993" Ref="J?"  Part="1" 
AR Path="/5C24E8B1/5C259993" Ref="J303"  Part="1" 
F 0 "J303" H 1850 4400 50  0000 C CNN
F 1 "51_ENABLE" V 1950 4200 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_1x02_Pitch2.54mm" H 1850 4300 50  0001 C CNN
F 3 "~" H 1850 4300 50  0001 C CNN
	1    1850 4300
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2050 4300 2050 4050
Connection ~ 2050 4050
Wire Wire Line
	2050 4050 2300 4050
Wire Wire Line
	2600 4050 2800 4050
Wire Wire Line
	2800 4050 2800 4250
Wire Wire Line
	2800 4550 2800 4750
Wire Wire Line
	2800 4750 2050 4750
Wire Wire Line
	1500 4750 1500 4150
Wire Wire Line
	2050 4700 2050 4750
Connection ~ 2050 4750
Wire Wire Line
	2050 4750 1500 4750
Wire Wire Line
	3150 4550 3150 4750
Wire Wire Line
	3150 4750 2800 4750
Connection ~ 2800 4750
Wire Wire Line
	3150 4250 3150 4050
Wire Wire Line
	3150 4050 2800 4050
Connection ~ 2800 4050
Wire Wire Line
	3150 3400 3150 4050
Connection ~ 3150 4050
$Comp
L power:GND #PWR?
U 1 1 5C25BD62
P 1500 4850
AR Path="/5C25BD62" Ref="#PWR?"  Part="1" 
AR Path="/5C24E8B1/5C25BD62" Ref="#PWR0308"  Part="1" 
F 0 "#PWR0308" H 1500 4600 50  0001 C CNN
F 1 "GND" H 1505 4677 50  0000 C CNN
F 2 "" H 1500 4850 50  0001 C CNN
F 3 "" H 1500 4850 50  0001 C CNN
	1    1500 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 4850 1500 4750
Connection ~ 1500 4750
$Comp
L Device:R R?
U 1 1 5C25C658
P 2250 3050
AR Path="/5C25C658" Ref="R?"  Part="1" 
AR Path="/5C24E8B1/5C25C658" Ref="R303"  Part="1" 
F 0 "R303" V 2150 3000 50  0000 C CNN
F 1 "1k" V 2250 3100 50  0000 C CNN
F 2 "Resistors_ThroughHole:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 2180 3050 50  0001 C CNN
F 3 "~" H 2250 3050 50  0001 C CNN
	1    2250 3050
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D?
U 1 1 5C25C65F
P 2250 2700
AR Path="/5C25C65F" Ref="D?"  Part="1" 
AR Path="/5C24E8B1/5C25C65F" Ref="D301"  Part="1" 
F 0 "D301" V 2200 2600 50  0000 C CNN
F 1 "RF OK" V 2300 2500 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_1x02_Pitch2.54mm" H 2250 2700 50  0001 C CNN
F 3 "~" H 2250 2700 50  0001 C CNN
	1    2250 2700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2250 2850 2250 2900
Wire Wire Line
	2250 2550 2150 2550
Connection ~ 1800 2550
Wire Wire Line
	1800 2550 1800 2500
Wire Wire Line
	2250 3200 2250 3300
Connection ~ 2250 3300
Wire Wire Line
	2250 3300 2150 3300
$Comp
L Device:R R?
U 1 1 5C25E37B
P 2150 3050
AR Path="/5C25E37B" Ref="R?"  Part="1" 
AR Path="/5C24E8B1/5C25E37B" Ref="R302"  Part="1" 
F 0 "R302" V 2250 3000 50  0000 C CNN
F 1 "1k" V 2150 3100 50  0000 C CNN
F 2 "Resistors_ThroughHole:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 2080 3050 50  0001 C CNN
F 3 "~" H 2150 3050 50  0001 C CNN
	1    2150 3050
	-1   0    0    1   
$EndComp
Wire Wire Line
	2150 2900 2150 2550
Connection ~ 2150 2550
Wire Wire Line
	2150 2550 1800 2550
Wire Wire Line
	2150 3200 2150 3300
Connection ~ 2150 3300
Wire Wire Line
	2150 3300 1800 3300
$Comp
L Device:R R?
U 1 1 5C25F2BC
P 4100 2750
AR Path="/5C25F2BC" Ref="R?"  Part="1" 
AR Path="/5C24E8B1/5C25F2BC" Ref="R301"  Part="1" 
F 0 "R301" V 4000 2800 50  0000 C CNN
F 1 "10k" V 4200 2750 50  0000 C CNN
F 2 "Resistors_ThroughHole:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 4030 2750 50  0001 C CNN
F 3 "~" H 4100 2750 50  0001 C CNN
	1    4100 2750
	-1   0    0    1   
$EndComp
$Comp
L Device:C C?
U 1 1 5C25F8FE
P 3750 3350
AR Path="/5C25F8FE" Ref="C?"  Part="1" 
AR Path="/5C24E8B1/5C25F8FE" Ref="C302"  Part="1" 
F 0 "C302" H 3865 3396 50  0000 L CNN
F 1 "100n" H 3865 3305 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Disc_D4.7mm_W2.5mm_P5.00mm" H 3788 3200 50  0001 C CNN
F 3 "~" H 3750 3350 50  0001 C CNN
	1    3750 3350
	-1   0    0    -1  
$EndComp
$Comp
L Device:R_POT_TRIM RV301
U 1 1 5C2604AB
P 4100 3200
F 0 "RV301" H 4031 3154 50  0000 R CNN
F 1 "1k" H 4031 3245 50  0000 R CNN
F 2 "Potentiometers:Potentiometer_Trimmer_Bourns_3006P" H 4100 3200 50  0001 C CNN
F 3 "~" H 4100 3200 50  0001 C CNN
	1    4100 3200
	-1   0    0    1   
$EndComp
Wire Wire Line
	3750 3200 3150 3200
Wire Wire Line
	3950 3200 3750 3200
Connection ~ 3750 3200
Wire Wire Line
	4100 2900 4100 3050
Wire Wire Line
	4100 3350 4100 3500
Wire Wire Line
	4100 3500 3750 3500
$Comp
L power:GND #PWR?
U 1 1 5C264CAB
P 4100 3500
AR Path="/5C264CAB" Ref="#PWR?"  Part="1" 
AR Path="/5C24E8B1/5C264CAB" Ref="#PWR0306"  Part="1" 
F 0 "#PWR0306" H 4100 3250 50  0001 C CNN
F 1 "GND" H 4105 3327 50  0000 C CNN
F 2 "" H 4100 3500 50  0001 C CNN
F 3 "" H 4100 3500 50  0001 C CNN
	1    4100 3500
	1    0    0    -1  
$EndComp
Connection ~ 4100 3500
$Comp
L power:+5V #PWR?
U 1 1 5C264CD8
P 4100 2600
AR Path="/5C264CD8" Ref="#PWR?"  Part="1" 
AR Path="/5C24E8B1/5C264CD8" Ref="#PWR0303"  Part="1" 
F 0 "#PWR0303" H 4100 2450 50  0001 C CNN
F 1 "+5V" H 4115 2773 50  0000 C CNN
F 2 "" H 4100 2600 50  0001 C CNN
F 3 "" H 4100 2600 50  0001 C CNN
	1    4100 2600
	1    0    0    -1  
$EndComp
$EndSCHEMATC
