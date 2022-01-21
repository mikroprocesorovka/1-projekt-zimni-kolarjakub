   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.1 - 30 Jun 2020
   3                     ; Generator (Limited) V4.4.12 - 02 Jul 2020
  76                     ; 87 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
  76                     ; 88 {
  78                     	switch	.text
  79  0000               _FLASH_Unlock:
  81  0000 88            	push	a
  82       00000000      OFST:	set	0
  85                     ; 90   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
  87  0001 a1fd          	cp	a,#253
  88  0003 2704          	jreq	L01
  89  0005 a1f7          	cp	a,#247
  90  0007 2603          	jrne	L6
  91  0009               L01:
  92  0009 4f            	clr	a
  93  000a 2010          	jra	L21
  94  000c               L6:
  95  000c ae005a        	ldw	x,#90
  96  000f 89            	pushw	x
  97  0010 ae0000        	ldw	x,#0
  98  0013 89            	pushw	x
  99  0014 ae0010        	ldw	x,#L73
 100  0017 cd0000        	call	_assert_failed
 102  001a 5b04          	addw	sp,#4
 103  001c               L21:
 104                     ; 93   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
 106  001c 7b01          	ld	a,(OFST+1,sp)
 107  001e a1fd          	cp	a,#253
 108  0020 260a          	jrne	L14
 109                     ; 95     FLASH->PUKR = FLASH_RASS_KEY1;
 111  0022 35565062      	mov	20578,#86
 112                     ; 96     FLASH->PUKR = FLASH_RASS_KEY2;
 114  0026 35ae5062      	mov	20578,#174
 116  002a 2008          	jra	L34
 117  002c               L14:
 118                     ; 101     FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
 120  002c 35ae5064      	mov	20580,#174
 121                     ; 102     FLASH->DUKR = FLASH_RASS_KEY1;
 123  0030 35565064      	mov	20580,#86
 124  0034               L34:
 125                     ; 104 }
 128  0034 84            	pop	a
 129  0035 81            	ret
 165                     ; 112 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
 165                     ; 113 {
 166                     	switch	.text
 167  0036               _FLASH_Lock:
 169  0036 88            	push	a
 170       00000000      OFST:	set	0
 173                     ; 115   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
 175  0037 a1fd          	cp	a,#253
 176  0039 2704          	jreq	L02
 177  003b a1f7          	cp	a,#247
 178  003d 2603          	jrne	L61
 179  003f               L02:
 180  003f 4f            	clr	a
 181  0040 2010          	jra	L22
 182  0042               L61:
 183  0042 ae0073        	ldw	x,#115
 184  0045 89            	pushw	x
 185  0046 ae0000        	ldw	x,#0
 186  0049 89            	pushw	x
 187  004a ae0010        	ldw	x,#L73
 188  004d cd0000        	call	_assert_failed
 190  0050 5b04          	addw	sp,#4
 191  0052               L22:
 192                     ; 118   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
 194  0052 c6505f        	ld	a,20575
 195  0055 1401          	and	a,(OFST+1,sp)
 196  0057 c7505f        	ld	20575,a
 197                     ; 119 }
 200  005a 84            	pop	a
 201  005b 81            	ret
 224                     ; 126 void FLASH_DeInit(void)
 224                     ; 127 {
 225                     	switch	.text
 226  005c               _FLASH_DeInit:
 230                     ; 128   FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 232  005c 725f505a      	clr	20570
 233                     ; 129   FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 235  0060 725f505b      	clr	20571
 236                     ; 130   FLASH->NCR2 = FLASH_NCR2_RESET_VALUE;
 238  0064 35ff505c      	mov	20572,#255
 239                     ; 131   FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_DUL);
 241  0068 7217505f      	bres	20575,#3
 242                     ; 132   FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_PUL);
 244  006c 7213505f      	bres	20575,#1
 245                     ; 133   (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 247  0070 c6505f        	ld	a,20575
 248                     ; 134 }
 251  0073 81            	ret
 307                     ; 142 void FLASH_ITConfig(FunctionalState NewState)
 307                     ; 143 {
 308                     	switch	.text
 309  0074               _FLASH_ITConfig:
 311  0074 88            	push	a
 312       00000000      OFST:	set	0
 315                     ; 145   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 317  0075 4d            	tnz	a
 318  0076 2704          	jreq	L23
 319  0078 a101          	cp	a,#1
 320  007a 2603          	jrne	L03
 321  007c               L23:
 322  007c 4f            	clr	a
 323  007d 2010          	jra	L43
 324  007f               L03:
 325  007f ae0091        	ldw	x,#145
 326  0082 89            	pushw	x
 327  0083 ae0000        	ldw	x,#0
 328  0086 89            	pushw	x
 329  0087 ae0010        	ldw	x,#L73
 330  008a cd0000        	call	_assert_failed
 332  008d 5b04          	addw	sp,#4
 333  008f               L43:
 334                     ; 147   if(NewState != DISABLE)
 336  008f 0d01          	tnz	(OFST+1,sp)
 337  0091 2706          	jreq	L121
 338                     ; 149     FLASH->CR1 |= FLASH_CR1_IE; /* Enables the interrupt sources */
 340  0093 7212505a      	bset	20570,#1
 342  0097 2004          	jra	L321
 343  0099               L121:
 344                     ; 153     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE); /* Disables the interrupt sources */
 346  0099 7213505a      	bres	20570,#1
 347  009d               L321:
 348                     ; 155 }
 351  009d 84            	pop	a
 352  009e 81            	ret
 387                     .const:	section	.text
 388  0000               L64:
 389  0000 00008000      	dc.l	32768
 390  0004               L05:
 391  0004 00028000      	dc.l	163840
 392  0008               L25:
 393  0008 00004000      	dc.l	16384
 394  000c               L45:
 395  000c 00004800      	dc.l	18432
 396                     ; 164 void FLASH_EraseByte(uint32_t Address)
 396                     ; 165 {
 397                     	switch	.text
 398  009f               _FLASH_EraseByte:
 400       00000000      OFST:	set	0
 403                     ; 167   assert_param(IS_FLASH_ADDRESS_OK(Address));
 405  009f 96            	ldw	x,sp
 406  00a0 1c0003        	addw	x,#OFST+3
 407  00a3 cd0000        	call	c_ltor
 409  00a6 ae0000        	ldw	x,#L64
 410  00a9 cd0000        	call	c_lcmp
 412  00ac 250f          	jrult	L44
 413  00ae 96            	ldw	x,sp
 414  00af 1c0003        	addw	x,#OFST+3
 415  00b2 cd0000        	call	c_ltor
 417  00b5 ae0004        	ldw	x,#L05
 418  00b8 cd0000        	call	c_lcmp
 420  00bb 251e          	jrult	L24
 421  00bd               L44:
 422  00bd 96            	ldw	x,sp
 423  00be 1c0003        	addw	x,#OFST+3
 424  00c1 cd0000        	call	c_ltor
 426  00c4 ae0008        	ldw	x,#L25
 427  00c7 cd0000        	call	c_lcmp
 429  00ca 2512          	jrult	L04
 430  00cc 96            	ldw	x,sp
 431  00cd 1c0003        	addw	x,#OFST+3
 432  00d0 cd0000        	call	c_ltor
 434  00d3 ae000c        	ldw	x,#L45
 435  00d6 cd0000        	call	c_lcmp
 437  00d9 2403          	jruge	L04
 438  00db               L24:
 439  00db 4f            	clr	a
 440  00dc 2010          	jra	L65
 441  00de               L04:
 442  00de ae00a7        	ldw	x,#167
 443  00e1 89            	pushw	x
 444  00e2 ae0000        	ldw	x,#0
 445  00e5 89            	pushw	x
 446  00e6 ae0010        	ldw	x,#L73
 447  00e9 cd0000        	call	_assert_failed
 449  00ec 5b04          	addw	sp,#4
 450  00ee               L65:
 451                     ; 170   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = FLASH_CLEAR_BYTE; 
 453  00ee 7b04          	ld	a,(OFST+4,sp)
 454  00f0 b700          	ld	c_x,a
 455  00f2 1e05          	ldw	x,(OFST+5,sp)
 456  00f4 bf01          	ldw	c_x+1,x
 457  00f6 4f            	clr	a
 458  00f7 92bd0000      	ldf	[c_x.e],a
 459                     ; 171 }
 462  00fb 81            	ret
 506                     ; 181 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
 506                     ; 182 {
 507                     	switch	.text
 508  00fc               _FLASH_ProgramByte:
 510       00000000      OFST:	set	0
 513                     ; 184   assert_param(IS_FLASH_ADDRESS_OK(Address));
 515  00fc 96            	ldw	x,sp
 516  00fd 1c0003        	addw	x,#OFST+3
 517  0100 cd0000        	call	c_ltor
 519  0103 ae0000        	ldw	x,#L64
 520  0106 cd0000        	call	c_lcmp
 522  0109 250f          	jrult	L66
 523  010b 96            	ldw	x,sp
 524  010c 1c0003        	addw	x,#OFST+3
 525  010f cd0000        	call	c_ltor
 527  0112 ae0004        	ldw	x,#L05
 528  0115 cd0000        	call	c_lcmp
 530  0118 251e          	jrult	L46
 531  011a               L66:
 532  011a 96            	ldw	x,sp
 533  011b 1c0003        	addw	x,#OFST+3
 534  011e cd0000        	call	c_ltor
 536  0121 ae0008        	ldw	x,#L25
 537  0124 cd0000        	call	c_lcmp
 539  0127 2512          	jrult	L26
 540  0129 96            	ldw	x,sp
 541  012a 1c0003        	addw	x,#OFST+3
 542  012d cd0000        	call	c_ltor
 544  0130 ae000c        	ldw	x,#L45
 545  0133 cd0000        	call	c_lcmp
 547  0136 2403          	jruge	L26
 548  0138               L46:
 549  0138 4f            	clr	a
 550  0139 2010          	jra	L07
 551  013b               L26:
 552  013b ae00b8        	ldw	x,#184
 553  013e 89            	pushw	x
 554  013f ae0000        	ldw	x,#0
 555  0142 89            	pushw	x
 556  0143 ae0010        	ldw	x,#L73
 557  0146 cd0000        	call	_assert_failed
 559  0149 5b04          	addw	sp,#4
 560  014b               L07:
 561                     ; 185   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = Data;
 563  014b 7b07          	ld	a,(OFST+7,sp)
 564  014d 88            	push	a
 565  014e 7b05          	ld	a,(OFST+5,sp)
 566  0150 b700          	ld	c_x,a
 567  0152 1e06          	ldw	x,(OFST+6,sp)
 568  0154 84            	pop	a
 569  0155 bf01          	ldw	c_x+1,x
 570  0157 92bd0000      	ldf	[c_x.e],a
 571                     ; 186 }
 574  015b 81            	ret
 609                     ; 195 uint8_t FLASH_ReadByte(uint32_t Address)
 609                     ; 196 {
 610                     	switch	.text
 611  015c               _FLASH_ReadByte:
 613       00000000      OFST:	set	0
 616                     ; 198   assert_param(IS_FLASH_ADDRESS_OK(Address));
 618  015c 96            	ldw	x,sp
 619  015d 1c0003        	addw	x,#OFST+3
 620  0160 cd0000        	call	c_ltor
 622  0163 ae0000        	ldw	x,#L64
 623  0166 cd0000        	call	c_lcmp
 625  0169 250f          	jrult	L001
 626  016b 96            	ldw	x,sp
 627  016c 1c0003        	addw	x,#OFST+3
 628  016f cd0000        	call	c_ltor
 630  0172 ae0004        	ldw	x,#L05
 631  0175 cd0000        	call	c_lcmp
 633  0178 251e          	jrult	L67
 634  017a               L001:
 635  017a 96            	ldw	x,sp
 636  017b 1c0003        	addw	x,#OFST+3
 637  017e cd0000        	call	c_ltor
 639  0181 ae0008        	ldw	x,#L25
 640  0184 cd0000        	call	c_lcmp
 642  0187 2512          	jrult	L47
 643  0189 96            	ldw	x,sp
 644  018a 1c0003        	addw	x,#OFST+3
 645  018d cd0000        	call	c_ltor
 647  0190 ae000c        	ldw	x,#L45
 648  0193 cd0000        	call	c_lcmp
 650  0196 2403          	jruge	L47
 651  0198               L67:
 652  0198 4f            	clr	a
 653  0199 2010          	jra	L201
 654  019b               L47:
 655  019b ae00c6        	ldw	x,#198
 656  019e 89            	pushw	x
 657  019f ae0000        	ldw	x,#0
 658  01a2 89            	pushw	x
 659  01a3 ae0010        	ldw	x,#L73
 660  01a6 cd0000        	call	_assert_failed
 662  01a9 5b04          	addw	sp,#4
 663  01ab               L201:
 664                     ; 201   return(*(PointerAttr uint8_t *) (MemoryAddressCast)Address); 
 666  01ab 7b04          	ld	a,(OFST+4,sp)
 667  01ad b700          	ld	c_x,a
 668  01af 1e05          	ldw	x,(OFST+5,sp)
 669  01b1 bf01          	ldw	c_x+1,x
 670  01b3 92bc0000      	ldf	a,[c_x.e]
 673  01b7 81            	ret
 717                     ; 212 void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
 717                     ; 213 {
 718                     	switch	.text
 719  01b8               _FLASH_ProgramWord:
 721       00000000      OFST:	set	0
 724                     ; 215   assert_param(IS_FLASH_ADDRESS_OK(Address));
 726  01b8 96            	ldw	x,sp
 727  01b9 1c0003        	addw	x,#OFST+3
 728  01bc cd0000        	call	c_ltor
 730  01bf ae0000        	ldw	x,#L64
 731  01c2 cd0000        	call	c_lcmp
 733  01c5 250f          	jrult	L211
 734  01c7 96            	ldw	x,sp
 735  01c8 1c0003        	addw	x,#OFST+3
 736  01cb cd0000        	call	c_ltor
 738  01ce ae0004        	ldw	x,#L05
 739  01d1 cd0000        	call	c_lcmp
 741  01d4 251e          	jrult	L011
 742  01d6               L211:
 743  01d6 96            	ldw	x,sp
 744  01d7 1c0003        	addw	x,#OFST+3
 745  01da cd0000        	call	c_ltor
 747  01dd ae0008        	ldw	x,#L25
 748  01e0 cd0000        	call	c_lcmp
 750  01e3 2512          	jrult	L601
 751  01e5 96            	ldw	x,sp
 752  01e6 1c0003        	addw	x,#OFST+3
 753  01e9 cd0000        	call	c_ltor
 755  01ec ae000c        	ldw	x,#L45
 756  01ef cd0000        	call	c_lcmp
 758  01f2 2403          	jruge	L601
 759  01f4               L011:
 760  01f4 4f            	clr	a
 761  01f5 2010          	jra	L411
 762  01f7               L601:
 763  01f7 ae00d7        	ldw	x,#215
 764  01fa 89            	pushw	x
 765  01fb ae0000        	ldw	x,#0
 766  01fe 89            	pushw	x
 767  01ff ae0010        	ldw	x,#L73
 768  0202 cd0000        	call	_assert_failed
 770  0205 5b04          	addw	sp,#4
 771  0207               L411:
 772                     ; 218   FLASH->CR2 |= FLASH_CR2_WPRG;
 774  0207 721c505b      	bset	20571,#6
 775                     ; 219   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NWPRG);
 777  020b 721d505c      	bres	20572,#6
 778                     ; 222   *((PointerAttr uint8_t*)(MemoryAddressCast)Address)       = *((uint8_t*)(&Data));
 780  020f 7b07          	ld	a,(OFST+7,sp)
 781  0211 88            	push	a
 782  0212 7b05          	ld	a,(OFST+5,sp)
 783  0214 b700          	ld	c_x,a
 784  0216 1e06          	ldw	x,(OFST+6,sp)
 785  0218 84            	pop	a
 786  0219 bf01          	ldw	c_x+1,x
 787  021b 92bd0000      	ldf	[c_x.e],a
 788                     ; 224   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 1) = *((uint8_t*)(&Data)+1); 
 790  021f 7b08          	ld	a,(OFST+8,sp)
 791  0221 88            	push	a
 792  0222 7b05          	ld	a,(OFST+5,sp)
 793  0224 b700          	ld	c_x,a
 794  0226 1e06          	ldw	x,(OFST+6,sp)
 795  0228 84            	pop	a
 796  0229 90ae0001      	ldw	y,#1
 797  022d bf01          	ldw	c_x+1,x
 798  022f 93            	ldw	x,y
 799  0230 92a70000      	ldf	([c_x.e],x),a
 800                     ; 226   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 2) = *((uint8_t*)(&Data)+2); 
 802  0234 7b09          	ld	a,(OFST+9,sp)
 803  0236 88            	push	a
 804  0237 7b05          	ld	a,(OFST+5,sp)
 805  0239 b700          	ld	c_x,a
 806  023b 1e06          	ldw	x,(OFST+6,sp)
 807  023d 84            	pop	a
 808  023e 90ae0002      	ldw	y,#2
 809  0242 bf01          	ldw	c_x+1,x
 810  0244 93            	ldw	x,y
 811  0245 92a70000      	ldf	([c_x.e],x),a
 812                     ; 228   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 3) = *((uint8_t*)(&Data)+3); 
 814  0249 7b0a          	ld	a,(OFST+10,sp)
 815  024b 88            	push	a
 816  024c 7b05          	ld	a,(OFST+5,sp)
 817  024e b700          	ld	c_x,a
 818  0250 1e06          	ldw	x,(OFST+6,sp)
 819  0252 84            	pop	a
 820  0253 90ae0003      	ldw	y,#3
 821  0257 bf01          	ldw	c_x+1,x
 822  0259 93            	ldw	x,y
 823  025a 92a70000      	ldf	([c_x.e],x),a
 824                     ; 229 }
 827  025e 81            	ret
 873                     ; 237 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
 873                     ; 238 {
 874                     	switch	.text
 875  025f               _FLASH_ProgramOptionByte:
 877  025f 89            	pushw	x
 878       00000000      OFST:	set	0
 881                     ; 240   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 883  0260 a34800        	cpw	x,#18432
 884  0263 2508          	jrult	L021
 885  0265 a34880        	cpw	x,#18560
 886  0268 2403          	jruge	L021
 887  026a 4f            	clr	a
 888  026b 2010          	jra	L221
 889  026d               L021:
 890  026d ae00f0        	ldw	x,#240
 891  0270 89            	pushw	x
 892  0271 ae0000        	ldw	x,#0
 893  0274 89            	pushw	x
 894  0275 ae0010        	ldw	x,#L73
 895  0278 cd0000        	call	_assert_failed
 897  027b 5b04          	addw	sp,#4
 898  027d               L221:
 899                     ; 243   FLASH->CR2 |= FLASH_CR2_OPT;
 901  027d 721e505b      	bset	20571,#7
 902                     ; 244   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 904  0281 721f505c      	bres	20572,#7
 905                     ; 247   if(Address == 0x4800)
 907  0285 1e01          	ldw	x,(OFST+1,sp)
 908  0287 a34800        	cpw	x,#18432
 909  028a 2607          	jrne	L742
 910                     ; 250     *((NEAR uint8_t*)Address) = Data;
 912  028c 7b05          	ld	a,(OFST+5,sp)
 913  028e 1e01          	ldw	x,(OFST+1,sp)
 914  0290 f7            	ld	(x),a
 916  0291 200c          	jra	L152
 917  0293               L742:
 918                     ; 255     *((NEAR uint8_t*)Address) = Data;
 920  0293 7b05          	ld	a,(OFST+5,sp)
 921  0295 1e01          	ldw	x,(OFST+1,sp)
 922  0297 f7            	ld	(x),a
 923                     ; 256     *((NEAR uint8_t*)((uint16_t)(Address + 1))) = (uint8_t)(~Data);
 925  0298 7b05          	ld	a,(OFST+5,sp)
 926  029a 43            	cpl	a
 927  029b 1e01          	ldw	x,(OFST+1,sp)
 928  029d e701          	ld	(1,x),a
 929  029f               L152:
 930                     ; 258   FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 932  029f a6fd          	ld	a,#253
 933  02a1 cd0437        	call	_FLASH_WaitForLastOperation
 935                     ; 261   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 937  02a4 721f505b      	bres	20571,#7
 938                     ; 262   FLASH->NCR2 |= FLASH_NCR2_NOPT;
 940  02a8 721e505c      	bset	20572,#7
 941                     ; 263 }
 944  02ac 85            	popw	x
 945  02ad 81            	ret
 982                     ; 270 void FLASH_EraseOptionByte(uint16_t Address)
 982                     ; 271 {
 983                     	switch	.text
 984  02ae               _FLASH_EraseOptionByte:
 986  02ae 89            	pushw	x
 987       00000000      OFST:	set	0
 990                     ; 273   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 992  02af a34800        	cpw	x,#18432
 993  02b2 2508          	jrult	L621
 994  02b4 a34880        	cpw	x,#18560
 995  02b7 2403          	jruge	L621
 996  02b9 4f            	clr	a
 997  02ba 2010          	jra	L031
 998  02bc               L621:
 999  02bc ae0111        	ldw	x,#273
1000  02bf 89            	pushw	x
1001  02c0 ae0000        	ldw	x,#0
1002  02c3 89            	pushw	x
1003  02c4 ae0010        	ldw	x,#L73
1004  02c7 cd0000        	call	_assert_failed
1006  02ca 5b04          	addw	sp,#4
1007  02cc               L031:
1008                     ; 276   FLASH->CR2 |= FLASH_CR2_OPT;
1010  02cc 721e505b      	bset	20571,#7
1011                     ; 277   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
1013  02d0 721f505c      	bres	20572,#7
1014                     ; 280   if(Address == 0x4800)
1016  02d4 1e01          	ldw	x,(OFST+1,sp)
1017  02d6 a34800        	cpw	x,#18432
1018  02d9 2605          	jrne	L172
1019                     ; 283     *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
1021  02db 1e01          	ldw	x,(OFST+1,sp)
1022  02dd 7f            	clr	(x)
1024  02de 2009          	jra	L372
1025  02e0               L172:
1026                     ; 288     *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
1028  02e0 1e01          	ldw	x,(OFST+1,sp)
1029  02e2 7f            	clr	(x)
1030                     ; 289     *((NEAR uint8_t*)((uint16_t)(Address + (uint16_t)1 ))) = FLASH_SET_BYTE;
1032  02e3 1e01          	ldw	x,(OFST+1,sp)
1033  02e5 a6ff          	ld	a,#255
1034  02e7 e701          	ld	(1,x),a
1035  02e9               L372:
1036                     ; 291   FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
1038  02e9 a6fd          	ld	a,#253
1039  02eb cd0437        	call	_FLASH_WaitForLastOperation
1041                     ; 294   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
1043  02ee 721f505b      	bres	20571,#7
1044                     ; 295   FLASH->NCR2 |= FLASH_NCR2_NOPT;
1046  02f2 721e505c      	bset	20572,#7
1047                     ; 296 }
1050  02f6 85            	popw	x
1051  02f7 81            	ret
1115                     ; 303 uint16_t FLASH_ReadOptionByte(uint16_t Address)
1115                     ; 304 {
1116                     	switch	.text
1117  02f8               _FLASH_ReadOptionByte:
1119  02f8 89            	pushw	x
1120  02f9 5204          	subw	sp,#4
1121       00000004      OFST:	set	4
1124                     ; 305   uint8_t value_optbyte, value_optbyte_complement = 0;
1126                     ; 306   uint16_t res_value = 0;
1128                     ; 309   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
1130  02fb a34800        	cpw	x,#18432
1131  02fe 2508          	jrult	L431
1132  0300 a34880        	cpw	x,#18560
1133  0303 2403          	jruge	L431
1134  0305 4f            	clr	a
1135  0306 2010          	jra	L631
1136  0308               L431:
1137  0308 ae0135        	ldw	x,#309
1138  030b 89            	pushw	x
1139  030c ae0000        	ldw	x,#0
1140  030f 89            	pushw	x
1141  0310 ae0010        	ldw	x,#L73
1142  0313 cd0000        	call	_assert_failed
1144  0316 5b04          	addw	sp,#4
1145  0318               L631:
1146                     ; 311   value_optbyte = *((NEAR uint8_t*)Address); /* Read option byte */
1148  0318 1e05          	ldw	x,(OFST+1,sp)
1149  031a f6            	ld	a,(x)
1150  031b 6b01          	ld	(OFST-3,sp),a
1152                     ; 312   value_optbyte_complement = *(((NEAR uint8_t*)Address) + 1); /* Read option byte complement */
1154  031d 1e05          	ldw	x,(OFST+1,sp)
1155  031f e601          	ld	a,(1,x)
1156  0321 6b02          	ld	(OFST-2,sp),a
1158                     ; 315   if(Address == 0x4800)	 
1160  0323 1e05          	ldw	x,(OFST+1,sp)
1161  0325 a34800        	cpw	x,#18432
1162  0328 2608          	jrne	L723
1163                     ; 317     res_value =	 value_optbyte;
1165  032a 7b01          	ld	a,(OFST-3,sp)
1166  032c 5f            	clrw	x
1167  032d 97            	ld	xl,a
1168  032e 1f03          	ldw	(OFST-1,sp),x
1171  0330 2023          	jra	L133
1172  0332               L723:
1173                     ; 321     if(value_optbyte == (uint8_t)(~value_optbyte_complement))
1175  0332 7b02          	ld	a,(OFST-2,sp)
1176  0334 43            	cpl	a
1177  0335 1101          	cp	a,(OFST-3,sp)
1178  0337 2617          	jrne	L333
1179                     ; 323       res_value = (uint16_t)((uint16_t)value_optbyte << 8);
1181  0339 7b01          	ld	a,(OFST-3,sp)
1182  033b 5f            	clrw	x
1183  033c 97            	ld	xl,a
1184  033d 4f            	clr	a
1185  033e 02            	rlwa	x,a
1186  033f 1f03          	ldw	(OFST-1,sp),x
1188                     ; 324       res_value = res_value | (uint16_t)value_optbyte_complement;
1190  0341 7b02          	ld	a,(OFST-2,sp)
1191  0343 5f            	clrw	x
1192  0344 97            	ld	xl,a
1193  0345 01            	rrwa	x,a
1194  0346 1a04          	or	a,(OFST+0,sp)
1195  0348 01            	rrwa	x,a
1196  0349 1a03          	or	a,(OFST-1,sp)
1197  034b 01            	rrwa	x,a
1198  034c 1f03          	ldw	(OFST-1,sp),x
1201  034e 2005          	jra	L133
1202  0350               L333:
1203                     ; 328       res_value = FLASH_OPTIONBYTE_ERROR;
1205  0350 ae5555        	ldw	x,#21845
1206  0353 1f03          	ldw	(OFST-1,sp),x
1208  0355               L133:
1209                     ; 331   return(res_value);
1211  0355 1e03          	ldw	x,(OFST-1,sp)
1214  0357 5b06          	addw	sp,#6
1215  0359 81            	ret
1290                     ; 340 void FLASH_SetLowPowerMode(FLASH_LPMode_TypeDef FLASH_LPMode)
1290                     ; 341 {
1291                     	switch	.text
1292  035a               _FLASH_SetLowPowerMode:
1294  035a 88            	push	a
1295       00000000      OFST:	set	0
1298                     ; 343   assert_param(IS_FLASH_LOW_POWER_MODE_OK(FLASH_LPMode));
1300  035b a104          	cp	a,#4
1301  035d 270b          	jreq	L441
1302  035f a108          	cp	a,#8
1303  0361 2707          	jreq	L441
1304  0363 4d            	tnz	a
1305  0364 2704          	jreq	L441
1306  0366 a10c          	cp	a,#12
1307  0368 2603          	jrne	L241
1308  036a               L441:
1309  036a 4f            	clr	a
1310  036b 2010          	jra	L641
1311  036d               L241:
1312  036d ae0157        	ldw	x,#343
1313  0370 89            	pushw	x
1314  0371 ae0000        	ldw	x,#0
1315  0374 89            	pushw	x
1316  0375 ae0010        	ldw	x,#L73
1317  0378 cd0000        	call	_assert_failed
1319  037b 5b04          	addw	sp,#4
1320  037d               L641:
1321                     ; 346   FLASH->CR1 &= (uint8_t)(~(FLASH_CR1_HALT | FLASH_CR1_AHALT)); 
1323  037d c6505a        	ld	a,20570
1324  0380 a4f3          	and	a,#243
1325  0382 c7505a        	ld	20570,a
1326                     ; 349   FLASH->CR1 |= (uint8_t)FLASH_LPMode; 
1328  0385 c6505a        	ld	a,20570
1329  0388 1a01          	or	a,(OFST+1,sp)
1330  038a c7505a        	ld	20570,a
1331                     ; 350 }
1334  038d 84            	pop	a
1335  038e 81            	ret
1394                     ; 358 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
1394                     ; 359 {
1395                     	switch	.text
1396  038f               _FLASH_SetProgrammingTime:
1398  038f 88            	push	a
1399       00000000      OFST:	set	0
1402                     ; 361   assert_param(IS_FLASH_PROGRAM_TIME_OK(FLASH_ProgTime));
1404  0390 4d            	tnz	a
1405  0391 2704          	jreq	L451
1406  0393 a101          	cp	a,#1
1407  0395 2603          	jrne	L251
1408  0397               L451:
1409  0397 4f            	clr	a
1410  0398 2010          	jra	L651
1411  039a               L251:
1412  039a ae0169        	ldw	x,#361
1413  039d 89            	pushw	x
1414  039e ae0000        	ldw	x,#0
1415  03a1 89            	pushw	x
1416  03a2 ae0010        	ldw	x,#L73
1417  03a5 cd0000        	call	_assert_failed
1419  03a8 5b04          	addw	sp,#4
1420  03aa               L651:
1421                     ; 363   FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
1423  03aa 7211505a      	bres	20570,#0
1424                     ; 364   FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
1426  03ae c6505a        	ld	a,20570
1427  03b1 1a01          	or	a,(OFST+1,sp)
1428  03b3 c7505a        	ld	20570,a
1429                     ; 365 }
1432  03b6 84            	pop	a
1433  03b7 81            	ret
1458                     ; 372 FLASH_LPMode_TypeDef FLASH_GetLowPowerMode(void)
1458                     ; 373 {
1459                     	switch	.text
1460  03b8               _FLASH_GetLowPowerMode:
1464                     ; 374   return((FLASH_LPMode_TypeDef)(FLASH->CR1 & (uint8_t)(FLASH_CR1_HALT | FLASH_CR1_AHALT)));
1466  03b8 c6505a        	ld	a,20570
1467  03bb a40c          	and	a,#12
1470  03bd 81            	ret
1495                     ; 382 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
1495                     ; 383 {
1496                     	switch	.text
1497  03be               _FLASH_GetProgrammingTime:
1501                     ; 384   return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
1503  03be c6505a        	ld	a,20570
1504  03c1 a401          	and	a,#1
1507  03c3 81            	ret
1541                     ; 392 uint32_t FLASH_GetBootSize(void)
1541                     ; 393 {
1542                     	switch	.text
1543  03c4               _FLASH_GetBootSize:
1545  03c4 5204          	subw	sp,#4
1546       00000004      OFST:	set	4
1549                     ; 394   uint32_t temp = 0;
1551                     ; 397   temp = (uint32_t)((uint32_t)FLASH->FPR * (uint32_t)512);
1553  03c6 c6505d        	ld	a,20573
1554  03c9 5f            	clrw	x
1555  03ca 97            	ld	xl,a
1556  03cb 90ae0200      	ldw	y,#512
1557  03cf cd0000        	call	c_umul
1559  03d2 96            	ldw	x,sp
1560  03d3 1c0001        	addw	x,#OFST-3
1561  03d6 cd0000        	call	c_rtol
1564                     ; 400   if(FLASH->FPR == 0xFF)
1566  03d9 c6505d        	ld	a,20573
1567  03dc a1ff          	cp	a,#255
1568  03de 2611          	jrne	L554
1569                     ; 402     temp += 512;
1571  03e0 ae0200        	ldw	x,#512
1572  03e3 bf02          	ldw	c_lreg+2,x
1573  03e5 ae0000        	ldw	x,#0
1574  03e8 bf00          	ldw	c_lreg,x
1575  03ea 96            	ldw	x,sp
1576  03eb 1c0001        	addw	x,#OFST-3
1577  03ee cd0000        	call	c_lgadd
1580  03f1               L554:
1581                     ; 406   return(temp);
1583  03f1 96            	ldw	x,sp
1584  03f2 1c0001        	addw	x,#OFST-3
1585  03f5 cd0000        	call	c_ltor
1589  03f8 5b04          	addw	sp,#4
1590  03fa 81            	ret
1700                     ; 417 FlagStatus FLASH_GetFlagStatus(FLASH_Flag_TypeDef FLASH_FLAG)
1700                     ; 418 {
1701                     	switch	.text
1702  03fb               _FLASH_GetFlagStatus:
1704  03fb 88            	push	a
1705  03fc 88            	push	a
1706       00000001      OFST:	set	1
1709                     ; 419   FlagStatus status = RESET;
1711                     ; 421   assert_param(IS_FLASH_FLAGS_OK(FLASH_FLAG));
1713  03fd a140          	cp	a,#64
1714  03ff 2710          	jreq	L271
1715  0401 a108          	cp	a,#8
1716  0403 270c          	jreq	L271
1717  0405 a104          	cp	a,#4
1718  0407 2708          	jreq	L271
1719  0409 a102          	cp	a,#2
1720  040b 2704          	jreq	L271
1721  040d a101          	cp	a,#1
1722  040f 2603          	jrne	L071
1723  0411               L271:
1724  0411 4f            	clr	a
1725  0412 2010          	jra	L471
1726  0414               L071:
1727  0414 ae01a5        	ldw	x,#421
1728  0417 89            	pushw	x
1729  0418 ae0000        	ldw	x,#0
1730  041b 89            	pushw	x
1731  041c ae0010        	ldw	x,#L73
1732  041f cd0000        	call	_assert_failed
1734  0422 5b04          	addw	sp,#4
1735  0424               L471:
1736                     ; 424   if((FLASH->IAPSR & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
1738  0424 c6505f        	ld	a,20575
1739  0427 1502          	bcp	a,(OFST+1,sp)
1740  0429 2706          	jreq	L725
1741                     ; 426     status = SET; /* FLASH_FLAG is set */
1743  042b a601          	ld	a,#1
1744  042d 6b01          	ld	(OFST+0,sp),a
1747  042f 2002          	jra	L135
1748  0431               L725:
1749                     ; 430     status = RESET; /* FLASH_FLAG is reset*/
1751  0431 0f01          	clr	(OFST+0,sp)
1753  0433               L135:
1754                     ; 434   return status;
1756  0433 7b01          	ld	a,(OFST+0,sp)
1759  0435 85            	popw	x
1760  0436 81            	ret
1853                     ; 549 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType)) 
1853                     ; 550 {
1854                     	switch	.text
1855  0437               _FLASH_WaitForLastOperation:
1857  0437 5203          	subw	sp,#3
1858       00000003      OFST:	set	3
1861                     ; 551   uint8_t flagstatus = 0x00;
1863  0439 0f03          	clr	(OFST+0,sp)
1865                     ; 552   uint16_t timeout = OPERATION_TIMEOUT;
1867  043b aeffff        	ldw	x,#65535
1868  043e 1f01          	ldw	(OFST-2,sp),x
1870                     ; 557     if(FLASH_MemType == FLASH_MEMTYPE_PROG)
1872  0440 a1fd          	cp	a,#253
1873  0442 2628          	jrne	L316
1875  0444 200e          	jra	L106
1876  0446               L775:
1877                     ; 561         flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_EOP |
1877                     ; 562                                                         FLASH_IAPSR_WR_PG_DIS));
1879  0446 c6505f        	ld	a,20575
1880  0449 a405          	and	a,#5
1881  044b 6b03          	ld	(OFST+0,sp),a
1883                     ; 563         timeout--;
1885  044d 1e01          	ldw	x,(OFST-2,sp)
1886  044f 1d0001        	subw	x,#1
1887  0452 1f01          	ldw	(OFST-2,sp),x
1889  0454               L106:
1890                     ; 559       while((flagstatus == 0x00) && (timeout != 0x00))
1892  0454 0d03          	tnz	(OFST+0,sp)
1893  0456 261c          	jrne	L706
1895  0458 1e01          	ldw	x,(OFST-2,sp)
1896  045a 26ea          	jrne	L775
1897  045c 2016          	jra	L706
1898  045e               L116:
1899                     ; 570         flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_HVOFF |
1899                     ; 571                                                         FLASH_IAPSR_WR_PG_DIS));
1901  045e c6505f        	ld	a,20575
1902  0461 a441          	and	a,#65
1903  0463 6b03          	ld	(OFST+0,sp),a
1905                     ; 572         timeout--;
1907  0465 1e01          	ldw	x,(OFST-2,sp)
1908  0467 1d0001        	subw	x,#1
1909  046a 1f01          	ldw	(OFST-2,sp),x
1911  046c               L316:
1912                     ; 568       while((flagstatus == 0x00) && (timeout != 0x00))
1914  046c 0d03          	tnz	(OFST+0,sp)
1915  046e 2604          	jrne	L706
1917  0470 1e01          	ldw	x,(OFST-2,sp)
1918  0472 26ea          	jrne	L116
1919  0474               L706:
1920                     ; 584   if(timeout == 0x00 )
1922  0474 1e01          	ldw	x,(OFST-2,sp)
1923  0476 2604          	jrne	L126
1924                     ; 586     flagstatus = FLASH_STATUS_TIMEOUT;
1926  0478 a602          	ld	a,#2
1927  047a 6b03          	ld	(OFST+0,sp),a
1929  047c               L126:
1930                     ; 589   return((FLASH_Status_TypeDef)flagstatus);
1932  047c 7b03          	ld	a,(OFST+0,sp)
1935  047e 5b03          	addw	sp,#3
1936  0480 81            	ret
2000                     ; 599 IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
2000                     ; 600 {
2001                     	switch	.text
2002  0481               _FLASH_EraseBlock:
2004  0481 89            	pushw	x
2005  0482 5207          	subw	sp,#7
2006       00000007      OFST:	set	7
2009                     ; 601   uint32_t startaddress = 0;
2011                     ; 611   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
2013  0484 7b0c          	ld	a,(OFST+5,sp)
2014  0486 a1fd          	cp	a,#253
2015  0488 2706          	jreq	L402
2016  048a 7b0c          	ld	a,(OFST+5,sp)
2017  048c a1f7          	cp	a,#247
2018  048e 2603          	jrne	L202
2019  0490               L402:
2020  0490 4f            	clr	a
2021  0491 2010          	jra	L602
2022  0493               L202:
2023  0493 ae0263        	ldw	x,#611
2024  0496 89            	pushw	x
2025  0497 ae0000        	ldw	x,#0
2026  049a 89            	pushw	x
2027  049b ae0010        	ldw	x,#L73
2028  049e cd0000        	call	_assert_failed
2030  04a1 5b04          	addw	sp,#4
2031  04a3               L602:
2032                     ; 612   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
2034  04a3 7b0c          	ld	a,(OFST+5,sp)
2035  04a5 a1fd          	cp	a,#253
2036  04a7 2626          	jrne	L556
2037                     ; 614     assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
2039  04a9 1e08          	ldw	x,(OFST+1,sp)
2040  04ab a30400        	cpw	x,#1024
2041  04ae 2403          	jruge	L012
2042  04b0 4f            	clr	a
2043  04b1 2010          	jra	L212
2044  04b3               L012:
2045  04b3 ae0266        	ldw	x,#614
2046  04b6 89            	pushw	x
2047  04b7 ae0000        	ldw	x,#0
2048  04ba 89            	pushw	x
2049  04bb ae0010        	ldw	x,#L73
2050  04be cd0000        	call	_assert_failed
2052  04c1 5b04          	addw	sp,#4
2053  04c3               L212:
2054                     ; 615     startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
2056  04c3 ae8000        	ldw	x,#32768
2057  04c6 1f03          	ldw	(OFST-4,sp),x
2058  04c8 ae0000        	ldw	x,#0
2059  04cb 1f01          	ldw	(OFST-6,sp),x
2062  04cd 2024          	jra	L756
2063  04cf               L556:
2064                     ; 619     assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
2066  04cf 1e08          	ldw	x,(OFST+1,sp)
2067  04d1 a30010        	cpw	x,#16
2068  04d4 2403          	jruge	L412
2069  04d6 4f            	clr	a
2070  04d7 2010          	jra	L612
2071  04d9               L412:
2072  04d9 ae026b        	ldw	x,#619
2073  04dc 89            	pushw	x
2074  04dd ae0000        	ldw	x,#0
2075  04e0 89            	pushw	x
2076  04e1 ae0010        	ldw	x,#L73
2077  04e4 cd0000        	call	_assert_failed
2079  04e7 5b04          	addw	sp,#4
2080  04e9               L612:
2081                     ; 620     startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
2083  04e9 ae4000        	ldw	x,#16384
2084  04ec 1f03          	ldw	(OFST-4,sp),x
2085  04ee ae0000        	ldw	x,#0
2086  04f1 1f01          	ldw	(OFST-6,sp),x
2088  04f3               L756:
2089                     ; 625   pwFlash = (PointerAttr uint8_t *)(MemoryAddressCast)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
2091  04f3 1e08          	ldw	x,(OFST+1,sp)
2092  04f5 a680          	ld	a,#128
2093  04f7 cd0000        	call	c_cmulx
2095  04fa 96            	ldw	x,sp
2096  04fb 1c0001        	addw	x,#OFST-6
2097  04fe cd0000        	call	c_ladd
2099  0501 450100        	mov	c_x,c_lreg+1
2100  0504 be02          	ldw	x,c_lreg+2
2101  0506 b600          	ld	a,c_x
2102  0508 6b05          	ld	(OFST-2,sp),a
2103  050a 1f06          	ldw	(OFST-1,sp),x
2105                     ; 632   FLASH->CR2 |= FLASH_CR2_ERASE;
2107  050c 721a505b      	bset	20571,#5
2108                     ; 633   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NERASE);
2110  0510 721b505c      	bres	20572,#5
2111                     ; 640     *pwFlash = (uint8_t)0;
2113  0514 7b05          	ld	a,(OFST-2,sp)
2114  0516 b700          	ld	c_x,a
2115  0518 1e06          	ldw	x,(OFST-1,sp)
2116  051a bf01          	ldw	c_x+1,x
2117  051c 4f            	clr	a
2118  051d 92bd0000      	ldf	[c_x.e],a
2119                     ; 641   *(pwFlash + 1) = (uint8_t)0;
2121  0521 7b05          	ld	a,(OFST-2,sp)
2122  0523 b700          	ld	c_x,a
2123  0525 1e06          	ldw	x,(OFST-1,sp)
2124  0527 90ae0001      	ldw	y,#1
2125  052b bf01          	ldw	c_x+1,x
2126  052d 93            	ldw	x,y
2127  052e 4f            	clr	a
2128  052f 92a70000      	ldf	([c_x.e],x),a
2129                     ; 642   *(pwFlash + 2) = (uint8_t)0;
2131  0533 7b05          	ld	a,(OFST-2,sp)
2132  0535 b700          	ld	c_x,a
2133  0537 1e06          	ldw	x,(OFST-1,sp)
2134  0539 90ae0002      	ldw	y,#2
2135  053d bf01          	ldw	c_x+1,x
2136  053f 93            	ldw	x,y
2137  0540 4f            	clr	a
2138  0541 92a70000      	ldf	([c_x.e],x),a
2139                     ; 643   *(pwFlash + 3) = (uint8_t)0;    
2141  0545 7b05          	ld	a,(OFST-2,sp)
2142  0547 b700          	ld	c_x,a
2143  0549 1e06          	ldw	x,(OFST-1,sp)
2144  054b 90ae0003      	ldw	y,#3
2145  054f bf01          	ldw	c_x+1,x
2146  0551 93            	ldw	x,y
2147  0552 4f            	clr	a
2148  0553 92a70000      	ldf	([c_x.e],x),a
2149                     ; 645 }
2152  0557 5b09          	addw	sp,#9
2153  0559 81            	ret
2258                     ; 656 IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType, 
2258                     ; 657                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer))
2258                     ; 658 {
2259                     	switch	.text
2260  055a               _FLASH_ProgramBlock:
2262  055a 89            	pushw	x
2263  055b 5206          	subw	sp,#6
2264       00000006      OFST:	set	6
2267                     ; 659   uint16_t Count = 0;
2269                     ; 660   uint32_t startaddress = 0;
2271                     ; 663   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
2273  055d 7b0b          	ld	a,(OFST+5,sp)
2274  055f a1fd          	cp	a,#253
2275  0561 2706          	jreq	L422
2276  0563 7b0b          	ld	a,(OFST+5,sp)
2277  0565 a1f7          	cp	a,#247
2278  0567 2603          	jrne	L222
2279  0569               L422:
2280  0569 4f            	clr	a
2281  056a 2010          	jra	L622
2282  056c               L222:
2283  056c ae0297        	ldw	x,#663
2284  056f 89            	pushw	x
2285  0570 ae0000        	ldw	x,#0
2286  0573 89            	pushw	x
2287  0574 ae0010        	ldw	x,#L73
2288  0577 cd0000        	call	_assert_failed
2290  057a 5b04          	addw	sp,#4
2291  057c               L622:
2292                     ; 664   assert_param(IS_FLASH_PROGRAM_MODE_OK(FLASH_ProgMode));
2294  057c 0d0c          	tnz	(OFST+6,sp)
2295  057e 2706          	jreq	L232
2296  0580 7b0c          	ld	a,(OFST+6,sp)
2297  0582 a110          	cp	a,#16
2298  0584 2603          	jrne	L032
2299  0586               L232:
2300  0586 4f            	clr	a
2301  0587 2010          	jra	L432
2302  0589               L032:
2303  0589 ae0298        	ldw	x,#664
2304  058c 89            	pushw	x
2305  058d ae0000        	ldw	x,#0
2306  0590 89            	pushw	x
2307  0591 ae0010        	ldw	x,#L73
2308  0594 cd0000        	call	_assert_failed
2310  0597 5b04          	addw	sp,#4
2311  0599               L432:
2312                     ; 665   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
2314  0599 7b0b          	ld	a,(OFST+5,sp)
2315  059b a1fd          	cp	a,#253
2316  059d 2626          	jrne	L337
2317                     ; 667     assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
2319  059f 1e07          	ldw	x,(OFST+1,sp)
2320  05a1 a30400        	cpw	x,#1024
2321  05a4 2403          	jruge	L632
2322  05a6 4f            	clr	a
2323  05a7 2010          	jra	L042
2324  05a9               L632:
2325  05a9 ae029b        	ldw	x,#667
2326  05ac 89            	pushw	x
2327  05ad ae0000        	ldw	x,#0
2328  05b0 89            	pushw	x
2329  05b1 ae0010        	ldw	x,#L73
2330  05b4 cd0000        	call	_assert_failed
2332  05b7 5b04          	addw	sp,#4
2333  05b9               L042:
2334                     ; 668     startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
2336  05b9 ae8000        	ldw	x,#32768
2337  05bc 1f03          	ldw	(OFST-3,sp),x
2338  05be ae0000        	ldw	x,#0
2339  05c1 1f01          	ldw	(OFST-5,sp),x
2342  05c3 2024          	jra	L537
2343  05c5               L337:
2344                     ; 672     assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
2346  05c5 1e07          	ldw	x,(OFST+1,sp)
2347  05c7 a30010        	cpw	x,#16
2348  05ca 2403          	jruge	L242
2349  05cc 4f            	clr	a
2350  05cd 2010          	jra	L442
2351  05cf               L242:
2352  05cf ae02a0        	ldw	x,#672
2353  05d2 89            	pushw	x
2354  05d3 ae0000        	ldw	x,#0
2355  05d6 89            	pushw	x
2356  05d7 ae0010        	ldw	x,#L73
2357  05da cd0000        	call	_assert_failed
2359  05dd 5b04          	addw	sp,#4
2360  05df               L442:
2361                     ; 673     startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
2363  05df ae4000        	ldw	x,#16384
2364  05e2 1f03          	ldw	(OFST-3,sp),x
2365  05e4 ae0000        	ldw	x,#0
2366  05e7 1f01          	ldw	(OFST-5,sp),x
2368  05e9               L537:
2369                     ; 677   startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
2371  05e9 1e07          	ldw	x,(OFST+1,sp)
2372  05eb a680          	ld	a,#128
2373  05ed cd0000        	call	c_cmulx
2375  05f0 96            	ldw	x,sp
2376  05f1 1c0001        	addw	x,#OFST-5
2377  05f4 cd0000        	call	c_lgadd
2380                     ; 680   if(FLASH_ProgMode == FLASH_PROGRAMMODE_STANDARD)
2382  05f7 0d0c          	tnz	(OFST+6,sp)
2383  05f9 260a          	jrne	L737
2384                     ; 683     FLASH->CR2 |= FLASH_CR2_PRG;
2386  05fb 7210505b      	bset	20571,#0
2387                     ; 684     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NPRG);
2389  05ff 7211505c      	bres	20572,#0
2391  0603 2008          	jra	L147
2392  0605               L737:
2393                     ; 689     FLASH->CR2 |= FLASH_CR2_FPRG;
2395  0605 7218505b      	bset	20571,#4
2396                     ; 690     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NFPRG);
2398  0609 7219505c      	bres	20572,#4
2399  060d               L147:
2400                     ; 694   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
2402  060d 5f            	clrw	x
2403  060e 1f05          	ldw	(OFST-1,sp),x
2405  0610               L347:
2406                     ; 696     *((PointerAttr uint8_t*) (MemoryAddressCast)startaddress + Count) = ((uint8_t)(Buffer[Count]));
2408  0610 1e0d          	ldw	x,(OFST+7,sp)
2409  0612 72fb05        	addw	x,(OFST-1,sp)
2410  0615 f6            	ld	a,(x)
2411  0616 88            	push	a
2412  0617 7b03          	ld	a,(OFST-3,sp)
2413  0619 b700          	ld	c_x,a
2414  061b 1e04          	ldw	x,(OFST-2,sp)
2415  061d 84            	pop	a
2416  061e 1605          	ldw	y,(OFST-1,sp)
2417  0620 bf01          	ldw	c_x+1,x
2418  0622 93            	ldw	x,y
2419  0623 92a70000      	ldf	([c_x.e],x),a
2420                     ; 694   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
2422  0627 1e05          	ldw	x,(OFST-1,sp)
2423  0629 1c0001        	addw	x,#1
2424  062c 1f05          	ldw	(OFST-1,sp),x
2428  062e 1e05          	ldw	x,(OFST-1,sp)
2429  0630 a30080        	cpw	x,#128
2430  0633 25db          	jrult	L347
2431                     ; 698 }
2434  0635 5b08          	addw	sp,#8
2435  0637 81            	ret
2448                     	xdef	_FLASH_WaitForLastOperation
2449                     	xdef	_FLASH_ProgramBlock
2450                     	xdef	_FLASH_EraseBlock
2451                     	xdef	_FLASH_GetFlagStatus
2452                     	xdef	_FLASH_GetBootSize
2453                     	xdef	_FLASH_GetProgrammingTime
2454                     	xdef	_FLASH_GetLowPowerMode
2455                     	xdef	_FLASH_SetProgrammingTime
2456                     	xdef	_FLASH_SetLowPowerMode
2457                     	xdef	_FLASH_EraseOptionByte
2458                     	xdef	_FLASH_ProgramOptionByte
2459                     	xdef	_FLASH_ReadOptionByte
2460                     	xdef	_FLASH_ProgramWord
2461                     	xdef	_FLASH_ReadByte
2462                     	xdef	_FLASH_ProgramByte
2463                     	xdef	_FLASH_EraseByte
2464                     	xdef	_FLASH_ITConfig
2465                     	xdef	_FLASH_DeInit
2466                     	xdef	_FLASH_Lock
2467                     	xdef	_FLASH_Unlock
2468                     	xref	_assert_failed
2469                     	switch	.const
2470  0010               L73:
2471  0010 7372635c7374  	dc.b	"src\stm8s_flash.c",0
2472                     	xref.b	c_lreg
2473                     	xref.b	c_x
2474                     	xref.b	c_y
2494                     	xref	c_ladd
2495                     	xref	c_cmulx
2496                     	xref	c_lgadd
2497                     	xref	c_rtol
2498                     	xref	c_umul
2499                     	xref	c_lcmp
2500                     	xref	c_ltor
2501                     	end
