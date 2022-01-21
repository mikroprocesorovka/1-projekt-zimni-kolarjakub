   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.1 - 30 Jun 2020
   3                     ; Generator (Limited) V4.4.12 - 02 Jul 2020
  43                     ; 54 void UART3_DeInit(void)
  43                     ; 55 {
  45                     	switch	.text
  46  0000               _UART3_DeInit:
  50                     ; 58   (void) UART3->SR;
  52  0000 c65240        	ld	a,21056
  53                     ; 59   (void) UART3->DR;
  55  0003 c65241        	ld	a,21057
  56                     ; 61   UART3->BRR2 = UART3_BRR2_RESET_VALUE; /*Set UART3_BRR2 to reset value 0x00 */
  58  0006 725f5243      	clr	21059
  59                     ; 62   UART3->BRR1 = UART3_BRR1_RESET_VALUE; /*Set UART3_BRR1 to reset value 0x00 */
  61  000a 725f5242      	clr	21058
  62                     ; 64   UART3->CR1 = UART3_CR1_RESET_VALUE;  /*Set UART3_CR1 to reset value 0x00  */
  64  000e 725f5244      	clr	21060
  65                     ; 65   UART3->CR2 = UART3_CR2_RESET_VALUE;  /*Set UART3_CR2 to reset value 0x00  */
  67  0012 725f5245      	clr	21061
  68                     ; 66   UART3->CR3 = UART3_CR3_RESET_VALUE;  /*Set UART3_CR3 to reset value 0x00  */
  70  0016 725f5246      	clr	21062
  71                     ; 67   UART3->CR4 = UART3_CR4_RESET_VALUE;  /*Set UART3_CR4 to reset value 0x00  */
  73  001a 725f5247      	clr	21063
  74                     ; 68   UART3->CR6 = UART3_CR6_RESET_VALUE;  /*Set UART3_CR6 to reset value 0x00  */
  76  001e 725f5249      	clr	21065
  77                     ; 69 }
  80  0022 81            	ret
 308                     .const:	section	.text
 309  0000               L43:
 310  0000 00098969      	dc.l	625001
 311  0004               L64:
 312  0004 00000064      	dc.l	100
 313                     ; 83 void UART3_Init(uint32_t BaudRate, UART3_WordLength_TypeDef WordLength, 
 313                     ; 84                 UART3_StopBits_TypeDef StopBits, UART3_Parity_TypeDef Parity, 
 313                     ; 85                 UART3_Mode_TypeDef Mode)
 313                     ; 86 {
 314                     	switch	.text
 315  0023               _UART3_Init:
 317  0023 520e          	subw	sp,#14
 318       0000000e      OFST:	set	14
 321                     ; 87   uint8_t BRR2_1 = 0, BRR2_2 = 0;
 325                     ; 88   uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
 329                     ; 91   assert_param(IS_UART3_WORDLENGTH_OK(WordLength));
 331  0025 0d15          	tnz	(OFST+7,sp)
 332  0027 2706          	jreq	L21
 333  0029 7b15          	ld	a,(OFST+7,sp)
 334  002b a110          	cp	a,#16
 335  002d 2603          	jrne	L01
 336  002f               L21:
 337  002f 4f            	clr	a
 338  0030 2010          	jra	L41
 339  0032               L01:
 340  0032 ae005b        	ldw	x,#91
 341  0035 89            	pushw	x
 342  0036 ae0000        	ldw	x,#0
 343  0039 89            	pushw	x
 344  003a ae0008        	ldw	x,#L741
 345  003d cd0000        	call	_assert_failed
 347  0040 5b04          	addw	sp,#4
 348  0042               L41:
 349                     ; 92   assert_param(IS_UART3_STOPBITS_OK(StopBits));
 351  0042 0d16          	tnz	(OFST+8,sp)
 352  0044 2706          	jreq	L02
 353  0046 7b16          	ld	a,(OFST+8,sp)
 354  0048 a120          	cp	a,#32
 355  004a 2603          	jrne	L61
 356  004c               L02:
 357  004c 4f            	clr	a
 358  004d 2010          	jra	L22
 359  004f               L61:
 360  004f ae005c        	ldw	x,#92
 361  0052 89            	pushw	x
 362  0053 ae0000        	ldw	x,#0
 363  0056 89            	pushw	x
 364  0057 ae0008        	ldw	x,#L741
 365  005a cd0000        	call	_assert_failed
 367  005d 5b04          	addw	sp,#4
 368  005f               L22:
 369                     ; 93   assert_param(IS_UART3_PARITY_OK(Parity));
 371  005f 0d17          	tnz	(OFST+9,sp)
 372  0061 270c          	jreq	L62
 373  0063 7b17          	ld	a,(OFST+9,sp)
 374  0065 a104          	cp	a,#4
 375  0067 2706          	jreq	L62
 376  0069 7b17          	ld	a,(OFST+9,sp)
 377  006b a106          	cp	a,#6
 378  006d 2603          	jrne	L42
 379  006f               L62:
 380  006f 4f            	clr	a
 381  0070 2010          	jra	L03
 382  0072               L42:
 383  0072 ae005d        	ldw	x,#93
 384  0075 89            	pushw	x
 385  0076 ae0000        	ldw	x,#0
 386  0079 89            	pushw	x
 387  007a ae0008        	ldw	x,#L741
 388  007d cd0000        	call	_assert_failed
 390  0080 5b04          	addw	sp,#4
 391  0082               L03:
 392                     ; 94   assert_param(IS_UART3_BAUDRATE_OK(BaudRate));
 394  0082 96            	ldw	x,sp
 395  0083 1c0011        	addw	x,#OFST+3
 396  0086 cd0000        	call	c_ltor
 398  0089 ae0000        	ldw	x,#L43
 399  008c cd0000        	call	c_lcmp
 401  008f 2403          	jruge	L23
 402  0091 4f            	clr	a
 403  0092 2010          	jra	L63
 404  0094               L23:
 405  0094 ae005e        	ldw	x,#94
 406  0097 89            	pushw	x
 407  0098 ae0000        	ldw	x,#0
 408  009b 89            	pushw	x
 409  009c ae0008        	ldw	x,#L741
 410  009f cd0000        	call	_assert_failed
 412  00a2 5b04          	addw	sp,#4
 413  00a4               L63:
 414                     ; 95   assert_param(IS_UART3_MODE_OK((uint8_t)Mode));
 416  00a4 7b18          	ld	a,(OFST+10,sp)
 417  00a6 a108          	cp	a,#8
 418  00a8 2730          	jreq	L24
 419  00aa 7b18          	ld	a,(OFST+10,sp)
 420  00ac a140          	cp	a,#64
 421  00ae 272a          	jreq	L24
 422  00b0 7b18          	ld	a,(OFST+10,sp)
 423  00b2 a104          	cp	a,#4
 424  00b4 2724          	jreq	L24
 425  00b6 7b18          	ld	a,(OFST+10,sp)
 426  00b8 a180          	cp	a,#128
 427  00ba 271e          	jreq	L24
 428  00bc 7b18          	ld	a,(OFST+10,sp)
 429  00be a10c          	cp	a,#12
 430  00c0 2718          	jreq	L24
 431  00c2 7b18          	ld	a,(OFST+10,sp)
 432  00c4 a10c          	cp	a,#12
 433  00c6 2712          	jreq	L24
 434  00c8 7b18          	ld	a,(OFST+10,sp)
 435  00ca a144          	cp	a,#68
 436  00cc 270c          	jreq	L24
 437  00ce 7b18          	ld	a,(OFST+10,sp)
 438  00d0 a1c0          	cp	a,#192
 439  00d2 2706          	jreq	L24
 440  00d4 7b18          	ld	a,(OFST+10,sp)
 441  00d6 a188          	cp	a,#136
 442  00d8 2603          	jrne	L04
 443  00da               L24:
 444  00da 4f            	clr	a
 445  00db 2010          	jra	L44
 446  00dd               L04:
 447  00dd ae005f        	ldw	x,#95
 448  00e0 89            	pushw	x
 449  00e1 ae0000        	ldw	x,#0
 450  00e4 89            	pushw	x
 451  00e5 ae0008        	ldw	x,#L741
 452  00e8 cd0000        	call	_assert_failed
 454  00eb 5b04          	addw	sp,#4
 455  00ed               L44:
 456                     ; 98   UART3->CR1 &= (uint8_t)(~UART3_CR1_M);     
 458  00ed 72195244      	bres	21060,#4
 459                     ; 100   UART3->CR1 |= (uint8_t)WordLength; 
 461  00f1 c65244        	ld	a,21060
 462  00f4 1a15          	or	a,(OFST+7,sp)
 463  00f6 c75244        	ld	21060,a
 464                     ; 103   UART3->CR3 &= (uint8_t)(~UART3_CR3_STOP);  
 466  00f9 c65246        	ld	a,21062
 467  00fc a4cf          	and	a,#207
 468  00fe c75246        	ld	21062,a
 469                     ; 105   UART3->CR3 |= (uint8_t)StopBits;  
 471  0101 c65246        	ld	a,21062
 472  0104 1a16          	or	a,(OFST+8,sp)
 473  0106 c75246        	ld	21062,a
 474                     ; 108   UART3->CR1 &= (uint8_t)(~(UART3_CR1_PCEN | UART3_CR1_PS));  
 476  0109 c65244        	ld	a,21060
 477  010c a4f9          	and	a,#249
 478  010e c75244        	ld	21060,a
 479                     ; 110   UART3->CR1 |= (uint8_t)Parity;     
 481  0111 c65244        	ld	a,21060
 482  0114 1a17          	or	a,(OFST+9,sp)
 483  0116 c75244        	ld	21060,a
 484                     ; 113   UART3->BRR1 &= (uint8_t)(~UART3_BRR1_DIVM);  
 486  0119 725f5242      	clr	21058
 487                     ; 115   UART3->BRR2 &= (uint8_t)(~UART3_BRR2_DIVM);  
 489  011d c65243        	ld	a,21059
 490  0120 a40f          	and	a,#15
 491  0122 c75243        	ld	21059,a
 492                     ; 117   UART3->BRR2 &= (uint8_t)(~UART3_BRR2_DIVF);  
 494  0125 c65243        	ld	a,21059
 495  0128 a4f0          	and	a,#240
 496  012a c75243        	ld	21059,a
 497                     ; 120   BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
 499  012d 96            	ldw	x,sp
 500  012e 1c0011        	addw	x,#OFST+3
 501  0131 cd0000        	call	c_ltor
 503  0134 a604          	ld	a,#4
 504  0136 cd0000        	call	c_llsh
 506  0139 96            	ldw	x,sp
 507  013a 1c0001        	addw	x,#OFST-13
 508  013d cd0000        	call	c_rtol
 511  0140 cd0000        	call	_CLK_GetClockFreq
 513  0143 96            	ldw	x,sp
 514  0144 1c0001        	addw	x,#OFST-13
 515  0147 cd0000        	call	c_ludv
 517  014a 96            	ldw	x,sp
 518  014b 1c000b        	addw	x,#OFST-3
 519  014e cd0000        	call	c_rtol
 522                     ; 121   BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
 524  0151 96            	ldw	x,sp
 525  0152 1c0011        	addw	x,#OFST+3
 526  0155 cd0000        	call	c_ltor
 528  0158 a604          	ld	a,#4
 529  015a cd0000        	call	c_llsh
 531  015d 96            	ldw	x,sp
 532  015e 1c0001        	addw	x,#OFST-13
 533  0161 cd0000        	call	c_rtol
 536  0164 cd0000        	call	_CLK_GetClockFreq
 538  0167 a664          	ld	a,#100
 539  0169 cd0000        	call	c_smul
 541  016c 96            	ldw	x,sp
 542  016d 1c0001        	addw	x,#OFST-13
 543  0170 cd0000        	call	c_ludv
 545  0173 96            	ldw	x,sp
 546  0174 1c0007        	addw	x,#OFST-7
 547  0177 cd0000        	call	c_rtol
 550                     ; 124   BRR2_1 = (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100))
 550                     ; 125                                 << 4) / 100) & (uint8_t)0x0F); 
 552  017a 96            	ldw	x,sp
 553  017b 1c000b        	addw	x,#OFST-3
 554  017e cd0000        	call	c_ltor
 556  0181 a664          	ld	a,#100
 557  0183 cd0000        	call	c_smul
 559  0186 96            	ldw	x,sp
 560  0187 1c0001        	addw	x,#OFST-13
 561  018a cd0000        	call	c_rtol
 564  018d 96            	ldw	x,sp
 565  018e 1c0007        	addw	x,#OFST-7
 566  0191 cd0000        	call	c_ltor
 568  0194 96            	ldw	x,sp
 569  0195 1c0001        	addw	x,#OFST-13
 570  0198 cd0000        	call	c_lsub
 572  019b a604          	ld	a,#4
 573  019d cd0000        	call	c_llsh
 575  01a0 ae0004        	ldw	x,#L64
 576  01a3 cd0000        	call	c_ludv
 578  01a6 b603          	ld	a,c_lreg+3
 579  01a8 a40f          	and	a,#15
 580  01aa 6b05          	ld	(OFST-9,sp),a
 582                     ; 126   BRR2_2 = (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0);
 584  01ac 96            	ldw	x,sp
 585  01ad 1c000b        	addw	x,#OFST-3
 586  01b0 cd0000        	call	c_ltor
 588  01b3 a604          	ld	a,#4
 589  01b5 cd0000        	call	c_lursh
 591  01b8 b603          	ld	a,c_lreg+3
 592  01ba a4f0          	and	a,#240
 593  01bc b703          	ld	c_lreg+3,a
 594  01be 3f02          	clr	c_lreg+2
 595  01c0 3f01          	clr	c_lreg+1
 596  01c2 3f00          	clr	c_lreg
 597  01c4 b603          	ld	a,c_lreg+3
 598  01c6 6b06          	ld	(OFST-8,sp),a
 600                     ; 128   UART3->BRR2 = (uint8_t)(BRR2_1 | BRR2_2);
 602  01c8 7b05          	ld	a,(OFST-9,sp)
 603  01ca 1a06          	or	a,(OFST-8,sp)
 604  01cc c75243        	ld	21059,a
 605                     ; 130   UART3->BRR1 = (uint8_t)BaudRate_Mantissa;           
 607  01cf 7b0e          	ld	a,(OFST+0,sp)
 608  01d1 c75242        	ld	21058,a
 609                     ; 132   if ((uint8_t)(Mode & UART3_MODE_TX_ENABLE))
 611  01d4 7b18          	ld	a,(OFST+10,sp)
 612  01d6 a504          	bcp	a,#4
 613  01d8 2706          	jreq	L151
 614                     ; 135     UART3->CR2 |= UART3_CR2_TEN;  
 616  01da 72165245      	bset	21061,#3
 618  01de 2004          	jra	L351
 619  01e0               L151:
 620                     ; 140     UART3->CR2 &= (uint8_t)(~UART3_CR2_TEN);  
 622  01e0 72175245      	bres	21061,#3
 623  01e4               L351:
 624                     ; 142   if ((uint8_t)(Mode & UART3_MODE_RX_ENABLE))
 626  01e4 7b18          	ld	a,(OFST+10,sp)
 627  01e6 a508          	bcp	a,#8
 628  01e8 2706          	jreq	L551
 629                     ; 145     UART3->CR2 |= UART3_CR2_REN;  
 631  01ea 72145245      	bset	21061,#2
 633  01ee 2004          	jra	L751
 634  01f0               L551:
 635                     ; 150     UART3->CR2 &= (uint8_t)(~UART3_CR2_REN);  
 637  01f0 72155245      	bres	21061,#2
 638  01f4               L751:
 639                     ; 152 }
 642  01f4 5b0e          	addw	sp,#14
 643  01f6 81            	ret
 698                     ; 160 void UART3_Cmd(FunctionalState NewState)
 698                     ; 161 {
 699                     	switch	.text
 700  01f7               _UART3_Cmd:
 704                     ; 162   if (NewState != DISABLE)
 706  01f7 4d            	tnz	a
 707  01f8 2706          	jreq	L702
 708                     ; 165     UART3->CR1 &= (uint8_t)(~UART3_CR1_UARTD); 
 710  01fa 721b5244      	bres	21060,#5
 712  01fe 2004          	jra	L112
 713  0200               L702:
 714                     ; 170     UART3->CR1 |= UART3_CR1_UARTD;  
 716  0200 721a5244      	bset	21060,#5
 717  0204               L112:
 718                     ; 172 }
 721  0204 81            	ret
 854                     ; 189 void UART3_ITConfig(UART3_IT_TypeDef UART3_IT, FunctionalState NewState)
 854                     ; 190 {
 855                     	switch	.text
 856  0205               _UART3_ITConfig:
 858  0205 89            	pushw	x
 859  0206 89            	pushw	x
 860       00000002      OFST:	set	2
 863                     ; 191   uint8_t uartreg = 0, itpos = 0x00;
 867                     ; 194   assert_param(IS_UART3_CONFIG_IT_OK(UART3_IT));
 869  0207 a30100        	cpw	x,#256
 870  020a 271e          	jreq	L65
 871  020c a30277        	cpw	x,#631
 872  020f 2719          	jreq	L65
 873  0211 a30266        	cpw	x,#614
 874  0214 2714          	jreq	L65
 875  0216 a30205        	cpw	x,#517
 876  0219 270f          	jreq	L65
 877  021b a30244        	cpw	x,#580
 878  021e 270a          	jreq	L65
 879  0220 a30412        	cpw	x,#1042
 880  0223 2705          	jreq	L65
 881  0225 a30346        	cpw	x,#838
 882  0228 2603          	jrne	L45
 883  022a               L65:
 884  022a 4f            	clr	a
 885  022b 2010          	jra	L06
 886  022d               L45:
 887  022d ae00c2        	ldw	x,#194
 888  0230 89            	pushw	x
 889  0231 ae0000        	ldw	x,#0
 890  0234 89            	pushw	x
 891  0235 ae0008        	ldw	x,#L741
 892  0238 cd0000        	call	_assert_failed
 894  023b 5b04          	addw	sp,#4
 895  023d               L06:
 896                     ; 195   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 898  023d 0d07          	tnz	(OFST+5,sp)
 899  023f 2706          	jreq	L46
 900  0241 7b07          	ld	a,(OFST+5,sp)
 901  0243 a101          	cp	a,#1
 902  0245 2603          	jrne	L26
 903  0247               L46:
 904  0247 4f            	clr	a
 905  0248 2010          	jra	L66
 906  024a               L26:
 907  024a ae00c3        	ldw	x,#195
 908  024d 89            	pushw	x
 909  024e ae0000        	ldw	x,#0
 910  0251 89            	pushw	x
 911  0252 ae0008        	ldw	x,#L741
 912  0255 cd0000        	call	_assert_failed
 914  0258 5b04          	addw	sp,#4
 915  025a               L66:
 916                     ; 198   uartreg = (uint8_t)((uint16_t)UART3_IT >> 0x08);
 918  025a 7b03          	ld	a,(OFST+1,sp)
 919  025c 6b01          	ld	(OFST-1,sp),a
 921                     ; 201   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART3_IT & (uint8_t)0x0F));
 923  025e 7b04          	ld	a,(OFST+2,sp)
 924  0260 a40f          	and	a,#15
 925  0262 5f            	clrw	x
 926  0263 97            	ld	xl,a
 927  0264 a601          	ld	a,#1
 928  0266 5d            	tnzw	x
 929  0267 2704          	jreq	L07
 930  0269               L27:
 931  0269 48            	sll	a
 932  026a 5a            	decw	x
 933  026b 26fc          	jrne	L27
 934  026d               L07:
 935  026d 6b02          	ld	(OFST+0,sp),a
 937                     ; 203   if (NewState != DISABLE)
 939  026f 0d07          	tnz	(OFST+5,sp)
 940  0271 273a          	jreq	L372
 941                     ; 206     if (uartreg == 0x01)
 943  0273 7b01          	ld	a,(OFST-1,sp)
 944  0275 a101          	cp	a,#1
 945  0277 260a          	jrne	L572
 946                     ; 208       UART3->CR1 |= itpos;
 948  0279 c65244        	ld	a,21060
 949  027c 1a02          	or	a,(OFST+0,sp)
 950  027e c75244        	ld	21060,a
 952  0281 2066          	jra	L113
 953  0283               L572:
 954                     ; 210     else if (uartreg == 0x02)
 956  0283 7b01          	ld	a,(OFST-1,sp)
 957  0285 a102          	cp	a,#2
 958  0287 260a          	jrne	L103
 959                     ; 212       UART3->CR2 |= itpos;
 961  0289 c65245        	ld	a,21061
 962  028c 1a02          	or	a,(OFST+0,sp)
 963  028e c75245        	ld	21061,a
 965  0291 2056          	jra	L113
 966  0293               L103:
 967                     ; 214     else if (uartreg == 0x03)
 969  0293 7b01          	ld	a,(OFST-1,sp)
 970  0295 a103          	cp	a,#3
 971  0297 260a          	jrne	L503
 972                     ; 216       UART3->CR4 |= itpos;
 974  0299 c65247        	ld	a,21063
 975  029c 1a02          	or	a,(OFST+0,sp)
 976  029e c75247        	ld	21063,a
 978  02a1 2046          	jra	L113
 979  02a3               L503:
 980                     ; 220       UART3->CR6 |= itpos;
 982  02a3 c65249        	ld	a,21065
 983  02a6 1a02          	or	a,(OFST+0,sp)
 984  02a8 c75249        	ld	21065,a
 985  02ab 203c          	jra	L113
 986  02ad               L372:
 987                     ; 226     if (uartreg == 0x01)
 989  02ad 7b01          	ld	a,(OFST-1,sp)
 990  02af a101          	cp	a,#1
 991  02b1 260b          	jrne	L313
 992                     ; 228       UART3->CR1 &= (uint8_t)(~itpos);
 994  02b3 7b02          	ld	a,(OFST+0,sp)
 995  02b5 43            	cpl	a
 996  02b6 c45244        	and	a,21060
 997  02b9 c75244        	ld	21060,a
 999  02bc 202b          	jra	L113
1000  02be               L313:
1001                     ; 230     else if (uartreg == 0x02)
1003  02be 7b01          	ld	a,(OFST-1,sp)
1004  02c0 a102          	cp	a,#2
1005  02c2 260b          	jrne	L713
1006                     ; 232       UART3->CR2 &= (uint8_t)(~itpos);
1008  02c4 7b02          	ld	a,(OFST+0,sp)
1009  02c6 43            	cpl	a
1010  02c7 c45245        	and	a,21061
1011  02ca c75245        	ld	21061,a
1013  02cd 201a          	jra	L113
1014  02cf               L713:
1015                     ; 234     else if (uartreg == 0x03)
1017  02cf 7b01          	ld	a,(OFST-1,sp)
1018  02d1 a103          	cp	a,#3
1019  02d3 260b          	jrne	L323
1020                     ; 236       UART3->CR4 &= (uint8_t)(~itpos);
1022  02d5 7b02          	ld	a,(OFST+0,sp)
1023  02d7 43            	cpl	a
1024  02d8 c45247        	and	a,21063
1025  02db c75247        	ld	21063,a
1027  02de 2009          	jra	L113
1028  02e0               L323:
1029                     ; 240       UART3->CR6 &= (uint8_t)(~itpos);
1031  02e0 7b02          	ld	a,(OFST+0,sp)
1032  02e2 43            	cpl	a
1033  02e3 c45249        	and	a,21065
1034  02e6 c75249        	ld	21065,a
1035  02e9               L113:
1036                     ; 243 }
1039  02e9 5b04          	addw	sp,#4
1040  02eb 81            	ret
1100                     ; 252 void UART3_LINBreakDetectionConfig(UART3_LINBreakDetectionLength_TypeDef UART3_LINBreakDetectionLength)
1100                     ; 253 {
1101                     	switch	.text
1102  02ec               _UART3_LINBreakDetectionConfig:
1104  02ec 88            	push	a
1105       00000000      OFST:	set	0
1108                     ; 255   assert_param(IS_UART3_LINBREAKDETECTIONLENGTH_OK(UART3_LINBreakDetectionLength));
1110  02ed 4d            	tnz	a
1111  02ee 2704          	jreq	L001
1112  02f0 a101          	cp	a,#1
1113  02f2 2603          	jrne	L67
1114  02f4               L001:
1115  02f4 4f            	clr	a
1116  02f5 2010          	jra	L201
1117  02f7               L67:
1118  02f7 ae00ff        	ldw	x,#255
1119  02fa 89            	pushw	x
1120  02fb ae0000        	ldw	x,#0
1121  02fe 89            	pushw	x
1122  02ff ae0008        	ldw	x,#L741
1123  0302 cd0000        	call	_assert_failed
1125  0305 5b04          	addw	sp,#4
1126  0307               L201:
1127                     ; 257   if (UART3_LINBreakDetectionLength != UART3_LINBREAKDETECTIONLENGTH_10BITS)
1129  0307 0d01          	tnz	(OFST+1,sp)
1130  0309 2706          	jreq	L553
1131                     ; 259     UART3->CR4 |= UART3_CR4_LBDL;
1133  030b 721a5247      	bset	21063,#5
1135  030f 2004          	jra	L753
1136  0311               L553:
1137                     ; 263     UART3->CR4 &= ((uint8_t)~UART3_CR4_LBDL);
1139  0311 721b5247      	bres	21063,#5
1140  0315               L753:
1141                     ; 265 }
1144  0315 84            	pop	a
1145  0316 81            	ret
1267                     ; 277 void UART3_LINConfig(UART3_LinMode_TypeDef UART3_Mode,
1267                     ; 278                      UART3_LinAutosync_TypeDef UART3_Autosync, 
1267                     ; 279                      UART3_LinDivUp_TypeDef UART3_DivUp)
1267                     ; 280 {
1268                     	switch	.text
1269  0317               _UART3_LINConfig:
1271  0317 89            	pushw	x
1272       00000000      OFST:	set	0
1275                     ; 282   assert_param(IS_UART3_SLAVE_OK(UART3_Mode));
1277  0318 9e            	ld	a,xh
1278  0319 4d            	tnz	a
1279  031a 2705          	jreq	L011
1280  031c 9e            	ld	a,xh
1281  031d a101          	cp	a,#1
1282  031f 2603          	jrne	L601
1283  0321               L011:
1284  0321 4f            	clr	a
1285  0322 2010          	jra	L211
1286  0324               L601:
1287  0324 ae011a        	ldw	x,#282
1288  0327 89            	pushw	x
1289  0328 ae0000        	ldw	x,#0
1290  032b 89            	pushw	x
1291  032c ae0008        	ldw	x,#L741
1292  032f cd0000        	call	_assert_failed
1294  0332 5b04          	addw	sp,#4
1295  0334               L211:
1296                     ; 283   assert_param(IS_UART3_AUTOSYNC_OK(UART3_Autosync));
1298  0334 7b02          	ld	a,(OFST+2,sp)
1299  0336 a101          	cp	a,#1
1300  0338 2704          	jreq	L611
1301  033a 0d02          	tnz	(OFST+2,sp)
1302  033c 2603          	jrne	L411
1303  033e               L611:
1304  033e 4f            	clr	a
1305  033f 2010          	jra	L021
1306  0341               L411:
1307  0341 ae011b        	ldw	x,#283
1308  0344 89            	pushw	x
1309  0345 ae0000        	ldw	x,#0
1310  0348 89            	pushw	x
1311  0349 ae0008        	ldw	x,#L741
1312  034c cd0000        	call	_assert_failed
1314  034f 5b04          	addw	sp,#4
1315  0351               L021:
1316                     ; 284   assert_param(IS_UART3_DIVUP_OK(UART3_DivUp));
1318  0351 0d05          	tnz	(OFST+5,sp)
1319  0353 2706          	jreq	L421
1320  0355 7b05          	ld	a,(OFST+5,sp)
1321  0357 a101          	cp	a,#1
1322  0359 2603          	jrne	L221
1323  035b               L421:
1324  035b 4f            	clr	a
1325  035c 2010          	jra	L621
1326  035e               L221:
1327  035e ae011c        	ldw	x,#284
1328  0361 89            	pushw	x
1329  0362 ae0000        	ldw	x,#0
1330  0365 89            	pushw	x
1331  0366 ae0008        	ldw	x,#L741
1332  0369 cd0000        	call	_assert_failed
1334  036c 5b04          	addw	sp,#4
1335  036e               L621:
1336                     ; 286   if (UART3_Mode != UART3_LIN_MODE_MASTER)
1338  036e 0d01          	tnz	(OFST+1,sp)
1339  0370 2706          	jreq	L734
1340                     ; 288     UART3->CR6 |=  UART3_CR6_LSLV;
1342  0372 721a5249      	bset	21065,#5
1344  0376 2004          	jra	L144
1345  0378               L734:
1346                     ; 292     UART3->CR6 &= ((uint8_t)~UART3_CR6_LSLV);
1348  0378 721b5249      	bres	21065,#5
1349  037c               L144:
1350                     ; 295   if (UART3_Autosync != UART3_LIN_AUTOSYNC_DISABLE)
1352  037c 0d02          	tnz	(OFST+2,sp)
1353  037e 2706          	jreq	L344
1354                     ; 297     UART3->CR6 |=  UART3_CR6_LASE ;
1356  0380 72185249      	bset	21065,#4
1358  0384 2004          	jra	L544
1359  0386               L344:
1360                     ; 301     UART3->CR6 &= ((uint8_t)~ UART3_CR6_LASE );
1362  0386 72195249      	bres	21065,#4
1363  038a               L544:
1364                     ; 304   if (UART3_DivUp != UART3_LIN_DIVUP_LBRR1)
1366  038a 0d05          	tnz	(OFST+5,sp)
1367  038c 2706          	jreq	L744
1368                     ; 306     UART3->CR6 |=  UART3_CR6_LDUM;
1370  038e 721e5249      	bset	21065,#7
1372  0392 2004          	jra	L154
1373  0394               L744:
1374                     ; 310     UART3->CR6 &= ((uint8_t)~ UART3_CR6_LDUM);
1376  0394 721f5249      	bres	21065,#7
1377  0398               L154:
1378                     ; 312 }
1381  0398 85            	popw	x
1382  0399 81            	ret
1418                     ; 320 void UART3_LINCmd(FunctionalState NewState)
1418                     ; 321 {
1419                     	switch	.text
1420  039a               _UART3_LINCmd:
1422  039a 88            	push	a
1423       00000000      OFST:	set	0
1426                     ; 323   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1428  039b 4d            	tnz	a
1429  039c 2704          	jreq	L431
1430  039e a101          	cp	a,#1
1431  03a0 2603          	jrne	L231
1432  03a2               L431:
1433  03a2 4f            	clr	a
1434  03a3 2010          	jra	L631
1435  03a5               L231:
1436  03a5 ae0143        	ldw	x,#323
1437  03a8 89            	pushw	x
1438  03a9 ae0000        	ldw	x,#0
1439  03ac 89            	pushw	x
1440  03ad ae0008        	ldw	x,#L741
1441  03b0 cd0000        	call	_assert_failed
1443  03b3 5b04          	addw	sp,#4
1444  03b5               L631:
1445                     ; 325   if (NewState != DISABLE)
1447  03b5 0d01          	tnz	(OFST+1,sp)
1448  03b7 2706          	jreq	L174
1449                     ; 328     UART3->CR3 |= UART3_CR3_LINEN;
1451  03b9 721c5246      	bset	21062,#6
1453  03bd 2004          	jra	L374
1454  03bf               L174:
1455                     ; 333     UART3->CR3 &= ((uint8_t)~UART3_CR3_LINEN);
1457  03bf 721d5246      	bres	21062,#6
1458  03c3               L374:
1459                     ; 335 }
1462  03c3 84            	pop	a
1463  03c4 81            	ret
1521                     ; 343 void UART3_WakeUpConfig(UART3_WakeUp_TypeDef UART3_WakeUp)
1521                     ; 344 {
1522                     	switch	.text
1523  03c5               _UART3_WakeUpConfig:
1525  03c5 88            	push	a
1526       00000000      OFST:	set	0
1529                     ; 346   assert_param(IS_UART3_WAKEUP_OK(UART3_WakeUp));
1531  03c6 4d            	tnz	a
1532  03c7 2704          	jreq	L441
1533  03c9 a108          	cp	a,#8
1534  03cb 2603          	jrne	L241
1535  03cd               L441:
1536  03cd 4f            	clr	a
1537  03ce 2010          	jra	L641
1538  03d0               L241:
1539  03d0 ae015a        	ldw	x,#346
1540  03d3 89            	pushw	x
1541  03d4 ae0000        	ldw	x,#0
1542  03d7 89            	pushw	x
1543  03d8 ae0008        	ldw	x,#L741
1544  03db cd0000        	call	_assert_failed
1546  03de 5b04          	addw	sp,#4
1547  03e0               L641:
1548                     ; 348   UART3->CR1 &= ((uint8_t)~UART3_CR1_WAKE);
1550  03e0 72175244      	bres	21060,#3
1551                     ; 349   UART3->CR1 |= (uint8_t)UART3_WakeUp;
1553  03e4 c65244        	ld	a,21060
1554  03e7 1a01          	or	a,(OFST+1,sp)
1555  03e9 c75244        	ld	21060,a
1556                     ; 350 }
1559  03ec 84            	pop	a
1560  03ed 81            	ret
1597                     ; 358 void UART3_ReceiverWakeUpCmd(FunctionalState NewState)
1597                     ; 359 {
1598                     	switch	.text
1599  03ee               _UART3_ReceiverWakeUpCmd:
1601  03ee 88            	push	a
1602       00000000      OFST:	set	0
1605                     ; 361   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1607  03ef 4d            	tnz	a
1608  03f0 2704          	jreq	L451
1609  03f2 a101          	cp	a,#1
1610  03f4 2603          	jrne	L251
1611  03f6               L451:
1612  03f6 4f            	clr	a
1613  03f7 2010          	jra	L651
1614  03f9               L251:
1615  03f9 ae0169        	ldw	x,#361
1616  03fc 89            	pushw	x
1617  03fd ae0000        	ldw	x,#0
1618  0400 89            	pushw	x
1619  0401 ae0008        	ldw	x,#L741
1620  0404 cd0000        	call	_assert_failed
1622  0407 5b04          	addw	sp,#4
1623  0409               L651:
1624                     ; 363   if (NewState != DISABLE)
1626  0409 0d01          	tnz	(OFST+1,sp)
1627  040b 2706          	jreq	L145
1628                     ; 366     UART3->CR2 |= UART3_CR2_RWU;
1630  040d 72125245      	bset	21061,#1
1632  0411 2004          	jra	L345
1633  0413               L145:
1634                     ; 371     UART3->CR2 &= ((uint8_t)~UART3_CR2_RWU);
1636  0413 72135245      	bres	21061,#1
1637  0417               L345:
1638                     ; 373 }
1641  0417 84            	pop	a
1642  0418 81            	ret
1665                     ; 380 uint8_t UART3_ReceiveData8(void)
1665                     ; 381 {
1666                     	switch	.text
1667  0419               _UART3_ReceiveData8:
1671                     ; 382   return ((uint8_t)UART3->DR);
1673  0419 c65241        	ld	a,21057
1676  041c 81            	ret
1710                     ; 390 uint16_t UART3_ReceiveData9(void)
1710                     ; 391 {
1711                     	switch	.text
1712  041d               _UART3_ReceiveData9:
1714  041d 89            	pushw	x
1715       00000002      OFST:	set	2
1718                     ; 392   uint16_t temp = 0;
1720                     ; 394   temp = (uint16_t)(((uint16_t)((uint16_t)UART3->CR1 & (uint16_t)UART3_CR1_R8)) << 1);
1722  041e c65244        	ld	a,21060
1723  0421 5f            	clrw	x
1724  0422 a480          	and	a,#128
1725  0424 5f            	clrw	x
1726  0425 02            	rlwa	x,a
1727  0426 58            	sllw	x
1728  0427 1f01          	ldw	(OFST-1,sp),x
1730                     ; 395   return (uint16_t)((((uint16_t)UART3->DR) | temp) & ((uint16_t)0x01FF));
1732  0429 c65241        	ld	a,21057
1733  042c 5f            	clrw	x
1734  042d 97            	ld	xl,a
1735  042e 01            	rrwa	x,a
1736  042f 1a02          	or	a,(OFST+0,sp)
1737  0431 01            	rrwa	x,a
1738  0432 1a01          	or	a,(OFST-1,sp)
1739  0434 01            	rrwa	x,a
1740  0435 01            	rrwa	x,a
1741  0436 a4ff          	and	a,#255
1742  0438 01            	rrwa	x,a
1743  0439 a401          	and	a,#1
1744  043b 01            	rrwa	x,a
1747  043c 5b02          	addw	sp,#2
1748  043e 81            	ret
1782                     ; 403 void UART3_SendData8(uint8_t Data)
1782                     ; 404 {
1783                     	switch	.text
1784  043f               _UART3_SendData8:
1788                     ; 406   UART3->DR = Data;
1790  043f c75241        	ld	21057,a
1791                     ; 407 }
1794  0442 81            	ret
1828                     ; 414 void UART3_SendData9(uint16_t Data)
1828                     ; 415 {
1829                     	switch	.text
1830  0443               _UART3_SendData9:
1832  0443 89            	pushw	x
1833       00000000      OFST:	set	0
1836                     ; 417   UART3->CR1 &= ((uint8_t)~UART3_CR1_T8);                  
1838  0444 721d5244      	bres	21060,#6
1839                     ; 420   UART3->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART3_CR1_T8); 
1841  0448 54            	srlw	x
1842  0449 54            	srlw	x
1843  044a 9f            	ld	a,xl
1844  044b a440          	and	a,#64
1845  044d ca5244        	or	a,21060
1846  0450 c75244        	ld	21060,a
1847                     ; 423   UART3->DR   = (uint8_t)(Data);                    
1849  0453 7b02          	ld	a,(OFST+2,sp)
1850  0455 c75241        	ld	21057,a
1851                     ; 424 }
1854  0458 85            	popw	x
1855  0459 81            	ret
1878                     ; 431 void UART3_SendBreak(void)
1878                     ; 432 {
1879                     	switch	.text
1880  045a               _UART3_SendBreak:
1884                     ; 433   UART3->CR2 |= UART3_CR2_SBK;
1886  045a 72105245      	bset	21061,#0
1887                     ; 434 }
1890  045e 81            	ret
1925                     ; 441 void UART3_SetAddress(uint8_t UART3_Address)
1925                     ; 442 {
1926                     	switch	.text
1927  045f               _UART3_SetAddress:
1929  045f 88            	push	a
1930       00000000      OFST:	set	0
1933                     ; 444   assert_param(IS_UART3_ADDRESS_OK(UART3_Address));
1935  0460 a110          	cp	a,#16
1936  0462 2403          	jruge	L471
1937  0464 4f            	clr	a
1938  0465 2010          	jra	L671
1939  0467               L471:
1940  0467 ae01bc        	ldw	x,#444
1941  046a 89            	pushw	x
1942  046b ae0000        	ldw	x,#0
1943  046e 89            	pushw	x
1944  046f ae0008        	ldw	x,#L741
1945  0472 cd0000        	call	_assert_failed
1947  0475 5b04          	addw	sp,#4
1948  0477               L671:
1949                     ; 447   UART3->CR4 &= ((uint8_t)~UART3_CR4_ADD);
1951  0477 c65247        	ld	a,21063
1952  047a a4f0          	and	a,#240
1953  047c c75247        	ld	21063,a
1954                     ; 449   UART3->CR4 |= UART3_Address;
1956  047f c65247        	ld	a,21063
1957  0482 1a01          	or	a,(OFST+1,sp)
1958  0484 c75247        	ld	21063,a
1959                     ; 450 }
1962  0487 84            	pop	a
1963  0488 81            	ret
2121                     ; 458 FlagStatus UART3_GetFlagStatus(UART3_Flag_TypeDef UART3_FLAG)
2121                     ; 459 {
2122                     	switch	.text
2123  0489               _UART3_GetFlagStatus:
2125  0489 89            	pushw	x
2126  048a 88            	push	a
2127       00000001      OFST:	set	1
2130                     ; 460   FlagStatus status = RESET;
2132                     ; 463   assert_param(IS_UART3_FLAG_OK(UART3_FLAG));
2134  048b a30080        	cpw	x,#128
2135  048e 2737          	jreq	L402
2136  0490 a30040        	cpw	x,#64
2137  0493 2732          	jreq	L402
2138  0495 a30020        	cpw	x,#32
2139  0498 272d          	jreq	L402
2140  049a a30010        	cpw	x,#16
2141  049d 2728          	jreq	L402
2142  049f a30008        	cpw	x,#8
2143  04a2 2723          	jreq	L402
2144  04a4 a30004        	cpw	x,#4
2145  04a7 271e          	jreq	L402
2146  04a9 a30002        	cpw	x,#2
2147  04ac 2719          	jreq	L402
2148  04ae a30001        	cpw	x,#1
2149  04b1 2714          	jreq	L402
2150  04b3 a30101        	cpw	x,#257
2151  04b6 270f          	jreq	L402
2152  04b8 a30301        	cpw	x,#769
2153  04bb 270a          	jreq	L402
2154  04bd a30302        	cpw	x,#770
2155  04c0 2705          	jreq	L402
2156  04c2 a30210        	cpw	x,#528
2157  04c5 2603          	jrne	L202
2158  04c7               L402:
2159  04c7 4f            	clr	a
2160  04c8 2010          	jra	L602
2161  04ca               L202:
2162  04ca ae01cf        	ldw	x,#463
2163  04cd 89            	pushw	x
2164  04ce ae0000        	ldw	x,#0
2165  04d1 89            	pushw	x
2166  04d2 ae0008        	ldw	x,#L741
2167  04d5 cd0000        	call	_assert_failed
2169  04d8 5b04          	addw	sp,#4
2170  04da               L602:
2171                     ; 466   if (UART3_FLAG == UART3_FLAG_LBDF)
2173  04da 1e02          	ldw	x,(OFST+1,sp)
2174  04dc a30210        	cpw	x,#528
2175  04df 2611          	jrne	L347
2176                     ; 468     if ((UART3->CR4 & (uint8_t)UART3_FLAG) != (uint8_t)0x00)
2178  04e1 c65247        	ld	a,21063
2179  04e4 1503          	bcp	a,(OFST+2,sp)
2180  04e6 2706          	jreq	L547
2181                     ; 471       status = SET;
2183  04e8 a601          	ld	a,#1
2184  04ea 6b01          	ld	(OFST+0,sp),a
2187  04ec 2039          	jra	L157
2188  04ee               L547:
2189                     ; 476       status = RESET;
2191  04ee 0f01          	clr	(OFST+0,sp)
2193  04f0 2035          	jra	L157
2194  04f2               L347:
2195                     ; 479   else if (UART3_FLAG == UART3_FLAG_SBK)
2197  04f2 1e02          	ldw	x,(OFST+1,sp)
2198  04f4 a30101        	cpw	x,#257
2199  04f7 2611          	jrne	L357
2200                     ; 481     if ((UART3->CR2 & (uint8_t)UART3_FLAG) != (uint8_t)0x00)
2202  04f9 c65245        	ld	a,21061
2203  04fc 1503          	bcp	a,(OFST+2,sp)
2204  04fe 2706          	jreq	L557
2205                     ; 484       status = SET;
2207  0500 a601          	ld	a,#1
2208  0502 6b01          	ld	(OFST+0,sp),a
2211  0504 2021          	jra	L157
2212  0506               L557:
2213                     ; 489       status = RESET;
2215  0506 0f01          	clr	(OFST+0,sp)
2217  0508 201d          	jra	L157
2218  050a               L357:
2219                     ; 492   else if ((UART3_FLAG == UART3_FLAG_LHDF) || (UART3_FLAG == UART3_FLAG_LSF))
2221  050a 1e02          	ldw	x,(OFST+1,sp)
2222  050c a30302        	cpw	x,#770
2223  050f 2707          	jreq	L567
2225  0511 1e02          	ldw	x,(OFST+1,sp)
2226  0513 a30301        	cpw	x,#769
2227  0516 2614          	jrne	L367
2228  0518               L567:
2229                     ; 494     if ((UART3->CR6 & (uint8_t)UART3_FLAG) != (uint8_t)0x00)
2231  0518 c65249        	ld	a,21065
2232  051b 1503          	bcp	a,(OFST+2,sp)
2233  051d 2706          	jreq	L767
2234                     ; 497       status = SET;
2236  051f a601          	ld	a,#1
2237  0521 6b01          	ld	(OFST+0,sp),a
2240  0523 2002          	jra	L157
2241  0525               L767:
2242                     ; 502       status = RESET;
2244  0525 0f01          	clr	(OFST+0,sp)
2246  0527               L157:
2247                     ; 520   return  status;
2249  0527 7b01          	ld	a,(OFST+0,sp)
2252  0529 5b03          	addw	sp,#3
2253  052b 81            	ret
2254  052c               L367:
2255                     ; 507     if ((UART3->SR & (uint8_t)UART3_FLAG) != (uint8_t)0x00)
2257  052c c65240        	ld	a,21056
2258  052f 1503          	bcp	a,(OFST+2,sp)
2259  0531 2706          	jreq	L577
2260                     ; 510       status = SET;
2262  0533 a601          	ld	a,#1
2263  0535 6b01          	ld	(OFST+0,sp),a
2266  0537 20ee          	jra	L157
2267  0539               L577:
2268                     ; 515       status = RESET;
2270  0539 0f01          	clr	(OFST+0,sp)
2272  053b 20ea          	jra	L157
2308                     ; 551 void UART3_ClearFlag(UART3_Flag_TypeDef UART3_FLAG)
2308                     ; 552 {
2309                     	switch	.text
2310  053d               _UART3_ClearFlag:
2312  053d 89            	pushw	x
2313       00000000      OFST:	set	0
2316                     ; 554   assert_param(IS_UART3_CLEAR_FLAG_OK(UART3_FLAG));
2318  053e a30020        	cpw	x,#32
2319  0541 270f          	jreq	L412
2320  0543 a30302        	cpw	x,#770
2321  0546 270a          	jreq	L412
2322  0548 a30301        	cpw	x,#769
2323  054b 2705          	jreq	L412
2324  054d a30210        	cpw	x,#528
2325  0550 2603          	jrne	L212
2326  0552               L412:
2327  0552 4f            	clr	a
2328  0553 2010          	jra	L612
2329  0555               L212:
2330  0555 ae022a        	ldw	x,#554
2331  0558 89            	pushw	x
2332  0559 ae0000        	ldw	x,#0
2333  055c 89            	pushw	x
2334  055d ae0008        	ldw	x,#L741
2335  0560 cd0000        	call	_assert_failed
2337  0563 5b04          	addw	sp,#4
2338  0565               L612:
2339                     ; 557   if (UART3_FLAG == UART3_FLAG_RXNE)
2341  0565 1e01          	ldw	x,(OFST+1,sp)
2342  0567 a30020        	cpw	x,#32
2343  056a 2606          	jrne	L7101
2344                     ; 559     UART3->SR = (uint8_t)~(UART3_SR_RXNE);
2346  056c 35df5240      	mov	21056,#223
2348  0570 201e          	jra	L1201
2349  0572               L7101:
2350                     ; 562   else if (UART3_FLAG == UART3_FLAG_LBDF)
2352  0572 1e01          	ldw	x,(OFST+1,sp)
2353  0574 a30210        	cpw	x,#528
2354  0577 2606          	jrne	L3201
2355                     ; 564     UART3->CR4 &= (uint8_t)(~UART3_CR4_LBDF);
2357  0579 72195247      	bres	21063,#4
2359  057d 2011          	jra	L1201
2360  057f               L3201:
2361                     ; 567   else if (UART3_FLAG == UART3_FLAG_LHDF)
2363  057f 1e01          	ldw	x,(OFST+1,sp)
2364  0581 a30302        	cpw	x,#770
2365  0584 2606          	jrne	L7201
2366                     ; 569     UART3->CR6 &= (uint8_t)(~UART3_CR6_LHDF);
2368  0586 72135249      	bres	21065,#1
2370  058a 2004          	jra	L1201
2371  058c               L7201:
2372                     ; 574     UART3->CR6 &= (uint8_t)(~UART3_CR6_LSF);
2374  058c 72115249      	bres	21065,#0
2375  0590               L1201:
2376                     ; 576 }
2379  0590 85            	popw	x
2380  0591 81            	ret
2463                     ; 591 ITStatus UART3_GetITStatus(UART3_IT_TypeDef UART3_IT)
2463                     ; 592 {
2464                     	switch	.text
2465  0592               _UART3_GetITStatus:
2467  0592 89            	pushw	x
2468  0593 89            	pushw	x
2469       00000002      OFST:	set	2
2472                     ; 593   ITStatus pendingbitstatus = RESET;
2474                     ; 594   uint8_t itpos = 0;
2476                     ; 595   uint8_t itmask1 = 0;
2478                     ; 596   uint8_t itmask2 = 0;
2480                     ; 597   uint8_t enablestatus = 0;
2482                     ; 600   assert_param(IS_UART3_GET_IT_OK(UART3_IT));
2484  0594 a30277        	cpw	x,#631
2485  0597 2723          	jreq	L422
2486  0599 a30266        	cpw	x,#614
2487  059c 271e          	jreq	L422
2488  059e a30255        	cpw	x,#597
2489  05a1 2719          	jreq	L422
2490  05a3 a30244        	cpw	x,#580
2491  05a6 2714          	jreq	L422
2492  05a8 a30235        	cpw	x,#565
2493  05ab 270f          	jreq	L422
2494  05ad a30346        	cpw	x,#838
2495  05b0 270a          	jreq	L422
2496  05b2 a30412        	cpw	x,#1042
2497  05b5 2705          	jreq	L422
2498  05b7 a30100        	cpw	x,#256
2499  05ba 2603          	jrne	L222
2500  05bc               L422:
2501  05bc 4f            	clr	a
2502  05bd 2010          	jra	L622
2503  05bf               L222:
2504  05bf ae0258        	ldw	x,#600
2505  05c2 89            	pushw	x
2506  05c3 ae0000        	ldw	x,#0
2507  05c6 89            	pushw	x
2508  05c7 ae0008        	ldw	x,#L741
2509  05ca cd0000        	call	_assert_failed
2511  05cd 5b04          	addw	sp,#4
2512  05cf               L622:
2513                     ; 603   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART3_IT & (uint8_t)0x0F));
2515  05cf 7b04          	ld	a,(OFST+2,sp)
2516  05d1 a40f          	and	a,#15
2517  05d3 5f            	clrw	x
2518  05d4 97            	ld	xl,a
2519  05d5 a601          	ld	a,#1
2520  05d7 5d            	tnzw	x
2521  05d8 2704          	jreq	L032
2522  05da               L232:
2523  05da 48            	sll	a
2524  05db 5a            	decw	x
2525  05dc 26fc          	jrne	L232
2526  05de               L032:
2527  05de 6b01          	ld	(OFST-1,sp),a
2529                     ; 605   itmask1 = (uint8_t)((uint8_t)UART3_IT >> (uint8_t)4);
2531  05e0 7b04          	ld	a,(OFST+2,sp)
2532  05e2 4e            	swap	a
2533  05e3 a40f          	and	a,#15
2534  05e5 6b02          	ld	(OFST+0,sp),a
2536                     ; 607   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2538  05e7 7b02          	ld	a,(OFST+0,sp)
2539  05e9 5f            	clrw	x
2540  05ea 97            	ld	xl,a
2541  05eb a601          	ld	a,#1
2542  05ed 5d            	tnzw	x
2543  05ee 2704          	jreq	L432
2544  05f0               L632:
2545  05f0 48            	sll	a
2546  05f1 5a            	decw	x
2547  05f2 26fc          	jrne	L632
2548  05f4               L432:
2549  05f4 6b02          	ld	(OFST+0,sp),a
2551                     ; 610   if (UART3_IT == UART3_IT_PE)
2553  05f6 1e03          	ldw	x,(OFST+1,sp)
2554  05f8 a30100        	cpw	x,#256
2555  05fb 261c          	jrne	L5701
2556                     ; 613     enablestatus = (uint8_t)((uint8_t)UART3->CR1 & itmask2);
2558  05fd c65244        	ld	a,21060
2559  0600 1402          	and	a,(OFST+0,sp)
2560  0602 6b02          	ld	(OFST+0,sp),a
2562                     ; 616     if (((UART3->SR & itpos) != (uint8_t)0x00) && enablestatus)
2564  0604 c65240        	ld	a,21056
2565  0607 1501          	bcp	a,(OFST-1,sp)
2566  0609 270a          	jreq	L7701
2568  060b 0d02          	tnz	(OFST+0,sp)
2569  060d 2706          	jreq	L7701
2570                     ; 619       pendingbitstatus = SET;
2572  060f a601          	ld	a,#1
2573  0611 6b02          	ld	(OFST+0,sp),a
2576  0613 2064          	jra	L3011
2577  0615               L7701:
2578                     ; 624       pendingbitstatus = RESET;
2580  0615 0f02          	clr	(OFST+0,sp)
2582  0617 2060          	jra	L3011
2583  0619               L5701:
2584                     ; 627   else if (UART3_IT == UART3_IT_LBDF)
2586  0619 1e03          	ldw	x,(OFST+1,sp)
2587  061b a30346        	cpw	x,#838
2588  061e 261c          	jrne	L5011
2589                     ; 630     enablestatus = (uint8_t)((uint8_t)UART3->CR4 & itmask2);
2591  0620 c65247        	ld	a,21063
2592  0623 1402          	and	a,(OFST+0,sp)
2593  0625 6b02          	ld	(OFST+0,sp),a
2595                     ; 632     if (((UART3->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
2597  0627 c65247        	ld	a,21063
2598  062a 1501          	bcp	a,(OFST-1,sp)
2599  062c 270a          	jreq	L7011
2601  062e 0d02          	tnz	(OFST+0,sp)
2602  0630 2706          	jreq	L7011
2603                     ; 635       pendingbitstatus = SET;
2605  0632 a601          	ld	a,#1
2606  0634 6b02          	ld	(OFST+0,sp),a
2609  0636 2041          	jra	L3011
2610  0638               L7011:
2611                     ; 640       pendingbitstatus = RESET;
2613  0638 0f02          	clr	(OFST+0,sp)
2615  063a 203d          	jra	L3011
2616  063c               L5011:
2617                     ; 643   else if (UART3_IT == UART3_IT_LHDF)
2619  063c 1e03          	ldw	x,(OFST+1,sp)
2620  063e a30412        	cpw	x,#1042
2621  0641 261c          	jrne	L5111
2622                     ; 646     enablestatus = (uint8_t)((uint8_t)UART3->CR6 & itmask2);
2624  0643 c65249        	ld	a,21065
2625  0646 1402          	and	a,(OFST+0,sp)
2626  0648 6b02          	ld	(OFST+0,sp),a
2628                     ; 648     if (((UART3->CR6 & itpos) != (uint8_t)0x00) && enablestatus)
2630  064a c65249        	ld	a,21065
2631  064d 1501          	bcp	a,(OFST-1,sp)
2632  064f 270a          	jreq	L7111
2634  0651 0d02          	tnz	(OFST+0,sp)
2635  0653 2706          	jreq	L7111
2636                     ; 651       pendingbitstatus = SET;
2638  0655 a601          	ld	a,#1
2639  0657 6b02          	ld	(OFST+0,sp),a
2642  0659 201e          	jra	L3011
2643  065b               L7111:
2644                     ; 656       pendingbitstatus = RESET;
2646  065b 0f02          	clr	(OFST+0,sp)
2648  065d 201a          	jra	L3011
2649  065f               L5111:
2650                     ; 662     enablestatus = (uint8_t)((uint8_t)UART3->CR2 & itmask2);
2652  065f c65245        	ld	a,21061
2653  0662 1402          	and	a,(OFST+0,sp)
2654  0664 6b02          	ld	(OFST+0,sp),a
2656                     ; 664     if (((UART3->SR & itpos) != (uint8_t)0x00) && enablestatus)
2658  0666 c65240        	ld	a,21056
2659  0669 1501          	bcp	a,(OFST-1,sp)
2660  066b 270a          	jreq	L5211
2662  066d 0d02          	tnz	(OFST+0,sp)
2663  066f 2706          	jreq	L5211
2664                     ; 667       pendingbitstatus = SET;
2666  0671 a601          	ld	a,#1
2667  0673 6b02          	ld	(OFST+0,sp),a
2670  0675 2002          	jra	L3011
2671  0677               L5211:
2672                     ; 672       pendingbitstatus = RESET;
2674  0677 0f02          	clr	(OFST+0,sp)
2676  0679               L3011:
2677                     ; 676   return  pendingbitstatus;
2679  0679 7b02          	ld	a,(OFST+0,sp)
2682  067b 5b04          	addw	sp,#4
2683  067d 81            	ret
2720                     ; 706 void UART3_ClearITPendingBit(UART3_IT_TypeDef UART3_IT)
2720                     ; 707 {
2721                     	switch	.text
2722  067e               _UART3_ClearITPendingBit:
2724  067e 89            	pushw	x
2725       00000000      OFST:	set	0
2728                     ; 709   assert_param(IS_UART3_CLEAR_IT_OK(UART3_IT));
2730  067f a30255        	cpw	x,#597
2731  0682 270a          	jreq	L442
2732  0684 a30412        	cpw	x,#1042
2733  0687 2705          	jreq	L442
2734  0689 a30346        	cpw	x,#838
2735  068c 2603          	jrne	L242
2736  068e               L442:
2737  068e 4f            	clr	a
2738  068f 2010          	jra	L642
2739  0691               L242:
2740  0691 ae02c5        	ldw	x,#709
2741  0694 89            	pushw	x
2742  0695 ae0000        	ldw	x,#0
2743  0698 89            	pushw	x
2744  0699 ae0008        	ldw	x,#L741
2745  069c cd0000        	call	_assert_failed
2747  069f 5b04          	addw	sp,#4
2748  06a1               L642:
2749                     ; 712   if (UART3_IT == UART3_IT_RXNE)
2751  06a1 1e01          	ldw	x,(OFST+1,sp)
2752  06a3 a30255        	cpw	x,#597
2753  06a6 2606          	jrne	L7411
2754                     ; 714     UART3->SR = (uint8_t)~(UART3_SR_RXNE);
2756  06a8 35df5240      	mov	21056,#223
2758  06ac 2011          	jra	L1511
2759  06ae               L7411:
2760                     ; 717   else if (UART3_IT == UART3_IT_LBDF)
2762  06ae 1e01          	ldw	x,(OFST+1,sp)
2763  06b0 a30346        	cpw	x,#838
2764  06b3 2606          	jrne	L3511
2765                     ; 719     UART3->CR4 &= (uint8_t)~(UART3_CR4_LBDF);
2767  06b5 72195247      	bres	21063,#4
2769  06b9 2004          	jra	L1511
2770  06bb               L3511:
2771                     ; 724     UART3->CR6 &= (uint8_t)(~UART3_CR6_LHDF);
2773  06bb 72135249      	bres	21065,#1
2774  06bf               L1511:
2775                     ; 726 }
2778  06bf 85            	popw	x
2779  06c0 81            	ret
2792                     	xdef	_UART3_ClearITPendingBit
2793                     	xdef	_UART3_GetITStatus
2794                     	xdef	_UART3_ClearFlag
2795                     	xdef	_UART3_GetFlagStatus
2796                     	xdef	_UART3_SetAddress
2797                     	xdef	_UART3_SendBreak
2798                     	xdef	_UART3_SendData9
2799                     	xdef	_UART3_SendData8
2800                     	xdef	_UART3_ReceiveData9
2801                     	xdef	_UART3_ReceiveData8
2802                     	xdef	_UART3_WakeUpConfig
2803                     	xdef	_UART3_ReceiverWakeUpCmd
2804                     	xdef	_UART3_LINCmd
2805                     	xdef	_UART3_LINConfig
2806                     	xdef	_UART3_LINBreakDetectionConfig
2807                     	xdef	_UART3_ITConfig
2808                     	xdef	_UART3_Cmd
2809                     	xdef	_UART3_Init
2810                     	xdef	_UART3_DeInit
2811                     	xref	_assert_failed
2812                     	xref	_CLK_GetClockFreq
2813                     	switch	.const
2814  0008               L741:
2815  0008 7372635c7374  	dc.b	"src\stm8s_uart3.c",0
2816                     	xref.b	c_lreg
2817                     	xref.b	c_x
2837                     	xref	c_lursh
2838                     	xref	c_lsub
2839                     	xref	c_smul
2840                     	xref	c_ludv
2841                     	xref	c_rtol
2842                     	xref	c_llsh
2843                     	xref	c_lcmp
2844                     	xref	c_ltor
2845                     	end
