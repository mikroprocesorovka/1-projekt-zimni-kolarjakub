   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.1 - 30 Jun 2020
   3                     ; Generator (Limited) V4.4.12 - 02 Jul 2020
  76                     ; 13 void lcd_store_symbol(uint8_t pos, uint8_t* charmap){
  78                     	switch	.text
  79  0000               _lcd_store_symbol:
  81  0000 88            	push	a
  82  0001 88            	push	a
  83       00000001      OFST:	set	1
  86                     ; 15 if(pos>7) return;
  88  0002 a108          	cp	a,#8
  89  0004 2421          	jruge	L6
  92                     ; 16 lcd_command(LCD_SET_CGRAM | pos);
  94  0006 7b02          	ld	a,(OFST+1,sp)
  95  0008 aa40          	or	a,#64
  96  000a cd0280        	call	_lcd_command
  98                     ; 17 for(i=0;i<8;i++){
 100  000d 0f01          	clr	(OFST+0,sp)
 102  000f               L54:
 103                     ; 18 lcd_data(charmap[i]);
 105  000f 7b01          	ld	a,(OFST+0,sp)
 106  0011 5f            	clrw	x
 107  0012 97            	ld	xl,a
 108  0013 72fb05        	addw	x,(OFST+4,sp)
 109  0016 f6            	ld	a,(x)
 110  0017 cd02aa        	call	_lcd_data
 112                     ; 17 for(i=0;i<8;i++){
 114  001a 0c01          	inc	(OFST+0,sp)
 118  001c 7b01          	ld	a,(OFST+0,sp)
 119  001e a108          	cp	a,#8
 120  0020 25ed          	jrult	L54
 121                     ; 20 lcd_command(LCD_SET_DDRAM | 0); // other funtions (like lcd_puts) relies that address counter points into DDRAM
 123  0022 a680          	ld	a,#128
 124  0024 cd0280        	call	_lcd_command
 126                     ; 21 }
 127  0027               L6:
 130  0027 85            	popw	x
 131  0028 81            	ret
 167                     ; 25 void lcd_puts(char* text){
 168                     	switch	.text
 169  0029               _lcd_puts:
 171  0029 89            	pushw	x
 172       00000000      OFST:	set	0
 175  002a 200d          	jra	L37
 176  002c               L17:
 177                     ; 27 		lcd_data(*text);
 179  002c 1e01          	ldw	x,(OFST+1,sp)
 180  002e f6            	ld	a,(x)
 181  002f cd02aa        	call	_lcd_data
 183                     ; 28 		text++;
 185  0032 1e01          	ldw	x,(OFST+1,sp)
 186  0034 1c0001        	addw	x,#1
 187  0037 1f01          	ldw	(OFST+1,sp),x
 188  0039               L37:
 189                     ; 26 	while(*text){
 191  0039 1e01          	ldw	x,(OFST+1,sp)
 192  003b 7d            	tnz	(x)
 193  003c 26ee          	jrne	L17
 194                     ; 30 }
 197  003e 85            	popw	x
 198  003f 81            	ret
 232                     ; 32 void lcd_init(void){
 233                     	switch	.text
 234  0040               _lcd_init:
 238                     ; 33 	lcd_init_hw();
 240  0040 cd00d4        	call	_lcd_init_hw
 242                     ; 35 	lcd_bus_outputs();
 244  0043 cd00f8        	call	_lcd_bus_outputs
 246                     ; 21 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);
 250  0046 ae04eb        	ldw	x,#1259
 252  0049 9d            nop
 253  004a                L41:
 254  004a 5a             decw X
 255  004b 26fd           jrne L41
 256  004d 9d             nop
 257                      
 259  004e               L101:
 260                     ; 38 	lcd_bus_set(0b0011);
 262  004e a603          	ld	a,#3
 263  0050 cd01a0        	call	_lcd_bus_set
 265                     ; 39 	lcd_e_tick();
 267  0053 cd025d        	call	_lcd_e_tick
 269                     ; 21 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);
 273  0056 ae0188        	ldw	x,#392
 275  0059 9d            nop
 276  005a                L61:
 277  005a 5a             decw X
 278  005b 26fd           jrne L61
 279  005d 9d             nop
 280                      
 282  005e               L501:
 283                     ; 42 	lcd_bus_set(0b0011);
 285  005e a603          	ld	a,#3
 286  0060 cd01a0        	call	_lcd_bus_set
 288                     ; 43 	lcd_e_tick();
 290  0063 cd025d        	call	_lcd_e_tick
 292                     ; 21 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);
 296  0066 ae0216        	ldw	x,#534
 298  0069 9d            nop
 299  006a                L02:
 300  006a 5a             decw X
 301  006b 26fd           jrne L02
 302  006d 9d             nop
 303                      
 305  006e               L111:
 306                     ; 46 	lcd_bus_set(0b0011);
 308  006e a603          	ld	a,#3
 309  0070 cd01a0        	call	_lcd_bus_set
 311                     ; 47 	lcd_e_tick();
 313  0073 cd025d        	call	_lcd_e_tick
 315                     ; 48 	lcd_bus_set(0b0010);
 317  0076 a602          	ld	a,#2
 318  0078 cd01a0        	call	_lcd_bus_set
 320                     ; 49 	lcd_e_tick();
 322  007b cd025d        	call	_lcd_e_tick
 324                     ; 21 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);
 328  007e ae00d6        	ldw	x,#214
 330  0081 9d            nop
 331  0082                L22:
 332  0082 5a             decw X
 333  0083 26fd           jrne L22
 334  0085 9d             nop
 335                      
 337  0086               L511:
 338                     ; 55 	lcd_command(LCD_FUNCTION_SET | LCD_4BITS | LCD_2LINES | USED_FONT);
 340  0086 a628          	ld	a,#40
 341  0088 cd0280        	call	_lcd_command
 343                     ; 57 	lcd_command(LCD_ENTRY_MODE_SET | LCD_INCREMENT | LCD_DISPLAY_NOSHIFT);
 345  008b a606          	ld	a,#6
 346  008d cd0280        	call	_lcd_command
 348                     ; 58 	lcd_command(LCD_DISPLAY_ONOFF | LCD_ON | LCD_CURSOR_OFF | LCD_BLINK_OFF);
 350  0090 a60c          	ld	a,#12
 351  0092 cd0280        	call	_lcd_command
 353                     ; 59 	lcd_command(LCD_CURSOR_OR_DISPLAY_SHIFT | LCD_CURSOR_SHIFT | LCD_SHIFT_RIGHT);
 355  0095 a614          	ld	a,#20
 356  0097 cd0280        	call	_lcd_command
 358                     ; 60 	lcd_command(LCD_DISPLAY_CLEAR);
 360  009a a601          	ld	a,#1
 361  009c cd0280        	call	_lcd_command
 363                     ; 61 	lcd_command(LCD_RETURN_HOME);
 365  009f a602          	ld	a,#2
 366  00a1 cd0280        	call	_lcd_command
 368                     ; 62 }
 371  00a4 81            	ret
 424                     ; 64 void lcd_gotoxy(uint8_t column, uint8_t line){
 425                     	switch	.text
 426  00a5               _lcd_gotoxy:
 428  00a5 89            	pushw	x
 429  00a6 88            	push	a
 430       00000001      OFST:	set	1
 433                     ; 65 	uint8_t tmp=0;
 435  00a7 0f01          	clr	(OFST+0,sp)
 437                     ; 77 	if(column > (LCD_COLUMNS-1)){column=LCD_COLUMNS-1;}
 439  00a9 9e            	ld	a,xh
 440  00aa a110          	cp	a,#16
 441  00ac 2504          	jrult	L551
 444  00ae a60f          	ld	a,#15
 445  00b0 6b02          	ld	(OFST+1,sp),a
 446  00b2               L551:
 447                     ; 78 	if(line == 0){tmp=0x00;}
 449  00b2 0d03          	tnz	(OFST+2,sp)
 450  00b4 2604          	jrne	L751
 453  00b6 0f01          	clr	(OFST+0,sp)
 456  00b8 200a          	jra	L161
 457  00ba               L751:
 458                     ; 79 	else if(line==1){tmp = 0x40;}
 460  00ba 7b03          	ld	a,(OFST+2,sp)
 461  00bc a101          	cp	a,#1
 462  00be 2604          	jrne	L161
 465  00c0 a640          	ld	a,#64
 466  00c2 6b01          	ld	(OFST+0,sp),a
 468  00c4               L161:
 469                     ; 80 	tmp = tmp + column;
 471  00c4 7b01          	ld	a,(OFST+0,sp)
 472  00c6 1b02          	add	a,(OFST+1,sp)
 473  00c8 6b01          	ld	(OFST+0,sp),a
 475                     ; 87 	lcd_command(LCD_SET_DDRAM | tmp);
 477  00ca 7b01          	ld	a,(OFST+0,sp)
 478  00cc aa80          	or	a,#128
 479  00ce cd0280        	call	_lcd_command
 481                     ; 88 }
 484  00d1 5b03          	addw	sp,#3
 485  00d3 81            	ret
 510                     ; 91 void lcd_init_hw(void){
 511                     	switch	.text
 512  00d4               _lcd_init_hw:
 516                     ; 110  GPIO_Init(LCD_RS_PORT,LCD_RS_PIN,GPIO_MODE_OUT_PP_LOW_SLOW);
 518  00d4 4bc0          	push	#192
 519  00d6 4b04          	push	#4
 520  00d8 ae500f        	ldw	x,#20495
 521  00db cd0000        	call	_GPIO_Init
 523  00de 85            	popw	x
 524                     ; 111  GPIO_Init(LCD_RW_PORT,LCD_RW_PIN,GPIO_MODE_OUT_PP_LOW_SLOW);
 526  00df 4bc0          	push	#192
 527  00e1 4b01          	push	#1
 528  00e3 ae5019        	ldw	x,#20505
 529  00e6 cd0000        	call	_GPIO_Init
 531  00e9 85            	popw	x
 532                     ; 112  GPIO_Init(LCD_E_PORT,LCD_E_PIN,GPIO_MODE_OUT_PP_HIGH_SLOW);
 534  00ea 4bd0          	push	#208
 535  00ec 4b08          	push	#8
 536  00ee ae5019        	ldw	x,#20505
 537  00f1 cd0000        	call	_GPIO_Init
 539  00f4 85            	popw	x
 540                     ; 115  lcd_bus_outputs();
 542  00f5 ad01          	call	_lcd_bus_outputs
 544                     ; 116 }
 547  00f7 81            	ret
 571                     ; 119 void lcd_bus_outputs(void){
 572                     	switch	.text
 573  00f8               _lcd_bus_outputs:
 577                     ; 123  GPIO_Init(LCD_D4_PORT,LCD_D4_PIN,GPIO_MODE_OUT_PP_LOW_SLOW);
 579  00f8 4bc0          	push	#192
 580  00fa 4b10          	push	#16
 581  00fc ae5019        	ldw	x,#20505
 582  00ff cd0000        	call	_GPIO_Init
 584  0102 85            	popw	x
 585                     ; 124  GPIO_Init(LCD_D5_PORT,LCD_D5_PIN,GPIO_MODE_OUT_PP_LOW_SLOW);
 587  0103 4bc0          	push	#192
 588  0105 4b20          	push	#32
 589  0107 ae5019        	ldw	x,#20505
 590  010a cd0000        	call	_GPIO_Init
 592  010d 85            	popw	x
 593                     ; 125  GPIO_Init(LCD_D6_PORT,LCD_D6_PIN,GPIO_MODE_OUT_PP_LOW_SLOW);
 595  010e 4bc0          	push	#192
 596  0110 4b40          	push	#64
 597  0112 ae5019        	ldw	x,#20505
 598  0115 cd0000        	call	_GPIO_Init
 600  0118 85            	popw	x
 601                     ; 126  GPIO_Init(LCD_D7_PORT,LCD_D7_PIN,GPIO_MODE_OUT_PP_LOW_SLOW);
 603  0119 4bc0          	push	#192
 604  011b 4b80          	push	#128
 605  011d ae5019        	ldw	x,#20505
 606  0120 cd0000        	call	_GPIO_Init
 608  0123 85            	popw	x
 609                     ; 128 }
 612  0124 81            	ret
 636                     ; 131 void lcd_bus_inputs(void){
 637                     	switch	.text
 638  0125               _lcd_bus_inputs:
 642                     ; 139  GPIO_Init(LCD_D4_PORT,LCD_D4_PIN,GPIO_MODE_IN_FL_NO_IT);
 644  0125 4b00          	push	#0
 645  0127 4b10          	push	#16
 646  0129 ae5019        	ldw	x,#20505
 647  012c cd0000        	call	_GPIO_Init
 649  012f 85            	popw	x
 650                     ; 140  GPIO_Init(LCD_D5_PORT,LCD_D5_PIN,GPIO_MODE_IN_FL_NO_IT);
 652  0130 4b00          	push	#0
 653  0132 4b20          	push	#32
 654  0134 ae5019        	ldw	x,#20505
 655  0137 cd0000        	call	_GPIO_Init
 657  013a 85            	popw	x
 658                     ; 141  GPIO_Init(LCD_D6_PORT,LCD_D6_PIN,GPIO_MODE_IN_FL_NO_IT);
 660  013b 4b00          	push	#0
 661  013d 4b40          	push	#64
 662  013f ae5019        	ldw	x,#20505
 663  0142 cd0000        	call	_GPIO_Init
 665  0145 85            	popw	x
 666                     ; 142  GPIO_Init(LCD_D7_PORT,LCD_D7_PIN,GPIO_MODE_IN_FL_NO_IT); 
 668  0146 4b00          	push	#0
 669  0148 4b80          	push	#128
 670  014a ae5019        	ldw	x,#20505
 671  014d cd0000        	call	_GPIO_Init
 673  0150 85            	popw	x
 674                     ; 144 }
 677  0151 81            	ret
 701                     ; 147 void lcd_deinit_hw(void){
 702                     	switch	.text
 703  0152               _lcd_deinit_hw:
 707                     ; 148 	GPIO_Init(LCD_RS_PORT,LCD_RS_PIN,GPIO_MODE_IN_FL_NO_IT);
 709  0152 4b00          	push	#0
 710  0154 4b04          	push	#4
 711  0156 ae500f        	ldw	x,#20495
 712  0159 cd0000        	call	_GPIO_Init
 714  015c 85            	popw	x
 715                     ; 149 	GPIO_Init(LCD_RW_PORT,LCD_RW_PIN,GPIO_MODE_IN_FL_NO_IT);
 717  015d 4b00          	push	#0
 718  015f 4b01          	push	#1
 719  0161 ae5019        	ldw	x,#20505
 720  0164 cd0000        	call	_GPIO_Init
 722  0167 85            	popw	x
 723                     ; 150 	GPIO_Init(LCD_E_PORT,LCD_E_PIN,GPIO_MODE_IN_FL_NO_IT);
 725  0168 4b00          	push	#0
 726  016a 4b08          	push	#8
 727  016c ae5019        	ldw	x,#20505
 728  016f cd0000        	call	_GPIO_Init
 730  0172 85            	popw	x
 731                     ; 151 	GPIO_Init(LCD_D4_PORT,LCD_D4_PIN,GPIO_MODE_IN_FL_NO_IT);
 733  0173 4b00          	push	#0
 734  0175 4b10          	push	#16
 735  0177 ae5019        	ldw	x,#20505
 736  017a cd0000        	call	_GPIO_Init
 738  017d 85            	popw	x
 739                     ; 152 	GPIO_Init(LCD_D5_PORT,LCD_D5_PIN,GPIO_MODE_IN_FL_NO_IT);
 741  017e 4b00          	push	#0
 742  0180 4b20          	push	#32
 743  0182 ae5019        	ldw	x,#20505
 744  0185 cd0000        	call	_GPIO_Init
 746  0188 85            	popw	x
 747                     ; 153 	GPIO_Init(LCD_D6_PORT,LCD_D6_PIN,GPIO_MODE_IN_FL_NO_IT);
 749  0189 4b00          	push	#0
 750  018b 4b40          	push	#64
 751  018d ae5019        	ldw	x,#20505
 752  0190 cd0000        	call	_GPIO_Init
 754  0193 85            	popw	x
 755                     ; 154 	GPIO_Init(LCD_D7_PORT,LCD_D7_PIN,GPIO_MODE_IN_FL_NO_IT); 
 757  0194 4b00          	push	#0
 758  0196 4b80          	push	#128
 759  0198 ae5019        	ldw	x,#20505
 760  019b cd0000        	call	_GPIO_Init
 762  019e 85            	popw	x
 763                     ; 155 }
 766  019f 81            	ret
 802                     ; 158 void lcd_bus_set(uint8_t data){
 803                     	switch	.text
 804  01a0               _lcd_bus_set:
 806  01a0 88            	push	a
 807       00000000      OFST:	set	0
 810                     ; 159 	if(data & (1<<0)){LCD_D4_H;}else{LCD_D4_L;}
 812  01a1 a501          	bcp	a,#1
 813  01a3 270b          	jreq	L342
 816  01a5 4b10          	push	#16
 817  01a7 ae5019        	ldw	x,#20505
 818  01aa cd0000        	call	_GPIO_WriteHigh
 820  01ad 84            	pop	a
 822  01ae 2009          	jra	L542
 823  01b0               L342:
 826  01b0 4b10          	push	#16
 827  01b2 ae5019        	ldw	x,#20505
 828  01b5 cd0000        	call	_GPIO_WriteLow
 830  01b8 84            	pop	a
 831  01b9               L542:
 832                     ; 160 	if(data & (1<<1)){LCD_D5_H;}else{LCD_D5_L;}
 834  01b9 7b01          	ld	a,(OFST+1,sp)
 835  01bb a502          	bcp	a,#2
 836  01bd 270b          	jreq	L742
 839  01bf 4b20          	push	#32
 840  01c1 ae5019        	ldw	x,#20505
 841  01c4 cd0000        	call	_GPIO_WriteHigh
 843  01c7 84            	pop	a
 845  01c8 2009          	jra	L152
 846  01ca               L742:
 849  01ca 4b20          	push	#32
 850  01cc ae5019        	ldw	x,#20505
 851  01cf cd0000        	call	_GPIO_WriteLow
 853  01d2 84            	pop	a
 854  01d3               L152:
 855                     ; 161 	if(data & (1<<2)){LCD_D6_H;}else{LCD_D6_L;}
 857  01d3 7b01          	ld	a,(OFST+1,sp)
 858  01d5 a504          	bcp	a,#4
 859  01d7 270b          	jreq	L352
 862  01d9 4b40          	push	#64
 863  01db ae5019        	ldw	x,#20505
 864  01de cd0000        	call	_GPIO_WriteHigh
 866  01e1 84            	pop	a
 868  01e2 2009          	jra	L552
 869  01e4               L352:
 872  01e4 4b40          	push	#64
 873  01e6 ae5019        	ldw	x,#20505
 874  01e9 cd0000        	call	_GPIO_WriteLow
 876  01ec 84            	pop	a
 877  01ed               L552:
 878                     ; 162 	if(data & (1<<3)){LCD_D7_H;}else{LCD_D7_L;}
 880  01ed 7b01          	ld	a,(OFST+1,sp)
 881  01ef a508          	bcp	a,#8
 882  01f1 270b          	jreq	L752
 885  01f3 4b80          	push	#128
 886  01f5 ae5019        	ldw	x,#20505
 887  01f8 cd0000        	call	_GPIO_WriteHigh
 889  01fb 84            	pop	a
 891  01fc 2009          	jra	L162
 892  01fe               L752:
 895  01fe 4b80          	push	#128
 896  0200 ae5019        	ldw	x,#20505
 897  0203 cd0000        	call	_GPIO_WriteLow
 899  0206 84            	pop	a
 900  0207               L162:
 901                     ; 163 }
 904  0207 84            	pop	a
 905  0208 81            	ret
 940                     ; 166 uint8_t lcd_bus_read(void){
 941                     	switch	.text
 942  0209               _lcd_bus_read:
 944  0209 88            	push	a
 945       00000001      OFST:	set	1
 948                     ; 167 	uint8_t tmp=0;
 950  020a 0f01          	clr	(OFST+0,sp)
 952                     ; 168 	if(GPIO_ReadInputPin(LCD_D4_PORT,LCD_D4_PIN)){tmp |= 1<<0;}
 954  020c 4b10          	push	#16
 955  020e ae5019        	ldw	x,#20505
 956  0211 cd0000        	call	_GPIO_ReadInputPin
 958  0214 5b01          	addw	sp,#1
 959  0216 4d            	tnz	a
 960  0217 2706          	jreq	L103
 963  0219 7b01          	ld	a,(OFST+0,sp)
 964  021b aa01          	or	a,#1
 965  021d 6b01          	ld	(OFST+0,sp),a
 967  021f               L103:
 968                     ; 169 	if(GPIO_ReadInputPin(LCD_D5_PORT,LCD_D5_PIN)){tmp |= 1<<1;}
 970  021f 4b20          	push	#32
 971  0221 ae5019        	ldw	x,#20505
 972  0224 cd0000        	call	_GPIO_ReadInputPin
 974  0227 5b01          	addw	sp,#1
 975  0229 4d            	tnz	a
 976  022a 2706          	jreq	L303
 979  022c 7b01          	ld	a,(OFST+0,sp)
 980  022e aa02          	or	a,#2
 981  0230 6b01          	ld	(OFST+0,sp),a
 983  0232               L303:
 984                     ; 170 	if(GPIO_ReadInputPin(LCD_D6_PORT,LCD_D6_PIN)){tmp |= 1<<2;}
 986  0232 4b40          	push	#64
 987  0234 ae5019        	ldw	x,#20505
 988  0237 cd0000        	call	_GPIO_ReadInputPin
 990  023a 5b01          	addw	sp,#1
 991  023c 4d            	tnz	a
 992  023d 2706          	jreq	L503
 995  023f 7b01          	ld	a,(OFST+0,sp)
 996  0241 aa04          	or	a,#4
 997  0243 6b01          	ld	(OFST+0,sp),a
 999  0245               L503:
1000                     ; 171 	if(GPIO_ReadInputPin(LCD_D7_PORT,LCD_D7_PIN)){tmp |= 1<<3;}
1002  0245 4b80          	push	#128
1003  0247 ae5019        	ldw	x,#20505
1004  024a cd0000        	call	_GPIO_ReadInputPin
1006  024d 5b01          	addw	sp,#1
1007  024f 4d            	tnz	a
1008  0250 2706          	jreq	L703
1011  0252 7b01          	ld	a,(OFST+0,sp)
1012  0254 aa08          	or	a,#8
1013  0256 6b01          	ld	(OFST+0,sp),a
1015  0258               L703:
1016                     ; 172 	return tmp;
1018  0258 7b01          	ld	a,(OFST+0,sp)
1021  025a 5b01          	addw	sp,#1
1022  025c 81            	ret
1051                     ; 176 void lcd_e_tick(void){
1052                     	switch	.text
1053  025d               _lcd_e_tick:
1057                     ; 177 	LCD_E_H;
1059  025d 4b08          	push	#8
1060  025f ae5019        	ldw	x,#20505
1061  0262 cd0000        	call	_GPIO_WriteHigh
1063  0265 84            	pop	a
1064                     ; 21 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);
1068  0266 ae0006        	ldw	x,#6
1070  0269 9d            nop
1071  026a                L44:
1072  026a 5a             decw X
1073  026b 26fd           jrne L44
1074  026d 9d             nop
1075                      
1077  026e               L313:
1078                     ; 179 	LCD_E_L;
1080  026e 4b08          	push	#8
1081  0270 ae5019        	ldw	x,#20505
1082  0273 cd0000        	call	_GPIO_WriteLow
1084  0276 84            	pop	a
1085                     ; 21 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);
1089  0277 ae0006        	ldw	x,#6
1091  027a 9d            nop
1092  027b                L64:
1093  027b 5a             decw X
1094  027c 26fd           jrne L64
1095  027e 9d             nop
1096                      
1098  027f               L713:
1099                     ; 181 }
1102  027f 81            	ret
1143                     ; 184 void lcd_command(uint8_t command){
1144                     	switch	.text
1145  0280               _lcd_command:
1147  0280 88            	push	a
1148       00000000      OFST:	set	0
1151                     ; 185 	LCD_RS_L;
1153  0281 4b04          	push	#4
1154  0283 ae500f        	ldw	x,#20495
1155  0286 cd0000        	call	_GPIO_WriteLow
1157  0289 84            	pop	a
1158                     ; 21 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);
1162  028a ae0006        	ldw	x,#6
1164  028d 9d            nop
1165  028e                L25:
1166  028e 5a             decw X
1167  028f 26fd           jrne L25
1168  0291 9d             nop
1169                      
1171  0292               L333:
1172                     ; 187 	lcd_bus_set((command >> 4) & 0b1111);
1174  0292 7b01          	ld	a,(OFST+1,sp)
1175  0294 4e            	swap	a
1176  0295 a40f          	and	a,#15
1177  0297 cd01a0        	call	_lcd_bus_set
1179                     ; 188 	lcd_e_tick();
1181  029a adc1          	call	_lcd_e_tick
1183                     ; 189 	lcd_bus_set(command & 0b1111);
1185  029c 7b01          	ld	a,(OFST+1,sp)
1186  029e a40f          	and	a,#15
1187  02a0 cd01a0        	call	_lcd_bus_set
1189                     ; 190 	lcd_e_tick();
1191  02a3 adb8          	call	_lcd_e_tick
1193                     ; 191 	lcd_busy_wait();
1195  02a5 cd039f        	call	_lcd_busy_wait
1197                     ; 192 }
1200  02a8 84            	pop	a
1201  02a9 81            	ret
1242                     ; 195 void lcd_data(uint8_t data){
1243                     	switch	.text
1244  02aa               _lcd_data:
1246  02aa 88            	push	a
1247       00000000      OFST:	set	0
1250                     ; 196 	LCD_RS_H;
1252  02ab 4b04          	push	#4
1253  02ad ae500f        	ldw	x,#20495
1254  02b0 cd0000        	call	_GPIO_WriteHigh
1256  02b3 84            	pop	a
1257                     ; 21 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);
1261  02b4 ae0006        	ldw	x,#6
1263  02b7 9d            nop
1264  02b8                L65:
1265  02b8 5a             decw X
1266  02b9 26fd           jrne L65
1267  02bb 9d             nop
1268                      
1270  02bc               L553:
1271                     ; 198 	lcd_bus_set((data >> 4) & 0b1111);
1273  02bc 7b01          	ld	a,(OFST+1,sp)
1274  02be 4e            	swap	a
1275  02bf a40f          	and	a,#15
1276  02c1 cd01a0        	call	_lcd_bus_set
1278                     ; 199 	lcd_e_tick();
1280  02c4 ad97          	call	_lcd_e_tick
1282                     ; 200 	lcd_bus_set(data & 0b1111);
1284  02c6 7b01          	ld	a,(OFST+1,sp)
1285  02c8 a40f          	and	a,#15
1286  02ca cd01a0        	call	_lcd_bus_set
1288                     ; 201 	lcd_e_tick();
1290  02cd ad8e          	call	_lcd_e_tick
1292                     ; 202 	lcd_busy_wait();
1294  02cf cd039f        	call	_lcd_busy_wait
1296                     ; 203 }
1299  02d2 84            	pop	a
1300  02d3 81            	ret
1346                     ; 206 uint8_t lcd_read(void){
1347                     	switch	.text
1348  02d4               _lcd_read:
1350  02d4 88            	push	a
1351       00000001      OFST:	set	1
1354                     ; 207 	uint8_t tmp=0;
1356                     ; 208 	LCD_RS_L;
1358  02d5 4b04          	push	#4
1359  02d7 ae500f        	ldw	x,#20495
1360  02da cd0000        	call	_GPIO_WriteLow
1362  02dd 84            	pop	a
1363                     ; 209 	lcd_bus_inputs();
1365  02de cd0125        	call	_lcd_bus_inputs
1367                     ; 210 	LCD_RW_H;
1369  02e1 4b01          	push	#1
1370  02e3 ae5019        	ldw	x,#20505
1371  02e6 cd0000        	call	_GPIO_WriteHigh
1373  02e9 84            	pop	a
1374                     ; 21 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);
1378  02ea ae0006        	ldw	x,#6
1380  02ed 9d            nop
1381  02ee                L26:
1382  02ee 5a             decw X
1383  02ef 26fd           jrne L26
1384  02f1 9d             nop
1385                      
1387  02f2               L773:
1388                     ; 212 	LCD_E_H;
1390  02f2 4b08          	push	#8
1391  02f4 ae5019        	ldw	x,#20505
1392  02f7 cd0000        	call	_GPIO_WriteHigh
1394  02fa 84            	pop	a
1395                     ; 21 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);
1399  02fb ae0006        	ldw	x,#6
1401  02fe 9d            nop
1402  02ff                L46:
1403  02ff 5a             decw X
1404  0300 26fd           jrne L46
1405  0302 9d             nop
1406                      
1408  0303               L304:
1409                     ; 214 	tmp = lcd_bus_read()<<4;
1411  0303 cd0209        	call	_lcd_bus_read
1413  0306 97            	ld	xl,a
1414  0307 a610          	ld	a,#16
1415  0309 42            	mul	x,a
1416  030a 9f            	ld	a,xl
1417  030b 6b01          	ld	(OFST+0,sp),a
1419                     ; 215 	LCD_E_L;
1421  030d 4b08          	push	#8
1422  030f ae5019        	ldw	x,#20505
1423  0312 cd0000        	call	_GPIO_WriteLow
1425  0315 84            	pop	a
1426                     ; 21 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);
1430  0316 ae0006        	ldw	x,#6
1432  0319 9d            nop
1433  031a                L66:
1434  031a 5a             decw X
1435  031b 26fd           jrne L66
1436  031d 9d             nop
1437                      
1439  031e               L704:
1440                     ; 217 	LCD_E_H;
1442  031e 4b08          	push	#8
1443  0320 ae5019        	ldw	x,#20505
1444  0323 cd0000        	call	_GPIO_WriteHigh
1446  0326 84            	pop	a
1447                     ; 21 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);
1451  0327 ae0006        	ldw	x,#6
1453  032a 9d            nop
1454  032b                L07:
1455  032b 5a             decw X
1456  032c 26fd           jrne L07
1457  032e 9d             nop
1458                      
1460  032f               L314:
1461                     ; 219 	tmp |= lcd_bus_read();
1463  032f cd0209        	call	_lcd_bus_read
1465  0332 1a01          	or	a,(OFST+0,sp)
1466  0334 6b01          	ld	(OFST+0,sp),a
1468                     ; 220 	LCD_E_L;
1470  0336 4b08          	push	#8
1471  0338 ae5019        	ldw	x,#20505
1472  033b cd0000        	call	_GPIO_WriteLow
1474  033e 84            	pop	a
1475                     ; 21 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);
1479  033f ae0006        	ldw	x,#6
1481  0342 9d            nop
1482  0343                L27:
1483  0343 5a             decw X
1484  0344 26fd           jrne L27
1485  0346 9d             nop
1486                      
1488  0347               L714:
1489                     ; 222 	LCD_RW_L;
1491  0347 4b01          	push	#1
1492  0349 ae5019        	ldw	x,#20505
1493  034c cd0000        	call	_GPIO_WriteLow
1495  034f 84            	pop	a
1496                     ; 223 	lcd_bus_outputs();
1498  0350 cd00f8        	call	_lcd_bus_outputs
1500                     ; 224 	return tmp;
1502  0353 7b01          	ld	a,(OFST+0,sp)
1505  0355 5b01          	addw	sp,#1
1506  0357 81            	ret
1531                     ; 229 void lcd_bus_sleep(void){
1532                     	switch	.text
1533  0358               _lcd_bus_sleep:
1537                     ; 230 LCD_RS_H;
1539  0358 4b04          	push	#4
1540  035a ae500f        	ldw	x,#20495
1541  035d cd0000        	call	_GPIO_WriteHigh
1543  0360 84            	pop	a
1544                     ; 231 LCD_RW_H;
1546  0361 4b01          	push	#1
1547  0363 ae5019        	ldw	x,#20505
1548  0366 cd0000        	call	_GPIO_WriteHigh
1550  0369 84            	pop	a
1551                     ; 232 lcd_bus_inputs();
1553  036a cd0125        	call	_lcd_bus_inputs
1555                     ; 233 }
1558  036d 81            	ret
1584                     ; 236 void lcd_bus_wakeup(void){
1585                     	switch	.text
1586  036e               _lcd_bus_wakeup:
1590                     ; 237 LCD_RW_L;
1592  036e 4b01          	push	#1
1593  0370 ae5019        	ldw	x,#20505
1594  0373 cd0000        	call	_GPIO_WriteLow
1596  0376 84            	pop	a
1597                     ; 238 LCD_D4_H;
1599  0377 4b10          	push	#16
1600  0379 ae5019        	ldw	x,#20505
1601  037c cd0000        	call	_GPIO_WriteHigh
1603  037f 84            	pop	a
1604                     ; 239 LCD_D5_H;
1606  0380 4b20          	push	#32
1607  0382 ae5019        	ldw	x,#20505
1608  0385 cd0000        	call	_GPIO_WriteHigh
1610  0388 84            	pop	a
1611                     ; 240 LCD_D6_H;
1613  0389 4b40          	push	#64
1614  038b ae5019        	ldw	x,#20505
1615  038e cd0000        	call	_GPIO_WriteHigh
1617  0391 84            	pop	a
1618                     ; 241 LCD_D7_H;
1620  0392 4b80          	push	#128
1621  0394 ae5019        	ldw	x,#20505
1622  0397 cd0000        	call	_GPIO_WriteHigh
1624  039a 84            	pop	a
1625                     ; 242 lcd_bus_outputs();
1627  039b cd00f8        	call	_lcd_bus_outputs
1629                     ; 243 }	
1632  039e 81            	ret
1667                     ; 246 uint8_t lcd_busy_wait(void){
1668                     	switch	.text
1669  039f               _lcd_busy_wait:
1671  039f 89            	pushw	x
1672       00000002      OFST:	set	2
1675                     ; 247 	uint16_t timeout=LCD_BUSY_TIMEOUT;
1677  03a0 ae01f4        	ldw	x,#500
1678  03a3 1f01          	ldw	(OFST-1,sp),x
1681  03a5 2007          	jra	L105
1682  03a7               L574:
1683                     ; 249 		timeout--;
1685  03a7 1e01          	ldw	x,(OFST-1,sp)
1686  03a9 1d0001        	subw	x,#1
1687  03ac 1f01          	ldw	(OFST-1,sp),x
1689  03ae               L105:
1690                     ; 248 	while(timeout && lcd_busy()){
1692  03ae 1e01          	ldw	x,(OFST-1,sp)
1693  03b0 2707          	jreq	L505
1695  03b2 cd02d4        	call	_lcd_read
1697  03b5 a580          	bcp	a,#128
1698  03b7 26ee          	jrne	L574
1699  03b9               L505:
1700                     ; 251 	if(timeout==0){return 1;} // error, busy still ==1
1702  03b9 1e01          	ldw	x,(OFST-1,sp)
1703  03bb 2604          	jrne	L705
1706  03bd a601          	ld	a,#1
1708  03bf 2001          	jra	L201
1709  03c1               L705:
1710                     ; 252 	else{return 0;}
1712  03c1 4f            	clr	a
1714  03c2               L201:
1716  03c2 85            	popw	x
1717  03c3 81            	ret
1730                     	xdef	_lcd_store_symbol
1731                     	xdef	_lcd_puts
1732                     	xdef	_lcd_gotoxy
1733                     	xdef	_lcd_init
1734                     	xdef	_lcd_bus_wakeup
1735                     	xdef	_lcd_bus_sleep
1736                     	xdef	_lcd_busy_wait
1737                     	xdef	_lcd_read
1738                     	xdef	_lcd_data
1739                     	xdef	_lcd_command
1740                     	xdef	_lcd_e_tick
1741                     	xdef	_lcd_bus_read
1742                     	xdef	_lcd_bus_inputs
1743                     	xdef	_lcd_bus_outputs
1744                     	xdef	_lcd_deinit_hw
1745                     	xdef	_lcd_init_hw
1746                     	xdef	_lcd_bus_set
1747                     	xref	_GPIO_ReadInputPin
1748                     	xref	_GPIO_WriteLow
1749                     	xref	_GPIO_WriteHigh
1750                     	xref	_GPIO_Init
1769                     	end
