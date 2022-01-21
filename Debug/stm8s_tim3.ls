   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.1 - 30 Jun 2020
   3                     ; Generator (Limited) V4.4.12 - 02 Jul 2020
  43                     ; 51 void TIM3_DeInit(void)
  43                     ; 52 {
  45                     	switch	.text
  46  0000               _TIM3_DeInit:
  50                     ; 53   TIM3->CR1 = (uint8_t)TIM3_CR1_RESET_VALUE;
  52  0000 725f5320      	clr	21280
  53                     ; 54   TIM3->IER = (uint8_t)TIM3_IER_RESET_VALUE;
  55  0004 725f5321      	clr	21281
  56                     ; 55   TIM3->SR2 = (uint8_t)TIM3_SR2_RESET_VALUE;
  58  0008 725f5323      	clr	21283
  59                     ; 58   TIM3->CCER1 = (uint8_t)TIM3_CCER1_RESET_VALUE;
  61  000c 725f5327      	clr	21287
  62                     ; 61   TIM3->CCER1 = (uint8_t)TIM3_CCER1_RESET_VALUE;
  64  0010 725f5327      	clr	21287
  65                     ; 62   TIM3->CCMR1 = (uint8_t)TIM3_CCMR1_RESET_VALUE;
  67  0014 725f5325      	clr	21285
  68                     ; 63   TIM3->CCMR2 = (uint8_t)TIM3_CCMR2_RESET_VALUE;
  70  0018 725f5326      	clr	21286
  71                     ; 64   TIM3->CNTRH = (uint8_t)TIM3_CNTRH_RESET_VALUE;
  73  001c 725f5328      	clr	21288
  74                     ; 65   TIM3->CNTRL = (uint8_t)TIM3_CNTRL_RESET_VALUE;
  76  0020 725f5329      	clr	21289
  77                     ; 66   TIM3->PSCR = (uint8_t)TIM3_PSCR_RESET_VALUE;
  79  0024 725f532a      	clr	21290
  80                     ; 67   TIM3->ARRH  = (uint8_t)TIM3_ARRH_RESET_VALUE;
  82  0028 35ff532b      	mov	21291,#255
  83                     ; 68   TIM3->ARRL  = (uint8_t)TIM3_ARRL_RESET_VALUE;
  85  002c 35ff532c      	mov	21292,#255
  86                     ; 69   TIM3->CCR1H = (uint8_t)TIM3_CCR1H_RESET_VALUE;
  88  0030 725f532d      	clr	21293
  89                     ; 70   TIM3->CCR1L = (uint8_t)TIM3_CCR1L_RESET_VALUE;
  91  0034 725f532e      	clr	21294
  92                     ; 71   TIM3->CCR2H = (uint8_t)TIM3_CCR2H_RESET_VALUE;
  94  0038 725f532f      	clr	21295
  95                     ; 72   TIM3->CCR2L = (uint8_t)TIM3_CCR2L_RESET_VALUE;
  97  003c 725f5330      	clr	21296
  98                     ; 73   TIM3->SR1 = (uint8_t)TIM3_SR1_RESET_VALUE;
 100  0040 725f5322      	clr	21282
 101                     ; 74 }
 104  0044 81            	ret
 272                     ; 82 void TIM3_TimeBaseInit( TIM3_Prescaler_TypeDef TIM3_Prescaler,
 272                     ; 83                         uint16_t TIM3_Period)
 272                     ; 84 {
 273                     	switch	.text
 274  0045               _TIM3_TimeBaseInit:
 276  0045 88            	push	a
 277       00000000      OFST:	set	0
 280                     ; 86   TIM3->PSCR = (uint8_t)(TIM3_Prescaler);
 282  0046 c7532a        	ld	21290,a
 283                     ; 88   TIM3->ARRH = (uint8_t)(TIM3_Period >> 8);
 285  0049 7b04          	ld	a,(OFST+4,sp)
 286  004b c7532b        	ld	21291,a
 287                     ; 89   TIM3->ARRL = (uint8_t)(TIM3_Period);
 289  004e 7b05          	ld	a,(OFST+5,sp)
 290  0050 c7532c        	ld	21292,a
 291                     ; 90 }
 294  0053 84            	pop	a
 295  0054 81            	ret
 453                     ; 100 void TIM3_OC1Init(TIM3_OCMode_TypeDef TIM3_OCMode,
 453                     ; 101                   TIM3_OutputState_TypeDef TIM3_OutputState,
 453                     ; 102                   uint16_t TIM3_Pulse,
 453                     ; 103                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
 453                     ; 104 {
 454                     	switch	.text
 455  0055               _TIM3_OC1Init:
 457  0055 89            	pushw	x
 458  0056 88            	push	a
 459       00000001      OFST:	set	1
 462                     ; 106   assert_param(IS_TIM3_OC_MODE_OK(TIM3_OCMode));
 464  0057 9e            	ld	a,xh
 465  0058 4d            	tnz	a
 466  0059 2719          	jreq	L41
 467  005b 9e            	ld	a,xh
 468  005c a110          	cp	a,#16
 469  005e 2714          	jreq	L41
 470  0060 9e            	ld	a,xh
 471  0061 a120          	cp	a,#32
 472  0063 270f          	jreq	L41
 473  0065 9e            	ld	a,xh
 474  0066 a130          	cp	a,#48
 475  0068 270a          	jreq	L41
 476  006a 9e            	ld	a,xh
 477  006b a160          	cp	a,#96
 478  006d 2705          	jreq	L41
 479  006f 9e            	ld	a,xh
 480  0070 a170          	cp	a,#112
 481  0072 2603          	jrne	L21
 482  0074               L41:
 483  0074 4f            	clr	a
 484  0075 2010          	jra	L61
 485  0077               L21:
 486  0077 ae006a        	ldw	x,#106
 487  007a 89            	pushw	x
 488  007b ae0000        	ldw	x,#0
 489  007e 89            	pushw	x
 490  007f ae0000        	ldw	x,#L502
 491  0082 cd0000        	call	_assert_failed
 493  0085 5b04          	addw	sp,#4
 494  0087               L61:
 495                     ; 107   assert_param(IS_TIM3_OUTPUT_STATE_OK(TIM3_OutputState));
 497  0087 0d03          	tnz	(OFST+2,sp)
 498  0089 2706          	jreq	L22
 499  008b 7b03          	ld	a,(OFST+2,sp)
 500  008d a111          	cp	a,#17
 501  008f 2603          	jrne	L02
 502  0091               L22:
 503  0091 4f            	clr	a
 504  0092 2010          	jra	L42
 505  0094               L02:
 506  0094 ae006b        	ldw	x,#107
 507  0097 89            	pushw	x
 508  0098 ae0000        	ldw	x,#0
 509  009b 89            	pushw	x
 510  009c ae0000        	ldw	x,#L502
 511  009f cd0000        	call	_assert_failed
 513  00a2 5b04          	addw	sp,#4
 514  00a4               L42:
 515                     ; 108   assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
 517  00a4 0d08          	tnz	(OFST+7,sp)
 518  00a6 2706          	jreq	L03
 519  00a8 7b08          	ld	a,(OFST+7,sp)
 520  00aa a122          	cp	a,#34
 521  00ac 2603          	jrne	L62
 522  00ae               L03:
 523  00ae 4f            	clr	a
 524  00af 2010          	jra	L23
 525  00b1               L62:
 526  00b1 ae006c        	ldw	x,#108
 527  00b4 89            	pushw	x
 528  00b5 ae0000        	ldw	x,#0
 529  00b8 89            	pushw	x
 530  00b9 ae0000        	ldw	x,#L502
 531  00bc cd0000        	call	_assert_failed
 533  00bf 5b04          	addw	sp,#4
 534  00c1               L23:
 535                     ; 111   TIM3->CCER1 &= (uint8_t)(~( TIM3_CCER1_CC1E | TIM3_CCER1_CC1P));
 537  00c1 c65327        	ld	a,21287
 538  00c4 a4fc          	and	a,#252
 539  00c6 c75327        	ld	21287,a
 540                     ; 113   TIM3->CCER1 |= (uint8_t)((uint8_t)(TIM3_OutputState  & TIM3_CCER1_CC1E   ) | (uint8_t)(TIM3_OCPolarity   & TIM3_CCER1_CC1P   ));
 542  00c9 7b08          	ld	a,(OFST+7,sp)
 543  00cb a402          	and	a,#2
 544  00cd 6b01          	ld	(OFST+0,sp),a
 546  00cf 7b03          	ld	a,(OFST+2,sp)
 547  00d1 a401          	and	a,#1
 548  00d3 1a01          	or	a,(OFST+0,sp)
 549  00d5 ca5327        	or	a,21287
 550  00d8 c75327        	ld	21287,a
 551                     ; 116   TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
 553  00db c65325        	ld	a,21285
 554  00de a48f          	and	a,#143
 555  00e0 1a02          	or	a,(OFST+1,sp)
 556  00e2 c75325        	ld	21285,a
 557                     ; 119   TIM3->CCR1H = (uint8_t)(TIM3_Pulse >> 8);
 559  00e5 7b06          	ld	a,(OFST+5,sp)
 560  00e7 c7532d        	ld	21293,a
 561                     ; 120   TIM3->CCR1L = (uint8_t)(TIM3_Pulse);
 563  00ea 7b07          	ld	a,(OFST+6,sp)
 564  00ec c7532e        	ld	21294,a
 565                     ; 121 }
 568  00ef 5b03          	addw	sp,#3
 569  00f1 81            	ret
 634                     ; 131 void TIM3_OC2Init(TIM3_OCMode_TypeDef TIM3_OCMode,
 634                     ; 132                   TIM3_OutputState_TypeDef TIM3_OutputState,
 634                     ; 133                   uint16_t TIM3_Pulse,
 634                     ; 134                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
 634                     ; 135 {
 635                     	switch	.text
 636  00f2               _TIM3_OC2Init:
 638  00f2 89            	pushw	x
 639  00f3 88            	push	a
 640       00000001      OFST:	set	1
 643                     ; 137   assert_param(IS_TIM3_OC_MODE_OK(TIM3_OCMode));
 645  00f4 9e            	ld	a,xh
 646  00f5 4d            	tnz	a
 647  00f6 2719          	jreq	L04
 648  00f8 9e            	ld	a,xh
 649  00f9 a110          	cp	a,#16
 650  00fb 2714          	jreq	L04
 651  00fd 9e            	ld	a,xh
 652  00fe a120          	cp	a,#32
 653  0100 270f          	jreq	L04
 654  0102 9e            	ld	a,xh
 655  0103 a130          	cp	a,#48
 656  0105 270a          	jreq	L04
 657  0107 9e            	ld	a,xh
 658  0108 a160          	cp	a,#96
 659  010a 2705          	jreq	L04
 660  010c 9e            	ld	a,xh
 661  010d a170          	cp	a,#112
 662  010f 2603          	jrne	L63
 663  0111               L04:
 664  0111 4f            	clr	a
 665  0112 2010          	jra	L24
 666  0114               L63:
 667  0114 ae0089        	ldw	x,#137
 668  0117 89            	pushw	x
 669  0118 ae0000        	ldw	x,#0
 670  011b 89            	pushw	x
 671  011c ae0000        	ldw	x,#L502
 672  011f cd0000        	call	_assert_failed
 674  0122 5b04          	addw	sp,#4
 675  0124               L24:
 676                     ; 138   assert_param(IS_TIM3_OUTPUT_STATE_OK(TIM3_OutputState));
 678  0124 0d03          	tnz	(OFST+2,sp)
 679  0126 2706          	jreq	L64
 680  0128 7b03          	ld	a,(OFST+2,sp)
 681  012a a111          	cp	a,#17
 682  012c 2603          	jrne	L44
 683  012e               L64:
 684  012e 4f            	clr	a
 685  012f 2010          	jra	L05
 686  0131               L44:
 687  0131 ae008a        	ldw	x,#138
 688  0134 89            	pushw	x
 689  0135 ae0000        	ldw	x,#0
 690  0138 89            	pushw	x
 691  0139 ae0000        	ldw	x,#L502
 692  013c cd0000        	call	_assert_failed
 694  013f 5b04          	addw	sp,#4
 695  0141               L05:
 696                     ; 139   assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
 698  0141 0d08          	tnz	(OFST+7,sp)
 699  0143 2706          	jreq	L45
 700  0145 7b08          	ld	a,(OFST+7,sp)
 701  0147 a122          	cp	a,#34
 702  0149 2603          	jrne	L25
 703  014b               L45:
 704  014b 4f            	clr	a
 705  014c 2010          	jra	L65
 706  014e               L25:
 707  014e ae008b        	ldw	x,#139
 708  0151 89            	pushw	x
 709  0152 ae0000        	ldw	x,#0
 710  0155 89            	pushw	x
 711  0156 ae0000        	ldw	x,#L502
 712  0159 cd0000        	call	_assert_failed
 714  015c 5b04          	addw	sp,#4
 715  015e               L65:
 716                     ; 143   TIM3->CCER1 &= (uint8_t)(~( TIM3_CCER1_CC2E |  TIM3_CCER1_CC2P ));
 718  015e c65327        	ld	a,21287
 719  0161 a4cf          	and	a,#207
 720  0163 c75327        	ld	21287,a
 721                     ; 145   TIM3->CCER1 |= (uint8_t)((uint8_t)(TIM3_OutputState  & TIM3_CCER1_CC2E   ) | (uint8_t)(TIM3_OCPolarity   & TIM3_CCER1_CC2P ));
 723  0166 7b08          	ld	a,(OFST+7,sp)
 724  0168 a420          	and	a,#32
 725  016a 6b01          	ld	(OFST+0,sp),a
 727  016c 7b03          	ld	a,(OFST+2,sp)
 728  016e a410          	and	a,#16
 729  0170 1a01          	or	a,(OFST+0,sp)
 730  0172 ca5327        	or	a,21287
 731  0175 c75327        	ld	21287,a
 732                     ; 149   TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
 734  0178 c65326        	ld	a,21286
 735  017b a48f          	and	a,#143
 736  017d 1a02          	or	a,(OFST+1,sp)
 737  017f c75326        	ld	21286,a
 738                     ; 153   TIM3->CCR2H = (uint8_t)(TIM3_Pulse >> 8);
 740  0182 7b06          	ld	a,(OFST+5,sp)
 741  0184 c7532f        	ld	21295,a
 742                     ; 154   TIM3->CCR2L = (uint8_t)(TIM3_Pulse);
 744  0187 7b07          	ld	a,(OFST+6,sp)
 745  0189 c75330        	ld	21296,a
 746                     ; 155 }
 749  018c 5b03          	addw	sp,#3
 750  018e 81            	ret
 935                     ; 166 void TIM3_ICInit(TIM3_Channel_TypeDef TIM3_Channel,
 935                     ; 167                  TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
 935                     ; 168                  TIM3_ICSelection_TypeDef TIM3_ICSelection,
 935                     ; 169                  TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
 935                     ; 170                  uint8_t TIM3_ICFilter)
 935                     ; 171 {
 936                     	switch	.text
 937  018f               _TIM3_ICInit:
 939  018f 89            	pushw	x
 940       00000000      OFST:	set	0
 943                     ; 173   assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
 945  0190 9e            	ld	a,xh
 946  0191 4d            	tnz	a
 947  0192 2705          	jreq	L46
 948  0194 9e            	ld	a,xh
 949  0195 a101          	cp	a,#1
 950  0197 2603          	jrne	L26
 951  0199               L46:
 952  0199 4f            	clr	a
 953  019a 2010          	jra	L66
 954  019c               L26:
 955  019c ae00ad        	ldw	x,#173
 956  019f 89            	pushw	x
 957  01a0 ae0000        	ldw	x,#0
 958  01a3 89            	pushw	x
 959  01a4 ae0000        	ldw	x,#L502
 960  01a7 cd0000        	call	_assert_failed
 962  01aa 5b04          	addw	sp,#4
 963  01ac               L66:
 964                     ; 174   assert_param(IS_TIM3_IC_POLARITY_OK(TIM3_ICPolarity));
 966  01ac 0d02          	tnz	(OFST+2,sp)
 967  01ae 2706          	jreq	L27
 968  01b0 7b02          	ld	a,(OFST+2,sp)
 969  01b2 a144          	cp	a,#68
 970  01b4 2603          	jrne	L07
 971  01b6               L27:
 972  01b6 4f            	clr	a
 973  01b7 2010          	jra	L47
 974  01b9               L07:
 975  01b9 ae00ae        	ldw	x,#174
 976  01bc 89            	pushw	x
 977  01bd ae0000        	ldw	x,#0
 978  01c0 89            	pushw	x
 979  01c1 ae0000        	ldw	x,#L502
 980  01c4 cd0000        	call	_assert_failed
 982  01c7 5b04          	addw	sp,#4
 983  01c9               L47:
 984                     ; 175   assert_param(IS_TIM3_IC_SELECTION_OK(TIM3_ICSelection));
 986  01c9 7b05          	ld	a,(OFST+5,sp)
 987  01cb a101          	cp	a,#1
 988  01cd 270c          	jreq	L001
 989  01cf 7b05          	ld	a,(OFST+5,sp)
 990  01d1 a102          	cp	a,#2
 991  01d3 2706          	jreq	L001
 992  01d5 7b05          	ld	a,(OFST+5,sp)
 993  01d7 a103          	cp	a,#3
 994  01d9 2603          	jrne	L67
 995  01db               L001:
 996  01db 4f            	clr	a
 997  01dc 2010          	jra	L201
 998  01de               L67:
 999  01de ae00af        	ldw	x,#175
1000  01e1 89            	pushw	x
1001  01e2 ae0000        	ldw	x,#0
1002  01e5 89            	pushw	x
1003  01e6 ae0000        	ldw	x,#L502
1004  01e9 cd0000        	call	_assert_failed
1006  01ec 5b04          	addw	sp,#4
1007  01ee               L201:
1008                     ; 176   assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_ICPrescaler));
1010  01ee 0d06          	tnz	(OFST+6,sp)
1011  01f0 2712          	jreq	L601
1012  01f2 7b06          	ld	a,(OFST+6,sp)
1013  01f4 a104          	cp	a,#4
1014  01f6 270c          	jreq	L601
1015  01f8 7b06          	ld	a,(OFST+6,sp)
1016  01fa a108          	cp	a,#8
1017  01fc 2706          	jreq	L601
1018  01fe 7b06          	ld	a,(OFST+6,sp)
1019  0200 a10c          	cp	a,#12
1020  0202 2603          	jrne	L401
1021  0204               L601:
1022  0204 4f            	clr	a
1023  0205 2010          	jra	L011
1024  0207               L401:
1025  0207 ae00b0        	ldw	x,#176
1026  020a 89            	pushw	x
1027  020b ae0000        	ldw	x,#0
1028  020e 89            	pushw	x
1029  020f ae0000        	ldw	x,#L502
1030  0212 cd0000        	call	_assert_failed
1032  0215 5b04          	addw	sp,#4
1033  0217               L011:
1034                     ; 177   assert_param(IS_TIM3_IC_FILTER_OK(TIM3_ICFilter));
1036  0217 7b07          	ld	a,(OFST+7,sp)
1037  0219 a110          	cp	a,#16
1038  021b 2403          	jruge	L211
1039  021d 4f            	clr	a
1040  021e 2010          	jra	L411
1041  0220               L211:
1042  0220 ae00b1        	ldw	x,#177
1043  0223 89            	pushw	x
1044  0224 ae0000        	ldw	x,#0
1045  0227 89            	pushw	x
1046  0228 ae0000        	ldw	x,#L502
1047  022b cd0000        	call	_assert_failed
1049  022e 5b04          	addw	sp,#4
1050  0230               L411:
1051                     ; 179   if (TIM3_Channel != TIM3_CHANNEL_2)
1053  0230 7b01          	ld	a,(OFST+1,sp)
1054  0232 a101          	cp	a,#1
1055  0234 2714          	jreq	L543
1056                     ; 182     TI1_Config((uint8_t)TIM3_ICPolarity,
1056                     ; 183                (uint8_t)TIM3_ICSelection,
1056                     ; 184                (uint8_t)TIM3_ICFilter);
1058  0236 7b07          	ld	a,(OFST+7,sp)
1059  0238 88            	push	a
1060  0239 7b06          	ld	a,(OFST+6,sp)
1061  023b 97            	ld	xl,a
1062  023c 7b03          	ld	a,(OFST+3,sp)
1063  023e 95            	ld	xh,a
1064  023f cd08e9        	call	L3_TI1_Config
1066  0242 84            	pop	a
1067                     ; 187     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1069  0243 7b06          	ld	a,(OFST+6,sp)
1070  0245 cd073a        	call	_TIM3_SetIC1Prescaler
1073  0248 2012          	jra	L743
1074  024a               L543:
1075                     ; 192     TI2_Config((uint8_t)TIM3_ICPolarity,
1075                     ; 193                (uint8_t)TIM3_ICSelection,
1075                     ; 194                (uint8_t)TIM3_ICFilter);
1077  024a 7b07          	ld	a,(OFST+7,sp)
1078  024c 88            	push	a
1079  024d 7b06          	ld	a,(OFST+6,sp)
1080  024f 97            	ld	xl,a
1081  0250 7b03          	ld	a,(OFST+3,sp)
1082  0252 95            	ld	xh,a
1083  0253 cd0919        	call	L5_TI2_Config
1085  0256 84            	pop	a
1086                     ; 197     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1088  0257 7b06          	ld	a,(OFST+6,sp)
1089  0259 cd0769        	call	_TIM3_SetIC2Prescaler
1091  025c               L743:
1092                     ; 199 }
1095  025c 85            	popw	x
1096  025d 81            	ret
1193                     ; 210 void TIM3_PWMIConfig(TIM3_Channel_TypeDef TIM3_Channel,
1193                     ; 211                      TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
1193                     ; 212                      TIM3_ICSelection_TypeDef TIM3_ICSelection,
1193                     ; 213                      TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
1193                     ; 214                      uint8_t TIM3_ICFilter)
1193                     ; 215 {
1194                     	switch	.text
1195  025e               _TIM3_PWMIConfig:
1197  025e 89            	pushw	x
1198  025f 89            	pushw	x
1199       00000002      OFST:	set	2
1202                     ; 216   uint8_t icpolarity = (uint8_t)TIM3_ICPOLARITY_RISING;
1204                     ; 217   uint8_t icselection = (uint8_t)TIM3_ICSELECTION_DIRECTTI;
1206                     ; 220   assert_param(IS_TIM3_PWMI_CHANNEL_OK(TIM3_Channel));
1208  0260 9e            	ld	a,xh
1209  0261 4d            	tnz	a
1210  0262 2705          	jreq	L221
1211  0264 9e            	ld	a,xh
1212  0265 a101          	cp	a,#1
1213  0267 2603          	jrne	L021
1214  0269               L221:
1215  0269 4f            	clr	a
1216  026a 2010          	jra	L421
1217  026c               L021:
1218  026c ae00dc        	ldw	x,#220
1219  026f 89            	pushw	x
1220  0270 ae0000        	ldw	x,#0
1221  0273 89            	pushw	x
1222  0274 ae0000        	ldw	x,#L502
1223  0277 cd0000        	call	_assert_failed
1225  027a 5b04          	addw	sp,#4
1226  027c               L421:
1227                     ; 221   assert_param(IS_TIM3_IC_POLARITY_OK(TIM3_ICPolarity));
1229  027c 0d04          	tnz	(OFST+2,sp)
1230  027e 2706          	jreq	L031
1231  0280 7b04          	ld	a,(OFST+2,sp)
1232  0282 a144          	cp	a,#68
1233  0284 2603          	jrne	L621
1234  0286               L031:
1235  0286 4f            	clr	a
1236  0287 2010          	jra	L231
1237  0289               L621:
1238  0289 ae00dd        	ldw	x,#221
1239  028c 89            	pushw	x
1240  028d ae0000        	ldw	x,#0
1241  0290 89            	pushw	x
1242  0291 ae0000        	ldw	x,#L502
1243  0294 cd0000        	call	_assert_failed
1245  0297 5b04          	addw	sp,#4
1246  0299               L231:
1247                     ; 222   assert_param(IS_TIM3_IC_SELECTION_OK(TIM3_ICSelection));
1249  0299 7b07          	ld	a,(OFST+5,sp)
1250  029b a101          	cp	a,#1
1251  029d 270c          	jreq	L631
1252  029f 7b07          	ld	a,(OFST+5,sp)
1253  02a1 a102          	cp	a,#2
1254  02a3 2706          	jreq	L631
1255  02a5 7b07          	ld	a,(OFST+5,sp)
1256  02a7 a103          	cp	a,#3
1257  02a9 2603          	jrne	L431
1258  02ab               L631:
1259  02ab 4f            	clr	a
1260  02ac 2010          	jra	L041
1261  02ae               L431:
1262  02ae ae00de        	ldw	x,#222
1263  02b1 89            	pushw	x
1264  02b2 ae0000        	ldw	x,#0
1265  02b5 89            	pushw	x
1266  02b6 ae0000        	ldw	x,#L502
1267  02b9 cd0000        	call	_assert_failed
1269  02bc 5b04          	addw	sp,#4
1270  02be               L041:
1271                     ; 223   assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_ICPrescaler));
1273  02be 0d08          	tnz	(OFST+6,sp)
1274  02c0 2712          	jreq	L441
1275  02c2 7b08          	ld	a,(OFST+6,sp)
1276  02c4 a104          	cp	a,#4
1277  02c6 270c          	jreq	L441
1278  02c8 7b08          	ld	a,(OFST+6,sp)
1279  02ca a108          	cp	a,#8
1280  02cc 2706          	jreq	L441
1281  02ce 7b08          	ld	a,(OFST+6,sp)
1282  02d0 a10c          	cp	a,#12
1283  02d2 2603          	jrne	L241
1284  02d4               L441:
1285  02d4 4f            	clr	a
1286  02d5 2010          	jra	L641
1287  02d7               L241:
1288  02d7 ae00df        	ldw	x,#223
1289  02da 89            	pushw	x
1290  02db ae0000        	ldw	x,#0
1291  02de 89            	pushw	x
1292  02df ae0000        	ldw	x,#L502
1293  02e2 cd0000        	call	_assert_failed
1295  02e5 5b04          	addw	sp,#4
1296  02e7               L641:
1297                     ; 226   if (TIM3_ICPolarity != TIM3_ICPOLARITY_FALLING)
1299  02e7 7b04          	ld	a,(OFST+2,sp)
1300  02e9 a144          	cp	a,#68
1301  02eb 2706          	jreq	L714
1302                     ; 228     icpolarity = (uint8_t)TIM3_ICPOLARITY_FALLING;
1304  02ed a644          	ld	a,#68
1305  02ef 6b01          	ld	(OFST-1,sp),a
1308  02f1 2002          	jra	L124
1309  02f3               L714:
1310                     ; 232     icpolarity = (uint8_t)TIM3_ICPOLARITY_RISING;
1312  02f3 0f01          	clr	(OFST-1,sp)
1314  02f5               L124:
1315                     ; 236   if (TIM3_ICSelection == TIM3_ICSELECTION_DIRECTTI)
1317  02f5 7b07          	ld	a,(OFST+5,sp)
1318  02f7 a101          	cp	a,#1
1319  02f9 2606          	jrne	L324
1320                     ; 238     icselection = (uint8_t)TIM3_ICSELECTION_INDIRECTTI;
1322  02fb a602          	ld	a,#2
1323  02fd 6b02          	ld	(OFST+0,sp),a
1326  02ff 2004          	jra	L524
1327  0301               L324:
1328                     ; 242     icselection = (uint8_t)TIM3_ICSELECTION_DIRECTTI;
1330  0301 a601          	ld	a,#1
1331  0303 6b02          	ld	(OFST+0,sp),a
1333  0305               L524:
1334                     ; 245   if (TIM3_Channel != TIM3_CHANNEL_2)
1336  0305 7b03          	ld	a,(OFST+1,sp)
1337  0307 a101          	cp	a,#1
1338  0309 2726          	jreq	L724
1339                     ; 248     TI1_Config((uint8_t)TIM3_ICPolarity, (uint8_t)TIM3_ICSelection,
1339                     ; 249                (uint8_t)TIM3_ICFilter);
1341  030b 7b09          	ld	a,(OFST+7,sp)
1342  030d 88            	push	a
1343  030e 7b08          	ld	a,(OFST+6,sp)
1344  0310 97            	ld	xl,a
1345  0311 7b05          	ld	a,(OFST+3,sp)
1346  0313 95            	ld	xh,a
1347  0314 cd08e9        	call	L3_TI1_Config
1349  0317 84            	pop	a
1350                     ; 252     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1352  0318 7b08          	ld	a,(OFST+6,sp)
1353  031a cd073a        	call	_TIM3_SetIC1Prescaler
1355                     ; 255     TI2_Config(icpolarity, icselection, TIM3_ICFilter);
1357  031d 7b09          	ld	a,(OFST+7,sp)
1358  031f 88            	push	a
1359  0320 7b03          	ld	a,(OFST+1,sp)
1360  0322 97            	ld	xl,a
1361  0323 7b02          	ld	a,(OFST+0,sp)
1362  0325 95            	ld	xh,a
1363  0326 cd0919        	call	L5_TI2_Config
1365  0329 84            	pop	a
1366                     ; 258     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1368  032a 7b08          	ld	a,(OFST+6,sp)
1369  032c cd0769        	call	_TIM3_SetIC2Prescaler
1372  032f 2024          	jra	L134
1373  0331               L724:
1374                     ; 263     TI2_Config((uint8_t)TIM3_ICPolarity, (uint8_t)TIM3_ICSelection,
1374                     ; 264                (uint8_t)TIM3_ICFilter);
1376  0331 7b09          	ld	a,(OFST+7,sp)
1377  0333 88            	push	a
1378  0334 7b08          	ld	a,(OFST+6,sp)
1379  0336 97            	ld	xl,a
1380  0337 7b05          	ld	a,(OFST+3,sp)
1381  0339 95            	ld	xh,a
1382  033a cd0919        	call	L5_TI2_Config
1384  033d 84            	pop	a
1385                     ; 267     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1387  033e 7b08          	ld	a,(OFST+6,sp)
1388  0340 cd0769        	call	_TIM3_SetIC2Prescaler
1390                     ; 270     TI1_Config(icpolarity, icselection, TIM3_ICFilter);
1392  0343 7b09          	ld	a,(OFST+7,sp)
1393  0345 88            	push	a
1394  0346 7b03          	ld	a,(OFST+1,sp)
1395  0348 97            	ld	xl,a
1396  0349 7b02          	ld	a,(OFST+0,sp)
1397  034b 95            	ld	xh,a
1398  034c cd08e9        	call	L3_TI1_Config
1400  034f 84            	pop	a
1401                     ; 273     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1403  0350 7b08          	ld	a,(OFST+6,sp)
1404  0352 cd073a        	call	_TIM3_SetIC1Prescaler
1406  0355               L134:
1407                     ; 275 }
1410  0355 5b04          	addw	sp,#4
1411  0357 81            	ret
1467                     ; 283 void TIM3_Cmd(FunctionalState NewState)
1467                     ; 284 {
1468                     	switch	.text
1469  0358               _TIM3_Cmd:
1471  0358 88            	push	a
1472       00000000      OFST:	set	0
1475                     ; 286   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1477  0359 4d            	tnz	a
1478  035a 2704          	jreq	L451
1479  035c a101          	cp	a,#1
1480  035e 2603          	jrne	L251
1481  0360               L451:
1482  0360 4f            	clr	a
1483  0361 2010          	jra	L651
1484  0363               L251:
1485  0363 ae011e        	ldw	x,#286
1486  0366 89            	pushw	x
1487  0367 ae0000        	ldw	x,#0
1488  036a 89            	pushw	x
1489  036b ae0000        	ldw	x,#L502
1490  036e cd0000        	call	_assert_failed
1492  0371 5b04          	addw	sp,#4
1493  0373               L651:
1494                     ; 289   if (NewState != DISABLE)
1496  0373 0d01          	tnz	(OFST+1,sp)
1497  0375 2706          	jreq	L164
1498                     ; 291     TIM3->CR1 |= (uint8_t)TIM3_CR1_CEN;
1500  0377 72105320      	bset	21280,#0
1502  037b 2004          	jra	L364
1503  037d               L164:
1504                     ; 295     TIM3->CR1 &= (uint8_t)(~TIM3_CR1_CEN);
1506  037d 72115320      	bres	21280,#0
1507  0381               L364:
1508                     ; 297 }
1511  0381 84            	pop	a
1512  0382 81            	ret
1585                     ; 311 void TIM3_ITConfig(TIM3_IT_TypeDef TIM3_IT, FunctionalState NewState)
1585                     ; 312 {
1586                     	switch	.text
1587  0383               _TIM3_ITConfig:
1589  0383 89            	pushw	x
1590       00000000      OFST:	set	0
1593                     ; 314   assert_param(IS_TIM3_IT_OK(TIM3_IT));
1595  0384 9e            	ld	a,xh
1596  0385 4d            	tnz	a
1597  0386 2708          	jreq	L261
1598  0388 9e            	ld	a,xh
1599  0389 a108          	cp	a,#8
1600  038b 2403          	jruge	L261
1601  038d 4f            	clr	a
1602  038e 2010          	jra	L461
1603  0390               L261:
1604  0390 ae013a        	ldw	x,#314
1605  0393 89            	pushw	x
1606  0394 ae0000        	ldw	x,#0
1607  0397 89            	pushw	x
1608  0398 ae0000        	ldw	x,#L502
1609  039b cd0000        	call	_assert_failed
1611  039e 5b04          	addw	sp,#4
1612  03a0               L461:
1613                     ; 315   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1615  03a0 0d02          	tnz	(OFST+2,sp)
1616  03a2 2706          	jreq	L071
1617  03a4 7b02          	ld	a,(OFST+2,sp)
1618  03a6 a101          	cp	a,#1
1619  03a8 2603          	jrne	L661
1620  03aa               L071:
1621  03aa 4f            	clr	a
1622  03ab 2010          	jra	L271
1623  03ad               L661:
1624  03ad ae013b        	ldw	x,#315
1625  03b0 89            	pushw	x
1626  03b1 ae0000        	ldw	x,#0
1627  03b4 89            	pushw	x
1628  03b5 ae0000        	ldw	x,#L502
1629  03b8 cd0000        	call	_assert_failed
1631  03bb 5b04          	addw	sp,#4
1632  03bd               L271:
1633                     ; 317   if (NewState != DISABLE)
1635  03bd 0d02          	tnz	(OFST+2,sp)
1636  03bf 270a          	jreq	L125
1637                     ; 320     TIM3->IER |= (uint8_t)TIM3_IT;
1639  03c1 c65321        	ld	a,21281
1640  03c4 1a01          	or	a,(OFST+1,sp)
1641  03c6 c75321        	ld	21281,a
1643  03c9 2009          	jra	L325
1644  03cb               L125:
1645                     ; 325     TIM3->IER &= (uint8_t)(~TIM3_IT);
1647  03cb 7b01          	ld	a,(OFST+1,sp)
1648  03cd 43            	cpl	a
1649  03ce c45321        	and	a,21281
1650  03d1 c75321        	ld	21281,a
1651  03d4               L325:
1652                     ; 327 }
1655  03d4 85            	popw	x
1656  03d5 81            	ret
1693                     ; 335 void TIM3_UpdateDisableConfig(FunctionalState NewState)
1693                     ; 336 {
1694                     	switch	.text
1695  03d6               _TIM3_UpdateDisableConfig:
1697  03d6 88            	push	a
1698       00000000      OFST:	set	0
1701                     ; 338   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1703  03d7 4d            	tnz	a
1704  03d8 2704          	jreq	L002
1705  03da a101          	cp	a,#1
1706  03dc 2603          	jrne	L671
1707  03de               L002:
1708  03de 4f            	clr	a
1709  03df 2010          	jra	L202
1710  03e1               L671:
1711  03e1 ae0152        	ldw	x,#338
1712  03e4 89            	pushw	x
1713  03e5 ae0000        	ldw	x,#0
1714  03e8 89            	pushw	x
1715  03e9 ae0000        	ldw	x,#L502
1716  03ec cd0000        	call	_assert_failed
1718  03ef 5b04          	addw	sp,#4
1719  03f1               L202:
1720                     ; 341   if (NewState != DISABLE)
1722  03f1 0d01          	tnz	(OFST+1,sp)
1723  03f3 2706          	jreq	L345
1724                     ; 343     TIM3->CR1 |= TIM3_CR1_UDIS;
1726  03f5 72125320      	bset	21280,#1
1728  03f9 2004          	jra	L545
1729  03fb               L345:
1730                     ; 347     TIM3->CR1 &= (uint8_t)(~TIM3_CR1_UDIS);
1732  03fb 72135320      	bres	21280,#1
1733  03ff               L545:
1734                     ; 349 }
1737  03ff 84            	pop	a
1738  0400 81            	ret
1797                     ; 359 void TIM3_UpdateRequestConfig(TIM3_UpdateSource_TypeDef TIM3_UpdateSource)
1797                     ; 360 {
1798                     	switch	.text
1799  0401               _TIM3_UpdateRequestConfig:
1801  0401 88            	push	a
1802       00000000      OFST:	set	0
1805                     ; 362   assert_param(IS_TIM3_UPDATE_SOURCE_OK(TIM3_UpdateSource));
1807  0402 4d            	tnz	a
1808  0403 2704          	jreq	L012
1809  0405 a101          	cp	a,#1
1810  0407 2603          	jrne	L602
1811  0409               L012:
1812  0409 4f            	clr	a
1813  040a 2010          	jra	L212
1814  040c               L602:
1815  040c ae016a        	ldw	x,#362
1816  040f 89            	pushw	x
1817  0410 ae0000        	ldw	x,#0
1818  0413 89            	pushw	x
1819  0414 ae0000        	ldw	x,#L502
1820  0417 cd0000        	call	_assert_failed
1822  041a 5b04          	addw	sp,#4
1823  041c               L212:
1824                     ; 365   if (TIM3_UpdateSource != TIM3_UPDATESOURCE_GLOBAL)
1826  041c 0d01          	tnz	(OFST+1,sp)
1827  041e 2706          	jreq	L575
1828                     ; 367     TIM3->CR1 |= TIM3_CR1_URS;
1830  0420 72145320      	bset	21280,#2
1832  0424 2004          	jra	L775
1833  0426               L575:
1834                     ; 371     TIM3->CR1 &= (uint8_t)(~TIM3_CR1_URS);
1836  0426 72155320      	bres	21280,#2
1837  042a               L775:
1838                     ; 373 }
1841  042a 84            	pop	a
1842  042b 81            	ret
1900                     ; 383 void TIM3_SelectOnePulseMode(TIM3_OPMode_TypeDef TIM3_OPMode)
1900                     ; 384 {
1901                     	switch	.text
1902  042c               _TIM3_SelectOnePulseMode:
1904  042c 88            	push	a
1905       00000000      OFST:	set	0
1908                     ; 386   assert_param(IS_TIM3_OPM_MODE_OK(TIM3_OPMode));
1910  042d a101          	cp	a,#1
1911  042f 2703          	jreq	L022
1912  0431 4d            	tnz	a
1913  0432 2603          	jrne	L612
1914  0434               L022:
1915  0434 4f            	clr	a
1916  0435 2010          	jra	L222
1917  0437               L612:
1918  0437 ae0182        	ldw	x,#386
1919  043a 89            	pushw	x
1920  043b ae0000        	ldw	x,#0
1921  043e 89            	pushw	x
1922  043f ae0000        	ldw	x,#L502
1923  0442 cd0000        	call	_assert_failed
1925  0445 5b04          	addw	sp,#4
1926  0447               L222:
1927                     ; 389   if (TIM3_OPMode != TIM3_OPMODE_REPETITIVE)
1929  0447 0d01          	tnz	(OFST+1,sp)
1930  0449 2706          	jreq	L726
1931                     ; 391     TIM3->CR1 |= TIM3_CR1_OPM;
1933  044b 72165320      	bset	21280,#3
1935  044f 2004          	jra	L136
1936  0451               L726:
1937                     ; 395     TIM3->CR1 &= (uint8_t)(~TIM3_CR1_OPM);
1939  0451 72175320      	bres	21280,#3
1940  0455               L136:
1941                     ; 397 }
1944  0455 84            	pop	a
1945  0456 81            	ret
2014                     ; 427 void TIM3_PrescalerConfig(TIM3_Prescaler_TypeDef Prescaler,
2014                     ; 428                           TIM3_PSCReloadMode_TypeDef TIM3_PSCReloadMode)
2014                     ; 429 {
2015                     	switch	.text
2016  0457               _TIM3_PrescalerConfig:
2018  0457 89            	pushw	x
2019       00000000      OFST:	set	0
2022                     ; 431   assert_param(IS_TIM3_PRESCALER_RELOAD_OK(TIM3_PSCReloadMode));
2024  0458 9f            	ld	a,xl
2025  0459 4d            	tnz	a
2026  045a 2705          	jreq	L032
2027  045c 9f            	ld	a,xl
2028  045d a101          	cp	a,#1
2029  045f 2603          	jrne	L622
2030  0461               L032:
2031  0461 4f            	clr	a
2032  0462 2010          	jra	L232
2033  0464               L622:
2034  0464 ae01af        	ldw	x,#431
2035  0467 89            	pushw	x
2036  0468 ae0000        	ldw	x,#0
2037  046b 89            	pushw	x
2038  046c ae0000        	ldw	x,#L502
2039  046f cd0000        	call	_assert_failed
2041  0472 5b04          	addw	sp,#4
2042  0474               L232:
2043                     ; 432   assert_param(IS_TIM3_PRESCALER_OK(Prescaler));
2045  0474 0d01          	tnz	(OFST+1,sp)
2046  0476 275a          	jreq	L632
2047  0478 7b01          	ld	a,(OFST+1,sp)
2048  047a a101          	cp	a,#1
2049  047c 2754          	jreq	L632
2050  047e 7b01          	ld	a,(OFST+1,sp)
2051  0480 a102          	cp	a,#2
2052  0482 274e          	jreq	L632
2053  0484 7b01          	ld	a,(OFST+1,sp)
2054  0486 a103          	cp	a,#3
2055  0488 2748          	jreq	L632
2056  048a 7b01          	ld	a,(OFST+1,sp)
2057  048c a104          	cp	a,#4
2058  048e 2742          	jreq	L632
2059  0490 7b01          	ld	a,(OFST+1,sp)
2060  0492 a105          	cp	a,#5
2061  0494 273c          	jreq	L632
2062  0496 7b01          	ld	a,(OFST+1,sp)
2063  0498 a106          	cp	a,#6
2064  049a 2736          	jreq	L632
2065  049c 7b01          	ld	a,(OFST+1,sp)
2066  049e a107          	cp	a,#7
2067  04a0 2730          	jreq	L632
2068  04a2 7b01          	ld	a,(OFST+1,sp)
2069  04a4 a108          	cp	a,#8
2070  04a6 272a          	jreq	L632
2071  04a8 7b01          	ld	a,(OFST+1,sp)
2072  04aa a109          	cp	a,#9
2073  04ac 2724          	jreq	L632
2074  04ae 7b01          	ld	a,(OFST+1,sp)
2075  04b0 a10a          	cp	a,#10
2076  04b2 271e          	jreq	L632
2077  04b4 7b01          	ld	a,(OFST+1,sp)
2078  04b6 a10b          	cp	a,#11
2079  04b8 2718          	jreq	L632
2080  04ba 7b01          	ld	a,(OFST+1,sp)
2081  04bc a10c          	cp	a,#12
2082  04be 2712          	jreq	L632
2083  04c0 7b01          	ld	a,(OFST+1,sp)
2084  04c2 a10d          	cp	a,#13
2085  04c4 270c          	jreq	L632
2086  04c6 7b01          	ld	a,(OFST+1,sp)
2087  04c8 a10e          	cp	a,#14
2088  04ca 2706          	jreq	L632
2089  04cc 7b01          	ld	a,(OFST+1,sp)
2090  04ce a10f          	cp	a,#15
2091  04d0 2603          	jrne	L432
2092  04d2               L632:
2093  04d2 4f            	clr	a
2094  04d3 2010          	jra	L042
2095  04d5               L432:
2096  04d5 ae01b0        	ldw	x,#432
2097  04d8 89            	pushw	x
2098  04d9 ae0000        	ldw	x,#0
2099  04dc 89            	pushw	x
2100  04dd ae0000        	ldw	x,#L502
2101  04e0 cd0000        	call	_assert_failed
2103  04e3 5b04          	addw	sp,#4
2104  04e5               L042:
2105                     ; 435   TIM3->PSCR = (uint8_t)Prescaler;
2107  04e5 7b01          	ld	a,(OFST+1,sp)
2108  04e7 c7532a        	ld	21290,a
2109                     ; 438   TIM3->EGR = (uint8_t)TIM3_PSCReloadMode;
2111  04ea 7b02          	ld	a,(OFST+2,sp)
2112  04ec c75324        	ld	21284,a
2113                     ; 439 }
2116  04ef 85            	popw	x
2117  04f0 81            	ret
2176                     ; 450 void TIM3_ForcedOC1Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
2176                     ; 451 {
2177                     	switch	.text
2178  04f1               _TIM3_ForcedOC1Config:
2180  04f1 88            	push	a
2181       00000000      OFST:	set	0
2184                     ; 453   assert_param(IS_TIM3_FORCED_ACTION_OK(TIM3_ForcedAction));
2186  04f2 a150          	cp	a,#80
2187  04f4 2704          	jreq	L642
2188  04f6 a140          	cp	a,#64
2189  04f8 2603          	jrne	L442
2190  04fa               L642:
2191  04fa 4f            	clr	a
2192  04fb 2010          	jra	L052
2193  04fd               L442:
2194  04fd ae01c5        	ldw	x,#453
2195  0500 89            	pushw	x
2196  0501 ae0000        	ldw	x,#0
2197  0504 89            	pushw	x
2198  0505 ae0000        	ldw	x,#L502
2199  0508 cd0000        	call	_assert_failed
2201  050b 5b04          	addw	sp,#4
2202  050d               L052:
2203                     ; 456   TIM3->CCMR1 =  (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_OCM))  | (uint8_t)TIM3_ForcedAction);
2205  050d c65325        	ld	a,21285
2206  0510 a48f          	and	a,#143
2207  0512 1a01          	or	a,(OFST+1,sp)
2208  0514 c75325        	ld	21285,a
2209                     ; 457 }
2212  0517 84            	pop	a
2213  0518 81            	ret
2250                     ; 468 void TIM3_ForcedOC2Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
2250                     ; 469 {
2251                     	switch	.text
2252  0519               _TIM3_ForcedOC2Config:
2254  0519 88            	push	a
2255       00000000      OFST:	set	0
2258                     ; 471   assert_param(IS_TIM3_FORCED_ACTION_OK(TIM3_ForcedAction));
2260  051a a150          	cp	a,#80
2261  051c 2704          	jreq	L652
2262  051e a140          	cp	a,#64
2263  0520 2603          	jrne	L452
2264  0522               L652:
2265  0522 4f            	clr	a
2266  0523 2010          	jra	L062
2267  0525               L452:
2268  0525 ae01d7        	ldw	x,#471
2269  0528 89            	pushw	x
2270  0529 ae0000        	ldw	x,#0
2271  052c 89            	pushw	x
2272  052d ae0000        	ldw	x,#L502
2273  0530 cd0000        	call	_assert_failed
2275  0533 5b04          	addw	sp,#4
2276  0535               L062:
2277                     ; 474   TIM3->CCMR2 =  (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_ForcedAction);
2279  0535 c65326        	ld	a,21286
2280  0538 a48f          	and	a,#143
2281  053a 1a01          	or	a,(OFST+1,sp)
2282  053c c75326        	ld	21286,a
2283                     ; 475 }
2286  053f 84            	pop	a
2287  0540 81            	ret
2324                     ; 483 void TIM3_ARRPreloadConfig(FunctionalState NewState)
2324                     ; 484 {
2325                     	switch	.text
2326  0541               _TIM3_ARRPreloadConfig:
2328  0541 88            	push	a
2329       00000000      OFST:	set	0
2332                     ; 486   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2334  0542 4d            	tnz	a
2335  0543 2704          	jreq	L662
2336  0545 a101          	cp	a,#1
2337  0547 2603          	jrne	L462
2338  0549               L662:
2339  0549 4f            	clr	a
2340  054a 2010          	jra	L072
2341  054c               L462:
2342  054c ae01e6        	ldw	x,#486
2343  054f 89            	pushw	x
2344  0550 ae0000        	ldw	x,#0
2345  0553 89            	pushw	x
2346  0554 ae0000        	ldw	x,#L502
2347  0557 cd0000        	call	_assert_failed
2349  055a 5b04          	addw	sp,#4
2350  055c               L072:
2351                     ; 489   if (NewState != DISABLE)
2353  055c 0d01          	tnz	(OFST+1,sp)
2354  055e 2706          	jreq	L747
2355                     ; 491     TIM3->CR1 |= TIM3_CR1_ARPE;
2357  0560 721e5320      	bset	21280,#7
2359  0564 2004          	jra	L157
2360  0566               L747:
2361                     ; 495     TIM3->CR1 &= (uint8_t)(~TIM3_CR1_ARPE);
2363  0566 721f5320      	bres	21280,#7
2364  056a               L157:
2365                     ; 497 }
2368  056a 84            	pop	a
2369  056b 81            	ret
2406                     ; 505 void TIM3_OC1PreloadConfig(FunctionalState NewState)
2406                     ; 506 {
2407                     	switch	.text
2408  056c               _TIM3_OC1PreloadConfig:
2410  056c 88            	push	a
2411       00000000      OFST:	set	0
2414                     ; 508   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2416  056d 4d            	tnz	a
2417  056e 2704          	jreq	L672
2418  0570 a101          	cp	a,#1
2419  0572 2603          	jrne	L472
2420  0574               L672:
2421  0574 4f            	clr	a
2422  0575 2010          	jra	L003
2423  0577               L472:
2424  0577 ae01fc        	ldw	x,#508
2425  057a 89            	pushw	x
2426  057b ae0000        	ldw	x,#0
2427  057e 89            	pushw	x
2428  057f ae0000        	ldw	x,#L502
2429  0582 cd0000        	call	_assert_failed
2431  0585 5b04          	addw	sp,#4
2432  0587               L003:
2433                     ; 511   if (NewState != DISABLE)
2435  0587 0d01          	tnz	(OFST+1,sp)
2436  0589 2706          	jreq	L177
2437                     ; 513     TIM3->CCMR1 |= TIM3_CCMR_OCxPE;
2439  058b 72165325      	bset	21285,#3
2441  058f 2004          	jra	L377
2442  0591               L177:
2443                     ; 517     TIM3->CCMR1 &= (uint8_t)(~TIM3_CCMR_OCxPE);
2445  0591 72175325      	bres	21285,#3
2446  0595               L377:
2447                     ; 519 }
2450  0595 84            	pop	a
2451  0596 81            	ret
2488                     ; 527 void TIM3_OC2PreloadConfig(FunctionalState NewState)
2488                     ; 528 {
2489                     	switch	.text
2490  0597               _TIM3_OC2PreloadConfig:
2492  0597 88            	push	a
2493       00000000      OFST:	set	0
2496                     ; 530   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2498  0598 4d            	tnz	a
2499  0599 2704          	jreq	L603
2500  059b a101          	cp	a,#1
2501  059d 2603          	jrne	L403
2502  059f               L603:
2503  059f 4f            	clr	a
2504  05a0 2010          	jra	L013
2505  05a2               L403:
2506  05a2 ae0212        	ldw	x,#530
2507  05a5 89            	pushw	x
2508  05a6 ae0000        	ldw	x,#0
2509  05a9 89            	pushw	x
2510  05aa ae0000        	ldw	x,#L502
2511  05ad cd0000        	call	_assert_failed
2513  05b0 5b04          	addw	sp,#4
2514  05b2               L013:
2515                     ; 533   if (NewState != DISABLE)
2517  05b2 0d01          	tnz	(OFST+1,sp)
2518  05b4 2706          	jreq	L3101
2519                     ; 535     TIM3->CCMR2 |= TIM3_CCMR_OCxPE;
2521  05b6 72165326      	bset	21286,#3
2523  05ba 2004          	jra	L5101
2524  05bc               L3101:
2525                     ; 539     TIM3->CCMR2 &= (uint8_t)(~TIM3_CCMR_OCxPE);
2527  05bc 72175326      	bres	21286,#3
2528  05c0               L5101:
2529                     ; 541 }
2532  05c0 84            	pop	a
2533  05c1 81            	ret
2599                     ; 552 void TIM3_GenerateEvent(TIM3_EventSource_TypeDef TIM3_EventSource)
2599                     ; 553 {
2600                     	switch	.text
2601  05c2               _TIM3_GenerateEvent:
2603  05c2 88            	push	a
2604       00000000      OFST:	set	0
2607                     ; 555   assert_param(IS_TIM3_EVENT_SOURCE_OK(TIM3_EventSource));
2609  05c3 4d            	tnz	a
2610  05c4 2703          	jreq	L413
2611  05c6 4f            	clr	a
2612  05c7 2010          	jra	L613
2613  05c9               L413:
2614  05c9 ae022b        	ldw	x,#555
2615  05cc 89            	pushw	x
2616  05cd ae0000        	ldw	x,#0
2617  05d0 89            	pushw	x
2618  05d1 ae0000        	ldw	x,#L502
2619  05d4 cd0000        	call	_assert_failed
2621  05d7 5b04          	addw	sp,#4
2622  05d9               L613:
2623                     ; 558   TIM3->EGR = (uint8_t)TIM3_EventSource;
2625  05d9 7b01          	ld	a,(OFST+1,sp)
2626  05db c75324        	ld	21284,a
2627                     ; 559 }
2630  05de 84            	pop	a
2631  05df 81            	ret
2668                     ; 569 void TIM3_OC1PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
2668                     ; 570 {
2669                     	switch	.text
2670  05e0               _TIM3_OC1PolarityConfig:
2672  05e0 88            	push	a
2673       00000000      OFST:	set	0
2676                     ; 572   assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
2678  05e1 4d            	tnz	a
2679  05e2 2704          	jreq	L423
2680  05e4 a122          	cp	a,#34
2681  05e6 2603          	jrne	L223
2682  05e8               L423:
2683  05e8 4f            	clr	a
2684  05e9 2010          	jra	L623
2685  05eb               L223:
2686  05eb ae023c        	ldw	x,#572
2687  05ee 89            	pushw	x
2688  05ef ae0000        	ldw	x,#0
2689  05f2 89            	pushw	x
2690  05f3 ae0000        	ldw	x,#L502
2691  05f6 cd0000        	call	_assert_failed
2693  05f9 5b04          	addw	sp,#4
2694  05fb               L623:
2695                     ; 575   if (TIM3_OCPolarity != TIM3_OCPOLARITY_HIGH)
2697  05fb 0d01          	tnz	(OFST+1,sp)
2698  05fd 2706          	jreq	L5601
2699                     ; 577     TIM3->CCER1 |= TIM3_CCER1_CC1P;
2701  05ff 72125327      	bset	21287,#1
2703  0603 2004          	jra	L7601
2704  0605               L5601:
2705                     ; 581     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1P);
2707  0605 72135327      	bres	21287,#1
2708  0609               L7601:
2709                     ; 583 }
2712  0609 84            	pop	a
2713  060a 81            	ret
2750                     ; 593 void TIM3_OC2PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
2750                     ; 594 {
2751                     	switch	.text
2752  060b               _TIM3_OC2PolarityConfig:
2754  060b 88            	push	a
2755       00000000      OFST:	set	0
2758                     ; 596   assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
2760  060c 4d            	tnz	a
2761  060d 2704          	jreq	L433
2762  060f a122          	cp	a,#34
2763  0611 2603          	jrne	L233
2764  0613               L433:
2765  0613 4f            	clr	a
2766  0614 2010          	jra	L633
2767  0616               L233:
2768  0616 ae0254        	ldw	x,#596
2769  0619 89            	pushw	x
2770  061a ae0000        	ldw	x,#0
2771  061d 89            	pushw	x
2772  061e ae0000        	ldw	x,#L502
2773  0621 cd0000        	call	_assert_failed
2775  0624 5b04          	addw	sp,#4
2776  0626               L633:
2777                     ; 599   if (TIM3_OCPolarity != TIM3_OCPOLARITY_HIGH)
2779  0626 0d01          	tnz	(OFST+1,sp)
2780  0628 2706          	jreq	L7011
2781                     ; 601     TIM3->CCER1 |= TIM3_CCER1_CC2P;
2783  062a 721a5327      	bset	21287,#5
2785  062e 2004          	jra	L1111
2786  0630               L7011:
2787                     ; 605     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2P);
2789  0630 721b5327      	bres	21287,#5
2790  0634               L1111:
2791                     ; 607 }
2794  0634 84            	pop	a
2795  0635 81            	ret
2841                     ; 619 void TIM3_CCxCmd(TIM3_Channel_TypeDef TIM3_Channel, FunctionalState NewState)
2841                     ; 620 {
2842                     	switch	.text
2843  0636               _TIM3_CCxCmd:
2845  0636 89            	pushw	x
2846       00000000      OFST:	set	0
2849                     ; 622   assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
2851  0637 9e            	ld	a,xh
2852  0638 4d            	tnz	a
2853  0639 2705          	jreq	L443
2854  063b 9e            	ld	a,xh
2855  063c a101          	cp	a,#1
2856  063e 2603          	jrne	L243
2857  0640               L443:
2858  0640 4f            	clr	a
2859  0641 2010          	jra	L643
2860  0643               L243:
2861  0643 ae026e        	ldw	x,#622
2862  0646 89            	pushw	x
2863  0647 ae0000        	ldw	x,#0
2864  064a 89            	pushw	x
2865  064b ae0000        	ldw	x,#L502
2866  064e cd0000        	call	_assert_failed
2868  0651 5b04          	addw	sp,#4
2869  0653               L643:
2870                     ; 623   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2872  0653 0d02          	tnz	(OFST+2,sp)
2873  0655 2706          	jreq	L253
2874  0657 7b02          	ld	a,(OFST+2,sp)
2875  0659 a101          	cp	a,#1
2876  065b 2603          	jrne	L053
2877  065d               L253:
2878  065d 4f            	clr	a
2879  065e 2010          	jra	L453
2880  0660               L053:
2881  0660 ae026f        	ldw	x,#623
2882  0663 89            	pushw	x
2883  0664 ae0000        	ldw	x,#0
2884  0667 89            	pushw	x
2885  0668 ae0000        	ldw	x,#L502
2886  066b cd0000        	call	_assert_failed
2888  066e 5b04          	addw	sp,#4
2889  0670               L453:
2890                     ; 625   if (TIM3_Channel == TIM3_CHANNEL_1)
2892  0670 0d01          	tnz	(OFST+1,sp)
2893  0672 2610          	jrne	L5311
2894                     ; 628     if (NewState != DISABLE)
2896  0674 0d02          	tnz	(OFST+2,sp)
2897  0676 2706          	jreq	L7311
2898                     ; 630       TIM3->CCER1 |= TIM3_CCER1_CC1E;
2900  0678 72105327      	bset	21287,#0
2902  067c 2014          	jra	L3411
2903  067e               L7311:
2904                     ; 634       TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
2906  067e 72115327      	bres	21287,#0
2907  0682 200e          	jra	L3411
2908  0684               L5311:
2909                     ; 641     if (NewState != DISABLE)
2911  0684 0d02          	tnz	(OFST+2,sp)
2912  0686 2706          	jreq	L5411
2913                     ; 643       TIM3->CCER1 |= TIM3_CCER1_CC2E;
2915  0688 72185327      	bset	21287,#4
2917  068c 2004          	jra	L3411
2918  068e               L5411:
2919                     ; 647       TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2E);
2921  068e 72195327      	bres	21287,#4
2922  0692               L3411:
2923                     ; 650 }
2926  0692 85            	popw	x
2927  0693 81            	ret
2973                     ; 671 void TIM3_SelectOCxM(TIM3_Channel_TypeDef TIM3_Channel, TIM3_OCMode_TypeDef TIM3_OCMode)
2973                     ; 672 {
2974                     	switch	.text
2975  0694               _TIM3_SelectOCxM:
2977  0694 89            	pushw	x
2978       00000000      OFST:	set	0
2981                     ; 674   assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
2983  0695 9e            	ld	a,xh
2984  0696 4d            	tnz	a
2985  0697 2705          	jreq	L263
2986  0699 9e            	ld	a,xh
2987  069a a101          	cp	a,#1
2988  069c 2603          	jrne	L063
2989  069e               L263:
2990  069e 4f            	clr	a
2991  069f 2010          	jra	L463
2992  06a1               L063:
2993  06a1 ae02a2        	ldw	x,#674
2994  06a4 89            	pushw	x
2995  06a5 ae0000        	ldw	x,#0
2996  06a8 89            	pushw	x
2997  06a9 ae0000        	ldw	x,#L502
2998  06ac cd0000        	call	_assert_failed
3000  06af 5b04          	addw	sp,#4
3001  06b1               L463:
3002                     ; 675   assert_param(IS_TIM3_OCM_OK(TIM3_OCMode));
3004  06b1 0d02          	tnz	(OFST+2,sp)
3005  06b3 272a          	jreq	L073
3006  06b5 7b02          	ld	a,(OFST+2,sp)
3007  06b7 a110          	cp	a,#16
3008  06b9 2724          	jreq	L073
3009  06bb 7b02          	ld	a,(OFST+2,sp)
3010  06bd a120          	cp	a,#32
3011  06bf 271e          	jreq	L073
3012  06c1 7b02          	ld	a,(OFST+2,sp)
3013  06c3 a130          	cp	a,#48
3014  06c5 2718          	jreq	L073
3015  06c7 7b02          	ld	a,(OFST+2,sp)
3016  06c9 a160          	cp	a,#96
3017  06cb 2712          	jreq	L073
3018  06cd 7b02          	ld	a,(OFST+2,sp)
3019  06cf a170          	cp	a,#112
3020  06d1 270c          	jreq	L073
3021  06d3 7b02          	ld	a,(OFST+2,sp)
3022  06d5 a150          	cp	a,#80
3023  06d7 2706          	jreq	L073
3024  06d9 7b02          	ld	a,(OFST+2,sp)
3025  06db a140          	cp	a,#64
3026  06dd 2603          	jrne	L663
3027  06df               L073:
3028  06df 4f            	clr	a
3029  06e0 2010          	jra	L273
3030  06e2               L663:
3031  06e2 ae02a3        	ldw	x,#675
3032  06e5 89            	pushw	x
3033  06e6 ae0000        	ldw	x,#0
3034  06e9 89            	pushw	x
3035  06ea ae0000        	ldw	x,#L502
3036  06ed cd0000        	call	_assert_failed
3038  06f0 5b04          	addw	sp,#4
3039  06f2               L273:
3040                     ; 677   if (TIM3_Channel == TIM3_CHANNEL_1)
3042  06f2 0d01          	tnz	(OFST+1,sp)
3043  06f4 2610          	jrne	L3711
3044                     ; 680     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
3046  06f6 72115327      	bres	21287,#0
3047                     ; 683     TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
3049  06fa c65325        	ld	a,21285
3050  06fd a48f          	and	a,#143
3051  06ff 1a02          	or	a,(OFST+2,sp)
3052  0701 c75325        	ld	21285,a
3054  0704 200e          	jra	L5711
3055  0706               L3711:
3056                     ; 688     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2E);
3058  0706 72195327      	bres	21287,#4
3059                     ; 691     TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
3061  070a c65326        	ld	a,21286
3062  070d a48f          	and	a,#143
3063  070f 1a02          	or	a,(OFST+2,sp)
3064  0711 c75326        	ld	21286,a
3065  0714               L5711:
3066                     ; 693 }
3069  0714 85            	popw	x
3070  0715 81            	ret
3104                     ; 701 void TIM3_SetCounter(uint16_t Counter)
3104                     ; 702 {
3105                     	switch	.text
3106  0716               _TIM3_SetCounter:
3110                     ; 704   TIM3->CNTRH = (uint8_t)(Counter >> 8);
3112  0716 9e            	ld	a,xh
3113  0717 c75328        	ld	21288,a
3114                     ; 705   TIM3->CNTRL = (uint8_t)(Counter);
3116  071a 9f            	ld	a,xl
3117  071b c75329        	ld	21289,a
3118                     ; 706 }
3121  071e 81            	ret
3155                     ; 714 void TIM3_SetAutoreload(uint16_t Autoreload)
3155                     ; 715 {
3156                     	switch	.text
3157  071f               _TIM3_SetAutoreload:
3161                     ; 717   TIM3->ARRH = (uint8_t)(Autoreload >> 8);
3163  071f 9e            	ld	a,xh
3164  0720 c7532b        	ld	21291,a
3165                     ; 718   TIM3->ARRL = (uint8_t)(Autoreload);
3167  0723 9f            	ld	a,xl
3168  0724 c7532c        	ld	21292,a
3169                     ; 719 }
3172  0727 81            	ret
3206                     ; 727 void TIM3_SetCompare1(uint16_t Compare1)
3206                     ; 728 {
3207                     	switch	.text
3208  0728               _TIM3_SetCompare1:
3212                     ; 730   TIM3->CCR1H = (uint8_t)(Compare1 >> 8);
3214  0728 9e            	ld	a,xh
3215  0729 c7532d        	ld	21293,a
3216                     ; 731   TIM3->CCR1L = (uint8_t)(Compare1);
3218  072c 9f            	ld	a,xl
3219  072d c7532e        	ld	21294,a
3220                     ; 732 }
3223  0730 81            	ret
3257                     ; 740 void TIM3_SetCompare2(uint16_t Compare2)
3257                     ; 741 {
3258                     	switch	.text
3259  0731               _TIM3_SetCompare2:
3263                     ; 743   TIM3->CCR2H = (uint8_t)(Compare2 >> 8);
3265  0731 9e            	ld	a,xh
3266  0732 c7532f        	ld	21295,a
3267                     ; 744   TIM3->CCR2L = (uint8_t)(Compare2);
3269  0735 9f            	ld	a,xl
3270  0736 c75330        	ld	21296,a
3271                     ; 745 }
3274  0739 81            	ret
3311                     ; 757 void TIM3_SetIC1Prescaler(TIM3_ICPSC_TypeDef TIM3_IC1Prescaler)
3311                     ; 758 {
3312                     	switch	.text
3313  073a               _TIM3_SetIC1Prescaler:
3315  073a 88            	push	a
3316       00000000      OFST:	set	0
3319                     ; 760   assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_IC1Prescaler));
3321  073b 4d            	tnz	a
3322  073c 270c          	jreq	L014
3323  073e a104          	cp	a,#4
3324  0740 2708          	jreq	L014
3325  0742 a108          	cp	a,#8
3326  0744 2704          	jreq	L014
3327  0746 a10c          	cp	a,#12
3328  0748 2603          	jrne	L604
3329  074a               L014:
3330  074a 4f            	clr	a
3331  074b 2010          	jra	L214
3332  074d               L604:
3333  074d ae02f8        	ldw	x,#760
3334  0750 89            	pushw	x
3335  0751 ae0000        	ldw	x,#0
3336  0754 89            	pushw	x
3337  0755 ae0000        	ldw	x,#L502
3338  0758 cd0000        	call	_assert_failed
3340  075b 5b04          	addw	sp,#4
3341  075d               L214:
3342                     ; 763   TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_ICxPSC)) | (uint8_t)TIM3_IC1Prescaler);
3344  075d c65325        	ld	a,21285
3345  0760 a4f3          	and	a,#243
3346  0762 1a01          	or	a,(OFST+1,sp)
3347  0764 c75325        	ld	21285,a
3348                     ; 764 }
3351  0767 84            	pop	a
3352  0768 81            	ret
3389                     ; 776 void TIM3_SetIC2Prescaler(TIM3_ICPSC_TypeDef TIM3_IC2Prescaler)
3389                     ; 777 {
3390                     	switch	.text
3391  0769               _TIM3_SetIC2Prescaler:
3393  0769 88            	push	a
3394       00000000      OFST:	set	0
3397                     ; 779   assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_IC2Prescaler));
3399  076a 4d            	tnz	a
3400  076b 270c          	jreq	L024
3401  076d a104          	cp	a,#4
3402  076f 2708          	jreq	L024
3403  0771 a108          	cp	a,#8
3404  0773 2704          	jreq	L024
3405  0775 a10c          	cp	a,#12
3406  0777 2603          	jrne	L614
3407  0779               L024:
3408  0779 4f            	clr	a
3409  077a 2010          	jra	L224
3410  077c               L614:
3411  077c ae030b        	ldw	x,#779
3412  077f 89            	pushw	x
3413  0780 ae0000        	ldw	x,#0
3414  0783 89            	pushw	x
3415  0784 ae0000        	ldw	x,#L502
3416  0787 cd0000        	call	_assert_failed
3418  078a 5b04          	addw	sp,#4
3419  078c               L224:
3420                     ; 782   TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_ICxPSC)) | (uint8_t)TIM3_IC2Prescaler);
3422  078c c65326        	ld	a,21286
3423  078f a4f3          	and	a,#243
3424  0791 1a01          	or	a,(OFST+1,sp)
3425  0793 c75326        	ld	21286,a
3426                     ; 783 }
3429  0796 84            	pop	a
3430  0797 81            	ret
3482                     ; 790 uint16_t TIM3_GetCapture1(void)
3482                     ; 791 {
3483                     	switch	.text
3484  0798               _TIM3_GetCapture1:
3486  0798 5204          	subw	sp,#4
3487       00000004      OFST:	set	4
3490                     ; 793   uint16_t tmpccr1 = 0;
3492                     ; 794   uint8_t tmpccr1l=0, tmpccr1h=0;
3496                     ; 796   tmpccr1h = TIM3->CCR1H;
3498  079a c6532d        	ld	a,21293
3499  079d 6b02          	ld	(OFST-2,sp),a
3501                     ; 797   tmpccr1l = TIM3->CCR1L;
3503  079f c6532e        	ld	a,21294
3504  07a2 6b01          	ld	(OFST-3,sp),a
3506                     ; 799   tmpccr1 = (uint16_t)(tmpccr1l);
3508  07a4 7b01          	ld	a,(OFST-3,sp)
3509  07a6 5f            	clrw	x
3510  07a7 97            	ld	xl,a
3511  07a8 1f03          	ldw	(OFST-1,sp),x
3513                     ; 800   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
3515  07aa 7b02          	ld	a,(OFST-2,sp)
3516  07ac 5f            	clrw	x
3517  07ad 97            	ld	xl,a
3518  07ae 4f            	clr	a
3519  07af 02            	rlwa	x,a
3520  07b0 01            	rrwa	x,a
3521  07b1 1a04          	or	a,(OFST+0,sp)
3522  07b3 01            	rrwa	x,a
3523  07b4 1a03          	or	a,(OFST-1,sp)
3524  07b6 01            	rrwa	x,a
3525  07b7 1f03          	ldw	(OFST-1,sp),x
3527                     ; 802   return (uint16_t)tmpccr1;
3529  07b9 1e03          	ldw	x,(OFST-1,sp)
3532  07bb 5b04          	addw	sp,#4
3533  07bd 81            	ret
3585                     ; 810 uint16_t TIM3_GetCapture2(void)
3585                     ; 811 {
3586                     	switch	.text
3587  07be               _TIM3_GetCapture2:
3589  07be 5204          	subw	sp,#4
3590       00000004      OFST:	set	4
3593                     ; 813   uint16_t tmpccr2 = 0;
3595                     ; 814   uint8_t tmpccr2l=0, tmpccr2h=0;
3599                     ; 816   tmpccr2h = TIM3->CCR2H;
3601  07c0 c6532f        	ld	a,21295
3602  07c3 6b02          	ld	(OFST-2,sp),a
3604                     ; 817   tmpccr2l = TIM3->CCR2L;
3606  07c5 c65330        	ld	a,21296
3607  07c8 6b01          	ld	(OFST-3,sp),a
3609                     ; 819   tmpccr2 = (uint16_t)(tmpccr2l);
3611  07ca 7b01          	ld	a,(OFST-3,sp)
3612  07cc 5f            	clrw	x
3613  07cd 97            	ld	xl,a
3614  07ce 1f03          	ldw	(OFST-1,sp),x
3616                     ; 820   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
3618  07d0 7b02          	ld	a,(OFST-2,sp)
3619  07d2 5f            	clrw	x
3620  07d3 97            	ld	xl,a
3621  07d4 4f            	clr	a
3622  07d5 02            	rlwa	x,a
3623  07d6 01            	rrwa	x,a
3624  07d7 1a04          	or	a,(OFST+0,sp)
3625  07d9 01            	rrwa	x,a
3626  07da 1a03          	or	a,(OFST-1,sp)
3627  07dc 01            	rrwa	x,a
3628  07dd 1f03          	ldw	(OFST-1,sp),x
3630                     ; 822   return (uint16_t)tmpccr2;
3632  07df 1e03          	ldw	x,(OFST-1,sp)
3635  07e1 5b04          	addw	sp,#4
3636  07e3 81            	ret
3670                     ; 830 uint16_t TIM3_GetCounter(void)
3670                     ; 831 {
3671                     	switch	.text
3672  07e4               _TIM3_GetCounter:
3674  07e4 89            	pushw	x
3675       00000002      OFST:	set	2
3678                     ; 832   uint16_t tmpcntr = 0;
3680                     ; 834   tmpcntr = ((uint16_t)TIM3->CNTRH << 8);
3682  07e5 c65328        	ld	a,21288
3683  07e8 5f            	clrw	x
3684  07e9 97            	ld	xl,a
3685  07ea 4f            	clr	a
3686  07eb 02            	rlwa	x,a
3687  07ec 1f01          	ldw	(OFST-1,sp),x
3689                     ; 836   return (uint16_t)( tmpcntr| (uint16_t)(TIM3->CNTRL));
3691  07ee c65329        	ld	a,21289
3692  07f1 5f            	clrw	x
3693  07f2 97            	ld	xl,a
3694  07f3 01            	rrwa	x,a
3695  07f4 1a02          	or	a,(OFST+0,sp)
3696  07f6 01            	rrwa	x,a
3697  07f7 1a01          	or	a,(OFST-1,sp)
3698  07f9 01            	rrwa	x,a
3701  07fa 5b02          	addw	sp,#2
3702  07fc 81            	ret
3726                     ; 844 TIM3_Prescaler_TypeDef TIM3_GetPrescaler(void)
3726                     ; 845 {
3727                     	switch	.text
3728  07fd               _TIM3_GetPrescaler:
3732                     ; 847   return (TIM3_Prescaler_TypeDef)(TIM3->PSCR);
3734  07fd c6532a        	ld	a,21290
3737  0800 81            	ret
3863                     ; 861 FlagStatus TIM3_GetFlagStatus(TIM3_FLAG_TypeDef TIM3_FLAG)
3863                     ; 862 {
3864                     	switch	.text
3865  0801               _TIM3_GetFlagStatus:
3867  0801 89            	pushw	x
3868  0802 89            	pushw	x
3869       00000002      OFST:	set	2
3872                     ; 863   FlagStatus bitstatus = RESET;
3874                     ; 864   uint8_t tim3_flag_l = 0, tim3_flag_h = 0;
3878                     ; 867   assert_param(IS_TIM3_GET_FLAG_OK(TIM3_FLAG));
3880  0803 a30001        	cpw	x,#1
3881  0806 2714          	jreq	L044
3882  0808 a30002        	cpw	x,#2
3883  080b 270f          	jreq	L044
3884  080d a30004        	cpw	x,#4
3885  0810 270a          	jreq	L044
3886  0812 a30200        	cpw	x,#512
3887  0815 2705          	jreq	L044
3888  0817 a30400        	cpw	x,#1024
3889  081a 2603          	jrne	L634
3890  081c               L044:
3891  081c 4f            	clr	a
3892  081d 2010          	jra	L244
3893  081f               L634:
3894  081f ae0363        	ldw	x,#867
3895  0822 89            	pushw	x
3896  0823 ae0000        	ldw	x,#0
3897  0826 89            	pushw	x
3898  0827 ae0000        	ldw	x,#L502
3899  082a cd0000        	call	_assert_failed
3901  082d 5b04          	addw	sp,#4
3902  082f               L244:
3903                     ; 869   tim3_flag_l = (uint8_t)(TIM3->SR1 & (uint8_t)TIM3_FLAG);
3905  082f c65322        	ld	a,21282
3906  0832 1404          	and	a,(OFST+2,sp)
3907  0834 6b01          	ld	(OFST-1,sp),a
3909                     ; 870   tim3_flag_h = (uint8_t)((uint16_t)TIM3_FLAG >> 8);
3911  0836 7b03          	ld	a,(OFST+1,sp)
3912  0838 6b02          	ld	(OFST+0,sp),a
3914                     ; 872   if (((tim3_flag_l) | (uint8_t)(TIM3->SR2 & tim3_flag_h)) != (uint8_t)RESET )
3916  083a c65323        	ld	a,21283
3917  083d 1402          	and	a,(OFST+0,sp)
3918  083f 1a01          	or	a,(OFST-1,sp)
3919  0841 2706          	jreq	L5051
3920                     ; 874     bitstatus = SET;
3922  0843 a601          	ld	a,#1
3923  0845 6b02          	ld	(OFST+0,sp),a
3926  0847 2002          	jra	L7051
3927  0849               L5051:
3928                     ; 878     bitstatus = RESET;
3930  0849 0f02          	clr	(OFST+0,sp)
3932  084b               L7051:
3933                     ; 880   return (FlagStatus)bitstatus;
3935  084b 7b02          	ld	a,(OFST+0,sp)
3938  084d 5b04          	addw	sp,#4
3939  084f 81            	ret
3975                     ; 894 void TIM3_ClearFlag(TIM3_FLAG_TypeDef TIM3_FLAG)
3975                     ; 895 {
3976                     	switch	.text
3977  0850               _TIM3_ClearFlag:
3979  0850 89            	pushw	x
3980       00000000      OFST:	set	0
3983                     ; 897   assert_param(IS_TIM3_CLEAR_FLAG_OK(TIM3_FLAG));
3985  0851 01            	rrwa	x,a
3986  0852 a4f8          	and	a,#248
3987  0854 01            	rrwa	x,a
3988  0855 a4f9          	and	a,#249
3989  0857 01            	rrwa	x,a
3990  0858 a30000        	cpw	x,#0
3991  085b 2607          	jrne	L644
3992  085d 1e01          	ldw	x,(OFST+1,sp)
3993  085f 2703          	jreq	L644
3994  0861 4f            	clr	a
3995  0862 2010          	jra	L054
3996  0864               L644:
3997  0864 ae0381        	ldw	x,#897
3998  0867 89            	pushw	x
3999  0868 ae0000        	ldw	x,#0
4000  086b 89            	pushw	x
4001  086c ae0000        	ldw	x,#L502
4002  086f cd0000        	call	_assert_failed
4004  0872 5b04          	addw	sp,#4
4005  0874               L054:
4006                     ; 900   TIM3->SR1 = (uint8_t)(~((uint8_t)(TIM3_FLAG)));
4008  0874 7b02          	ld	a,(OFST+2,sp)
4009  0876 43            	cpl	a
4010  0877 c75322        	ld	21282,a
4011                     ; 901   TIM3->SR2 = (uint8_t)(~((uint8_t)((uint16_t)TIM3_FLAG >> 8)));
4013  087a 7b01          	ld	a,(OFST+1,sp)
4014  087c 43            	cpl	a
4015  087d c75323        	ld	21283,a
4016                     ; 902 }
4019  0880 85            	popw	x
4020  0881 81            	ret
4085                     ; 913 ITStatus TIM3_GetITStatus(TIM3_IT_TypeDef TIM3_IT)
4085                     ; 914 {
4086                     	switch	.text
4087  0882               _TIM3_GetITStatus:
4089  0882 88            	push	a
4090  0883 89            	pushw	x
4091       00000002      OFST:	set	2
4094                     ; 915   ITStatus bitstatus = RESET;
4096                     ; 916   uint8_t TIM3_itStatus = 0, TIM3_itEnable = 0;
4100                     ; 919   assert_param(IS_TIM3_GET_IT_OK(TIM3_IT));
4102  0884 a101          	cp	a,#1
4103  0886 2708          	jreq	L654
4104  0888 a102          	cp	a,#2
4105  088a 2704          	jreq	L654
4106  088c a104          	cp	a,#4
4107  088e 2603          	jrne	L454
4108  0890               L654:
4109  0890 4f            	clr	a
4110  0891 2010          	jra	L064
4111  0893               L454:
4112  0893 ae0397        	ldw	x,#919
4113  0896 89            	pushw	x
4114  0897 ae0000        	ldw	x,#0
4115  089a 89            	pushw	x
4116  089b ae0000        	ldw	x,#L502
4117  089e cd0000        	call	_assert_failed
4119  08a1 5b04          	addw	sp,#4
4120  08a3               L064:
4121                     ; 921   TIM3_itStatus = (uint8_t)(TIM3->SR1 & TIM3_IT);
4123  08a3 c65322        	ld	a,21282
4124  08a6 1403          	and	a,(OFST+1,sp)
4125  08a8 6b01          	ld	(OFST-1,sp),a
4127                     ; 923   TIM3_itEnable = (uint8_t)(TIM3->IER & TIM3_IT);
4129  08aa c65321        	ld	a,21281
4130  08ad 1403          	and	a,(OFST+1,sp)
4131  08af 6b02          	ld	(OFST+0,sp),a
4133                     ; 925   if ((TIM3_itStatus != (uint8_t)RESET ) && (TIM3_itEnable != (uint8_t)RESET ))
4135  08b1 0d01          	tnz	(OFST-1,sp)
4136  08b3 270a          	jreq	L1651
4138  08b5 0d02          	tnz	(OFST+0,sp)
4139  08b7 2706          	jreq	L1651
4140                     ; 927     bitstatus = SET;
4142  08b9 a601          	ld	a,#1
4143  08bb 6b02          	ld	(OFST+0,sp),a
4146  08bd 2002          	jra	L3651
4147  08bf               L1651:
4148                     ; 931     bitstatus = RESET;
4150  08bf 0f02          	clr	(OFST+0,sp)
4152  08c1               L3651:
4153                     ; 933   return (ITStatus)(bitstatus);
4155  08c1 7b02          	ld	a,(OFST+0,sp)
4158  08c3 5b03          	addw	sp,#3
4159  08c5 81            	ret
4196                     ; 945 void TIM3_ClearITPendingBit(TIM3_IT_TypeDef TIM3_IT)
4196                     ; 946 {
4197                     	switch	.text
4198  08c6               _TIM3_ClearITPendingBit:
4200  08c6 88            	push	a
4201       00000000      OFST:	set	0
4204                     ; 948   assert_param(IS_TIM3_IT_OK(TIM3_IT));
4206  08c7 4d            	tnz	a
4207  08c8 2707          	jreq	L464
4208  08ca a108          	cp	a,#8
4209  08cc 2403          	jruge	L464
4210  08ce 4f            	clr	a
4211  08cf 2010          	jra	L664
4212  08d1               L464:
4213  08d1 ae03b4        	ldw	x,#948
4214  08d4 89            	pushw	x
4215  08d5 ae0000        	ldw	x,#0
4216  08d8 89            	pushw	x
4217  08d9 ae0000        	ldw	x,#L502
4218  08dc cd0000        	call	_assert_failed
4220  08df 5b04          	addw	sp,#4
4221  08e1               L664:
4222                     ; 951   TIM3->SR1 = (uint8_t)(~TIM3_IT);
4224  08e1 7b01          	ld	a,(OFST+1,sp)
4225  08e3 43            	cpl	a
4226  08e4 c75322        	ld	21282,a
4227                     ; 952 }
4230  08e7 84            	pop	a
4231  08e8 81            	ret
4283                     ; 970 static void TI1_Config(uint8_t TIM3_ICPolarity,
4283                     ; 971                        uint8_t TIM3_ICSelection,
4283                     ; 972                        uint8_t TIM3_ICFilter)
4283                     ; 973 {
4284                     	switch	.text
4285  08e9               L3_TI1_Config:
4287  08e9 89            	pushw	x
4288  08ea 88            	push	a
4289       00000001      OFST:	set	1
4292                     ; 975   TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
4294  08eb 72115327      	bres	21287,#0
4295                     ; 978   TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~( TIM3_CCMR_CCxS | TIM3_CCMR_ICxF))) | (uint8_t)(( (TIM3_ICSelection)) | ((uint8_t)( TIM3_ICFilter << 4))));
4297  08ef 7b06          	ld	a,(OFST+5,sp)
4298  08f1 97            	ld	xl,a
4299  08f2 a610          	ld	a,#16
4300  08f4 42            	mul	x,a
4301  08f5 9f            	ld	a,xl
4302  08f6 1a03          	or	a,(OFST+2,sp)
4303  08f8 6b01          	ld	(OFST+0,sp),a
4305  08fa c65325        	ld	a,21285
4306  08fd a40c          	and	a,#12
4307  08ff 1a01          	or	a,(OFST+0,sp)
4308  0901 c75325        	ld	21285,a
4309                     ; 981   if (TIM3_ICPolarity != TIM3_ICPOLARITY_RISING)
4311  0904 0d02          	tnz	(OFST+1,sp)
4312  0906 2706          	jreq	L1361
4313                     ; 983     TIM3->CCER1 |= TIM3_CCER1_CC1P;
4315  0908 72125327      	bset	21287,#1
4317  090c 2004          	jra	L3361
4318  090e               L1361:
4319                     ; 987     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1P);
4321  090e 72135327      	bres	21287,#1
4322  0912               L3361:
4323                     ; 990   TIM3->CCER1 |= TIM3_CCER1_CC1E;
4325  0912 72105327      	bset	21287,#0
4326                     ; 991 }
4329  0916 5b03          	addw	sp,#3
4330  0918 81            	ret
4382                     ; 1009 static void TI2_Config(uint8_t TIM3_ICPolarity,
4382                     ; 1010                        uint8_t TIM3_ICSelection,
4382                     ; 1011                        uint8_t TIM3_ICFilter)
4382                     ; 1012 {
4383                     	switch	.text
4384  0919               L5_TI2_Config:
4386  0919 89            	pushw	x
4387  091a 88            	push	a
4388       00000001      OFST:	set	1
4391                     ; 1014   TIM3->CCER1 &=  (uint8_t)(~TIM3_CCER1_CC2E);
4393  091b 72195327      	bres	21287,#4
4394                     ; 1017   TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~( TIM3_CCMR_CCxS |
4394                     ; 1018                                                               TIM3_CCMR_ICxF    ))) | (uint8_t)(( (TIM3_ICSelection)) | 
4394                     ; 1019                                                                                                 ((uint8_t)( TIM3_ICFilter << 4))));
4396  091f 7b06          	ld	a,(OFST+5,sp)
4397  0921 97            	ld	xl,a
4398  0922 a610          	ld	a,#16
4399  0924 42            	mul	x,a
4400  0925 9f            	ld	a,xl
4401  0926 1a03          	or	a,(OFST+2,sp)
4402  0928 6b01          	ld	(OFST+0,sp),a
4404  092a c65326        	ld	a,21286
4405  092d a40c          	and	a,#12
4406  092f 1a01          	or	a,(OFST+0,sp)
4407  0931 c75326        	ld	21286,a
4408                     ; 1022   if (TIM3_ICPolarity != TIM3_ICPOLARITY_RISING)
4410  0934 0d02          	tnz	(OFST+1,sp)
4411  0936 2706          	jreq	L3661
4412                     ; 1024     TIM3->CCER1 |= TIM3_CCER1_CC2P;
4414  0938 721a5327      	bset	21287,#5
4416  093c 2004          	jra	L5661
4417  093e               L3661:
4418                     ; 1028     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2P);
4420  093e 721b5327      	bres	21287,#5
4421  0942               L5661:
4422                     ; 1032   TIM3->CCER1 |= TIM3_CCER1_CC2E;
4424  0942 72185327      	bset	21287,#4
4425                     ; 1033 }
4428  0946 5b03          	addw	sp,#3
4429  0948 81            	ret
4442                     	xdef	_TIM3_ClearITPendingBit
4443                     	xdef	_TIM3_GetITStatus
4444                     	xdef	_TIM3_ClearFlag
4445                     	xdef	_TIM3_GetFlagStatus
4446                     	xdef	_TIM3_GetPrescaler
4447                     	xdef	_TIM3_GetCounter
4448                     	xdef	_TIM3_GetCapture2
4449                     	xdef	_TIM3_GetCapture1
4450                     	xdef	_TIM3_SetIC2Prescaler
4451                     	xdef	_TIM3_SetIC1Prescaler
4452                     	xdef	_TIM3_SetCompare2
4453                     	xdef	_TIM3_SetCompare1
4454                     	xdef	_TIM3_SetAutoreload
4455                     	xdef	_TIM3_SetCounter
4456                     	xdef	_TIM3_SelectOCxM
4457                     	xdef	_TIM3_CCxCmd
4458                     	xdef	_TIM3_OC2PolarityConfig
4459                     	xdef	_TIM3_OC1PolarityConfig
4460                     	xdef	_TIM3_GenerateEvent
4461                     	xdef	_TIM3_OC2PreloadConfig
4462                     	xdef	_TIM3_OC1PreloadConfig
4463                     	xdef	_TIM3_ARRPreloadConfig
4464                     	xdef	_TIM3_ForcedOC2Config
4465                     	xdef	_TIM3_ForcedOC1Config
4466                     	xdef	_TIM3_PrescalerConfig
4467                     	xdef	_TIM3_SelectOnePulseMode
4468                     	xdef	_TIM3_UpdateRequestConfig
4469                     	xdef	_TIM3_UpdateDisableConfig
4470                     	xdef	_TIM3_ITConfig
4471                     	xdef	_TIM3_Cmd
4472                     	xdef	_TIM3_PWMIConfig
4473                     	xdef	_TIM3_ICInit
4474                     	xdef	_TIM3_OC2Init
4475                     	xdef	_TIM3_OC1Init
4476                     	xdef	_TIM3_TimeBaseInit
4477                     	xdef	_TIM3_DeInit
4478                     	xref	_assert_failed
4479                     .const:	section	.text
4480  0000               L502:
4481  0000 7372635c7374  	dc.b	"src\stm8s_tim3.c",0
4501                     	end
