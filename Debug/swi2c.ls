   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.1 - 30 Jun 2020
   3                     ; Generator (Limited) V4.4.12 - 02 Jul 2020
 124                     ; 10 uint8_t swi2c_read_buf(uint8_t slv_addr, uint8_t address, uint8_t* data, uint16_t num){
 126                     	switch	.text
 127  0000               _swi2c_read_buf:
 129  0000 89            	pushw	x
 130  0001 5203          	subw	sp,#3
 131       00000003      OFST:	set	3
 134                     ; 11 uint8_t i=0,bit;	
 136                     ; 16 if(swi2c_START()){return 0xaa;} 
 138  0003 cd03c7        	call	_swi2c_START
 140  0006 4d            	tnz	a
 141  0007 2704          	jreq	L76
 144  0009 a6aa          	ld	a,#170
 146  000b 2010          	jra	L6
 147  000d               L76:
 148                     ; 19 mask=0b1<<7;
 150  000d a680          	ld	a,#128
 151  000f 6b03          	ld	(OFST+0,sp),a
 153  0011               L17:
 154                     ; 21 if(swi2c_writebit(slv_addr & mask)){return 0xff;}
 156  0011 7b04          	ld	a,(OFST+1,sp)
 157  0013 1403          	and	a,(OFST+0,sp)
 158  0015 cd02af        	call	_swi2c_writebit
 160  0018 4d            	tnz	a
 161  0019 2705          	jreq	L77
 164  001b a6ff          	ld	a,#255
 166  001d               L6:
 168  001d 5b05          	addw	sp,#5
 169  001f 81            	ret
 170  0020               L77:
 171                     ; 22 mask = mask >>1;
 173  0020 0403          	srl	(OFST+0,sp)
 175                     ; 20 while(mask){
 177  0022 0d03          	tnz	(OFST+0,sp)
 178  0024 26eb          	jrne	L17
 179                     ; 24 ack=swi2c_readbit();
 181  0026 cd0239        	call	_swi2c_readbit
 183  0029 6b02          	ld	(OFST-1,sp),a
 185                     ; 25 if(ack){
 187  002b 0d02          	tnz	(OFST-1,sp)
 188  002d 270e          	jreq	L101
 189                     ; 26 	if(swi2c_STOP()){return 0xff;}
 191  002f cd041a        	call	_swi2c_STOP
 193  0032 4d            	tnz	a
 194  0033 2704          	jreq	L301
 197  0035 a6ff          	ld	a,#255
 199  0037 20e4          	jra	L6
 200  0039               L301:
 201                     ; 27 	return ack;
 203  0039 7b02          	ld	a,(OFST-1,sp)
 205  003b 20e0          	jra	L6
 206  003d               L101:
 207                     ; 31 mask=0b1<<7;
 209  003d a680          	ld	a,#128
 210  003f 6b03          	ld	(OFST+0,sp),a
 212  0041               L501:
 213                     ; 33 if(swi2c_writebit(address & mask)){return 0xff;}
 215  0041 7b05          	ld	a,(OFST+2,sp)
 216  0043 1403          	and	a,(OFST+0,sp)
 217  0045 cd02af        	call	_swi2c_writebit
 219  0048 4d            	tnz	a
 220  0049 2704          	jreq	L311
 223  004b a6ff          	ld	a,#255
 225  004d 20ce          	jra	L6
 226  004f               L311:
 227                     ; 34 mask = mask >>1;
 229  004f 0403          	srl	(OFST+0,sp)
 231                     ; 32 while(mask){
 233  0051 0d03          	tnz	(OFST+0,sp)
 234  0053 26ec          	jrne	L501
 235                     ; 36 ack=swi2c_readbit();
 237  0055 cd0239        	call	_swi2c_readbit
 239  0058 6b02          	ld	(OFST-1,sp),a
 241                     ; 37 if(ack){
 243  005a 0d02          	tnz	(OFST-1,sp)
 244  005c 270e          	jreq	L511
 245                     ; 38 	if(swi2c_STOP()){return 0xff;}
 247  005e cd041a        	call	_swi2c_STOP
 249  0061 4d            	tnz	a
 250  0062 2704          	jreq	L711
 253  0064 a6ff          	ld	a,#255
 255  0066 20b5          	jra	L6
 256  0068               L711:
 257                     ; 39 	return ack;
 259  0068 7b02          	ld	a,(OFST-1,sp)
 261  006a 20b1          	jra	L6
 262  006c               L511:
 263                     ; 43 if(swi2c_RESTART()){return 0xff;} 
 265  006c cd0324        	call	_swi2c_RESTART
 267  006f 4d            	tnz	a
 268  0070 2704          	jreq	L121
 271  0072 a6ff          	ld	a,#255
 273  0074 20a7          	jra	L6
 274  0076               L121:
 275                     ; 46 mask=0b1<<7;
 277  0076 a680          	ld	a,#128
 278  0078 6b03          	ld	(OFST+0,sp),a
 280  007a               L321:
 281                     ; 48 if(swi2c_writebit((slv_addr | 0b1) & mask)){return 0xff;}
 283  007a 7b04          	ld	a,(OFST+1,sp)
 284  007c aa01          	or	a,#1
 285  007e 1403          	and	a,(OFST+0,sp)
 286  0080 cd02af        	call	_swi2c_writebit
 288  0083 4d            	tnz	a
 289  0084 2704          	jreq	L131
 292  0086 a6ff          	ld	a,#255
 294  0088 2093          	jra	L6
 295  008a               L131:
 296                     ; 49 mask = mask >>1;
 298  008a 0403          	srl	(OFST+0,sp)
 300                     ; 47 while(mask){
 302  008c 0d03          	tnz	(OFST+0,sp)
 303  008e 26ea          	jrne	L321
 304                     ; 51 ack=swi2c_readbit();
 306  0090 cd0239        	call	_swi2c_readbit
 308  0093 6b02          	ld	(OFST-1,sp),a
 310                     ; 52 if(ack){
 312  0095 0d02          	tnz	(OFST-1,sp)
 313  0097 2712          	jreq	L331
 314                     ; 53 	if(swi2c_STOP()){return 0xff;}
 316  0099 cd041a        	call	_swi2c_STOP
 318  009c 4d            	tnz	a
 319  009d 2706          	jreq	L531
 322  009f a6ff          	ld	a,#255
 324  00a1 ac1d001d      	jpf	L6
 325  00a5               L531:
 326                     ; 54 	return ack;
 328  00a5 7b02          	ld	a,(OFST-1,sp)
 330  00a7 ac1d001d      	jpf	L6
 331  00ab               L331:
 332                     ; 59 for(i=0;i<num;i++){
 334  00ab 0f01          	clr	(OFST-2,sp)
 337  00ad 2061          	jra	L341
 338  00af               L731:
 339                     ; 60 	mask=0b1<<7;
 341  00af a680          	ld	a,#128
 342  00b1 6b03          	ld	(OFST+0,sp),a
 344  00b3               L741:
 345                     ; 62 	bit = swi2c_readbit();
 347  00b3 cd0239        	call	_swi2c_readbit
 349  00b6 6b02          	ld	(OFST-1,sp),a
 351                     ; 63 	if(bit==0){data[i] &=~mask;}
 353  00b8 0d02          	tnz	(OFST-1,sp)
 354  00ba 260e          	jrne	L551
 357  00bc 7b01          	ld	a,(OFST-2,sp)
 358  00be 5f            	clrw	x
 359  00bf 97            	ld	xl,a
 360  00c0 72fb08        	addw	x,(OFST+5,sp)
 361  00c3 7b03          	ld	a,(OFST+0,sp)
 362  00c5 43            	cpl	a
 363  00c6 f4            	and	a,(x)
 364  00c7 f7            	ld	(x),a
 366  00c8 2011          	jra	L751
 367  00ca               L551:
 368                     ; 64 	else if(bit==1){data[i] |=mask;}
 370  00ca 7b02          	ld	a,(OFST-1,sp)
 371  00cc a101          	cp	a,#1
 372  00ce 2628          	jrne	L161
 375  00d0 7b01          	ld	a,(OFST-2,sp)
 376  00d2 5f            	clrw	x
 377  00d3 97            	ld	xl,a
 378  00d4 72fb08        	addw	x,(OFST+5,sp)
 379  00d7 f6            	ld	a,(x)
 380  00d8 1a03          	or	a,(OFST+0,sp)
 381  00da f7            	ld	(x),a
 383  00db               L751:
 384                     ; 66 	mask = mask >>1;
 386  00db 0403          	srl	(OFST+0,sp)
 388                     ; 61 	while(mask){
 390  00dd 0d03          	tnz	(OFST+0,sp)
 391  00df 26d2          	jrne	L741
 392                     ; 68 	if((i+1)==num){
 394  00e1 7b01          	ld	a,(OFST-2,sp)
 395  00e3 5f            	clrw	x
 396  00e4 97            	ld	xl,a
 397  00e5 5c            	incw	x
 398  00e6 130a          	cpw	x,(OFST+7,sp)
 399  00e8 2617          	jrne	L561
 400                     ; 69 		if(swi2c_writebit(1)){return 0xff;} // NACK
 402  00ea a601          	ld	a,#1
 403  00ec cd02af        	call	_swi2c_writebit
 405  00ef 4d            	tnz	a
 406  00f0 271c          	jreq	L171
 409  00f2 a6ff          	ld	a,#255
 411  00f4 ac1d001d      	jpf	L6
 412  00f8               L161:
 413                     ; 65 	else{swi2c_STOP();return 0xff;}
 415  00f8 cd041a        	call	_swi2c_STOP
 419  00fb a6ff          	ld	a,#255
 421  00fd ac1d001d      	jpf	L6
 422  0101               L561:
 423                     ; 71 		if(swi2c_writebit(0)){return 0xff;} // ACK
 425  0101 4f            	clr	a
 426  0102 cd02af        	call	_swi2c_writebit
 428  0105 4d            	tnz	a
 429  0106 2706          	jreq	L171
 432  0108 a6ff          	ld	a,#255
 434  010a ac1d001d      	jpf	L6
 435  010e               L171:
 436                     ; 59 for(i=0;i<num;i++){
 438  010e 0c01          	inc	(OFST-2,sp)
 440  0110               L341:
 443  0110 7b01          	ld	a,(OFST-2,sp)
 444  0112 5f            	clrw	x
 445  0113 97            	ld	xl,a
 446  0114 130a          	cpw	x,(OFST+7,sp)
 447  0116 2597          	jrult	L731
 448                     ; 76 if(swi2c_STOP()){return 0xff;}
 450  0118 cd041a        	call	_swi2c_STOP
 452  011b 4d            	tnz	a
 453  011c 2706          	jreq	L571
 456  011e a6ff          	ld	a,#255
 458  0120 ac1d001d      	jpf	L6
 459  0124               L571:
 460                     ; 77 return 0;
 462  0124 4f            	clr	a
 464  0125 ac1d001d      	jpf	L6
 557                     ; 88 uint8_t swi2c_write_buf(uint8_t slv_addr, uint8_t address, uint8_t* data, uint16_t num){
 558                     	switch	.text
 559  0129               _swi2c_write_buf:
 561  0129 89            	pushw	x
 562  012a 89            	pushw	x
 563       00000002      OFST:	set	2
 566                     ; 94 if(swi2c_START()){return 0xaa;} 
 568  012b cd03c7        	call	_swi2c_START
 570  012e 4d            	tnz	a
 571  012f 2704          	jreq	L542
 574  0131 a6aa          	ld	a,#170
 576  0133 2010          	jra	L21
 577  0135               L542:
 578                     ; 97 mask=0b1<<7;
 580  0135 a680          	ld	a,#128
 581  0137 6b02          	ld	(OFST+0,sp),a
 583  0139               L742:
 584                     ; 99 if(swi2c_writebit(slv_addr & mask)){return 0xff;}
 586  0139 7b03          	ld	a,(OFST+1,sp)
 587  013b 1402          	and	a,(OFST+0,sp)
 588  013d cd02af        	call	_swi2c_writebit
 590  0140 4d            	tnz	a
 591  0141 2705          	jreq	L552
 594  0143 a6ff          	ld	a,#255
 596  0145               L21:
 598  0145 5b04          	addw	sp,#4
 599  0147 81            	ret
 600  0148               L552:
 601                     ; 100 mask = mask >>1;
 603  0148 0402          	srl	(OFST+0,sp)
 605                     ; 98 while(mask){
 607  014a 0d02          	tnz	(OFST+0,sp)
 608  014c 26eb          	jrne	L742
 609                     ; 102 ack=swi2c_readbit();
 611  014e cd0239        	call	_swi2c_readbit
 613  0151 6b02          	ld	(OFST+0,sp),a
 615                     ; 103 if(ack){
 617  0153 0d02          	tnz	(OFST+0,sp)
 618  0155 270e          	jreq	L752
 619                     ; 104 	if(swi2c_STOP()){return 0xff;}
 621  0157 cd041a        	call	_swi2c_STOP
 623  015a 4d            	tnz	a
 624  015b 2704          	jreq	L162
 627  015d a6ff          	ld	a,#255
 629  015f 20e4          	jra	L21
 630  0161               L162:
 631                     ; 105 	return ack;
 633  0161 7b02          	ld	a,(OFST+0,sp)
 635  0163 20e0          	jra	L21
 636  0165               L752:
 637                     ; 109 mask=0b1<<7;
 639  0165 a680          	ld	a,#128
 640  0167 6b02          	ld	(OFST+0,sp),a
 642  0169               L362:
 643                     ; 111 if(swi2c_writebit(address & mask)){return 0xff;}
 645  0169 7b04          	ld	a,(OFST+2,sp)
 646  016b 1402          	and	a,(OFST+0,sp)
 647  016d cd02af        	call	_swi2c_writebit
 649  0170 4d            	tnz	a
 650  0171 2704          	jreq	L172
 653  0173 a6ff          	ld	a,#255
 655  0175 20ce          	jra	L21
 656  0177               L172:
 657                     ; 112 mask = mask >>1;
 659  0177 0402          	srl	(OFST+0,sp)
 661                     ; 110 while(mask){
 663  0179 0d02          	tnz	(OFST+0,sp)
 664  017b 26ec          	jrne	L362
 665                     ; 114 ack=swi2c_readbit();
 667  017d cd0239        	call	_swi2c_readbit
 669  0180 6b02          	ld	(OFST+0,sp),a
 671                     ; 115 if(ack){
 673  0182 0d02          	tnz	(OFST+0,sp)
 674  0184 270e          	jreq	L372
 675                     ; 116 	if(swi2c_STOP()){return 0xff;}
 677  0186 cd041a        	call	_swi2c_STOP
 679  0189 4d            	tnz	a
 680  018a 2704          	jreq	L572
 683  018c a6ff          	ld	a,#255
 685  018e 20b5          	jra	L21
 686  0190               L572:
 687                     ; 117 	return ack;
 689  0190 7b02          	ld	a,(OFST+0,sp)
 691  0192 20b1          	jra	L21
 692  0194               L372:
 693                     ; 121 for(i=0;i<num;i++){
 695  0194 0f01          	clr	(OFST-1,sp)
 698  0196 203b          	jra	L303
 699  0198               L772:
 700                     ; 122 	mask=0b1<<7;
 702  0198 a680          	ld	a,#128
 703  019a 6b02          	ld	(OFST+0,sp),a
 705  019c               L703:
 706                     ; 124 	if(swi2c_writebit(data[i] & mask)){return 0xff;}
 708  019c 7b01          	ld	a,(OFST-1,sp)
 709  019e 5f            	clrw	x
 710  019f 97            	ld	xl,a
 711  01a0 72fb07        	addw	x,(OFST+5,sp)
 712  01a3 f6            	ld	a,(x)
 713  01a4 1402          	and	a,(OFST+0,sp)
 714  01a6 cd02af        	call	_swi2c_writebit
 716  01a9 4d            	tnz	a
 717  01aa 2704          	jreq	L513
 720  01ac a6ff          	ld	a,#255
 722  01ae 2095          	jra	L21
 723  01b0               L513:
 724                     ; 125 	mask = mask >>1;
 726  01b0 0402          	srl	(OFST+0,sp)
 728                     ; 123 	while(mask){
 730  01b2 0d02          	tnz	(OFST+0,sp)
 731  01b4 26e6          	jrne	L703
 732                     ; 127 	ack=swi2c_readbit();
 734  01b6 cd0239        	call	_swi2c_readbit
 736  01b9 6b02          	ld	(OFST+0,sp),a
 738                     ; 128 	if(ack){
 740  01bb 0d02          	tnz	(OFST+0,sp)
 741  01bd 2712          	jreq	L713
 742                     ; 129 		if(swi2c_STOP()){return 0xff;}
 744  01bf cd041a        	call	_swi2c_STOP
 746  01c2 4d            	tnz	a
 747  01c3 2706          	jreq	L123
 750  01c5 a6ff          	ld	a,#255
 752  01c7 ac450145      	jpf	L21
 753  01cb               L123:
 754                     ; 130 		return ack;
 756  01cb 7b02          	ld	a,(OFST+0,sp)
 758  01cd ac450145      	jpf	L21
 759  01d1               L713:
 760                     ; 121 for(i=0;i<num;i++){
 762  01d1 0c01          	inc	(OFST-1,sp)
 764  01d3               L303:
 767  01d3 7b01          	ld	a,(OFST-1,sp)
 768  01d5 5f            	clrw	x
 769  01d6 97            	ld	xl,a
 770  01d7 1309          	cpw	x,(OFST+7,sp)
 771  01d9 25bd          	jrult	L772
 772                     ; 135 if(swi2c_STOP()){return 0xff;}
 774  01db cd041a        	call	_swi2c_STOP
 776  01de 4d            	tnz	a
 777  01df 2706          	jreq	L323
 780  01e1 a6ff          	ld	a,#255
 782  01e3 ac450145      	jpf	L21
 783  01e7               L323:
 784                     ; 136 return 0;
 786  01e7 4f            	clr	a
 788  01e8 ac450145      	jpf	L21
 844                     ; 147 uint8_t swi2c_test_slave(uint8_t slvaddr){
 845                     	switch	.text
 846  01ec               _swi2c_test_slave:
 848  01ec 88            	push	a
 849  01ed 88            	push	a
 850       00000001      OFST:	set	1
 853                     ; 149 uint8_t mask=0b1<<7;
 855  01ee a680          	ld	a,#128
 856  01f0 6b01          	ld	(OFST+0,sp),a
 858                     ; 150 if(swi2c_START()){return 0xaa;}
 860  01f2 cd03c7        	call	_swi2c_START
 862  01f5 4d            	tnz	a
 863  01f6 2714          	jreq	L753
 866  01f8 a6aa          	ld	a,#170
 868  01fa 200c          	jra	L61
 869  01fc               L553:
 870                     ; 152 if(swi2c_writebit(slvaddr & mask)){return 0xff;}
 872  01fc 7b02          	ld	a,(OFST+1,sp)
 873  01fe 1401          	and	a,(OFST+0,sp)
 874  0200 cd02af        	call	_swi2c_writebit
 876  0203 4d            	tnz	a
 877  0204 2704          	jreq	L363
 880  0206 a6ff          	ld	a,#255
 882  0208               L61:
 884  0208 85            	popw	x
 885  0209 81            	ret
 886  020a               L363:
 887                     ; 153 mask = mask >>1;
 889  020a 0401          	srl	(OFST+0,sp)
 891  020c               L753:
 892                     ; 151 while(mask){
 894  020c 0d01          	tnz	(OFST+0,sp)
 895  020e 26ec          	jrne	L553
 896                     ; 155 ack=swi2c_readbit();
 898  0210 ad27          	call	_swi2c_readbit
 900  0212 6b01          	ld	(OFST+0,sp),a
 902                     ; 156 if(swi2c_STOP()){return 0xff;}
 904  0214 cd041a        	call	_swi2c_STOP
 906  0217 4d            	tnz	a
 907  0218 2704          	jreq	L563
 910  021a a6ff          	ld	a,#255
 912  021c 20ea          	jra	L61
 913  021e               L563:
 914                     ; 157 return ack;
 916  021e 7b01          	ld	a,(OFST+0,sp)
 918  0220 20e6          	jra	L61
 942                     ; 161 void swi2c_init(void){
 943                     	switch	.text
 944  0222               _swi2c_init:
 948                     ; 162 GPIO_Init(SCL_GPIO,SCL_PIN,GPIO_MODE_OUT_OD_HIZ_SLOW);
 950  0222 4b90          	push	#144
 951  0224 4b40          	push	#64
 952  0226 ae500a        	ldw	x,#20490
 953  0229 cd0000        	call	_GPIO_Init
 955  022c 85            	popw	x
 956                     ; 163 GPIO_Init(SDA_GPIO,SDA_PIN,GPIO_MODE_OUT_OD_HIZ_SLOW);
 958  022d 4b90          	push	#144
 959  022f 4b80          	push	#128
 960  0231 ae500a        	ldw	x,#20490
 961  0234 cd0000        	call	_GPIO_Init
 963  0237 85            	popw	x
 964                     ; 164 }
 967  0238 81            	ret
1018                     ; 172 uint8_t swi2c_readbit(void){
1019                     	switch	.text
1020  0239               _swi2c_readbit:
1022  0239 5203          	subw	sp,#3
1023       00000003      OFST:	set	3
1026                     ; 173 uint16_t timeout=SWI2C_TIMEOUT;
1028  023b aeffff        	ldw	x,#65535
1029  023e 1f02          	ldw	(OFST-1,sp),x
1031                     ; 175 SDA_HIGH; // release SDA
1033  0240 4b80          	push	#128
1034  0242 ae500a        	ldw	x,#20490
1035  0245 cd0000        	call	_GPIO_WriteHigh
1037  0248 84            	pop	a
1038                     ; 21 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);
1042  0249 ae000b        	ldw	x,#11
1044  024c 9d            nop
1045  024d                L42:
1046  024d 5a             decw X
1047  024e 26fd           jrne L42
1048  0250 9d             nop
1049                      
1051  0251               L104:
1052                     ; 177 SCL_HIGH;
1054  0251 4b40          	push	#64
1055  0253 ae500a        	ldw	x,#20490
1056  0256 cd0000        	call	_GPIO_WriteHigh
1058  0259 84            	pop	a
1060  025a 2007          	jra	L734
1061  025c               L534:
1062                     ; 178 while(SCL_stat() == RESET && timeout){timeout--;}
1064  025c 1e02          	ldw	x,(OFST-1,sp)
1065  025e 1d0001        	subw	x,#1
1066  0261 1f02          	ldw	(OFST-1,sp),x
1068  0263               L734:
1071  0263 4b40          	push	#64
1072  0265 ae500a        	ldw	x,#20490
1073  0268 cd0000        	call	_GPIO_ReadInputPin
1075  026b 5b01          	addw	sp,#1
1076  026d 4d            	tnz	a
1077  026e 2604          	jrne	L344
1079  0270 1e02          	ldw	x,(OFST-1,sp)
1080  0272 26e8          	jrne	L534
1081  0274               L344:
1082                     ; 179 if(timeout==0){return 0xff;}
1084  0274 1e02          	ldw	x,(OFST-1,sp)
1085  0276 2604          	jrne	L544
1088  0278 a6ff          	ld	a,#255
1090  027a 2030          	jra	L23
1091  027c               L544:
1092                     ; 21 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);
1096  027c ae000b        	ldw	x,#11
1098  027f 9d            nop
1099  0280                L62:
1100  0280 5a             decw X
1101  0281 26fd           jrne L62
1102  0283 9d             nop
1103                      
1105  0284               L504:
1106                     ; 181 if(SDA_stat() == RESET){retval = 0;}else{retval=1;}
1108  0284 4b80          	push	#128
1109  0286 ae500a        	ldw	x,#20490
1110  0289 cd0000        	call	_GPIO_ReadInputPin
1112  028c 5b01          	addw	sp,#1
1113  028e 4d            	tnz	a
1114  028f 2604          	jrne	L744
1117  0291 0f01          	clr	(OFST-2,sp)
1120  0293 2004          	jra	L154
1121  0295               L744:
1124  0295 a601          	ld	a,#1
1125  0297 6b01          	ld	(OFST-2,sp),a
1127  0299               L154:
1128                     ; 182 SCL_LOW;
1130  0299 4b40          	push	#64
1131  029b ae500a        	ldw	x,#20490
1132  029e cd0000        	call	_GPIO_WriteLow
1134  02a1 84            	pop	a
1135                     ; 21 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);
1139  02a2 ae000b        	ldw	x,#11
1141  02a5 9d            nop
1142  02a6                L03:
1143  02a6 5a             decw X
1144  02a7 26fd           jrne L03
1145  02a9 9d             nop
1146                      
1148  02aa               L114:
1149                     ; 184 return retval;
1151  02aa 7b01          	ld	a,(OFST-2,sp)
1153  02ac               L23:
1155  02ac 5b03          	addw	sp,#3
1156  02ae 81            	ret
1207                     ; 190 uint8_t swi2c_writebit(uint8_t bit){
1208                     	switch	.text
1209  02af               _swi2c_writebit:
1211  02af 89            	pushw	x
1212       00000002      OFST:	set	2
1215                     ; 191 uint16_t timeout=SWI2C_TIMEOUT;
1217  02b0 aeffff        	ldw	x,#65535
1218  02b3 1f01          	ldw	(OFST-1,sp),x
1220                     ; 192 if(bit){SDA_HIGH;}else{SDA_LOW;} // set desired SDA value
1222  02b5 4d            	tnz	a
1223  02b6 270b          	jreq	L115
1226  02b8 4b80          	push	#128
1227  02ba ae500a        	ldw	x,#20490
1228  02bd cd0000        	call	_GPIO_WriteHigh
1230  02c0 84            	pop	a
1232  02c1 2009          	jra	L315
1233  02c3               L115:
1236  02c3 4b80          	push	#128
1237  02c5 ae500a        	ldw	x,#20490
1238  02c8 cd0000        	call	_GPIO_WriteLow
1240  02cb 84            	pop	a
1241  02cc               L315:
1242                     ; 21 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);
1246  02cc ae000b        	ldw	x,#11
1248  02cf 9d            nop
1249  02d0                L63:
1250  02d0 5a             decw X
1251  02d1 26fd           jrne L63
1252  02d3 9d             nop
1253                      
1255  02d4               L554:
1256                     ; 194 SCL_HIGH;		
1258  02d4 4b40          	push	#64
1259  02d6 ae500a        	ldw	x,#20490
1260  02d9 cd0000        	call	_GPIO_WriteHigh
1262  02dc 84            	pop	a
1264  02dd 2007          	jra	L715
1265  02df               L515:
1266                     ; 195 while(SCL_stat() == RESET && timeout){timeout--;} // wait until SCL is not high
1268  02df 1e01          	ldw	x,(OFST-1,sp)
1269  02e1 1d0001        	subw	x,#1
1270  02e4 1f01          	ldw	(OFST-1,sp),x
1272  02e6               L715:
1275  02e6 4b40          	push	#64
1276  02e8 ae500a        	ldw	x,#20490
1277  02eb cd0000        	call	_GPIO_ReadInputPin
1279  02ee 5b01          	addw	sp,#1
1280  02f0 4d            	tnz	a
1281  02f1 2604          	jrne	L325
1283  02f3 1e01          	ldw	x,(OFST-1,sp)
1284  02f5 26e8          	jrne	L515
1285  02f7               L325:
1286                     ; 196 if(timeout==0){SDA_HIGH; return 0xff;} // generate timeout error if SCL is held Low too long
1288  02f7 1e01          	ldw	x,(OFST-1,sp)
1289  02f9 260d          	jrne	L525
1292  02fb 4b80          	push	#128
1293  02fd ae500a        	ldw	x,#20490
1294  0300 cd0000        	call	_GPIO_WriteHigh
1296  0303 84            	pop	a
1299  0304 a6ff          	ld	a,#255
1301  0306 201a          	jra	L44
1302  0308               L525:
1303                     ; 21 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);
1307  0308 ae000b        	ldw	x,#11
1309  030b 9d            nop
1310  030c                L04:
1311  030c 5a             decw X
1312  030d 26fd           jrne L04
1313  030f 9d             nop
1314                      
1316  0310               L164:
1317                     ; 198 SCL_LOW;
1319  0310 4b40          	push	#64
1320  0312 ae500a        	ldw	x,#20490
1321  0315 cd0000        	call	_GPIO_WriteLow
1323  0318 84            	pop	a
1324                     ; 21 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);
1328  0319 ae000b        	ldw	x,#11
1330  031c 9d            nop
1331  031d                L24:
1332  031d 5a             decw X
1333  031e 26fd           jrne L24
1334  0320 9d             nop
1335                      
1337  0321               L564:
1338                     ; 200 return 0;
1340  0321 4f            	clr	a
1342  0322               L44:
1344  0322 85            	popw	x
1345  0323 81            	ret
1388                     ; 206 uint8_t swi2c_RESTART(void){
1389                     	switch	.text
1390  0324               _swi2c_RESTART:
1392  0324 89            	pushw	x
1393       00000002      OFST:	set	2
1396                     ; 207 uint16_t timeout=SWI2C_TIMEOUT;
1398  0325 aeffff        	ldw	x,#65535
1399  0328 1f01          	ldw	(OFST-1,sp),x
1401                     ; 208 SCL_LOW;
1403  032a 4b40          	push	#64
1404  032c ae500a        	ldw	x,#20490
1405  032f cd0000        	call	_GPIO_WriteLow
1407  0332 84            	pop	a
1408                     ; 209 SDA_HIGH;
1410  0333 4b80          	push	#128
1411  0335 ae500a        	ldw	x,#20490
1412  0338 cd0000        	call	_GPIO_WriteHigh
1414  033b 84            	pop	a
1416  033c 2007          	jra	L765
1417  033e               L565:
1418                     ; 210 while(SDA_stat() == RESET && timeout){timeout--;}
1420  033e 1e01          	ldw	x,(OFST-1,sp)
1421  0340 1d0001        	subw	x,#1
1422  0343 1f01          	ldw	(OFST-1,sp),x
1424  0345               L765:
1427  0345 4b80          	push	#128
1428  0347 ae500a        	ldw	x,#20490
1429  034a cd0000        	call	_GPIO_ReadInputPin
1431  034d 5b01          	addw	sp,#1
1432  034f 4d            	tnz	a
1433  0350 2604          	jrne	L375
1435  0352 1e01          	ldw	x,(OFST-1,sp)
1436  0354 26e8          	jrne	L565
1437  0356               L375:
1438                     ; 211 if(timeout==0){SCL_HIGH; return 0xff;}
1440  0356 1e01          	ldw	x,(OFST-1,sp)
1441  0358 260d          	jrne	L575
1444  035a 4b40          	push	#64
1445  035c ae500a        	ldw	x,#20490
1446  035f cd0000        	call	_GPIO_WriteHigh
1448  0362 84            	pop	a
1451  0363 a6ff          	ld	a,#255
1453  0365 2031          	jra	L06
1454  0367               L575:
1455                     ; 21 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);
1459  0367 ae001b        	ldw	x,#27
1461  036a 9d            nop
1462  036b                L05:
1463  036b 5a             decw X
1464  036c 26fd           jrne L05
1465  036e 9d             nop
1466                      
1468  036f               L135:
1469                     ; 213 SCL_HIGH;
1471  036f 4b40          	push	#64
1472  0371 ae500a        	ldw	x,#20490
1473  0374 cd0000        	call	_GPIO_WriteHigh
1475  0377 84            	pop	a
1477  0378 2007          	jra	L106
1478  037a               L775:
1479                     ; 214 while(SCL_stat() == RESET && timeout){timeout--;}
1481  037a 1e01          	ldw	x,(OFST-1,sp)
1482  037c 1d0001        	subw	x,#1
1483  037f 1f01          	ldw	(OFST-1,sp),x
1485  0381               L106:
1488  0381 4b40          	push	#64
1489  0383 ae500a        	ldw	x,#20490
1490  0386 cd0000        	call	_GPIO_ReadInputPin
1492  0389 5b01          	addw	sp,#1
1493  038b 4d            	tnz	a
1494  038c 2604          	jrne	L506
1496  038e 1e01          	ldw	x,(OFST-1,sp)
1497  0390 26e8          	jrne	L775
1498  0392               L506:
1499                     ; 215 if(timeout==0){return 0xff;}
1501  0392 1e01          	ldw	x,(OFST-1,sp)
1502  0394 2604          	jrne	L706
1505  0396 a6ff          	ld	a,#255
1507  0398               L06:
1509  0398 85            	popw	x
1510  0399 81            	ret
1511  039a               L706:
1512                     ; 21 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);
1516  039a ae001b        	ldw	x,#27
1518  039d 9d            nop
1519  039e                L25:
1520  039e 5a             decw X
1521  039f 26fd           jrne L25
1522  03a1 9d             nop
1523                      
1525  03a2               L535:
1526                     ; 217 SDA_LOW;
1528  03a2 4b80          	push	#128
1529  03a4 ae500a        	ldw	x,#20490
1530  03a7 cd0000        	call	_GPIO_WriteLow
1532  03aa 84            	pop	a
1533                     ; 21 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);
1537  03ab ae001b        	ldw	x,#27
1539  03ae 9d            nop
1540  03af                L45:
1541  03af 5a             decw X
1542  03b0 26fd           jrne L45
1543  03b2 9d             nop
1544                      
1546  03b3               L145:
1547                     ; 219 SCL_LOW;
1549  03b3 4b40          	push	#64
1550  03b5 ae500a        	ldw	x,#20490
1551  03b8 cd0000        	call	_GPIO_WriteLow
1553  03bb 84            	pop	a
1554                     ; 21 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);
1558  03bc ae001b        	ldw	x,#27
1560  03bf 9d            nop
1561  03c0                L65:
1562  03c0 5a             decw X
1563  03c1 26fd           jrne L65
1564  03c3 9d             nop
1565                      
1567  03c4               L545:
1568                     ; 221 return 0;
1570  03c4 4f            	clr	a
1572  03c5 20d1          	jra	L06
1602                     ; 227 uint8_t swi2c_START(void){
1603                     	switch	.text
1604  03c7               _swi2c_START:
1608                     ; 228 if(SCL_stat() == RESET || SDA_stat() == RESET){SDA_HIGH; SCL_HIGH; return 0xff;}
1610  03c7 4b40          	push	#64
1611  03c9 ae500a        	ldw	x,#20490
1612  03cc cd0000        	call	_GPIO_ReadInputPin
1614  03cf 5b01          	addw	sp,#1
1615  03d1 4d            	tnz	a
1616  03d2 270d          	jreq	L336
1618  03d4 4b80          	push	#128
1619  03d6 ae500a        	ldw	x,#20490
1620  03d9 cd0000        	call	_GPIO_ReadInputPin
1622  03dc 5b01          	addw	sp,#1
1623  03de 4d            	tnz	a
1624  03df 2615          	jrne	L136
1625  03e1               L336:
1628  03e1 4b80          	push	#128
1629  03e3 ae500a        	ldw	x,#20490
1630  03e6 cd0000        	call	_GPIO_WriteHigh
1632  03e9 84            	pop	a
1635  03ea 4b40          	push	#64
1636  03ec ae500a        	ldw	x,#20490
1637  03ef cd0000        	call	_GPIO_WriteHigh
1639  03f2 84            	pop	a
1642  03f3 a6ff          	ld	a,#255
1645  03f5 81            	ret
1646  03f6               L136:
1647                     ; 229 SDA_LOW;
1649  03f6 4b80          	push	#128
1650  03f8 ae500a        	ldw	x,#20490
1651  03fb cd0000        	call	_GPIO_WriteLow
1653  03fe 84            	pop	a
1654                     ; 21 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);
1658  03ff ae001b        	ldw	x,#27
1660  0402 9d            nop
1661  0403                L46:
1662  0403 5a             decw X
1663  0404 26fd           jrne L46
1664  0406 9d             nop
1665                      
1667  0407               L316:
1668                     ; 231 SCL_LOW;
1670  0407 4b40          	push	#64
1671  0409 ae500a        	ldw	x,#20490
1672  040c cd0000        	call	_GPIO_WriteLow
1674  040f 84            	pop	a
1675                     ; 21 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);
1679  0410 ae001b        	ldw	x,#27
1681  0413 9d            nop
1682  0414                L66:
1683  0414 5a             decw X
1684  0415 26fd           jrne L66
1685  0417 9d             nop
1686                      
1688  0418               L716:
1689                     ; 233 return 0;
1691  0418 4f            	clr	a
1694  0419 81            	ret
1744                     ; 239 uint8_t swi2c_STOP(void){
1745                     	switch	.text
1746  041a               _swi2c_STOP:
1748  041a 5203          	subw	sp,#3
1749       00000003      OFST:	set	3
1752                     ; 240 uint16_t timeout=SWI2C_TIMEOUT;
1754  041c aeffff        	ldw	x,#65535
1755  041f 1f02          	ldw	(OFST-1,sp),x
1757                     ; 241 uint8_t retval = 0;
1759  0421 0f01          	clr	(OFST-2,sp)
1761                     ; 242 SDA_LOW;
1763  0423 4b80          	push	#128
1764  0425 ae500a        	ldw	x,#20490
1765  0428 cd0000        	call	_GPIO_WriteLow
1767  042b 84            	pop	a
1768                     ; 21 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);
1772  042c ae001b        	ldw	x,#27
1774  042f 9d            nop
1775  0430                L27:
1776  0430 5a             decw X
1777  0431 26fd           jrne L27
1778  0433 9d             nop
1779                      
1781  0434               L736:
1782                     ; 244 SCL_HIGH;
1784  0434 4b40          	push	#64
1785  0436 ae500a        	ldw	x,#20490
1786  0439 cd0000        	call	_GPIO_WriteHigh
1788  043c 84            	pop	a
1790  043d 2007          	jra	L176
1791  043f               L766:
1792                     ; 245 while(SCL_stat() == RESET && timeout){timeout--;}
1794  043f 1e02          	ldw	x,(OFST-1,sp)
1795  0441 1d0001        	subw	x,#1
1796  0444 1f02          	ldw	(OFST-1,sp),x
1798  0446               L176:
1801  0446 4b40          	push	#64
1802  0448 ae500a        	ldw	x,#20490
1803  044b cd0000        	call	_GPIO_ReadInputPin
1805  044e 5b01          	addw	sp,#1
1806  0450 4d            	tnz	a
1807  0451 2604          	jrne	L576
1809  0453 1e02          	ldw	x,(OFST-1,sp)
1810  0455 26e8          	jrne	L766
1811  0457               L576:
1812                     ; 246 if(timeout==0){retval = 0xff;}
1814  0457 1e02          	ldw	x,(OFST-1,sp)
1815  0459 2604          	jrne	L776
1818  045b a6ff          	ld	a,#255
1819  045d 6b01          	ld	(OFST-2,sp),a
1821  045f               L776:
1822                     ; 21 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);
1826  045f ae001b        	ldw	x,#27
1828  0462 9d            nop
1829  0463                L47:
1830  0463 5a             decw X
1831  0464 26fd           jrne L47
1832  0466 9d             nop
1833                      
1835  0467               L346:
1836                     ; 248 SDA_HIGH;
1838  0467 4b80          	push	#128
1839  0469 ae500a        	ldw	x,#20490
1840  046c cd0000        	call	_GPIO_WriteHigh
1842  046f 84            	pop	a
1843                     ; 249 return retval;
1845  0470 7b01          	ld	a,(OFST-2,sp)
1848  0472 5b03          	addw	sp,#3
1849  0474 81            	ret
1901                     ; 256 uint8_t swi2c_recover(void){
1902                     	switch	.text
1903  0475               _swi2c_recover:
1905  0475 5203          	subw	sp,#3
1906       00000003      OFST:	set	3
1909                     ; 257 uint16_t timeout=SWI2C_TIMEOUT;
1911  0477 aeffff        	ldw	x,#65535
1912  047a 1f02          	ldw	(OFST-1,sp),x
1914                     ; 259 SCL_HIGH; // release both lines
1916  047c 4b40          	push	#64
1917  047e ae500a        	ldw	x,#20490
1918  0481 cd0000        	call	_GPIO_WriteHigh
1920  0484 84            	pop	a
1921                     ; 260 SDA_HIGH;
1923  0485 4b80          	push	#128
1924  0487 ae500a        	ldw	x,#20490
1925  048a cd0000        	call	_GPIO_WriteHigh
1927  048d 84            	pop	a
1928                     ; 21 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);
1932  048e ae000b        	ldw	x,#11
1934  0491 9d            nop
1935  0492                L001:
1936  0492 5a             decw X
1937  0493 26fd           jrne L001
1938  0495 9d             nop
1939                      
1941  0496               L307:
1942                     ; 263 if(SCL_stat() != RESET && SDA_stat() != RESET){return 0;}
1944  0496 4b40          	push	#64
1945  0498 ae500a        	ldw	x,#20490
1946  049b cd0000        	call	_GPIO_ReadInputPin
1948  049e 5b01          	addw	sp,#1
1949  04a0 4d            	tnz	a
1950  04a1 2710          	jreq	L737
1952  04a3 4b80          	push	#128
1953  04a5 ae500a        	ldw	x,#20490
1954  04a8 cd0000        	call	_GPIO_ReadInputPin
1956  04ab 5b01          	addw	sp,#1
1957  04ad 4d            	tnz	a
1958  04ae 2703          	jreq	L737
1961  04b0 4f            	clr	a
1963  04b1 2049          	jra	L601
1964  04b3               L737:
1965                     ; 265 if(SDA_stat() == RESET){
1967  04b3 4b80          	push	#128
1968  04b5 ae500a        	ldw	x,#20490
1969  04b8 cd0000        	call	_GPIO_ReadInputPin
1971  04bb 5b01          	addw	sp,#1
1972  04bd 4d            	tnz	a
1973  04be 2665          	jrne	L147
1974                     ; 266 	for(i=0;i<9;i++){ // try nine times try to read one bit and pray for SDA release
1976  04c0 0f01          	clr	(OFST-2,sp)
1978  04c2               L347:
1979                     ; 267 		SCL_LOW;
1981  04c2 4b40          	push	#64
1982  04c4 ae500a        	ldw	x,#20490
1983  04c7 cd0000        	call	_GPIO_WriteLow
1985  04ca 84            	pop	a
1986                     ; 21 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);
1990  04cb ae000b        	ldw	x,#11
1992  04ce 9d            nop
1993  04cf                L201:
1994  04cf 5a             decw X
1995  04d0 26fd           jrne L201
1996  04d2 9d             nop
1997                      
1999  04d3               L707:
2000                     ; 269 		SCL_HIGH; 
2002  04d3 4b40          	push	#64
2003  04d5 ae500a        	ldw	x,#20490
2004  04d8 cd0000        	call	_GPIO_WriteHigh
2006  04db 84            	pop	a
2008  04dc 2007          	jra	L357
2009  04de               L157:
2010                     ; 270 		while(SCL_stat() == RESET && timeout){timeout--;}
2012  04de 1e02          	ldw	x,(OFST-1,sp)
2013  04e0 1d0001        	subw	x,#1
2014  04e3 1f02          	ldw	(OFST-1,sp),x
2016  04e5               L357:
2019  04e5 4b40          	push	#64
2020  04e7 ae500a        	ldw	x,#20490
2021  04ea cd0000        	call	_GPIO_ReadInputPin
2023  04ed 5b01          	addw	sp,#1
2024  04ef 4d            	tnz	a
2025  04f0 2604          	jrne	L757
2027  04f2 1e02          	ldw	x,(OFST-1,sp)
2028  04f4 26e8          	jrne	L157
2029  04f6               L757:
2030                     ; 271 		if(timeout==0){return 0xff;}
2032  04f6 1e02          	ldw	x,(OFST-1,sp)
2033  04f8 2605          	jrne	L167
2036  04fa a6ff          	ld	a,#255
2038  04fc               L601:
2040  04fc 5b03          	addw	sp,#3
2041  04fe 81            	ret
2042  04ff               L167:
2043                     ; 21 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);
2047  04ff ae000b        	ldw	x,#11
2049  0502 9d            nop
2050  0503                L401:
2051  0503 5a             decw X
2052  0504 26fd           jrne L401
2053  0506 9d             nop
2054                      
2056  0507               L317:
2057                     ; 273 		if(SDA_stat() != RESET){ // if slave released SDA line, generate STOP
2059  0507 4b80          	push	#128
2060  0509 ae500a        	ldw	x,#20490
2061  050c cd0000        	call	_GPIO_ReadInputPin
2063  050f 5b01          	addw	sp,#1
2064  0511 4d            	tnz	a
2065  0512 2705          	jreq	L367
2066                     ; 274 			return(swi2c_STOP());
2068  0514 cd041a        	call	_swi2c_STOP
2071  0517 20e3          	jra	L601
2072  0519               L367:
2073                     ; 266 	for(i=0;i<9;i++){ // try nine times try to read one bit and pray for SDA release
2075  0519 0c01          	inc	(OFST-2,sp)
2079  051b 7b01          	ld	a,(OFST-2,sp)
2080  051d a109          	cp	a,#9
2081  051f 25a1          	jrult	L347
2082                     ; 277 		return 0xee;
2084  0521 a6ee          	ld	a,#238
2086  0523 20d7          	jra	L601
2087  0525               L147:
2088                     ; 279 }
2090  0525 20d5          	jra	L601
2103                     	xdef	_swi2c_STOP
2104                     	xdef	_swi2c_RESTART
2105                     	xdef	_swi2c_START
2106                     	xdef	_swi2c_readbit
2107                     	xdef	_swi2c_writebit
2108                     	xdef	_swi2c_recover
2109                     	xdef	_swi2c_read_buf
2110                     	xdef	_swi2c_write_buf
2111                     	xdef	_swi2c_test_slave
2112                     	xdef	_swi2c_init
2113                     	xref	_GPIO_ReadInputPin
2114                     	xref	_GPIO_WriteLow
2115                     	xref	_GPIO_WriteHigh
2116                     	xref	_GPIO_Init
2135                     	end
