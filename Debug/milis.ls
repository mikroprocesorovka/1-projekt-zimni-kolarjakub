   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.1 - 30 Jun 2020
   3                     ; Generator (Limited) V4.4.12 - 02 Jul 2020
  15                     	bsct
  16  0000               _miliseconds:
  17  0000 0000          	dc.w	0
  59                     ; 15 uint16_t milis(void){
  61                     	switch	.text
  62  0000               _milis:
  64  0000 89            	pushw	x
  65       00000002      OFST:	set	2
  68                     ; 17 TIM4_ITConfig(TIM4_IT_UPDATE,DISABLE);
  70  0001 ae0100        	ldw	x,#256
  71  0004 cd0000        	call	_TIM4_ITConfig
  73                     ; 18 tmp = miliseconds;
  75  0007 be00          	ldw	x,_miliseconds
  76  0009 1f01          	ldw	(OFST-1,sp),x
  78                     ; 19 TIM4_ITConfig(TIM4_IT_UPDATE,ENABLE);
  80  000b ae0101        	ldw	x,#257
  81  000e cd0000        	call	_TIM4_ITConfig
  83                     ; 20 return tmp;
  85  0011 1e01          	ldw	x,(OFST-1,sp)
  88  0013 5b02          	addw	sp,#2
  89  0015 81            	ret
 133                     ; 23 void delay_ms(uint16_t del){ 
 134                     	switch	.text
 135  0016               _delay_ms:
 137  0016 89            	pushw	x
 138  0017 89            	pushw	x
 139       00000002      OFST:	set	2
 142                     ; 25 if(del>DELAY_MS_MAX_VALUE){del=DELAY_MS_MAX_VALUE;} // ošetøení pøíliš velké hodnoty
 144  0018 a3fffe        	cpw	x,#65534
 145  001b 2505          	jrult	L15
 148  001d aefffd        	ldw	x,#65533
 149  0020 1f03          	ldw	(OFST+1,sp),x
 150  0022               L15:
 151                     ; 26 start_time=milis();
 153  0022 addc          	call	_milis
 155  0024 1f01          	ldw	(OFST-1,sp),x
 158  0026               L75:
 159                     ; 27 while((milis()-start_time) < del){}
 161  0026 add8          	call	_milis
 163  0028 72f001        	subw	x,(OFST-1,sp)
 164  002b 1303          	cpw	x,(OFST+1,sp)
 165  002d 25f7          	jrult	L75
 166                     ; 28 }
 169  002f 5b04          	addw	sp,#4
 170  0031 81            	ret
 199                     ; 57 void init_milis(void){
 200                     	switch	.text
 201  0032               _init_milis:
 205                     ; 58 TIM4_TimeBaseInit(PRESCALER,PERIOD); // (16MHz / 128) / 125 = 1000Hz
 207  0032 ae077c        	ldw	x,#1916
 208  0035 cd0000        	call	_TIM4_TimeBaseInit
 210                     ; 59 TIM4_ClearFlag(TIM4_FLAG_UPDATE);
 212  0038 a601          	ld	a,#1
 213  003a cd0000        	call	_TIM4_ClearFlag
 215                     ; 60 TIM4_ITConfig(TIM4_IT_UPDATE,ENABLE);
 217  003d ae0101        	ldw	x,#257
 218  0040 cd0000        	call	_TIM4_ITConfig
 220                     ; 61 ITC_SetSoftwarePriority(ITC_IRQ_TIM4_OVF, ITC_PRIORITYLEVEL_1); // nízká priorita pøerušení
 222  0043 ae1701        	ldw	x,#5889
 223  0046 cd0000        	call	_ITC_SetSoftwarePriority
 225                     ; 62 TIM4_Cmd(ENABLE);
 227  0049 a601          	ld	a,#1
 228  004b cd0000        	call	_TIM4_Cmd
 230                     ; 63 enableInterrupts();
 233  004e 9a            rim
 235                     ; 64 }
 239  004f 81            	ret
 265                     ; 67 INTERRUPT TIM4_UPD_OVF_IRQHandler(){
 267                     	switch	.text
 268  0050               f_TIM4_UPD_OVF_IRQHandler:
 270  0050 8a            	push	cc
 271  0051 84            	pop	a
 272  0052 a4bf          	and	a,#191
 273  0054 88            	push	a
 274  0055 86            	pop	cc
 275  0056 3b0002        	push	c_x+2
 276  0059 be00          	ldw	x,c_x
 277  005b 89            	pushw	x
 278  005c 3b0002        	push	c_y+2
 279  005f be00          	ldw	x,c_y
 280  0061 89            	pushw	x
 283                     ; 68 TIM4_ClearFlag(TIM4_FLAG_UPDATE);
 285  0062 a601          	ld	a,#1
 286  0064 cd0000        	call	_TIM4_ClearFlag
 288                     ; 69 miliseconds++;
 290  0067 be00          	ldw	x,_miliseconds
 291  0069 1c0001        	addw	x,#1
 292  006c bf00          	ldw	_miliseconds,x
 293                     ; 70 }
 296  006e 85            	popw	x
 297  006f bf00          	ldw	c_y,x
 298  0071 320002        	pop	c_y+2
 299  0074 85            	popw	x
 300  0075 bf00          	ldw	c_x,x
 301  0077 320002        	pop	c_x+2
 302  007a 80            	iret
 325                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 326                     	xdef	_miliseconds
 327                     	xdef	_init_milis
 328                     	xdef	_delay_ms
 329                     	xdef	_milis
 330                     	xref	_TIM4_ClearFlag
 331                     	xref	_TIM4_ITConfig
 332                     	xref	_TIM4_Cmd
 333                     	xref	_TIM4_TimeBaseInit
 334                     	xref	_ITC_SetSoftwarePriority
 335                     	xref.b	c_x
 336                     	xref.b	c_y
 355                     	end
