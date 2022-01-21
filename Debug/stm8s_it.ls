   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.1 - 30 Jun 2020
   3                     ; Generator (Limited) V4.4.12 - 02 Jul 2020
  44                     ; 53 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
  44                     ; 54 {
  45                     	switch	.text
  46  0000               f_NonHandledInterrupt:
  50                     ; 58 }
  53  0000 80            	iret
  75                     ; 66 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  75                     ; 67 {
  76                     	switch	.text
  77  0001               f_TRAP_IRQHandler:
  81                     ; 71 }
  84  0001 80            	iret
 106                     ; 78 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
 106                     ; 79 
 106                     ; 80 {
 107                     	switch	.text
 108  0002               f_TLI_IRQHandler:
 112                     ; 84 }
 115  0002 80            	iret
 137                     ; 91 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 137                     ; 92 {
 138                     	switch	.text
 139  0003               f_AWU_IRQHandler:
 143                     ; 96 }
 146  0003 80            	iret
 168                     ; 103 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 168                     ; 104 {
 169                     	switch	.text
 170  0004               f_CLK_IRQHandler:
 174                     ; 108 }
 177  0004 80            	iret
 200                     ; 115 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 200                     ; 116 {
 201                     	switch	.text
 202  0005               f_EXTI_PORTA_IRQHandler:
 206                     ; 120 }
 209  0005 80            	iret
 232                     ; 127 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 232                     ; 128 {
 233                     	switch	.text
 234  0006               f_EXTI_PORTB_IRQHandler:
 238                     ; 132 }
 241  0006 80            	iret
 264                     ; 139 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 264                     ; 140 {
 265                     	switch	.text
 266  0007               f_EXTI_PORTC_IRQHandler:
 270                     ; 144 }
 273  0007 80            	iret
 296                     ; 151 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 296                     ; 152 {
 297                     	switch	.text
 298  0008               f_EXTI_PORTD_IRQHandler:
 302                     ; 156 }
 305  0008 80            	iret
 328                     ; 163 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 328                     ; 164 {
 329                     	switch	.text
 330  0009               f_EXTI_PORTE_IRQHandler:
 334                     ; 168 }
 337  0009 80            	iret
 359                     ; 190  INTERRUPT_HANDLER(CAN_RX_IRQHandler, 8)
 359                     ; 191  {
 360                     	switch	.text
 361  000a               f_CAN_RX_IRQHandler:
 365                     ; 195  }
 368  000a 80            	iret
 390                     ; 202  INTERRUPT_HANDLER(CAN_TX_IRQHandler, 9)
 390                     ; 203  {
 391                     	switch	.text
 392  000b               f_CAN_TX_IRQHandler:
 396                     ; 207  }
 399  000b 80            	iret
 421                     ; 215 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 421                     ; 216 {
 422                     	switch	.text
 423  000c               f_SPI_IRQHandler:
 427                     ; 220 }
 430  000c 80            	iret
 453                     ; 227 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 453                     ; 228 {
 454                     	switch	.text
 455  000d               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 459                     ; 232 }
 462  000d 80            	iret
 485                     ; 239 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 485                     ; 240 {
 486                     	switch	.text
 487  000e               f_TIM1_CAP_COM_IRQHandler:
 491                     ; 244 }
 494  000e 80            	iret
 517                     ; 277  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 517                     ; 278  {
 518                     	switch	.text
 519  000f               f_TIM2_UPD_OVF_BRK_IRQHandler:
 523                     ; 282  }
 526  000f 80            	iret
 549                     ; 289  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 549                     ; 290  {
 550                     	switch	.text
 551  0010               f_TIM2_CAP_COM_IRQHandler:
 555                     ; 294  }
 558  0010 80            	iret
 581                     ; 316  INTERRUPT_HANDLER(TIM3_CAP_COM_IRQHandler, 16)
 581                     ; 317  {
 582                     	switch	.text
 583  0011               f_TIM3_CAP_COM_IRQHandler:
 587                     ; 321  }
 590  0011 80            	iret
 613                     ; 331  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 613                     ; 332  {
 614                     	switch	.text
 615  0012               f_UART1_TX_IRQHandler:
 619                     ; 336  }
 622  0012 80            	iret
 645                     ; 343  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 645                     ; 344  {
 646                     	switch	.text
 647  0013               f_UART1_RX_IRQHandler:
 651                     ; 348  }
 654  0013 80            	iret
 676                     ; 382 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 676                     ; 383 {
 677                     	switch	.text
 678  0014               f_I2C_IRQHandler:
 682                     ; 387 }
 685  0014 80            	iret
 708                     ; 421  INTERRUPT_HANDLER(UART3_TX_IRQHandler, 20)
 708                     ; 422  {
 709                     	switch	.text
 710  0015               f_UART3_TX_IRQHandler:
 714                     ; 426  }
 717  0015 80            	iret
 740                     ; 433  INTERRUPT_HANDLER(UART3_RX_IRQHandler, 21)
 740                     ; 434  {
 741                     	switch	.text
 742  0016               f_UART3_RX_IRQHandler:
 746                     ; 438  }
 749  0016 80            	iret
 771                     ; 447  INTERRUPT_HANDLER(ADC2_IRQHandler, 22)
 771                     ; 448  {
 772                     	switch	.text
 773  0017               f_ADC2_IRQHandler:
 777                     ; 452  }
 780  0017 80            	iret
 803                     ; 500 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 803                     ; 501 {
 804                     	switch	.text
 805  0018               f_EEPROM_EEC_IRQHandler:
 809                     ; 505 }
 812  0018 80            	iret
 824                     	xdef	f_EEPROM_EEC_IRQHandler
 825                     	xdef	f_ADC2_IRQHandler
 826                     	xdef	f_UART3_TX_IRQHandler
 827                     	xdef	f_UART3_RX_IRQHandler
 828                     	xdef	f_I2C_IRQHandler
 829                     	xdef	f_UART1_RX_IRQHandler
 830                     	xdef	f_UART1_TX_IRQHandler
 831                     	xdef	f_TIM3_CAP_COM_IRQHandler
 832                     	xdef	f_TIM2_CAP_COM_IRQHandler
 833                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 834                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 835                     	xdef	f_TIM1_CAP_COM_IRQHandler
 836                     	xdef	f_SPI_IRQHandler
 837                     	xdef	f_CAN_TX_IRQHandler
 838                     	xdef	f_CAN_RX_IRQHandler
 839                     	xdef	f_EXTI_PORTE_IRQHandler
 840                     	xdef	f_EXTI_PORTD_IRQHandler
 841                     	xdef	f_EXTI_PORTC_IRQHandler
 842                     	xdef	f_EXTI_PORTB_IRQHandler
 843                     	xdef	f_EXTI_PORTA_IRQHandler
 844                     	xdef	f_CLK_IRQHandler
 845                     	xdef	f_AWU_IRQHandler
 846                     	xdef	f_TLI_IRQHandler
 847                     	xdef	f_TRAP_IRQHandler
 848                     	xdef	f_NonHandledInterrupt
 867                     	end
