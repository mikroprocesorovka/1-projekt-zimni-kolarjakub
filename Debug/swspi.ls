   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.1 - 30 Jun 2020
   3                     ; Generator (Limited) V4.4.12 - 02 Jul 2020
  44                     ; 12 void swspi_init(void){
  46                     	switch	.text
  47  0000               _swspi_init:
  51                     ; 13 GPIO_Init(CS_GPIO,CS_PIN,GPIO_MODE_OUT_PP_HIGH_FAST);
  53  0000 4bf0          	push	#240
  54  0002 4b10          	push	#16
  55  0004 ae5005        	ldw	x,#20485
  56  0007 cd0000        	call	_GPIO_Init
  58  000a 85            	popw	x
  59                     ; 14 GPIO_Init(CLK_GPIO,CLK_PIN,GPIO_MODE_OUT_PP_LOW_FAST);
  61  000b 4be0          	push	#224
  62  000d 4b08          	push	#8
  63  000f ae5005        	ldw	x,#20485
  64  0012 cd0000        	call	_GPIO_Init
  66  0015 85            	popw	x
  67                     ; 15 GPIO_Init(DIN_GPIO,DIN_PIN,GPIO_MODE_OUT_PP_LOW_FAST);
  69  0016 4be0          	push	#224
  70  0018 4b20          	push	#32
  71  001a ae5005        	ldw	x,#20485
  72  001d cd0000        	call	_GPIO_Init
  74  0020 85            	popw	x
  75                     ; 16 }
  78  0021 81            	ret
 123                     ; 19 void swspi_tx16(uint16_t data){
 124                     	switch	.text
 125  0022               _swspi_tx16:
 127  0022 89            	pushw	x
 128  0023 89            	pushw	x
 129       00000002      OFST:	set	2
 132                     ; 20 uint16_t maska=0b1<<15; 
 134  0024 ae8000        	ldw	x,#32768
 135  0027 1f01          	ldw	(OFST-1,sp),x
 137                     ; 21 CS_L;										
 139  0029 4b10          	push	#16
 140  002b ae5005        	ldw	x,#20485
 141  002e cd0000        	call	_GPIO_WriteLow
 143  0031 84            	pop	a
 145  0032 2038          	jra	L54
 146  0034               L34:
 147                     ; 23 if(maska & data){DIN_H;}else{DIN_L;}
 149  0034 1e01          	ldw	x,(OFST-1,sp)
 150  0036 01            	rrwa	x,a
 151  0037 1404          	and	a,(OFST+2,sp)
 152  0039 01            	rrwa	x,a
 153  003a 1403          	and	a,(OFST+1,sp)
 154  003c 01            	rrwa	x,a
 155  003d a30000        	cpw	x,#0
 156  0040 270b          	jreq	L15
 159  0042 4b20          	push	#32
 160  0044 ae5005        	ldw	x,#20485
 161  0047 cd0000        	call	_GPIO_WriteHigh
 163  004a 84            	pop	a
 165  004b 2009          	jra	L35
 166  004d               L15:
 169  004d 4b20          	push	#32
 170  004f ae5005        	ldw	x,#20485
 171  0052 cd0000        	call	_GPIO_WriteLow
 173  0055 84            	pop	a
 174  0056               L35:
 175                     ; 24 CLK_H;
 177  0056 4b08          	push	#8
 178  0058 ae5005        	ldw	x,#20485
 179  005b cd0000        	call	_GPIO_WriteHigh
 181  005e 84            	pop	a
 182                     ; 25 maska = maska >> 1;
 184  005f 0401          	srl	(OFST-1,sp)
 185  0061 0602          	rrc	(OFST+0,sp)
 187                     ; 26 CLK_L;
 189  0063 4b08          	push	#8
 190  0065 ae5005        	ldw	x,#20485
 191  0068 cd0000        	call	_GPIO_WriteLow
 193  006b 84            	pop	a
 194  006c               L54:
 195                     ; 22 while(maska){
 197  006c 1e01          	ldw	x,(OFST-1,sp)
 198  006e 26c4          	jrne	L34
 199                     ; 28 CS_H;
 201  0070 4b10          	push	#16
 202  0072 ae5005        	ldw	x,#20485
 203  0075 cd0000        	call	_GPIO_WriteHigh
 205  0078 84            	pop	a
 206                     ; 29 }
 209  0079 5b04          	addw	sp,#4
 210  007b 81            	ret
 223                     	xdef	_swspi_tx16
 224                     	xdef	_swspi_init
 225                     	xref	_GPIO_WriteLow
 226                     	xref	_GPIO_WriteHigh
 227                     	xref	_GPIO_Init
 246                     	end
