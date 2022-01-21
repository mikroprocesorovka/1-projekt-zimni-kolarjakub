   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.1 - 30 Jun 2020
   3                     ; Generator (Limited) V4.4.12 - 02 Jul 2020
  43                     ; 50 uint8_t ITC_GetCPUCC(void)
  43                     ; 51 {
  45                     	switch	.text
  46  0000               _ITC_GetCPUCC:
  50                     ; 53   _asm("push cc");
  53  0000 8a            push cc
  55                     ; 54   _asm("pop a");
  58  0001 84            pop a
  60                     ; 55   return; /* Ignore compiler warning, the returned value is in A register */
  63  0002 81            	ret
  86                     ; 80 void ITC_DeInit(void)
  86                     ; 81 {
  87                     	switch	.text
  88  0003               _ITC_DeInit:
  92                     ; 82   ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
  94  0003 35ff7f70      	mov	32624,#255
  95                     ; 83   ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
  97  0007 35ff7f71      	mov	32625,#255
  98                     ; 84   ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
 100  000b 35ff7f72      	mov	32626,#255
 101                     ; 85   ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
 103  000f 35ff7f73      	mov	32627,#255
 104                     ; 86   ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
 106  0013 35ff7f74      	mov	32628,#255
 107                     ; 87   ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
 109  0017 35ff7f75      	mov	32629,#255
 110                     ; 88   ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
 112  001b 35ff7f76      	mov	32630,#255
 113                     ; 89   ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
 115  001f 35ff7f77      	mov	32631,#255
 116                     ; 90 }
 119  0023 81            	ret
 144                     ; 97 uint8_t ITC_GetSoftIntStatus(void)
 144                     ; 98 {
 145                     	switch	.text
 146  0024               _ITC_GetSoftIntStatus:
 150                     ; 99   return (uint8_t)(ITC_GetCPUCC() & CPU_CC_I1I0);
 152  0024 adda          	call	_ITC_GetCPUCC
 154  0026 a428          	and	a,#40
 157  0028 81            	ret
 435                     .const:	section	.text
 436  0000               L62:
 437  0000 0065          	dc.w	L14
 438  0002 0065          	dc.w	L14
 439  0004 0065          	dc.w	L14
 440  0006 0065          	dc.w	L14
 441  0008 006e          	dc.w	L34
 442  000a 006e          	dc.w	L34
 443  000c 006e          	dc.w	L34
 444  000e 006e          	dc.w	L34
 445  0010 0077          	dc.w	L54
 446  0012 0077          	dc.w	L54
 447  0014 0077          	dc.w	L54
 448  0016 0077          	dc.w	L54
 449  0018 0080          	dc.w	L74
 450  001a 0080          	dc.w	L74
 451  001c 0080          	dc.w	L74
 452  001e 0080          	dc.w	L74
 453  0020 0089          	dc.w	L15
 454  0022 0089          	dc.w	L15
 455  0024 0089          	dc.w	L15
 456  0026 0089          	dc.w	L15
 457  0028 0092          	dc.w	L35
 458  002a 0092          	dc.w	L35
 459  002c 0092          	dc.w	L35
 460  002e 0092          	dc.w	L35
 461  0030 009b          	dc.w	L55
 462                     ; 107 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(ITC_Irq_TypeDef IrqNum)
 462                     ; 108 {
 463                     	switch	.text
 464  0029               _ITC_GetSoftwarePriority:
 466  0029 88            	push	a
 467  002a 89            	pushw	x
 468       00000002      OFST:	set	2
 471                     ; 109   uint8_t Value = 0;
 473  002b 0f02          	clr	(OFST+0,sp)
 475                     ; 110   uint8_t Mask = 0;
 477                     ; 113   assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 479  002d a119          	cp	a,#25
 480  002f 2403          	jruge	L41
 481  0031 4f            	clr	a
 482  0032 2010          	jra	L61
 483  0034               L41:
 484  0034 ae0071        	ldw	x,#113
 485  0037 89            	pushw	x
 486  0038 ae0000        	ldw	x,#0
 487  003b 89            	pushw	x
 488  003c ae0064        	ldw	x,#L112
 489  003f cd0000        	call	_assert_failed
 491  0042 5b04          	addw	sp,#4
 492  0044               L61:
 493                     ; 116   Mask = (uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U));
 495  0044 7b03          	ld	a,(OFST+1,sp)
 496  0046 a403          	and	a,#3
 497  0048 48            	sll	a
 498  0049 5f            	clrw	x
 499  004a 97            	ld	xl,a
 500  004b a603          	ld	a,#3
 501  004d 5d            	tnzw	x
 502  004e 2704          	jreq	L02
 503  0050               L22:
 504  0050 48            	sll	a
 505  0051 5a            	decw	x
 506  0052 26fc          	jrne	L22
 507  0054               L02:
 508  0054 6b01          	ld	(OFST-1,sp),a
 510                     ; 118   switch (IrqNum)
 512  0056 7b03          	ld	a,(OFST+1,sp)
 514                     ; 198   default:
 514                     ; 199     break;
 515  0058 a119          	cp	a,#25
 516  005a 2407          	jruge	L42
 517  005c 5f            	clrw	x
 518  005d 97            	ld	xl,a
 519  005e 58            	sllw	x
 520  005f de0000        	ldw	x,(L62,x)
 521  0062 fc            	jp	(x)
 522  0063               L42:
 523  0063 203d          	jra	L512
 524  0065               L14:
 525                     ; 120   case ITC_IRQ_TLI: /* TLI software priority can be read but has no meaning */
 525                     ; 121   case ITC_IRQ_AWU:
 525                     ; 122   case ITC_IRQ_CLK:
 525                     ; 123   case ITC_IRQ_PORTA:
 525                     ; 124     Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 527  0065 c67f70        	ld	a,32624
 528  0068 1401          	and	a,(OFST-1,sp)
 529  006a 6b02          	ld	(OFST+0,sp),a
 531                     ; 125     break;
 533  006c 2034          	jra	L512
 534  006e               L34:
 535                     ; 127   case ITC_IRQ_PORTB:
 535                     ; 128   case ITC_IRQ_PORTC:
 535                     ; 129   case ITC_IRQ_PORTD:
 535                     ; 130   case ITC_IRQ_PORTE:
 535                     ; 131     Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 537  006e c67f71        	ld	a,32625
 538  0071 1401          	and	a,(OFST-1,sp)
 539  0073 6b02          	ld	(OFST+0,sp),a
 541                     ; 132     break;
 543  0075 202b          	jra	L512
 544  0077               L54:
 545                     ; 135   case ITC_IRQ_CAN_RX:
 545                     ; 136   case ITC_IRQ_CAN_TX:
 545                     ; 137 #endif /*STM8S208 or STM8AF52Ax */
 545                     ; 138 #if defined(STM8S903) || defined(STM8AF622x)
 545                     ; 139   case ITC_IRQ_PORTF:
 545                     ; 140 #endif /*STM8S903 or STM8AF622x */
 545                     ; 141   case ITC_IRQ_SPI:
 545                     ; 142   case ITC_IRQ_TIM1_OVF:
 545                     ; 143     Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 547  0077 c67f72        	ld	a,32626
 548  007a 1401          	and	a,(OFST-1,sp)
 549  007c 6b02          	ld	(OFST+0,sp),a
 551                     ; 144     break;
 553  007e 2022          	jra	L512
 554  0080               L74:
 555                     ; 146   case ITC_IRQ_TIM1_CAPCOM:
 555                     ; 147 #if defined (STM8S903) || defined (STM8AF622x)
 555                     ; 148   case ITC_IRQ_TIM5_OVFTRI:
 555                     ; 149   case ITC_IRQ_TIM5_CAPCOM:
 555                     ; 150 #else
 555                     ; 151   case ITC_IRQ_TIM2_OVF:
 555                     ; 152   case ITC_IRQ_TIM2_CAPCOM:
 555                     ; 153 #endif /* STM8S903 or STM8AF622x*/
 555                     ; 154   case ITC_IRQ_TIM3_OVF:
 555                     ; 155     Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 557  0080 c67f73        	ld	a,32627
 558  0083 1401          	and	a,(OFST-1,sp)
 559  0085 6b02          	ld	(OFST+0,sp),a
 561                     ; 156     break;
 563  0087 2019          	jra	L512
 564  0089               L15:
 565                     ; 158   case ITC_IRQ_TIM3_CAPCOM:
 565                     ; 159 #if defined(STM8S208) ||defined(STM8S207) || defined (STM8S007) || defined(STM8S103) || \
 565                     ; 160     defined(STM8S003) ||defined(STM8S001) || defined (STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
 565                     ; 161   case ITC_IRQ_UART1_TX:
 565                     ; 162   case ITC_IRQ_UART1_RX:
 565                     ; 163 #endif /*STM8S208 or STM8S207 or STM8S007 or STM8S103 or STM8S003 or STM8S001 or STM8S903 or STM8AF52Ax or STM8AF62Ax */ 
 565                     ; 164 #if defined(STM8AF622x)
 565                     ; 165   case ITC_IRQ_UART4_TX:
 565                     ; 166   case ITC_IRQ_UART4_RX:
 565                     ; 167 #endif /*STM8AF622x */
 565                     ; 168   case ITC_IRQ_I2C:
 565                     ; 169     Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 567  0089 c67f74        	ld	a,32628
 568  008c 1401          	and	a,(OFST-1,sp)
 569  008e 6b02          	ld	(OFST+0,sp),a
 571                     ; 170     break;
 573  0090 2010          	jra	L512
 574  0092               L35:
 575                     ; 178   case ITC_IRQ_UART3_TX:
 575                     ; 179   case ITC_IRQ_UART3_RX:
 575                     ; 180   case ITC_IRQ_ADC2:
 575                     ; 181 #endif /*STM8S208 or STM8S207 or STM8AF52Ax or STM8AF62Ax */
 575                     ; 182 #if defined(STM8S105) || defined(STM8S005) || defined(STM8S103) || defined(STM8S003) || \
 575                     ; 183     defined(STM8S001) || defined(STM8S903) || defined(STM8AF626x) || defined(STM8AF622x)
 575                     ; 184   case ITC_IRQ_ADC1:
 575                     ; 185 #endif /*STM8S105, STM8S005, STM8S103 or STM8S003 or STM8S001 or STM8S903 or STM8AF626x or STM8AF622x */
 575                     ; 186 #if defined (STM8S903) || defined (STM8AF622x)
 575                     ; 187   case ITC_IRQ_TIM6_OVFTRI:
 575                     ; 188 #else
 575                     ; 189   case ITC_IRQ_TIM4_OVF:
 575                     ; 190 #endif /*STM8S903 or STM8AF622x */
 575                     ; 191     Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 577  0092 c67f75        	ld	a,32629
 578  0095 1401          	and	a,(OFST-1,sp)
 579  0097 6b02          	ld	(OFST+0,sp),a
 581                     ; 192     break;
 583  0099 2007          	jra	L512
 584  009b               L55:
 585                     ; 194   case ITC_IRQ_EEPROM_EEC:
 585                     ; 195     Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 587  009b c67f76        	ld	a,32630
 588  009e 1401          	and	a,(OFST-1,sp)
 589  00a0 6b02          	ld	(OFST+0,sp),a
 591                     ; 196     break;
 593  00a2               L75:
 594                     ; 198   default:
 594                     ; 199     break;
 596  00a2               L512:
 597                     ; 202   Value >>= (uint8_t)(((uint8_t)IrqNum % 4u) * 2u);
 599  00a2 7b03          	ld	a,(OFST+1,sp)
 600  00a4 a403          	and	a,#3
 601  00a6 48            	sll	a
 602  00a7 5f            	clrw	x
 603  00a8 97            	ld	xl,a
 604  00a9 7b02          	ld	a,(OFST+0,sp)
 605  00ab 5d            	tnzw	x
 606  00ac 2704          	jreq	L03
 607  00ae               L23:
 608  00ae 44            	srl	a
 609  00af 5a            	decw	x
 610  00b0 26fc          	jrne	L23
 611  00b2               L03:
 612  00b2 6b02          	ld	(OFST+0,sp),a
 614                     ; 204   return((ITC_PriorityLevel_TypeDef)Value);
 616  00b4 7b02          	ld	a,(OFST+0,sp)
 619  00b6 5b03          	addw	sp,#3
 620  00b8 81            	ret
 686                     	switch	.const
 687  0032               L66:
 688  0032 014a          	dc.w	L712
 689  0034 014a          	dc.w	L712
 690  0036 014a          	dc.w	L712
 691  0038 014a          	dc.w	L712
 692  003a 015c          	dc.w	L122
 693  003c 015c          	dc.w	L122
 694  003e 015c          	dc.w	L122
 695  0040 015c          	dc.w	L122
 696  0042 016e          	dc.w	L322
 697  0044 016e          	dc.w	L322
 698  0046 016e          	dc.w	L322
 699  0048 016e          	dc.w	L322
 700  004a 0180          	dc.w	L522
 701  004c 0180          	dc.w	L522
 702  004e 0180          	dc.w	L522
 703  0050 0180          	dc.w	L522
 704  0052 0192          	dc.w	L722
 705  0054 0192          	dc.w	L722
 706  0056 0192          	dc.w	L722
 707  0058 0192          	dc.w	L722
 708  005a 01a4          	dc.w	L132
 709  005c 01a4          	dc.w	L132
 710  005e 01a4          	dc.w	L132
 711  0060 01a4          	dc.w	L132
 712  0062 01b6          	dc.w	L332
 713                     ; 220 void ITC_SetSoftwarePriority(ITC_Irq_TypeDef IrqNum, ITC_PriorityLevel_TypeDef PriorityValue)
 713                     ; 221 {
 714                     	switch	.text
 715  00b9               _ITC_SetSoftwarePriority:
 717  00b9 89            	pushw	x
 718  00ba 89            	pushw	x
 719       00000002      OFST:	set	2
 722                     ; 222   uint8_t Mask = 0;
 724                     ; 223   uint8_t NewPriority = 0;
 726                     ; 226   assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 728  00bb 9e            	ld	a,xh
 729  00bc a119          	cp	a,#25
 730  00be 2403          	jruge	L63
 731  00c0 4f            	clr	a
 732  00c1 2010          	jra	L04
 733  00c3               L63:
 734  00c3 ae00e2        	ldw	x,#226
 735  00c6 89            	pushw	x
 736  00c7 ae0000        	ldw	x,#0
 737  00ca 89            	pushw	x
 738  00cb ae0064        	ldw	x,#L112
 739  00ce cd0000        	call	_assert_failed
 741  00d1 5b04          	addw	sp,#4
 742  00d3               L04:
 743                     ; 227   assert_param(IS_ITC_PRIORITY_OK(PriorityValue));
 745  00d3 7b04          	ld	a,(OFST+2,sp)
 746  00d5 a102          	cp	a,#2
 747  00d7 2710          	jreq	L44
 748  00d9 7b04          	ld	a,(OFST+2,sp)
 749  00db a101          	cp	a,#1
 750  00dd 270a          	jreq	L44
 751  00df 0d04          	tnz	(OFST+2,sp)
 752  00e1 2706          	jreq	L44
 753  00e3 7b04          	ld	a,(OFST+2,sp)
 754  00e5 a103          	cp	a,#3
 755  00e7 2603          	jrne	L24
 756  00e9               L44:
 757  00e9 4f            	clr	a
 758  00ea 2010          	jra	L64
 759  00ec               L24:
 760  00ec ae00e3        	ldw	x,#227
 761  00ef 89            	pushw	x
 762  00f0 ae0000        	ldw	x,#0
 763  00f3 89            	pushw	x
 764  00f4 ae0064        	ldw	x,#L112
 765  00f7 cd0000        	call	_assert_failed
 767  00fa 5b04          	addw	sp,#4
 768  00fc               L64:
 769                     ; 230   assert_param(IS_ITC_INTERRUPTS_DISABLED);
 771  00fc cd0024        	call	_ITC_GetSoftIntStatus
 773  00ff a128          	cp	a,#40
 774  0101 2603          	jrne	L05
 775  0103 4f            	clr	a
 776  0104 2010          	jra	L25
 777  0106               L05:
 778  0106 ae00e6        	ldw	x,#230
 779  0109 89            	pushw	x
 780  010a ae0000        	ldw	x,#0
 781  010d 89            	pushw	x
 782  010e ae0064        	ldw	x,#L112
 783  0111 cd0000        	call	_assert_failed
 785  0114 5b04          	addw	sp,#4
 786  0116               L25:
 787                     ; 234   Mask = (uint8_t)(~(uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U)));
 789  0116 7b03          	ld	a,(OFST+1,sp)
 790  0118 a403          	and	a,#3
 791  011a 48            	sll	a
 792  011b 5f            	clrw	x
 793  011c 97            	ld	xl,a
 794  011d a603          	ld	a,#3
 795  011f 5d            	tnzw	x
 796  0120 2704          	jreq	L45
 797  0122               L65:
 798  0122 48            	sll	a
 799  0123 5a            	decw	x
 800  0124 26fc          	jrne	L65
 801  0126               L45:
 802  0126 43            	cpl	a
 803  0127 6b01          	ld	(OFST-1,sp),a
 805                     ; 237   NewPriority = (uint8_t)((uint8_t)(PriorityValue) << (((uint8_t)IrqNum % 4U) * 2U));
 807  0129 7b03          	ld	a,(OFST+1,sp)
 808  012b a403          	and	a,#3
 809  012d 48            	sll	a
 810  012e 5f            	clrw	x
 811  012f 97            	ld	xl,a
 812  0130 7b04          	ld	a,(OFST+2,sp)
 813  0132 5d            	tnzw	x
 814  0133 2704          	jreq	L06
 815  0135               L26:
 816  0135 48            	sll	a
 817  0136 5a            	decw	x
 818  0137 26fc          	jrne	L26
 819  0139               L06:
 820  0139 6b02          	ld	(OFST+0,sp),a
 822                     ; 239   switch (IrqNum)
 824  013b 7b03          	ld	a,(OFST+1,sp)
 826                     ; 329   default:
 826                     ; 330     break;
 827  013d a119          	cp	a,#25
 828  013f 2407          	jruge	L46
 829  0141 5f            	clrw	x
 830  0142 97            	ld	xl,a
 831  0143 58            	sllw	x
 832  0144 de0032        	ldw	x,(L66,x)
 833  0147 fc            	jp	(x)
 834  0148               L46:
 835  0148 207c          	jra	L372
 836  014a               L712:
 837                     ; 241   case ITC_IRQ_TLI: /* TLI software priority can be written but has no meaning */
 837                     ; 242   case ITC_IRQ_AWU:
 837                     ; 243   case ITC_IRQ_CLK:
 837                     ; 244   case ITC_IRQ_PORTA:
 837                     ; 245     ITC->ISPR1 &= Mask;
 839  014a c67f70        	ld	a,32624
 840  014d 1401          	and	a,(OFST-1,sp)
 841  014f c77f70        	ld	32624,a
 842                     ; 246     ITC->ISPR1 |= NewPriority;
 844  0152 c67f70        	ld	a,32624
 845  0155 1a02          	or	a,(OFST+0,sp)
 846  0157 c77f70        	ld	32624,a
 847                     ; 247     break;
 849  015a 206a          	jra	L372
 850  015c               L122:
 851                     ; 249   case ITC_IRQ_PORTB:
 851                     ; 250   case ITC_IRQ_PORTC:
 851                     ; 251   case ITC_IRQ_PORTD:
 851                     ; 252   case ITC_IRQ_PORTE:
 851                     ; 253     ITC->ISPR2 &= Mask;
 853  015c c67f71        	ld	a,32625
 854  015f 1401          	and	a,(OFST-1,sp)
 855  0161 c77f71        	ld	32625,a
 856                     ; 254     ITC->ISPR2 |= NewPriority;
 858  0164 c67f71        	ld	a,32625
 859  0167 1a02          	or	a,(OFST+0,sp)
 860  0169 c77f71        	ld	32625,a
 861                     ; 255     break;
 863  016c 2058          	jra	L372
 864  016e               L322:
 865                     ; 258   case ITC_IRQ_CAN_RX:
 865                     ; 259   case ITC_IRQ_CAN_TX:
 865                     ; 260 #endif /*STM8S208 or STM8AF52Ax */
 865                     ; 261 #if defined(STM8S903) || defined(STM8AF622x)
 865                     ; 262   case ITC_IRQ_PORTF:
 865                     ; 263 #endif /*STM8S903 or STM8AF622x */
 865                     ; 264   case ITC_IRQ_SPI:
 865                     ; 265   case ITC_IRQ_TIM1_OVF:
 865                     ; 266     ITC->ISPR3 &= Mask;
 867  016e c67f72        	ld	a,32626
 868  0171 1401          	and	a,(OFST-1,sp)
 869  0173 c77f72        	ld	32626,a
 870                     ; 267     ITC->ISPR3 |= NewPriority;
 872  0176 c67f72        	ld	a,32626
 873  0179 1a02          	or	a,(OFST+0,sp)
 874  017b c77f72        	ld	32626,a
 875                     ; 268     break;
 877  017e 2046          	jra	L372
 878  0180               L522:
 879                     ; 270   case ITC_IRQ_TIM1_CAPCOM:
 879                     ; 271 #if defined(STM8S903) || defined(STM8AF622x) 
 879                     ; 272   case ITC_IRQ_TIM5_OVFTRI:
 879                     ; 273   case ITC_IRQ_TIM5_CAPCOM:
 879                     ; 274 #else
 879                     ; 275   case ITC_IRQ_TIM2_OVF:
 879                     ; 276   case ITC_IRQ_TIM2_CAPCOM:
 879                     ; 277 #endif /*STM8S903 or STM8AF622x */
 879                     ; 278   case ITC_IRQ_TIM3_OVF:
 879                     ; 279     ITC->ISPR4 &= Mask;
 881  0180 c67f73        	ld	a,32627
 882  0183 1401          	and	a,(OFST-1,sp)
 883  0185 c77f73        	ld	32627,a
 884                     ; 280     ITC->ISPR4 |= NewPriority;
 886  0188 c67f73        	ld	a,32627
 887  018b 1a02          	or	a,(OFST+0,sp)
 888  018d c77f73        	ld	32627,a
 889                     ; 281     break;
 891  0190 2034          	jra	L372
 892  0192               L722:
 893                     ; 283   case ITC_IRQ_TIM3_CAPCOM:
 893                     ; 284 #if defined(STM8S208) ||defined(STM8S207) || defined (STM8S007) || defined(STM8S103) || \
 893                     ; 285     defined(STM8S001) ||defined(STM8S003) ||defined(STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
 893                     ; 286   case ITC_IRQ_UART1_TX:
 893                     ; 287   case ITC_IRQ_UART1_RX:
 893                     ; 288 #endif /*STM8S208 or STM8S207 or STM8S007 or STM8S103 or STM8S003 or STM8S001 or STM8S903 or STM8AF52Ax or STM8AF62Ax */ 
 893                     ; 289 #if defined(STM8AF622x)
 893                     ; 290   case ITC_IRQ_UART4_TX:
 893                     ; 291   case ITC_IRQ_UART4_RX:
 893                     ; 292 #endif /*STM8AF622x */
 893                     ; 293   case ITC_IRQ_I2C:
 893                     ; 294     ITC->ISPR5 &= Mask;
 895  0192 c67f74        	ld	a,32628
 896  0195 1401          	and	a,(OFST-1,sp)
 897  0197 c77f74        	ld	32628,a
 898                     ; 295     ITC->ISPR5 |= NewPriority;
 900  019a c67f74        	ld	a,32628
 901  019d 1a02          	or	a,(OFST+0,sp)
 902  019f c77f74        	ld	32628,a
 903                     ; 296     break;
 905  01a2 2022          	jra	L372
 906  01a4               L132:
 907                     ; 305   case ITC_IRQ_UART3_TX:
 907                     ; 306   case ITC_IRQ_UART3_RX:
 907                     ; 307   case ITC_IRQ_ADC2:
 907                     ; 308 #endif /*STM8S208 or STM8S207 or STM8AF52Ax or STM8AF62Ax */
 907                     ; 309     
 907                     ; 310 #if defined(STM8S105) || defined(STM8S005) || defined(STM8S103) || defined(STM8S003) || \
 907                     ; 311     defined(STM8S001) || defined(STM8S903) || defined(STM8AF626x) || defined (STM8AF622x)
 907                     ; 312   case ITC_IRQ_ADC1:
 907                     ; 313 #endif /*STM8S105, STM8S005, STM8S103 or STM8S003 or STM8S001 or STM8S903 or STM8AF626x or STM8AF622x */
 907                     ; 314     
 907                     ; 315 #if defined (STM8S903) || defined (STM8AF622x)
 907                     ; 316   case ITC_IRQ_TIM6_OVFTRI:
 907                     ; 317 #else
 907                     ; 318   case ITC_IRQ_TIM4_OVF:
 907                     ; 319 #endif /* STM8S903 or STM8AF622x */
 907                     ; 320     ITC->ISPR6 &= Mask;
 909  01a4 c67f75        	ld	a,32629
 910  01a7 1401          	and	a,(OFST-1,sp)
 911  01a9 c77f75        	ld	32629,a
 912                     ; 321     ITC->ISPR6 |= NewPriority;
 914  01ac c67f75        	ld	a,32629
 915  01af 1a02          	or	a,(OFST+0,sp)
 916  01b1 c77f75        	ld	32629,a
 917                     ; 322     break;
 919  01b4 2010          	jra	L372
 920  01b6               L332:
 921                     ; 324   case ITC_IRQ_EEPROM_EEC:
 921                     ; 325     ITC->ISPR7 &= Mask;
 923  01b6 c67f76        	ld	a,32630
 924  01b9 1401          	and	a,(OFST-1,sp)
 925  01bb c77f76        	ld	32630,a
 926                     ; 326     ITC->ISPR7 |= NewPriority;
 928  01be c67f76        	ld	a,32630
 929  01c1 1a02          	or	a,(OFST+0,sp)
 930  01c3 c77f76        	ld	32630,a
 931                     ; 327     break;
 933  01c6               L532:
 934                     ; 329   default:
 934                     ; 330     break;
 936  01c6               L372:
 937                     ; 332 }
 940  01c6 5b04          	addw	sp,#4
 941  01c8 81            	ret
 954                     	xdef	_ITC_GetSoftwarePriority
 955                     	xdef	_ITC_SetSoftwarePriority
 956                     	xdef	_ITC_GetSoftIntStatus
 957                     	xdef	_ITC_DeInit
 958                     	xdef	_ITC_GetCPUCC
 959                     	xref	_assert_failed
 960                     	switch	.const
 961  0064               L112:
 962  0064 7372635c7374  	dc.b	"src\stm8s_itc.c",0
 982                     	end
