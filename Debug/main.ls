   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.1 - 30 Jun 2020
   3                     ; Generator (Limited) V4.4.12 - 02 Jul 2020
  15                     	bsct
  16  0000               _capture_flag:
  17  0000 00            	dc.b	0
  18  0001               _time2:
  19  0001 00000000      	dc.l	0
  20  0005               _vzdalenost:
  21  0005 00000000      	dc.l	0
  22  0009               _vzd1:
  23  0009 0000          	dc.w	0
  24  000b               _read_flag:
  25  000b 00            	dc.b	0
  26  000c               _stav:
  27  000c 00            	dc.b	0
  28  000d               _rezim:
  29  000d 00            	dc.b	0
  30  000e               _cislo_zaznamu:
  31  000e 00            	dc.b	0
  32  000f               _zmena_rezimu:
  33  000f 00            	dc.b	0
  34  0010               _zmena_zaznamu:
  35  0010 00            	dc.b	0
  36  0011               _sepnuto:
  37  0011 00            	dc.b	0
  38  0012               _pocet_zaznamu:
  39  0012 00            	dc.b	0
  40  0013               _i:
  41  0013 00            	dc.b	0
 109                     .const:	section	.text
 110  0000               L6:
 111  0000 0000014d      	dc.l	333
 112  0004               L01:
 113  0004 00002710      	dc.l	10000
 114                     ; 53 void main(void){
 115                     	scross	off
 116                     	switch	.text
 117  0000               _main:
 121                     ; 54 CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1); // 16MHz z internÌho RC oscil·toru
 123  0000 4f            	clr	a
 124  0001 cd0000        	call	_CLK_HSIPrescalerConfig
 126                     ; 55 init_milis(); // milis kv˘li delay_ms()
 128  0004 cd0000        	call	_init_milis
 130                     ; 56 init_tim1(); // nastavit a spustit timer
 132  0007 cd05e6        	call	_init_tim1
 134                     ; 57 lcd_init();
 136  000a cd0000        	call	_lcd_init
 138                     ; 58 lcd_clear();
 140  000d a601          	ld	a,#1
 141  000f cd0000        	call	_lcd_command
 143                     ; 59 GPIO_Init(GPIOG, GPIO_PIN_0, GPIO_MODE_OUT_PP_LOW_SLOW); // v˝stup - "trigger pulz pro ultrazvuk"
 145  0012 4bc0          	push	#192
 146  0014 4b01          	push	#1
 147  0016 ae501e        	ldw	x,#20510
 148  0019 cd0000        	call	_GPIO_Init
 150  001c 85            	popw	x
 151                     ; 61 enableInterrupts();  //glob·lnÏ povolÌ p¯eruöenÌ
 154  001d 9a            rim
 156                     ; 62 swi2c_init();
 159  001e cd0000        	call	_swi2c_init
 161                     ; 63 init_tim3(); // nastavit a spustit timer
 163  0021 cd0539        	call	_init_tim3
 165                     ; 64 zapis[0] = 0b00000000;
 167  0024 3f4a          	clr	_zapis
 168                     ; 65 zapis[1] = 0b00100101;
 170  0026 3525004b      	mov	_zapis+1,#37
 171                     ; 66 zapis[2] = 0b00100011;//prvnÌ p˘lka desÌtky, druh· jednotky
 173  002a 3523004c      	mov	_zapis+2,#35
 174  002e               L73:
 175                     ; 72 		read_RTC();
 177  002e cd04d4        	call	_read_RTC
 179                     ; 73 		process_RTC();
 181  0031 cd04f8        	call	_process_RTC
 183                     ; 74 		process_measurment(); // obsluhuje neblokujÌcÌm zp˘sobem mÏ¯enÌ ultrazvukem
 185  0034 cd0577        	call	_process_measurment
 187                     ; 75 		process_enc();
 189  0037 cd035b        	call	_process_enc
 191                     ; 78 		switch(rezim){
 193  003a b60d          	ld	a,_rezim
 195                     ; 177 			default:
 195                     ; 178 				rezim=0;
 196  003c 4d            	tnz	a
 197  003d 270a          	jreq	L7
 198  003f 4a            	dec	a
 199  0040 2603          	jrne	L41
 200  0042 cc0266        	jp	L51
 201  0045               L41:
 202  0045               L71:
 205  0045 3f0d          	clr	_rezim
 206  0047 20e5          	jra	L73
 207  0049               L7:
 208                     ; 79 			case 0:
 208                     ; 80 				if (read_flag){
 210  0049 3d0b          	tnz	_read_flag
 211  004b 272c          	jreq	L74
 212                     ; 81 					read_flag=0;
 214  004d 3f0b          	clr	_read_flag
 215                     ; 82 					sprintf(text,"time: %u%u:%u%u:%u%u",des_hod,hod,des_min,min,des_sec,sec);//
 217  004f be48          	ldw	x,_sec
 218  0051 89            	pushw	x
 219  0052 be46          	ldw	x,_des_sec
 220  0054 89            	pushw	x
 221  0055 be44          	ldw	x,_min
 222  0057 89            	pushw	x
 223  0058 be42          	ldw	x,_des_min
 224  005a 89            	pushw	x
 225  005b be40          	ldw	x,_hod
 226  005d 89            	pushw	x
 227  005e be3e          	ldw	x,_des_hod
 228  0060 89            	pushw	x
 229  0061 ae002f        	ldw	x,#L15
 230  0064 89            	pushw	x
 231  0065 ae0059        	ldw	x,#_text
 232  0068 cd0000        	call	_sprintf
 234  006b 5b0e          	addw	sp,#14
 235                     ; 83 					lcd_gotoxy(0,1);
 237  006d ae0001        	ldw	x,#1
 238  0070 cd0000        	call	_lcd_gotoxy
 240                     ; 84 					lcd_puts(text);
 242  0073 ae0059        	ldw	x,#_text
 243  0076 cd0000        	call	_lcd_puts
 245  0079               L74:
 246                     ; 87 				if (milis()-time2>332){
 248  0079 cd0000        	call	_milis
 250  007c cd0000        	call	c_uitolx
 252  007f ae0001        	ldw	x,#_time2
 253  0082 cd0000        	call	c_lsub
 255  0085 ae0000        	ldw	x,#L6
 256  0088 cd0000        	call	c_lcmp
 258  008b 2403          	jruge	L61
 259  008d cc01a9        	jp	L35
 260  0090               L61:
 261                     ; 88 					time2=milis();
 263  0090 cd0000        	call	_milis
 265  0093 cd0000        	call	c_uitolx
 267  0096 ae0001        	ldw	x,#_time2
 268  0099 cd0000        	call	c_rtol
 270                     ; 89 					vzdalenost=capture/2;
 272  009c be69          	ldw	x,_capture
 273  009e 54            	srlw	x
 274  009f cd0000        	call	c_uitolx
 276  00a2 ae0005        	ldw	x,#_vzdalenost
 277  00a5 cd0000        	call	c_rtol
 279                     ; 90 					vzdalenost=vzdalenost*343;
 281  00a8 ae0157        	ldw	x,#343
 282  00ab bf02          	ldw	c_lreg+2,x
 283  00ad ae0000        	ldw	x,#0
 284  00b0 bf00          	ldw	c_lreg,x
 285  00b2 ae0005        	ldw	x,#_vzdalenost
 286  00b5 cd0000        	call	c_lgmul
 288                     ; 91 					vzd1=vzdalenost/10000;
 290  00b8 ae0005        	ldw	x,#_vzdalenost
 291  00bb cd0000        	call	c_ltor
 293  00be ae0004        	ldw	x,#L01
 294  00c1 cd0000        	call	c_ludv
 296  00c4 be02          	ldw	x,c_lreg+2
 297  00c6 bf09          	ldw	_vzd1,x
 298                     ; 92 					sprintf(text,"distance: %3ucm",vzd1);
 300  00c8 be09          	ldw	x,_vzd1
 301  00ca 89            	pushw	x
 302  00cb ae001f        	ldw	x,#L55
 303  00ce 89            	pushw	x
 304  00cf ae0059        	ldw	x,#_text
 305  00d2 cd0000        	call	_sprintf
 307  00d5 5b04          	addw	sp,#4
 308                     ; 93 					lcd_gotoxy(0,0);
 310  00d7 5f            	clrw	x
 311  00d8 cd0000        	call	_lcd_gotoxy
 313                     ; 94 					lcd_puts(text);
 315  00db ae0059        	ldw	x,#_text
 316  00de cd0000        	call	_lcd_puts
 318                     ; 96 					switch(sepnuto){
 320  00e1 b611          	ld	a,_sepnuto
 322                     ; 127 							break;
 323  00e3 4d            	tnz	a
 324  00e4 270a          	jreq	L11
 325  00e6 4a            	dec	a
 326  00e7 2603          	jrne	L02
 327  00e9 cc01a0        	jp	L31
 328  00ec               L02:
 329  00ec aca901a9      	jpf	L35
 330  00f0               L11:
 331                     ; 97 						case 0:
 331                     ; 98 							if (vzd1<DETEKCE_VZDALENOSTI){
 333  00f0 be09          	ldw	x,_vzd1
 334  00f2 a3000a        	cpw	x,#10
 335  00f5 2503          	jrult	L22
 336  00f7 cc01a9        	jp	L35
 337  00fa               L22:
 338                     ; 99 								pocet_zaznamu++;
 340  00fa 3c12          	inc	_pocet_zaznamu
 341                     ; 101 								if(pocet_zaznamu>10){
 343  00fc b612          	ld	a,_pocet_zaznamu
 344  00fe a10b          	cp	a,#11
 345  0100 254a          	jrult	L56
 346                     ; 102 									for(i=0;i<9;i++){
 348  0102 3f13          	clr	_i
 349  0104               L76:
 350                     ; 103 										zaznamy[i][0]=zaznamy[i+1][0];
 352  0104 b613          	ld	a,_i
 353  0106 97            	ld	xl,a
 354  0107 a606          	ld	a,#6
 355  0109 42            	mul	x,a
 356  010a e606          	ld	a,(_zaznamy+6,x)
 357  010c e700          	ld	(_zaznamy,x),a
 358                     ; 104 										zaznamy[i][1]=zaznamy[i+1][1];
 360  010e b613          	ld	a,_i
 361  0110 97            	ld	xl,a
 362  0111 a606          	ld	a,#6
 363  0113 42            	mul	x,a
 364  0114 e607          	ld	a,(_zaznamy+7,x)
 365  0116 e701          	ld	(_zaznamy+1,x),a
 366                     ; 105 										zaznamy[i][2]=zaznamy[i+1][2];
 368  0118 b613          	ld	a,_i
 369  011a 97            	ld	xl,a
 370  011b a606          	ld	a,#6
 371  011d 42            	mul	x,a
 372  011e e608          	ld	a,(_zaznamy+8,x)
 373  0120 e702          	ld	(_zaznamy+2,x),a
 374                     ; 106 										zaznamy[i][3]=zaznamy[i+1][3];
 376  0122 b613          	ld	a,_i
 377  0124 97            	ld	xl,a
 378  0125 a606          	ld	a,#6
 379  0127 42            	mul	x,a
 380  0128 e609          	ld	a,(_zaznamy+9,x)
 381  012a e703          	ld	(_zaznamy+3,x),a
 382                     ; 107 										zaznamy[i][4]=zaznamy[i+1][4];
 384  012c b613          	ld	a,_i
 385  012e 97            	ld	xl,a
 386  012f a606          	ld	a,#6
 387  0131 42            	mul	x,a
 388  0132 e60a          	ld	a,(_zaznamy+10,x)
 389  0134 e704          	ld	(_zaznamy+4,x),a
 390                     ; 108 										zaznamy[i][5]=zaznamy[i+1][5];
 392  0136 b613          	ld	a,_i
 393  0138 97            	ld	xl,a
 394  0139 a606          	ld	a,#6
 395  013b 42            	mul	x,a
 396  013c e60b          	ld	a,(_zaznamy+11,x)
 397  013e e705          	ld	(_zaznamy+5,x),a
 398                     ; 109 										pocet_zaznamu=10;
 400  0140 350a0012      	mov	_pocet_zaznamu,#10
 401                     ; 102 									for(i=0;i<9;i++){
 403  0144 3c13          	inc	_i
 406  0146 b613          	ld	a,_i
 407  0148 a109          	cp	a,#9
 408  014a 25b8          	jrult	L76
 409  014c               L56:
 410                     ; 113 								zaznamy[pocet_zaznamu-1][0]=sec;
 412  014c b612          	ld	a,_pocet_zaznamu
 413  014e 97            	ld	xl,a
 414  014f a606          	ld	a,#6
 415  0151 42            	mul	x,a
 416  0152 1d0006        	subw	x,#6
 417  0155 b649          	ld	a,_sec+1
 418  0157 e700          	ld	(_zaznamy,x),a
 419                     ; 114 								zaznamy[pocet_zaznamu-1][1]=des_sec;
 421  0159 b612          	ld	a,_pocet_zaznamu
 422  015b 97            	ld	xl,a
 423  015c a606          	ld	a,#6
 424  015e 42            	mul	x,a
 425  015f 1d0006        	subw	x,#6
 426  0162 b647          	ld	a,_des_sec+1
 427  0164 e701          	ld	(_zaznamy+1,x),a
 428                     ; 115 								zaznamy[pocet_zaznamu-1][2]=min;
 430  0166 b612          	ld	a,_pocet_zaznamu
 431  0168 97            	ld	xl,a
 432  0169 a606          	ld	a,#6
 433  016b 42            	mul	x,a
 434  016c 1d0006        	subw	x,#6
 435  016f b645          	ld	a,_min+1
 436  0171 e702          	ld	(_zaznamy+2,x),a
 437                     ; 116 								zaznamy[pocet_zaznamu-1][3]=des_min;
 439  0173 b612          	ld	a,_pocet_zaznamu
 440  0175 97            	ld	xl,a
 441  0176 a606          	ld	a,#6
 442  0178 42            	mul	x,a
 443  0179 1d0006        	subw	x,#6
 444  017c b643          	ld	a,_des_min+1
 445  017e e703          	ld	(_zaznamy+3,x),a
 446                     ; 117 								zaznamy[pocet_zaznamu-1][4]=hod;
 448  0180 b612          	ld	a,_pocet_zaznamu
 449  0182 97            	ld	xl,a
 450  0183 a606          	ld	a,#6
 451  0185 42            	mul	x,a
 452  0186 1d0006        	subw	x,#6
 453  0189 b641          	ld	a,_hod+1
 454  018b e704          	ld	(_zaznamy+4,x),a
 455                     ; 118 								zaznamy[pocet_zaznamu-1][5]=des_hod;
 457  018d b612          	ld	a,_pocet_zaznamu
 458  018f 97            	ld	xl,a
 459  0190 a606          	ld	a,#6
 460  0192 42            	mul	x,a
 461  0193 1d0006        	subw	x,#6
 462  0196 b63f          	ld	a,_des_hod+1
 463  0198 e705          	ld	(_zaznamy+5,x),a
 464                     ; 119 								sepnuto=1;
 466  019a 35010011      	mov	_sepnuto,#1
 467  019e 2009          	jra	L35
 468  01a0               L31:
 469                     ; 123 						case 1:
 469                     ; 124 							if (vzd1>DETEKCE_VZDALENOSTI+3){
 471  01a0 be09          	ldw	x,_vzd1
 472  01a2 a3000e        	cpw	x,#14
 473  01a5 2502          	jrult	L35
 474                     ; 125 								sepnuto=0;
 476  01a7 3f11          	clr	_sepnuto
 477  01a9               L16:
 478  01a9               L35:
 479                     ; 132 				if (zmena_rezimu){
 481  01a9 3d0f          	tnz	_zmena_rezimu
 482  01ab 2603          	jrne	L42
 483  01ad cc002e        	jp	L73
 484  01b0               L42:
 485                     ; 133 					zmena_rezimu=0;
 487  01b0 3f0f          	clr	_zmena_rezimu
 488                     ; 134 					cislo_zaznamu=0;
 490  01b2 3f0e          	clr	_cislo_zaznamu
 491                     ; 135 					lcd_clear();
 493  01b4 a601          	ld	a,#1
 494  01b6 cd0000        	call	_lcd_command
 496                     ; 136 					sprintf(text,"%u: %u%u:%u%u:%u%u",cislo_zaznamu+1,zaznamy[cislo_zaznamu][5],zaznamy[cislo_zaznamu][4],zaznamy[cislo_zaznamu][3],zaznamy[cislo_zaznamu][2],zaznamy[cislo_zaznamu][1],zaznamy[cislo_zaznamu][0]);
 498  01b9 b60e          	ld	a,_cislo_zaznamu
 499  01bb 97            	ld	xl,a
 500  01bc a606          	ld	a,#6
 501  01be 42            	mul	x,a
 502  01bf e600          	ld	a,(_zaznamy,x)
 503  01c1 88            	push	a
 504  01c2 b60e          	ld	a,_cislo_zaznamu
 505  01c4 97            	ld	xl,a
 506  01c5 a606          	ld	a,#6
 507  01c7 42            	mul	x,a
 508  01c8 e601          	ld	a,(_zaznamy+1,x)
 509  01ca 88            	push	a
 510  01cb b60e          	ld	a,_cislo_zaznamu
 511  01cd 97            	ld	xl,a
 512  01ce a606          	ld	a,#6
 513  01d0 42            	mul	x,a
 514  01d1 e602          	ld	a,(_zaznamy+2,x)
 515  01d3 88            	push	a
 516  01d4 b60e          	ld	a,_cislo_zaznamu
 517  01d6 97            	ld	xl,a
 518  01d7 a606          	ld	a,#6
 519  01d9 42            	mul	x,a
 520  01da e603          	ld	a,(_zaznamy+3,x)
 521  01dc 88            	push	a
 522  01dd b60e          	ld	a,_cislo_zaznamu
 523  01df 97            	ld	xl,a
 524  01e0 a606          	ld	a,#6
 525  01e2 42            	mul	x,a
 526  01e3 e604          	ld	a,(_zaznamy+4,x)
 527  01e5 88            	push	a
 528  01e6 b60e          	ld	a,_cislo_zaznamu
 529  01e8 97            	ld	xl,a
 530  01e9 a606          	ld	a,#6
 531  01eb 42            	mul	x,a
 532  01ec e605          	ld	a,(_zaznamy+5,x)
 533  01ee 88            	push	a
 534  01ef b60e          	ld	a,_cislo_zaznamu
 535  01f1 5f            	clrw	x
 536  01f2 97            	ld	xl,a
 537  01f3 5c            	incw	x
 538  01f4 89            	pushw	x
 539  01f5 ae000c        	ldw	x,#L101
 540  01f8 89            	pushw	x
 541  01f9 ae0059        	ldw	x,#_text
 542  01fc cd0000        	call	_sprintf
 544  01ff 5b0a          	addw	sp,#10
 545                     ; 137 					lcd_gotoxy(0,0);
 547  0201 5f            	clrw	x
 548  0202 cd0000        	call	_lcd_gotoxy
 550                     ; 138 					lcd_puts(text);
 552  0205 ae0059        	ldw	x,#_text
 553  0208 cd0000        	call	_lcd_puts
 555                     ; 140 					sprintf(text,"%u: %u%u:%u%u:%u%u",cislo_zaznamu+2,zaznamy[cislo_zaznamu+1][5],zaznamy[cislo_zaznamu+1][4],zaznamy[cislo_zaznamu+1][3],zaznamy[cislo_zaznamu+1][2],zaznamy[cislo_zaznamu+1][1],zaznamy[cislo_zaznamu+1][0]);
 557  020b b60e          	ld	a,_cislo_zaznamu
 558  020d 97            	ld	xl,a
 559  020e a606          	ld	a,#6
 560  0210 42            	mul	x,a
 561  0211 e606          	ld	a,(_zaznamy+6,x)
 562  0213 88            	push	a
 563  0214 b60e          	ld	a,_cislo_zaznamu
 564  0216 97            	ld	xl,a
 565  0217 a606          	ld	a,#6
 566  0219 42            	mul	x,a
 567  021a e607          	ld	a,(_zaznamy+7,x)
 568  021c 88            	push	a
 569  021d b60e          	ld	a,_cislo_zaznamu
 570  021f 97            	ld	xl,a
 571  0220 a606          	ld	a,#6
 572  0222 42            	mul	x,a
 573  0223 e608          	ld	a,(_zaznamy+8,x)
 574  0225 88            	push	a
 575  0226 b60e          	ld	a,_cislo_zaznamu
 576  0228 97            	ld	xl,a
 577  0229 a606          	ld	a,#6
 578  022b 42            	mul	x,a
 579  022c e609          	ld	a,(_zaznamy+9,x)
 580  022e 88            	push	a
 581  022f b60e          	ld	a,_cislo_zaznamu
 582  0231 97            	ld	xl,a
 583  0232 a606          	ld	a,#6
 584  0234 42            	mul	x,a
 585  0235 e60a          	ld	a,(_zaznamy+10,x)
 586  0237 88            	push	a
 587  0238 b60e          	ld	a,_cislo_zaznamu
 588  023a 97            	ld	xl,a
 589  023b a606          	ld	a,#6
 590  023d 42            	mul	x,a
 591  023e e60b          	ld	a,(_zaznamy+11,x)
 592  0240 88            	push	a
 593  0241 b60e          	ld	a,_cislo_zaznamu
 594  0243 5f            	clrw	x
 595  0244 97            	ld	xl,a
 596  0245 5c            	incw	x
 597  0246 5c            	incw	x
 598  0247 89            	pushw	x
 599  0248 ae000c        	ldw	x,#L101
 600  024b 89            	pushw	x
 601  024c ae0059        	ldw	x,#_text
 602  024f cd0000        	call	_sprintf
 604  0252 5b0a          	addw	sp,#10
 605                     ; 141 					lcd_gotoxy(0,1);
 607  0254 ae0001        	ldw	x,#1
 608  0257 cd0000        	call	_lcd_gotoxy
 610                     ; 142 					lcd_puts(text);
 612  025a ae0059        	ldw	x,#_text
 613  025d cd0000        	call	_lcd_puts
 615                     ; 143 					rezim++;
 617  0260 3c0d          	inc	_rezim
 618  0262 ac2e002e      	jpf	L73
 619  0266               L51:
 620                     ; 151 			case 1:
 620                     ; 152 				if (zmena_zaznamu){
 622  0266 3d10          	tnz	_zmena_zaznamu
 623  0268 2603          	jrne	L62
 624  026a cc0343        	jp	L301
 625  026d               L62:
 626                     ; 153 					zmena_zaznamu=0;
 628  026d 3f10          	clr	_zmena_zaznamu
 629                     ; 154 					sprintf(text,"%u: %u%u:%u%u:%u%u",cislo_zaznamu+1,zaznamy[cislo_zaznamu][5],zaznamy[cislo_zaznamu][4],zaznamy[cislo_zaznamu][3],zaznamy[cislo_zaznamu][2],zaznamy[cislo_zaznamu][1],zaznamy[cislo_zaznamu][0]);
 631  026f b60e          	ld	a,_cislo_zaznamu
 632  0271 97            	ld	xl,a
 633  0272 a606          	ld	a,#6
 634  0274 42            	mul	x,a
 635  0275 e600          	ld	a,(_zaznamy,x)
 636  0277 88            	push	a
 637  0278 b60e          	ld	a,_cislo_zaznamu
 638  027a 97            	ld	xl,a
 639  027b a606          	ld	a,#6
 640  027d 42            	mul	x,a
 641  027e e601          	ld	a,(_zaznamy+1,x)
 642  0280 88            	push	a
 643  0281 b60e          	ld	a,_cislo_zaznamu
 644  0283 97            	ld	xl,a
 645  0284 a606          	ld	a,#6
 646  0286 42            	mul	x,a
 647  0287 e602          	ld	a,(_zaznamy+2,x)
 648  0289 88            	push	a
 649  028a b60e          	ld	a,_cislo_zaznamu
 650  028c 97            	ld	xl,a
 651  028d a606          	ld	a,#6
 652  028f 42            	mul	x,a
 653  0290 e603          	ld	a,(_zaznamy+3,x)
 654  0292 88            	push	a
 655  0293 b60e          	ld	a,_cislo_zaznamu
 656  0295 97            	ld	xl,a
 657  0296 a606          	ld	a,#6
 658  0298 42            	mul	x,a
 659  0299 e604          	ld	a,(_zaznamy+4,x)
 660  029b 88            	push	a
 661  029c b60e          	ld	a,_cislo_zaznamu
 662  029e 97            	ld	xl,a
 663  029f a606          	ld	a,#6
 664  02a1 42            	mul	x,a
 665  02a2 e605          	ld	a,(_zaznamy+5,x)
 666  02a4 88            	push	a
 667  02a5 b60e          	ld	a,_cislo_zaznamu
 668  02a7 5f            	clrw	x
 669  02a8 97            	ld	xl,a
 670  02a9 5c            	incw	x
 671  02aa 89            	pushw	x
 672  02ab ae000c        	ldw	x,#L101
 673  02ae 89            	pushw	x
 674  02af ae0059        	ldw	x,#_text
 675  02b2 cd0000        	call	_sprintf
 677  02b5 5b0a          	addw	sp,#10
 678                     ; 155 					lcd_gotoxy(0,0);
 680  02b7 5f            	clrw	x
 681  02b8 cd0000        	call	_lcd_gotoxy
 683                     ; 156 					lcd_puts(text);
 685  02bb ae0059        	ldw	x,#_text
 686  02be cd0000        	call	_lcd_puts
 688                     ; 158 					if(cislo_zaznamu==9){
 690  02c1 b60e          	ld	a,_cislo_zaznamu
 691  02c3 a109          	cp	a,#9
 692  02c5 2627          	jrne	L501
 693                     ; 159 						sprintf(text,"%u: %u%u:%u%u:%u%u",cislo_zaznamu+2,zaznamy[0][5],zaznamy[0][4],zaznamy[0][3],zaznamy[0][2],zaznamy[0][1],zaznamy[0][0]);
 695  02c7 3b0000        	push	_zaznamy
 696  02ca 3b0001        	push	_zaznamy+1
 697  02cd 3b0002        	push	_zaznamy+2
 698  02d0 3b0003        	push	_zaznamy+3
 699  02d3 3b0004        	push	_zaznamy+4
 700  02d6 3b0005        	push	_zaznamy+5
 701  02d9 b60e          	ld	a,_cislo_zaznamu
 702  02db 5f            	clrw	x
 703  02dc 97            	ld	xl,a
 704  02dd 5c            	incw	x
 705  02de 5c            	incw	x
 706  02df 89            	pushw	x
 707  02e0 ae000c        	ldw	x,#L101
 708  02e3 89            	pushw	x
 709  02e4 ae0059        	ldw	x,#_text
 710  02e7 cd0000        	call	_sprintf
 712  02ea 5b0a          	addw	sp,#10
 714  02ec 2049          	jra	L701
 715  02ee               L501:
 716                     ; 162 						sprintf(text,"%u: %u%u:%u%u:%u%u",cislo_zaznamu+2,zaznamy[cislo_zaznamu+1][5],zaznamy[cislo_zaznamu+1][4],zaznamy[cislo_zaznamu+1][3],zaznamy[cislo_zaznamu+1][2],zaznamy[cislo_zaznamu+1][1],zaznamy[cislo_zaznamu+1][0]);
 718  02ee b60e          	ld	a,_cislo_zaznamu
 719  02f0 97            	ld	xl,a
 720  02f1 a606          	ld	a,#6
 721  02f3 42            	mul	x,a
 722  02f4 e606          	ld	a,(_zaznamy+6,x)
 723  02f6 88            	push	a
 724  02f7 b60e          	ld	a,_cislo_zaznamu
 725  02f9 97            	ld	xl,a
 726  02fa a606          	ld	a,#6
 727  02fc 42            	mul	x,a
 728  02fd e607          	ld	a,(_zaznamy+7,x)
 729  02ff 88            	push	a
 730  0300 b60e          	ld	a,_cislo_zaznamu
 731  0302 97            	ld	xl,a
 732  0303 a606          	ld	a,#6
 733  0305 42            	mul	x,a
 734  0306 e608          	ld	a,(_zaznamy+8,x)
 735  0308 88            	push	a
 736  0309 b60e          	ld	a,_cislo_zaznamu
 737  030b 97            	ld	xl,a
 738  030c a606          	ld	a,#6
 739  030e 42            	mul	x,a
 740  030f e609          	ld	a,(_zaznamy+9,x)
 741  0311 88            	push	a
 742  0312 b60e          	ld	a,_cislo_zaznamu
 743  0314 97            	ld	xl,a
 744  0315 a606          	ld	a,#6
 745  0317 42            	mul	x,a
 746  0318 e60a          	ld	a,(_zaznamy+10,x)
 747  031a 88            	push	a
 748  031b b60e          	ld	a,_cislo_zaznamu
 749  031d 97            	ld	xl,a
 750  031e a606          	ld	a,#6
 751  0320 42            	mul	x,a
 752  0321 e60b          	ld	a,(_zaznamy+11,x)
 753  0323 88            	push	a
 754  0324 b60e          	ld	a,_cislo_zaznamu
 755  0326 5f            	clrw	x
 756  0327 97            	ld	xl,a
 757  0328 5c            	incw	x
 758  0329 5c            	incw	x
 759  032a 89            	pushw	x
 760  032b ae000c        	ldw	x,#L101
 761  032e 89            	pushw	x
 762  032f ae0059        	ldw	x,#_text
 763  0332 cd0000        	call	_sprintf
 765  0335 5b0a          	addw	sp,#10
 766  0337               L701:
 767                     ; 164 					lcd_gotoxy(0,1);
 769  0337 ae0001        	ldw	x,#1
 770  033a cd0000        	call	_lcd_gotoxy
 772                     ; 165 					lcd_puts(text);
 774  033d ae0059        	ldw	x,#_text
 775  0340 cd0000        	call	_lcd_puts
 777  0343               L301:
 778                     ; 169 				if (zmena_rezimu){
 780  0343 3d0f          	tnz	_zmena_rezimu
 781  0345 2603          	jrne	L03
 782  0347 cc002e        	jp	L73
 783  034a               L03:
 784                     ; 170 					zmena_rezimu=0;
 786  034a 3f0f          	clr	_zmena_rezimu
 787                     ; 171 					lcd_clear();
 789  034c a601          	ld	a,#1
 790  034e cd0000        	call	_lcd_command
 792                     ; 172 					rezim++;
 794  0351 3c0d          	inc	_rezim
 795  0353 ac2e002e      	jpf	L73
 796  0357               L54:
 797                     ; 177 			default:
 797                     ; 178 				rezim=0;
 798  0357 ac2e002e      	jpf	L73
 801                     	bsct
 802  0014               L311_minuleA:
 803  0014 00            	dc.b	0
 804  0015               L511_minuleB:
 805  0015 00            	dc.b	0
 806  0016               L711_pocatek_stisku:
 807  0016 00000000      	dc.l	0
 808  001a               L121_minule_stisk:
 809  001a 00            	dc.b	0
 810  001b               L321_ted_stisk:
 811  001b 00            	dc.b	0
 812  001c               L521_konec_stisku:
 813  001c 00            	dc.b	0
 921                     	switch	.const
 922  0008               L43:
 923  0008 000003e8      	dc.l	1000
 924                     ; 185 void process_enc(void){
 925                     	switch	.text
 926  035b               _process_enc:
 930                     ; 192 		if (GPIO_ReadInputPin(ENKODER_TLAC_GPIO,ENKODER_TLAC_PIN)==RESET){
 932  035b 4b10          	push	#16
 933  035d ae5014        	ldw	x,#20500
 934  0360 cd0000        	call	_GPIO_ReadInputPin
 936  0363 5b01          	addw	sp,#1
 937  0365 4d            	tnz	a
 938  0366 2606          	jrne	L102
 939                     ; 193 			ted_stisk=1;
 941  0368 3501001b      	mov	L321_ted_stisk,#1
 943  036c 2002          	jra	L302
 944  036e               L102:
 945                     ; 195 		else{ted_stisk=0;}
 947  036e 3f1b          	clr	L321_ted_stisk
 948  0370               L302:
 949                     ; 197 		if((ted_stisk==1) && (minule_stisk==0)){pocatek_stisku=milis();}
 951  0370 b61b          	ld	a,L321_ted_stisk
 952  0372 a101          	cp	a,#1
 953  0374 2610          	jrne	L502
 955  0376 3d1a          	tnz	L121_minule_stisk
 956  0378 260c          	jrne	L502
 959  037a cd0000        	call	_milis
 961  037d cd0000        	call	c_uitolx
 963  0380 ae0016        	ldw	x,#L711_pocatek_stisku
 964  0383 cd0000        	call	c_rtol
 966  0386               L502:
 967                     ; 198 		if(ted_stisk==0 && minule_stisk==1){konec_stisku=1;}
 969  0386 3d1b          	tnz	L321_ted_stisk
 970  0388 260a          	jrne	L702
 972  038a b61a          	ld	a,L121_minule_stisk
 973  038c a101          	cp	a,#1
 974  038e 2604          	jrne	L702
 977  0390 3501001c      	mov	L521_konec_stisku,#1
 978  0394               L702:
 979                     ; 200 		if (konec_stisku==1 && ((milis()-pocatek_stisku)>999)){
 981  0394 b61c          	ld	a,L521_konec_stisku
 982  0396 a101          	cp	a,#1
 983  0398 2618          	jrne	L112
 985  039a cd0000        	call	_milis
 987  039d cd0000        	call	c_uitolx
 989  03a0 ae0016        	ldw	x,#L711_pocatek_stisku
 990  03a3 cd0000        	call	c_lsub
 992  03a6 ae0008        	ldw	x,#L43
 993  03a9 cd0000        	call	c_lcmp
 995  03ac 2504          	jrult	L112
 996                     ; 201 			konec_stisku=0;
 998  03ae 3f1c          	clr	L521_konec_stisku
1000  03b0 2020          	jra	L312
1001  03b2               L112:
1002                     ; 205 		else if(konec_stisku==1 && ((milis()-pocatek_stisku)<1000)){
1004  03b2 b61c          	ld	a,L521_konec_stisku
1005  03b4 a101          	cp	a,#1
1006  03b6 261a          	jrne	L312
1008  03b8 cd0000        	call	_milis
1010  03bb cd0000        	call	c_uitolx
1012  03be ae0016        	ldw	x,#L711_pocatek_stisku
1013  03c1 cd0000        	call	c_lsub
1015  03c4 ae0008        	ldw	x,#L43
1016  03c7 cd0000        	call	c_lcmp
1018  03ca 2406          	jruge	L312
1019                     ; 206 			zmena_rezimu=1;
1021  03cc 3501000f      	mov	_zmena_rezimu,#1
1022                     ; 207 			konec_stisku=0;
1024  03d0 3f1c          	clr	L521_konec_stisku
1025  03d2               L312:
1026                     ; 211 	if((GPIO_ReadInputPin(ENKODER_TLAC_B_GPIO,ENKODER_TLAC_B_PIN) != RESET) && minuleB==0 && GPIO_ReadInputPin(ENKODER_TLAC_A_GPIO,ENKODER_TLAC_A_PIN) == RESET){
1028  03d2 4b04          	push	#4
1029  03d4 ae5014        	ldw	x,#20500
1030  03d7 cd0000        	call	_GPIO_ReadInputPin
1032  03da 5b01          	addw	sp,#1
1033  03dc 4d            	tnz	a
1034  03dd 2722          	jreq	L712
1036  03df 3d15          	tnz	L511_minuleB
1037  03e1 261e          	jrne	L712
1039  03e3 4b02          	push	#2
1040  03e5 ae5014        	ldw	x,#20500
1041  03e8 cd0000        	call	_GPIO_ReadInputPin
1043  03eb 5b01          	addw	sp,#1
1044  03ed 4d            	tnz	a
1045  03ee 2611          	jrne	L712
1046                     ; 212 		zmena_zaznamu=1;
1048  03f0 35010010      	mov	_zmena_zaznamu,#1
1049                     ; 213 		cislo_zaznamu--;
1051  03f4 3a0e          	dec	_cislo_zaznamu
1052                     ; 214 		if (cislo_zaznamu>9){
1054  03f6 b60e          	ld	a,_cislo_zaznamu
1055  03f8 a10a          	cp	a,#10
1056  03fa 2505          	jrult	L712
1057                     ; 215 			cislo_zaznamu=pocet_zaznamu-1;
1059  03fc b612          	ld	a,_pocet_zaznamu
1060  03fe 4a            	dec	a
1061  03ff b70e          	ld	_cislo_zaznamu,a
1062  0401               L712:
1063                     ; 218 	if((GPIO_ReadInputPin(ENKODER_TLAC_B_GPIO,ENKODER_TLAC_B_PIN) == RESET) && minuleB==1 && GPIO_ReadInputPin(ENKODER_TLAC_A_GPIO,ENKODER_TLAC_A_PIN) != RESET){
1065  0401 4b04          	push	#4
1066  0403 ae5014        	ldw	x,#20500
1067  0406 cd0000        	call	_GPIO_ReadInputPin
1069  0409 5b01          	addw	sp,#1
1070  040b 4d            	tnz	a
1071  040c 2624          	jrne	L322
1073  040e b615          	ld	a,L511_minuleB
1074  0410 a101          	cp	a,#1
1075  0412 261e          	jrne	L322
1077  0414 4b02          	push	#2
1078  0416 ae5014        	ldw	x,#20500
1079  0419 cd0000        	call	_GPIO_ReadInputPin
1081  041c 5b01          	addw	sp,#1
1082  041e 4d            	tnz	a
1083  041f 2711          	jreq	L322
1084                     ; 219 		zmena_zaznamu=1;
1086  0421 35010010      	mov	_zmena_zaznamu,#1
1087                     ; 220 		cislo_zaznamu--;
1089  0425 3a0e          	dec	_cislo_zaznamu
1090                     ; 221 		if (cislo_zaznamu>9){
1092  0427 b60e          	ld	a,_cislo_zaznamu
1093  0429 a10a          	cp	a,#10
1094  042b 2505          	jrult	L322
1095                     ; 222 			cislo_zaznamu=pocet_zaznamu-1;
1097  042d b612          	ld	a,_pocet_zaznamu
1098  042f 4a            	dec	a
1099  0430 b70e          	ld	_cislo_zaznamu,a
1100  0432               L322:
1101                     ; 226 	if((GPIO_ReadInputPin(ENKODER_TLAC_A_GPIO,ENKODER_TLAC_A_PIN) != RESET) && minuleA==0 && GPIO_ReadInputPin(ENKODER_TLAC_B_GPIO,ENKODER_TLAC_B_PIN) == RESET){
1103  0432 4b02          	push	#2
1104  0434 ae5014        	ldw	x,#20500
1105  0437 cd0000        	call	_GPIO_ReadInputPin
1107  043a 5b01          	addw	sp,#1
1108  043c 4d            	tnz	a
1109  043d 272c          	jreq	L722
1111  043f 3d14          	tnz	L311_minuleA
1112  0441 2628          	jrne	L722
1114  0443 4b04          	push	#4
1115  0445 ae5014        	ldw	x,#20500
1116  0448 cd0000        	call	_GPIO_ReadInputPin
1118  044b 5b01          	addw	sp,#1
1119  044d 4d            	tnz	a
1120  044e 261b          	jrne	L722
1121                     ; 227 		zmena_zaznamu=1;
1123  0450 35010010      	mov	_zmena_zaznamu,#1
1124                     ; 228 		cislo_zaznamu++;
1126  0454 3c0e          	inc	_cislo_zaznamu
1127                     ; 229 		if (cislo_zaznamu>(pocet_zaznamu-1)){
1129  0456 9c            	rvf
1130  0457 b612          	ld	a,_pocet_zaznamu
1131  0459 5f            	clrw	x
1132  045a 97            	ld	xl,a
1133  045b 5a            	decw	x
1134  045c b60e          	ld	a,_cislo_zaznamu
1135  045e 905f          	clrw	y
1136  0460 9097          	ld	yl,a
1137  0462 90bf00        	ldw	c_y,y
1138  0465 b300          	cpw	x,c_y
1139  0467 2e02          	jrsge	L722
1140                     ; 230 			cislo_zaznamu=0;
1142  0469 3f0e          	clr	_cislo_zaznamu
1143  046b               L722:
1144                     ; 233 	if((GPIO_ReadInputPin(ENKODER_TLAC_A_GPIO,ENKODER_TLAC_A_PIN) == RESET) && minuleA==1 && GPIO_ReadInputPin(ENKODER_TLAC_B_GPIO,ENKODER_TLAC_B_PIN) != RESET){
1146  046b 4b02          	push	#2
1147  046d ae5014        	ldw	x,#20500
1148  0470 cd0000        	call	_GPIO_ReadInputPin
1150  0473 5b01          	addw	sp,#1
1151  0475 4d            	tnz	a
1152  0476 262e          	jrne	L332
1154  0478 b614          	ld	a,L311_minuleA
1155  047a a101          	cp	a,#1
1156  047c 2628          	jrne	L332
1158  047e 4b04          	push	#4
1159  0480 ae5014        	ldw	x,#20500
1160  0483 cd0000        	call	_GPIO_ReadInputPin
1162  0486 5b01          	addw	sp,#1
1163  0488 4d            	tnz	a
1164  0489 271b          	jreq	L332
1165                     ; 234 		zmena_zaznamu=1;
1167  048b 35010010      	mov	_zmena_zaznamu,#1
1168                     ; 235 		cislo_zaznamu++;
1170  048f 3c0e          	inc	_cislo_zaznamu
1171                     ; 236 		if (cislo_zaznamu>(pocet_zaznamu-1)){
1173  0491 9c            	rvf
1174  0492 b612          	ld	a,_pocet_zaznamu
1175  0494 5f            	clrw	x
1176  0495 97            	ld	xl,a
1177  0496 5a            	decw	x
1178  0497 b60e          	ld	a,_cislo_zaznamu
1179  0499 905f          	clrw	y
1180  049b 9097          	ld	yl,a
1181  049d 90bf00        	ldw	c_y,y
1182  04a0 b300          	cpw	x,c_y
1183  04a2 2e02          	jrsge	L332
1184                     ; 237 			cislo_zaznamu=0;
1186  04a4 3f0e          	clr	_cislo_zaznamu
1187  04a6               L332:
1188                     ; 242 	if(GPIO_ReadInputPin(ENKODER_TLAC_A_GPIO,ENKODER_TLAC_A_PIN) != RESET){minuleA = 1;} // pokud je vstup A v log.1
1190  04a6 4b02          	push	#2
1191  04a8 ae5014        	ldw	x,#20500
1192  04ab cd0000        	call	_GPIO_ReadInputPin
1194  04ae 5b01          	addw	sp,#1
1195  04b0 4d            	tnz	a
1196  04b1 2706          	jreq	L732
1199  04b3 35010014      	mov	L311_minuleA,#1
1201  04b7 2002          	jra	L142
1202  04b9               L732:
1203                     ; 243 	else{minuleA=0;}
1205  04b9 3f14          	clr	L311_minuleA
1206  04bb               L142:
1207                     ; 244 	if(GPIO_ReadInputPin(ENKODER_TLAC_B_GPIO,ENKODER_TLAC_B_PIN) != RESET){minuleB = 1;} // pokud je vstup A v log.1
1209  04bb 4b04          	push	#4
1210  04bd ae5014        	ldw	x,#20500
1211  04c0 cd0000        	call	_GPIO_ReadInputPin
1213  04c3 5b01          	addw	sp,#1
1214  04c5 4d            	tnz	a
1215  04c6 2706          	jreq	L342
1218  04c8 35010015      	mov	L511_minuleB,#1
1220  04cc 2002          	jra	L542
1221  04ce               L342:
1222                     ; 245 	else{minuleB=0;}
1224  04ce 3f15          	clr	L511_minuleB
1225  04d0               L542:
1226                     ; 247 	minule_stisk=ted_stisk;
1228  04d0 451b1a        	mov	L121_minule_stisk,L321_ted_stisk
1229                     ; 248 }
1232  04d3 81            	ret
1235                     	bsct
1236  001d               L742_last_time:
1237  001d 0000          	dc.w	0
1273                     ; 252 void read_RTC(void){
1274                     	switch	.text
1275  04d4               _read_RTC:
1279                     ; 254   if(milis() - last_time >= 100){
1281  04d4 cd0000        	call	_milis
1283  04d7 72b0001d      	subw	x,L742_last_time
1284  04db a30064        	cpw	x,#100
1285  04de 2517          	jrult	L762
1286                     ; 255     last_time = milis(); 
1288  04e0 cd0000        	call	_milis
1290  04e3 bf1d          	ldw	L742_last_time,x
1291                     ; 256     error=swi2c_read_buf(RTC_ADRESS,0x00,RTC_precteno,7); 
1293  04e5 ae0007        	ldw	x,#7
1294  04e8 89            	pushw	x
1295  04e9 ae0051        	ldw	x,#_RTC_precteno
1296  04ec 89            	pushw	x
1297  04ed aed000        	ldw	x,#53248
1298  04f0 cd0000        	call	_swi2c_read_buf
1300  04f3 5b04          	addw	sp,#4
1301  04f5 b758          	ld	_error,a
1302  04f7               L762:
1303                     ; 258 }
1306  04f7 81            	ret
1337                     ; 260 void process_RTC(void){
1338                     	switch	.text
1339  04f8               _process_RTC:
1343                     ; 261   sec = (RTC_precteno[0] & 0b00001111);              //sekundy
1345  04f8 b651          	ld	a,_RTC_precteno
1346  04fa a40f          	and	a,#15
1347  04fc 5f            	clrw	x
1348  04fd 97            	ld	xl,a
1349  04fe bf48          	ldw	_sec,x
1350                     ; 262   des_sec = ((RTC_precteno[0] >> 4) & 0b00001111);		 //desÌtky sekund
1352  0500 b651          	ld	a,_RTC_precteno
1353  0502 4e            	swap	a
1354  0503 a40f          	and	a,#15
1355  0505 5f            	clrw	x
1356  0506 97            	ld	xl,a
1357  0507 bf46          	ldw	_des_sec,x
1358                     ; 263 	min = (RTC_precteno[1] & 0b00001111);		                //minuty
1360  0509 b652          	ld	a,_RTC_precteno+1
1361  050b a40f          	and	a,#15
1362  050d 5f            	clrw	x
1363  050e 97            	ld	xl,a
1364  050f bf44          	ldw	_min,x
1365                     ; 264 	des_min = ((RTC_precteno[1] >> 4) & 0b00001111);   //desÌtky minut
1367  0511 b652          	ld	a,_RTC_precteno+1
1368  0513 4e            	swap	a
1369  0514 a40f          	and	a,#15
1370  0516 5f            	clrw	x
1371  0517 97            	ld	xl,a
1372  0518 bf42          	ldw	_des_min,x
1373                     ; 265 	hod = (RTC_precteno[2] & 0b00001111); 						//hodiny
1375  051a b653          	ld	a,_RTC_precteno+2
1376  051c a40f          	and	a,#15
1377  051e 5f            	clrw	x
1378  051f 97            	ld	xl,a
1379  0520 bf40          	ldw	_hod,x
1380                     ; 266 	des_hod = ((RTC_precteno[2] >> 4) & 0b00000011);  //desÌtky hodin
1382  0522 b653          	ld	a,_RTC_precteno+2
1383  0524 4e            	swap	a
1384  0525 a40f          	and	a,#15
1385  0527 5f            	clrw	x
1386  0528 a403          	and	a,#3
1387  052a 5f            	clrw	x
1388  052b 5f            	clrw	x
1389  052c 97            	ld	xl,a
1390  052d bf3e          	ldw	_des_hod,x
1391                     ; 267 	zbytek_hod = ((RTC_precteno[2] >> 4) & 0b00001111);   //zbytek dat hodin 
1393  052f b653          	ld	a,_RTC_precteno+2
1394  0531 4e            	swap	a
1395  0532 a40f          	and	a,#15
1396  0534 5f            	clrw	x
1397  0535 97            	ld	xl,a
1398  0536 bf3c          	ldw	_zbytek_hod,x
1399                     ; 268 }
1402  0538 81            	ret
1428                     ; 270 void init_tim3(void){
1429                     	switch	.text
1430  0539               _init_tim3:
1434                     ; 271 TIM3_TimeBaseInit(TIM3_PRESCALER_16,1999); // clock 1MHz, strop 5000 => perioda p¯eteËenÌ 5 ms
1436  0539 ae07cf        	ldw	x,#1999
1437  053c 89            	pushw	x
1438  053d a604          	ld	a,#4
1439  053f cd0000        	call	_TIM3_TimeBaseInit
1441  0542 85            	popw	x
1442                     ; 272 TIM3_ITConfig(TIM3_IT_UPDATE, ENABLE); // povolÌme p¯eruöenÌ od update ud·losti (p¯eteËenÌ) timeru 3
1444  0543 ae0101        	ldw	x,#257
1445  0546 cd0000        	call	_TIM3_ITConfig
1447                     ; 273 TIM3_Cmd(ENABLE); // spustÌme timer 3
1449  0549 a601          	ld	a,#1
1450  054b cd0000        	call	_TIM3_Cmd
1452                     ; 274 }
1455  054e 81            	ret
1481                     ; 277 INTERRUPT_HANDLER(TIM3_UPD_OVF_BRK_IRQHandler, 15){    //funkce pro obsluhu displej˘
1483                     	switch	.text
1484  054f               f_TIM3_UPD_OVF_BRK_IRQHandler:
1486  054f 8a            	push	cc
1487  0550 84            	pop	a
1488  0551 a4bf          	and	a,#191
1489  0553 88            	push	a
1490  0554 86            	pop	cc
1491  0555 3b0002        	push	c_x+2
1492  0558 be00          	ldw	x,c_x
1493  055a 89            	pushw	x
1494  055b 3b0002        	push	c_y+2
1495  055e be00          	ldw	x,c_y
1496  0560 89            	pushw	x
1499                     ; 278   TIM3_ClearITPendingBit(TIM3_IT_UPDATE);
1501  0561 a601          	ld	a,#1
1502  0563 cd0000        	call	_TIM3_ClearITPendingBit
1504                     ; 279 	read_flag=1;
1506  0566 3501000b      	mov	_read_flag,#1
1507                     ; 280 }
1510  056a 85            	popw	x
1511  056b bf00          	ldw	c_y,x
1512  056d 320002        	pop	c_y+2
1513  0570 85            	popw	x
1514  0571 bf00          	ldw	c_x,x
1515  0573 320002        	pop	c_x+2
1516  0576 80            	iret
1518                     	bsct
1519  001f               L123_stage:
1520  001f 00            	dc.b	0
1521  0020               L323_time:
1522  0020 0000          	dc.w	0
1570                     ; 283 void process_measurment(void){
1572                     	switch	.text
1573  0577               _process_measurment:
1577                     ; 286 	switch(stage){
1579  0577 b61f          	ld	a,L123_stage
1581                     ; 309 	default: // pokud se cokoli pokazÌ
1581                     ; 310 	stage = 0; // zaËneme znovu od zaË·tku
1582  0579 4d            	tnz	a
1583  057a 270a          	jreq	L523
1584  057c 4a            	dec	a
1585  057d 2727          	jreq	L723
1586  057f 4a            	dec	a
1587  0580 273f          	jreq	L133
1588  0582               L333:
1591  0582 3f1f          	clr	L123_stage
1592  0584 205f          	jra	L163
1593  0586               L523:
1594                     ; 287 	case 0:	// Ëek·me neû uplyne  MEASURMENT_PERIOD abychom odstartovali mÏ¯enÌ
1594                     ; 288 		if(milis()-time > MEASURMENT_PERIOD){
1596  0586 cd0000        	call	_milis
1598  0589 72b00020      	subw	x,L323_time
1599  058d a30065        	cpw	x,#101
1600  0590 2553          	jrult	L163
1601                     ; 289 			time = milis(); 
1603  0592 cd0000        	call	_milis
1605  0595 bf20          	ldw	L323_time,x
1606                     ; 290 			GPIO_WriteHigh(GPIOG,GPIO_PIN_0); // zah·jÌme trigger pulz
1608  0597 4b01          	push	#1
1609  0599 ae501e        	ldw	x,#20510
1610  059c cd0000        	call	_GPIO_WriteHigh
1612  059f 84            	pop	a
1613                     ; 291 			stage = 1; // a bdueme Ëekat aû uplyne Ëas trigger pulzu
1615  05a0 3501001f      	mov	L123_stage,#1
1616  05a4 203f          	jra	L163
1617  05a6               L723:
1618                     ; 294 	case 1: // Ëek·me neû uplyne PULSE_LEN (generuje trigger pulse)
1618                     ; 295 		if(milis()-time > PULSE_LEN){
1620  05a6 cd0000        	call	_milis
1622  05a9 72b00020      	subw	x,L323_time
1623  05ad a30003        	cpw	x,#3
1624  05b0 2533          	jrult	L163
1625                     ; 296 			GPIO_WriteLow(GPIOG,GPIO_PIN_0); // ukonËÌme trigger pulz
1627  05b2 4b01          	push	#1
1628  05b4 ae501e        	ldw	x,#20510
1629  05b7 cd0000        	call	_GPIO_WriteLow
1631  05ba 84            	pop	a
1632                     ; 297 			stage = 2; // a p¯ejdeme do f·ze kdy oËek·v·me echo
1634  05bb 3502001f      	mov	L123_stage,#2
1635  05bf 2024          	jra	L163
1636  05c1               L133:
1637                     ; 300 	case 2: // Ëek·me jestli dostaneme odezvu (Ëek·me na echo)
1637                     ; 301 		if(TIM1_GetFlagStatus(TIM1_FLAG_CC2) != RESET){ // hlÌd·me zda timer hl·sÌ zmÏ¯enÌ pulzu
1639  05c1 ae0004        	ldw	x,#4
1640  05c4 cd0000        	call	_TIM1_GetFlagStatus
1642  05c7 4d            	tnz	a
1643  05c8 270d          	jreq	L763
1644                     ; 302 			capture = TIM1_GetCapture2(); // uloûÌme v˝sledek mÏ¯enÌ
1646  05ca cd0000        	call	_TIM1_GetCapture2
1648  05cd bf69          	ldw	_capture,x
1649                     ; 303 			capture_flag=1; // d·me vÏdÏt zbytku programu ûe m·me nov˝ platn˝ v˝sledek
1651  05cf 35010000      	mov	_capture_flag,#1
1652                     ; 304 			stage = 0; // a zaËneme znovu od zaË·tku
1654  05d3 3f1f          	clr	L123_stage
1656  05d5 200e          	jra	L163
1657  05d7               L763:
1658                     ; 305 		}else if(milis()-time > MEASURMENT_PERIOD){ // pokud timer nezachytil pulz po dlouhou dobu, tak echo nep¯ijde
1660  05d7 cd0000        	call	_milis
1662  05da 72b00020      	subw	x,L323_time
1663  05de a30065        	cpw	x,#101
1664  05e1 2502          	jrult	L163
1665                     ; 306 			stage = 0; // a zaËneme znovu od zaË·tku
1667  05e3 3f1f          	clr	L123_stage
1668  05e5               L163:
1669                     ; 312 }
1672  05e5 81            	ret
1702                     ; 314 void init_tim1(void){
1703                     	switch	.text
1704  05e6               _init_tim1:
1708                     ; 315 GPIO_Init(GPIOC, GPIO_PIN_1, GPIO_MODE_IN_FL_NO_IT); // PC1 (TIM1_CH1) jako vstup
1710  05e6 4b00          	push	#0
1711  05e8 4b02          	push	#2
1712  05ea ae500a        	ldw	x,#20490
1713  05ed cd0000        	call	_GPIO_Init
1715  05f0 85            	popw	x
1716                     ; 316 TIM1_TimeBaseInit(15,TIM1_COUNTERMODE_UP,0xffff,0); // timer nech·me volnÏ bÏûet (do maxim·lnÌho stropu) s Ëasovou z·kladnou 1MHz (1us)
1718  05f1 4b00          	push	#0
1719  05f3 aeffff        	ldw	x,#65535
1720  05f6 89            	pushw	x
1721  05f7 4b00          	push	#0
1722  05f9 ae000f        	ldw	x,#15
1723  05fc cd0000        	call	_TIM1_TimeBaseInit
1725  05ff 5b04          	addw	sp,#4
1726                     ; 318 TIM1_ICInit(TIM1_CHANNEL_1,TIM1_ICPOLARITY_RISING,TIM1_ICSELECTION_DIRECTTI,TIM1_ICPSC_DIV1,0);
1728  0601 4b00          	push	#0
1729  0603 4b00          	push	#0
1730  0605 4b01          	push	#1
1731  0607 5f            	clrw	x
1732  0608 cd0000        	call	_TIM1_ICInit
1734  060b 5b03          	addw	sp,#3
1735                     ; 320 TIM1_ICInit(TIM1_CHANNEL_2,TIM1_ICPOLARITY_FALLING,TIM1_ICSELECTION_INDIRECTTI,TIM1_ICPSC_DIV1,0);
1737  060d 4b00          	push	#0
1738  060f 4b00          	push	#0
1739  0611 4b02          	push	#2
1740  0613 ae0101        	ldw	x,#257
1741  0616 cd0000        	call	_TIM1_ICInit
1743  0619 5b03          	addw	sp,#3
1744                     ; 321 TIM1_SelectInputTrigger(TIM1_TS_TI1FP1); // Zdroj sign·lu pro Clock/Trigger controller 
1746  061b a650          	ld	a,#80
1747  061d cd0000        	call	_TIM1_SelectInputTrigger
1749                     ; 322 TIM1_SelectSlaveMode(TIM1_SLAVEMODE_RESET); // Clock/Trigger m· po p¯Ìchodu sign·lu provÈst RESET timeru
1751  0620 a604          	ld	a,#4
1752  0622 cd0000        	call	_TIM1_SelectSlaveMode
1754                     ; 323 TIM1_ClearFlag(TIM1_FLAG_CC2); // pro jistotu vyËistÌme vlajku signalizujÌcÌ z·chyt a zmÏ¯enÌ echo pulzu
1756  0625 ae0004        	ldw	x,#4
1757  0628 cd0000        	call	_TIM1_ClearFlag
1759                     ; 324 TIM1_Cmd(ENABLE); // spustÌme timer aù bÏûÌ na pozadÌ
1761  062b a601          	ld	a,#1
1762  062d cd0000        	call	_TIM1_Cmd
1764                     ; 325 }
1767  0630 81            	ret
1802                     ; 329 void assert_failed(u8* file, u32 line)
1802                     ; 330 { 
1803                     	switch	.text
1804  0631               _assert_failed:
1808  0631               L324:
1809  0631 20fe          	jra	L324
2068                     	xdef	f_TIM3_UPD_OVF_BRK_IRQHandler
2069                     	xdef	_main
2070                     	xdef	_process_enc
2071                     	xdef	_i
2072                     	xdef	_pocet_zaznamu
2073                     	xdef	_sepnuto
2074                     	xdef	_zmena_zaznamu
2075                     	xdef	_zmena_rezimu
2076                     	xdef	_cislo_zaznamu
2077                     	switch	.ubsct
2078  0000               _zaznamy:
2079  0000 000000000000  	ds.b	60
2080                     	xdef	_zaznamy
2081                     	xdef	_rezim
2082                     	xdef	_stav
2083                     	xdef	_read_flag
2084  003c               _zbytek_hod:
2085  003c 0000          	ds.b	2
2086                     	xdef	_zbytek_hod
2087  003e               _des_hod:
2088  003e 0000          	ds.b	2
2089                     	xdef	_des_hod
2090  0040               _hod:
2091  0040 0000          	ds.b	2
2092                     	xdef	_hod
2093  0042               _des_min:
2094  0042 0000          	ds.b	2
2095                     	xdef	_des_min
2096  0044               _min:
2097  0044 0000          	ds.b	2
2098                     	xdef	_min
2099  0046               _des_sec:
2100  0046 0000          	ds.b	2
2101                     	xdef	_des_sec
2102  0048               _sec:
2103  0048 0000          	ds.b	2
2104                     	xdef	_sec
2105  004a               _zapis:
2106  004a 000000000000  	ds.b	7
2107                     	xdef	_zapis
2108  0051               _RTC_precteno:
2109  0051 000000000000  	ds.b	7
2110                     	xdef	_RTC_precteno
2111  0058               _error:
2112  0058 00            	ds.b	1
2113                     	xdef	_error
2114                     	xdef	_process_RTC
2115                     	xdef	_read_RTC
2116                     	xdef	_init_tim3
2117                     	xdef	_vzd1
2118                     	xdef	_vzdalenost
2119                     	xdef	_time2
2120  0059               _text:
2121  0059 000000000000  	ds.b	16
2122                     	xdef	_text
2123                     	xdef	_capture_flag
2124  0069               _capture:
2125  0069 0000          	ds.b	2
2126                     	xdef	_capture
2127                     	xdef	_init_tim1
2128                     	xdef	_process_measurment
2129                     	xref	_swi2c_read_buf
2130                     	xref	_swi2c_init
2131                     	xref	_sprintf
2132                     	xref	_lcd_puts
2133                     	xref	_lcd_gotoxy
2134                     	xref	_lcd_init
2135                     	xref	_lcd_command
2136                     	xref	_init_milis
2137                     	xref	_milis
2138                     	xdef	_assert_failed
2139                     	xref	_TIM3_ClearITPendingBit
2140                     	xref	_TIM3_ITConfig
2141                     	xref	_TIM3_Cmd
2142                     	xref	_TIM3_TimeBaseInit
2143                     	xref	_TIM1_ClearFlag
2144                     	xref	_TIM1_GetFlagStatus
2145                     	xref	_TIM1_GetCapture2
2146                     	xref	_TIM1_SelectSlaveMode
2147                     	xref	_TIM1_SelectInputTrigger
2148                     	xref	_TIM1_Cmd
2149                     	xref	_TIM1_ICInit
2150                     	xref	_TIM1_TimeBaseInit
2151                     	xref	_GPIO_ReadInputPin
2152                     	xref	_GPIO_WriteLow
2153                     	xref	_GPIO_WriteHigh
2154                     	xref	_GPIO_Init
2155                     	xref	_CLK_HSIPrescalerConfig
2156                     	switch	.const
2157  000c               L101:
2158  000c 25753a202575  	dc.b	"%u: %u%u:%u%u:%u%u",0
2159  001f               L55:
2160  001f 64697374616e  	dc.b	"distance: %3ucm",0
2161  002f               L15:
2162  002f 74696d653a20  	dc.b	"time: %u%u:%u%u:%u"
2163  0041 257500        	dc.b	"%u",0
2164                     	xref.b	c_lreg
2165                     	xref.b	c_x
2166                     	xref.b	c_y
2186                     	xref	c_ludv
2187                     	xref	c_ltor
2188                     	xref	c_lgmul
2189                     	xref	c_rtol
2190                     	xref	c_lcmp
2191                     	xref	c_lsub
2192                     	xref	c_uitolx
2193                     	end
