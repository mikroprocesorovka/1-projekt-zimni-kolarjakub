   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.1 - 30 Jun 2020
   3                     ; Generator (Limited) V4.4.12 - 02 Jul 2020
  82                     ; 4 void I2C_WriteRegister(uint8_t slaveaddr, uint8_t u8_regAddr, uint8_t u8_NumByteToWrite,uint8_t *u8_DataBuffer)
  82                     ; 5 {
  84                     	switch	.text
  85  0000               _I2C_WriteRegister:
  87  0000 89            	pushw	x
  88       00000000      OFST:	set	0
  91  0001 200b          	jra	L54
  92  0003               L34:
  93                     ; 8     I2C->CR2 |= 2;                        								// STOP=1, generate stop
  95  0003 72125211      	bset	21009,#1
  97  0007               L35:
  98                     ; 9     while((I2C->CR2 & 2) && tout());      								// wait until stop is performed
 100  0007 c65211        	ld	a,21009
 101  000a a502          	bcp	a,#2
 102  000c 26f9          	jrne	L35
 103  000e               L54:
 104                     ; 6   while((I2C->SR3 & 2) && tout())       									// Wait while the bus is busy
 106  000e c65219        	ld	a,21017
 107  0011 a502          	bcp	a,#2
 108  0013 26ee          	jrne	L34
 109                     ; 12   I2C->CR2 |= 1;                        									// START=1, generate start
 111  0015 72105211      	bset	21009,#0
 113  0019               L16:
 114                     ; 13   while(((I2C->SR1 & 1)==0) && tout()); 									// Wait for start bit detection (SB)
 116  0019 c65217        	ld	a,21015
 117  001c a501          	bcp	a,#1
 118  001e 27f9          	jreq	L16
 119                     ; 14   i2c_dead_time();                          									// SB clearing sequence
 122  0020 9d            nop
 127  0021 9d            nop
 129                     ; 17 	I2C->DR = slaveaddr << 1;   							// Send 7-bit device address & Write (R/W = 0)
 132  0022 7b01          	ld	a,(OFST+1,sp)
 133  0024 48            	sll	a
 134  0025 c75216        	ld	21014,a
 136  0028               L76:
 137                     ; 19   while(!(I2C->SR1 & 2) && tout());     									// Wait for address ack (ADDR)
 139  0028 c65217        	ld	a,21015
 140  002b a502          	bcp	a,#2
 141  002d 27f9          	jreq	L76
 142                     ; 20   i2c_dead_time();                          									// ADDR clearing sequence
 145  002f 9d            nop
 150  0030 9d            nop
 152                     ; 21   I2C->SR3;
 155  0031 c65219        	ld	a,21017
 157  0034               L57:
 158                     ; 22   while(!(I2C->SR1 & 0x80) && tout());  									// Wait for TxE
 160  0034 c65217        	ld	a,21015
 161  0037 a580          	bcp	a,#128
 162  0039 27f9          	jreq	L57
 163                     ; 25     I2C->DR = u8_regAddr;                 								// send Offset command
 165  003b 7b02          	ld	a,(OFST+2,sp)
 166  003d c75216        	ld	21014,a
 167                     ; 27   if(u8_NumByteToWrite)
 169  0040 0d05          	tnz	(OFST+5,sp)
 170  0042 271e          	jreq	L121
 172  0044 2015          	jra	L501
 173  0046               L311:
 174                     ; 31       while(!(I2C->SR1 & 0x80) && tout());  								// test EV8 - wait for TxE
 176  0046 c65217        	ld	a,21015
 177  0049 a580          	bcp	a,#128
 178  004b 27f9          	jreq	L311
 179                     ; 32       I2C->DR = *u8_DataBuffer++;           								// send next data byte
 181  004d 1e06          	ldw	x,(OFST+6,sp)
 182  004f 1c0001        	addw	x,#1
 183  0052 1f06          	ldw	(OFST+6,sp),x
 184  0054 1d0001        	subw	x,#1
 185  0057 f6            	ld	a,(x)
 186  0058 c75216        	ld	21014,a
 187  005b               L501:
 188                     ; 29     while(u8_NumByteToWrite--)          									
 190  005b 7b05          	ld	a,(OFST+5,sp)
 191  005d 0a05          	dec	(OFST+5,sp)
 192  005f 4d            	tnz	a
 193  0060 26e4          	jrne	L311
 194  0062               L121:
 195                     ; 35   while(((I2C->SR1 & 0x84) != 0x84) && tout()); 					// Wait for TxE & BTF
 197  0062 c65217        	ld	a,21015
 198  0065 a484          	and	a,#132
 199  0067 a184          	cp	a,#132
 200  0069 26f7          	jrne	L121
 201                     ; 36   i2c_dead_time();                          									// clearing sequence
 204  006b 9d            nop
 209  006c 9d            nop
 211                     ; 38   I2C->CR2 |= 2;                        									// generate stop here (STOP=1)
 214  006d 72125211      	bset	21009,#1
 216  0071               L721:
 217                     ; 39   while((I2C->CR2 & 2) && tout());      									// wait until stop is performed  
 219  0071 c65211        	ld	a,21009
 220  0074 a502          	bcp	a,#2
 221  0076 26f9          	jrne	L721
 222                     ; 40 }
 225  0078 85            	popw	x
 226  0079 81            	ret
 296                     ; 43 void I2C_ReadRegister(uint8_t slaveaddr, uint8_t u8_regAddr, uint8_t u8_NumByteToRead, uint8_t *u8_DataBuffer)
 296                     ; 44 {
 297                     	switch	.text
 298  007a               _I2C_ReadRegister:
 300  007a 89            	pushw	x
 301       00000000      OFST:	set	0
 304  007b 200b          	jra	L761
 305  007d               L561:
 306                     ; 48 		I2C->CR2 |= I2C_CR2_STOP;                   				// Generate stop here (STOP=1)
 308  007d 72125211      	bset	21009,#1
 310  0081               L571:
 311                     ; 49     while(I2C->CR2 & I2C_CR2_STOP  &&  tout()); 				// Wait until stop is performed
 313  0081 c65211        	ld	a,21009
 314  0084 a502          	bcp	a,#2
 315  0086 26f9          	jrne	L571
 316  0088               L761:
 317                     ; 46 	while(I2C->SR3 & I2C_SR3_BUSY  &&  tout())	  				// Wait while the bus is busy
 319  0088 c65219        	ld	a,21017
 320  008b a502          	bcp	a,#2
 321  008d 26ee          	jrne	L561
 322                     ; 51   I2C->CR2 |= I2C_CR2_ACK;                      				// ACK=1, Ack enable
 324  008f 72145211      	bset	21009,#2
 325                     ; 53   I2C->CR2 |= I2C_CR2_START;                    				// START=1, generate start
 327  0093 72105211      	bset	21009,#0
 329  0097               L302:
 330                     ; 54   while((I2C->SR1 & I2C_SR1_SB)==0  &&  tout());				// Wait for start bit detection (SB)
 332  0097 c65217        	ld	a,21015
 333  009a a501          	bcp	a,#1
 334  009c 27f9          	jreq	L302
 335                     ; 58 	I2C->DR = slaveaddr << 1;   						// Send 7-bit device address & Write (R/W = 0)
 337  009e 7b01          	ld	a,(OFST+1,sp)
 338  00a0 48            	sll	a
 339  00a1 c75216        	ld	21014,a
 341  00a4               L112:
 342                     ; 60   while(!(I2C->SR1 & I2C_SR1_ADDR) &&  tout()); 				// test EV6 - wait for address ack (ADDR)
 344  00a4 c65217        	ld	a,21015
 345  00a7 a502          	bcp	a,#2
 346  00a9 27f9          	jreq	L112
 347                     ; 61   i2c_dead_time();                                  		// ADDR clearing sequence
 350  00ab 9d            nop
 355  00ac 9d            nop
 357                     ; 62   I2C->SR3;
 360  00ad c65219        	ld	a,21017
 362  00b0               L712:
 363                     ; 64   while(!(I2C->SR1 & I2C_SR1_TXE) &&  tout());  				// Wait for TxE
 365  00b0 c65217        	ld	a,21015
 366  00b3 a580          	bcp	a,#128
 367  00b5 27f9          	jreq	L712
 368                     ; 67     I2C->DR = u8_regAddr;                         			// Send register address
 370  00b7 7b02          	ld	a,(OFST+2,sp)
 371  00b9 c75216        	ld	21014,a
 373  00bc               L522:
 374                     ; 69   while((I2C->SR1 & (I2C_SR1_TXE | I2C_SR1_BTF)) != (I2C_SR1_TXE | I2C_SR1_BTF)  &&  tout()); 
 376  00bc c65217        	ld	a,21015
 377  00bf a484          	and	a,#132
 378  00c1 a184          	cp	a,#132
 379  00c3 26f7          	jrne	L522
 380                     ; 70   i2c_dead_time();                                  				// clearing sequence
 383  00c5 9d            nop
 388  00c6 9d            nop
 390                     ; 72   I2C->CR2 |= I2C_CR2_START;                     				// START=1, generate re-start
 393  00c7 72105211      	bset	21009,#0
 395  00cb               L332:
 396                     ; 73   while((I2C->SR1 & I2C_SR1_SB)==0  &&  tout()); 				// Wait for start bit detection (SB)
 398  00cb c65217        	ld	a,21015
 399  00ce a501          	bcp	a,#1
 400  00d0 27f9          	jreq	L332
 401                     ; 77 		I2C->DR = (u8)(slaveaddr << 1) | 1;         	// Send 7-bit device address & Write (R/W = 1)
 403  00d2 7b01          	ld	a,(OFST+1,sp)
 404  00d4 48            	sll	a
 405  00d5 aa01          	or	a,#1
 406  00d7 c75216        	ld	21014,a
 408  00da               L142:
 409                     ; 79   while(!(I2C->SR1 & I2C_SR1_ADDR)  &&  tout());  			// Wait for address ack (ADDR)
 411  00da c65217        	ld	a,21015
 412  00dd a502          	bcp	a,#2
 413  00df 27f9          	jreq	L142
 414                     ; 81   if (u8_NumByteToRead > 2)                 						// *** more than 2 bytes are received? ***
 416  00e1 7b05          	ld	a,(OFST+5,sp)
 417  00e3 a103          	cp	a,#3
 418  00e5 2566          	jrult	L542
 419                     ; 83     I2C->SR3;                                     			// ADDR clearing sequence    
 421  00e7 c65219        	ld	a,21017
 423  00ea 2017          	jra	L152
 424  00ec               L752:
 425                     ; 86       while(!(I2C->SR1 & I2C_SR1_BTF)  &&  tout()); 				// Wait for BTF
 427  00ec c65217        	ld	a,21015
 428  00ef a504          	bcp	a,#4
 429  00f1 27f9          	jreq	L752
 430                     ; 87 			*u8_DataBuffer++ = I2C->DR;                   				// Reading next data byte
 432  00f3 1e06          	ldw	x,(OFST+6,sp)
 433  00f5 1c0001        	addw	x,#1
 434  00f8 1f06          	ldw	(OFST+6,sp),x
 435  00fa 1d0001        	subw	x,#1
 436  00fd c65216        	ld	a,21014
 437  0100 f7            	ld	(x),a
 438                     ; 88       --u8_NumByteToRead;																		// Decrease Numbyte to reade by 1
 440  0101 0a05          	dec	(OFST+5,sp)
 441  0103               L152:
 442                     ; 84     while(u8_NumByteToRead > 3  &&  tout())       			// not last three bytes?
 444  0103 7b05          	ld	a,(OFST+5,sp)
 445  0105 a104          	cp	a,#4
 446  0107 24e3          	jruge	L752
 448  0109               L562:
 449                     ; 91     while(!(I2C->SR1 & I2C_SR1_BTF)  &&  tout()); 			// Wait for BTF
 451  0109 c65217        	ld	a,21015
 452  010c a504          	bcp	a,#4
 453  010e 27f9          	jreq	L562
 454                     ; 92     I2C->CR2 &=~I2C_CR2_ACK;                      			// Clear ACK
 456  0110 72155211      	bres	21009,#2
 457                     ; 93     disableInterrupts();                          			// Errata workaround (Disable interrupt)
 460  0114 9b            sim
 462                     ; 94     *u8_DataBuffer++ = I2C->DR;                     		// Read 1st byte
 465  0115 1e06          	ldw	x,(OFST+6,sp)
 466  0117 1c0001        	addw	x,#1
 467  011a 1f06          	ldw	(OFST+6,sp),x
 468  011c 1d0001        	subw	x,#1
 469  011f c65216        	ld	a,21014
 470  0122 f7            	ld	(x),a
 471                     ; 95     I2C->CR2 |= I2C_CR2_STOP;                       		// Generate stop here (STOP=1)
 473  0123 72125211      	bset	21009,#1
 474                     ; 96     *u8_DataBuffer++ = I2C->DR;                     		// Read 2nd byte
 476  0127 1e06          	ldw	x,(OFST+6,sp)
 477  0129 1c0001        	addw	x,#1
 478  012c 1f06          	ldw	(OFST+6,sp),x
 479  012e 1d0001        	subw	x,#1
 480  0131 c65216        	ld	a,21014
 481  0134 f7            	ld	(x),a
 482                     ; 97     enableInterrupts();																	// Errata workaround (Enable interrupt)
 485  0135 9a            rim
 489  0136               L372:
 490                     ; 98     while(!(I2C->SR1 & I2C_SR1_RXNE)  &&  tout());			// Wait for RXNE
 492  0136 c65217        	ld	a,21015
 493  0139 a540          	bcp	a,#64
 494  013b 27f9          	jreq	L372
 495                     ; 99     *u8_DataBuffer++ = I2C->DR;                   			// Read 3rd Data byte
 497  013d 1e06          	ldw	x,(OFST+6,sp)
 498  013f 1c0001        	addw	x,#1
 499  0142 1f06          	ldw	(OFST+6,sp),x
 500  0144 1d0001        	subw	x,#1
 501  0147 c65216        	ld	a,21014
 502  014a f7            	ld	(x),a
 504  014b 2050          	jra	L323
 505  014d               L542:
 506                     ; 103    if(u8_NumByteToRead == 2)                						// *** just two bytes are received? ***
 508  014d 7b05          	ld	a,(OFST+5,sp)
 509  014f a102          	cp	a,#2
 510  0151 2630          	jrne	L103
 511                     ; 105       I2C->CR2 |= I2C_CR2_POS;                      		// Set POS bit (NACK at next received byte)
 513  0153 72165211      	bset	21009,#3
 514                     ; 106       disableInterrupts();                          		// Errata workaround (Disable interrupt)
 517  0157 9b            sim
 519                     ; 107       I2C->SR3;                                       	// Clear ADDR Flag
 522  0158 c65219        	ld	a,21017
 523                     ; 108       I2C->CR2 &=~I2C_CR2_ACK;                        	// Clear ACK 
 525  015b 72155211      	bres	21009,#2
 526                     ; 109       enableInterrupts();																// Errata workaround (Enable interrupt)
 529  015f 9a            rim
 533  0160               L503:
 534                     ; 110       while(!(I2C->SR1 & I2C_SR1_BTF)  &&  tout()); 		// Wait for BTF
 536  0160 c65217        	ld	a,21015
 537  0163 a504          	bcp	a,#4
 538  0165 27f9          	jreq	L503
 539                     ; 111       disableInterrupts();                          		// Errata workaround (Disable interrupt)
 542  0167 9b            sim
 544                     ; 112       I2C->CR2 |= I2C_CR2_STOP;                       	// Generate stop here (STOP=1)
 547  0168 72125211      	bset	21009,#1
 548                     ; 113       *u8_DataBuffer++ = I2C->DR;                     	// Read 1st Data byte
 550  016c 1e06          	ldw	x,(OFST+6,sp)
 551  016e 1c0001        	addw	x,#1
 552  0171 1f06          	ldw	(OFST+6,sp),x
 553  0173 1d0001        	subw	x,#1
 554  0176 c65216        	ld	a,21014
 555  0179 f7            	ld	(x),a
 556                     ; 114       enableInterrupts();																// Errata workaround (Enable interrupt)
 559  017a 9a            rim
 561                     ; 115 			*u8_DataBuffer = I2C->DR;													// Read 2nd Data byte
 564  017b 1e06          	ldw	x,(OFST+6,sp)
 565  017d c65216        	ld	a,21014
 566  0180 f7            	ld	(x),a
 568  0181 201a          	jra	L323
 569  0183               L103:
 570                     ; 119       I2C->CR2 &=~I2C_CR2_ACK;;                     		// Clear ACK 
 572  0183 72155211      	bres	21009,#2
 573                     ; 120       disableInterrupts();                          		// Errata workaround (Disable interrupt)
 577  0187 9b            sim
 579                     ; 121       I2C->SR3;                                       	// Clear ADDR Flag   
 582  0188 c65219        	ld	a,21017
 583                     ; 122       I2C->CR2 |= I2C_CR2_STOP;                       	// generate stop here (STOP=1)
 585  018b 72125211      	bset	21009,#1
 586                     ; 123       enableInterrupts();																// Errata workaround (Enable interrupt)
 589  018f 9a            rim
 593  0190               L513:
 594                     ; 124       while(!(I2C->SR1 & I2C_SR1_RXNE)  &&  tout()); 		// test EV7, wait for RxNE
 596  0190 c65217        	ld	a,21015
 597  0193 a540          	bcp	a,#64
 598  0195 27f9          	jreq	L513
 599                     ; 125       *u8_DataBuffer = I2C->DR;                     		// Read Data byte
 601  0197 1e06          	ldw	x,(OFST+6,sp)
 602  0199 c65216        	ld	a,21014
 603  019c f7            	ld	(x),a
 604  019d               L323:
 605                     ; 129   while((I2C->CR2 & I2C_CR2_STOP)  &&  tout());     		// Wait until stop is performed (STOPF = 1)
 607  019d c65211        	ld	a,21009
 608  01a0 a502          	bcp	a,#2
 609  01a2 26f9          	jrne	L323
 610                     ; 130   I2C->CR2 &=~I2C_CR2_POS;                          		// return POS to default state (POS=0)
 612  01a4 72175211      	bres	21009,#3
 613                     ; 131 }
 616  01a8 85            	popw	x
 617  01a9 81            	ret
 678                     ; 133 void I2C_RandomRead(uint8_t slaveaddr, uint8_t u8_NumByteToRead, uint8_t *u8_DataBuffer) 
 678                     ; 134 {
 679                     	switch	.text
 680  01aa               _I2C_RandomRead:
 682  01aa 89            	pushw	x
 683       00000000      OFST:	set	0
 686  01ab 200b          	jra	L753
 687  01ad               L553:
 688                     ; 138 		I2C->CR2 |= I2C_CR2_STOP;                   				// STOP=1, generate stop
 690  01ad 72125211      	bset	21009,#1
 692  01b1               L563:
 693                     ; 139     while(I2C->CR2 & I2C_CR2_STOP  &&  tout()); 				// wait until stop is performed
 695  01b1 c65211        	ld	a,21009
 696  01b4 a502          	bcp	a,#2
 697  01b6 26f9          	jrne	L563
 698  01b8               L753:
 699                     ; 136 	while(I2C->SR3 & I2C_SR3_BUSY  &&  tout())	  				// Wait while the bus is busy
 701  01b8 c65219        	ld	a,21017
 702  01bb a502          	bcp	a,#2
 703  01bd 26ee          	jrne	L553
 704                     ; 141   I2C->CR2 |= I2C_CR2_ACK;                      				// ACK=1, Ack enable
 706  01bf 72145211      	bset	21009,#2
 707                     ; 143   I2C->CR2 |= I2C_CR2_START;                    				// START=1, generate start
 709  01c3 72105211      	bset	21009,#0
 711  01c7               L373:
 712                     ; 144   while((I2C->SR1 & I2C_SR1_SB)==0  &&  tout());				// wait for start bit detection (SB)
 714  01c7 c65217        	ld	a,21015
 715  01ca a501          	bcp	a,#1
 716  01cc 27f9          	jreq	L373
 717                     ; 146     I2C->DR = (slaveaddr << 1) | 1;       			// Send 7-bit device address & Write (R/W = 1)
 719  01ce 7b01          	ld	a,(OFST+1,sp)
 720  01d0 48            	sll	a
 721  01d1 aa01          	or	a,#1
 722  01d3 c75216        	ld	21014,a
 724  01d6               L304:
 725                     ; 147   while(!(I2C->SR1 & I2C_SR1_ADDR)  &&  tout());				// Wait for address ack (ADDR)
 727  01d6 c65217        	ld	a,21015
 728  01d9 a502          	bcp	a,#2
 729  01db 27f9          	jreq	L304
 730                     ; 149   if (u8_NumByteToRead > 2)                 						// *** more than 2 bytes are received? ***
 732  01dd 7b02          	ld	a,(OFST+2,sp)
 733  01df a103          	cp	a,#3
 734  01e1 2566          	jrult	L704
 735                     ; 151     I2C->SR3;                                     			// ADDR clearing sequence    
 737  01e3 c65219        	ld	a,21017
 739  01e6 2017          	jra	L314
 740  01e8               L124:
 741                     ; 154       while(!(I2C->SR1 & I2C_SR1_BTF)  &&  tout()); 				// Wait for BTF
 743  01e8 c65217        	ld	a,21015
 744  01eb a504          	bcp	a,#4
 745  01ed 27f9          	jreq	L124
 746                     ; 155 			*u8_DataBuffer++ = I2C->DR;                   				// Reading next data byte
 748  01ef 1e05          	ldw	x,(OFST+5,sp)
 749  01f1 1c0001        	addw	x,#1
 750  01f4 1f05          	ldw	(OFST+5,sp),x
 751  01f6 1d0001        	subw	x,#1
 752  01f9 c65216        	ld	a,21014
 753  01fc f7            	ld	(x),a
 754                     ; 156       --u8_NumByteToRead;																		// Decrease Numbyte to reade by 1
 756  01fd 0a02          	dec	(OFST+2,sp)
 757  01ff               L314:
 758                     ; 152     while(u8_NumByteToRead > 3  &&  tout())       			// not last three bytes?
 760  01ff 7b02          	ld	a,(OFST+2,sp)
 761  0201 a104          	cp	a,#4
 762  0203 24e3          	jruge	L124
 764  0205               L724:
 765                     ; 159     while(!(I2C->SR1 & I2C_SR1_BTF)  &&  tout()); 			// Wait for BTF
 767  0205 c65217        	ld	a,21015
 768  0208 a504          	bcp	a,#4
 769  020a 27f9          	jreq	L724
 770                     ; 160     I2C->CR2 &=~I2C_CR2_ACK;                      			// Clear ACK
 772  020c 72155211      	bres	21009,#2
 773                     ; 161     disableInterrupts();                          			// Errata workaround (Disable interrupt)
 776  0210 9b            sim
 778                     ; 162     *u8_DataBuffer++ = I2C->DR;                     		// Read 1st byte
 781  0211 1e05          	ldw	x,(OFST+5,sp)
 782  0213 1c0001        	addw	x,#1
 783  0216 1f05          	ldw	(OFST+5,sp),x
 784  0218 1d0001        	subw	x,#1
 785  021b c65216        	ld	a,21014
 786  021e f7            	ld	(x),a
 787                     ; 163     I2C->CR2 |= I2C_CR2_STOP;                       		// Generate stop here (STOP=1)
 789  021f 72125211      	bset	21009,#1
 790                     ; 164     *u8_DataBuffer++ = I2C->DR;                     		// Read 2nd byte
 792  0223 1e05          	ldw	x,(OFST+5,sp)
 793  0225 1c0001        	addw	x,#1
 794  0228 1f05          	ldw	(OFST+5,sp),x
 795  022a 1d0001        	subw	x,#1
 796  022d c65216        	ld	a,21014
 797  0230 f7            	ld	(x),a
 798                     ; 165     enableInterrupts();																	// Errata workaround (Enable interrupt)
 801  0231 9a            rim
 805  0232               L534:
 806                     ; 166     while(!(I2C->SR1 & I2C_SR1_RXNE)  &&  tout());			// Wait for RXNE
 808  0232 c65217        	ld	a,21015
 809  0235 a540          	bcp	a,#64
 810  0237 27f9          	jreq	L534
 811                     ; 167     *u8_DataBuffer++ = I2C->DR;                   			// Read 3rd Data byte
 813  0239 1e05          	ldw	x,(OFST+5,sp)
 814  023b 1c0001        	addw	x,#1
 815  023e 1f05          	ldw	(OFST+5,sp),x
 816  0240 1d0001        	subw	x,#1
 817  0243 c65216        	ld	a,21014
 818  0246 f7            	ld	(x),a
 820  0247 2050          	jra	L564
 821  0249               L704:
 822                     ; 171     if(u8_NumByteToRead == 2)                						// *** just two bytes are received? ***
 824  0249 7b02          	ld	a,(OFST+2,sp)
 825  024b a102          	cp	a,#2
 826  024d 2630          	jrne	L344
 827                     ; 173       I2C->CR2 |= I2C_CR2_POS;                      		// Set POS bit (NACK at next received byte)
 829  024f 72165211      	bset	21009,#3
 830                     ; 174       disableInterrupts();                          		// Errata workaround (Disable interrupt)
 833  0253 9b            sim
 835                     ; 175       I2C->SR3;                                       	// Clear ADDR Flag
 838  0254 c65219        	ld	a,21017
 839                     ; 176       I2C->CR2 &=~I2C_CR2_ACK;                        	// Clear ACK 
 841  0257 72155211      	bres	21009,#2
 842                     ; 177       enableInterrupts();																// Errata workaround (Enable interrupt)
 845  025b 9a            rim
 849  025c               L744:
 850                     ; 178       while(!(I2C->SR1 & I2C_SR1_BTF)  &&  tout()); 		// Wait for BTF
 852  025c c65217        	ld	a,21015
 853  025f a504          	bcp	a,#4
 854  0261 27f9          	jreq	L744
 855                     ; 179       disableInterrupts();                          		// Errata workaround (Disable interrupt)
 858  0263 9b            sim
 860                     ; 180       I2C->CR2 |= I2C_CR2_STOP;                       	// Generate stop here (STOP=1)
 863  0264 72125211      	bset	21009,#1
 864                     ; 181       *u8_DataBuffer++ = I2C->DR;                     	// Read 1st Data byte
 866  0268 1e05          	ldw	x,(OFST+5,sp)
 867  026a 1c0001        	addw	x,#1
 868  026d 1f05          	ldw	(OFST+5,sp),x
 869  026f 1d0001        	subw	x,#1
 870  0272 c65216        	ld	a,21014
 871  0275 f7            	ld	(x),a
 872                     ; 182       enableInterrupts();																// Errata workaround (Enable interrupt)
 875  0276 9a            rim
 877                     ; 183 			*u8_DataBuffer = I2C->DR;													// Read 2nd Data byte
 880  0277 1e05          	ldw	x,(OFST+5,sp)
 881  0279 c65216        	ld	a,21014
 882  027c f7            	ld	(x),a
 884  027d 201a          	jra	L564
 885  027f               L344:
 886                     ; 187       I2C->CR2 &=~I2C_CR2_ACK;;                     		// Clear ACK 
 888  027f 72155211      	bres	21009,#2
 889                     ; 188       disableInterrupts();                          		// Errata workaround (Disable interrupt)
 893  0283 9b            sim
 895                     ; 189       I2C->SR3;                                       	// Clear ADDR Flag   
 898  0284 c65219        	ld	a,21017
 899                     ; 190       I2C->CR2 |= I2C_CR2_STOP;                       	// generate stop here (STOP=1)
 901  0287 72125211      	bset	21009,#1
 902                     ; 191       enableInterrupts();																// Errata workaround (Enable interrupt)
 905  028b 9a            rim
 909  028c               L754:
 910                     ; 192       while(!(I2C->SR1 & I2C_SR1_RXNE)  &&  tout()); 		// test EV7, wait for RxNE
 912  028c c65217        	ld	a,21015
 913  028f a540          	bcp	a,#64
 914  0291 27f9          	jreq	L754
 915                     ; 193       *u8_DataBuffer = I2C->DR;                     		// Read Data byte
 917  0293 1e05          	ldw	x,(OFST+5,sp)
 918  0295 c65216        	ld	a,21014
 919  0298 f7            	ld	(x),a
 920  0299               L564:
 921                     ; 197   while((I2C->CR2 & I2C_CR2_STOP)  &&  tout());     		// Wait until stop is performed (STOPF = 1)
 923  0299 c65211        	ld	a,21009
 924  029c a502          	bcp	a,#2
 925  029e 26f9          	jrne	L564
 926                     ; 198   I2C->CR2 &=~I2C_CR2_POS;                          		// return POS to default state (POS=0)
 928  02a0 72175211      	bres	21009,#3
 929                     ; 199 }
 932  02a4 85            	popw	x
 933  02a5 81            	ret
 946                     	xdef	_I2C_WriteRegister
 947                     	xdef	_I2C_ReadRegister
 948                     	xdef	_I2C_RandomRead
 967                     	end
