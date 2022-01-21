   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.1 - 30 Jun 2020
   3                     ; Generator (Limited) V4.4.12 - 02 Jul 2020
 176                     ; 10 uint16_t ADC_get(ADC2_Channel_TypeDef ADC2_Channel){
 178                     	switch	.text
 179  0000               _ADC_get:
 183                     ; 11 ADC2_Select_Channel(ADC2_Channel); // vybere kanál / nastavuje analogový multiplexer
 185  0000 ad13          	call	_ADC2_Select_Channel
 187                     ; 12 ADC2->CR1 |= ADC2_CR1_ADON; // Start Conversion (ADON must be SET before => ADC must be enabled !)
 189  0002 72105401      	bset	21505,#0
 191  0006               L101:
 192                     ; 13 while(!(ADC2->CSR & ADC2_CSR_EOC)); // èeká na dokonèení pøevodu (End Of Conversion)
 194  0006 c65400        	ld	a,21504
 195  0009 a580          	bcp	a,#128
 196  000b 27f9          	jreq	L101
 197                     ; 14 ADC2->CSR &=~ADC2_CSR_EOC; // maže vlajku 
 199  000d 721f5400      	bres	21504,#7
 200                     ; 15 return ADC2_GetConversionValue(); // vrací výsledek
 202  0011 cd0000        	call	_ADC2_GetConversionValue
 206  0014 81            	ret
 251                     ; 21 void ADC2_Select_Channel(ADC2_Channel_TypeDef ADC2_Channel){
 252                     	switch	.text
 253  0015               _ADC2_Select_Channel:
 255  0015 88            	push	a
 256  0016 88            	push	a
 257       00000001      OFST:	set	1
 260                     ; 22     uint8_t tmp = (ADC2->CSR) & (~ADC2_CSR_CH);
 262  0017 c65400        	ld	a,21504
 263  001a a4f0          	and	a,#240
 264  001c 6b01          	ld	(OFST+0,sp),a
 266                     ; 23     tmp |= ADC2_Channel | ADC2_CSR_EOC;
 268  001e 7b02          	ld	a,(OFST+1,sp)
 269  0020 aa80          	or	a,#128
 270  0022 1a01          	or	a,(OFST+0,sp)
 271  0024 6b01          	ld	(OFST+0,sp),a
 273                     ; 24     ADC2->CSR = tmp;
 275  0026 7b01          	ld	a,(OFST+0,sp)
 276  0028 c75400        	ld	21504,a
 277                     ; 25 }
 280  002b 85            	popw	x
 281  002c 81            	ret
 336                     ; 30 void ADC2_AlignConfig(ADC2_Align_TypeDef ADC2_Align){
 337                     	switch	.text
 338  002d               _ADC2_AlignConfig:
 342                     ; 31 	if(ADC2_Align){
 344  002d 4d            	tnz	a
 345  002e 2708          	jreq	L551
 346                     ; 32 		ADC2->CR2 |= (uint8_t)(ADC2_Align);
 348  0030 ca5402        	or	a,21506
 349  0033 c75402        	ld	21506,a
 351  0036 2004          	jra	L751
 352  0038               L551:
 353                     ; 34 		ADC2->CR2 &= (uint8_t)(~ADC2_CR2_ALIGN);
 355  0038 72175402      	bres	21506,#3
 356  003c               L751:
 357                     ; 36 }
 360  003c 81            	ret
 386                     ; 40 void ADC2_Startup_Wait(void){
 387                     	switch	.text
 388  003d               _ADC2_Startup_Wait:
 392                     ; 21 	_asm("nop\n $N:\n decw X\n jrne $L\n nop\n ", __ticks);
 396  003d ae0026        	ldw	x,#38
 398  0040 9d            nop
 399  0041                L41:
 400  0041 5a             decw X
 401  0042 26fd           jrne L41
 402  0044 9d             nop
 403                      
 405  0045               L361:
 406                     ; 42 }
 409  0045 81            	ret
 422                     	xdef	_ADC2_Startup_Wait
 423                     	xdef	_ADC2_AlignConfig
 424                     	xdef	_ADC2_Select_Channel
 425                     	xdef	_ADC_get
 426                     	xref	_ADC2_GetConversionValue
 445                     	end
