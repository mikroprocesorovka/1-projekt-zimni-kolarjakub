   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.1 - 30 Jun 2020
   3                     ; Generator (Limited) V4.4.12 - 02 Jul 2020
  15                     	bsct
  16  0000               __Id:
  17  0000 00000000      	dc.l	0
  18  0004               __IDE:
  19  0004 00            	dc.b	0
  20  0005               __RTR:
  21  0005 00            	dc.b	0
  22  0006               __DLC:
  23  0006 00            	dc.b	0
  24  0007               __Data:
  25  0007 00            	dc.b	0
  26  0008 000000000000  	ds.b	7
  27  000f               __FMI:
  28  000f 00            	dc.b	0
  58                     ; 62 void CAN_DeInit(void)
  58                     ; 63 {
  60                     	switch	.text
  61  0000               _CAN_DeInit:
  65                     ; 65   CAN->MCR = CAN_MCR_INRQ;
  67  0000 35015420      	mov	21536,#1
  68                     ; 66   CAN->PSR = CAN_Page_Config;
  70  0004 35065427      	mov	21543,#6
  71                     ; 67   CAN_OperatingModeRequest(CAN_OperatingMode_Initialization);
  73  0008 4f            	clr	a
  74  0009 cd0b6a        	call	_CAN_OperatingModeRequest
  76                     ; 68   CAN->Page.Config.ESR = CAN_ESR_RESET_VALUE;
  78  000c 725f5428      	clr	21544
  79                     ; 69   CAN->Page.Config.EIER = CAN_EIER_RESET_VALUE;
  81  0010 725f5429      	clr	21545
  82                     ; 70   CAN->Page.Config.BTR1 = CAN_BTR1_RESET_VALUE;
  84  0014 3540542c      	mov	21548,#64
  85                     ; 71   CAN->Page.Config.BTR2 = CAN_BTR2_RESET_VALUE;
  87  0018 3523542d      	mov	21549,#35
  88                     ; 72   CAN->Page.Config.FMR1 = CAN_FMR1_RESET_VALUE;
  90  001c 725f5430      	clr	21552
  91                     ; 73   CAN->Page.Config.FMR2 = CAN_FMR2_RESET_VALUE;
  93  0020 725f5431      	clr	21553
  94                     ; 74   CAN->Page.Config.FCR1 = CAN_FCR_RESET_VALUE;
  96  0024 725f5432      	clr	21554
  97                     ; 75   CAN->Page.Config.FCR2 = CAN_FCR_RESET_VALUE;
  99  0028 725f5433      	clr	21555
 100                     ; 76   CAN->Page.Config.FCR3 = CAN_FCR_RESET_VALUE;
 102  002c 725f5434      	clr	21556
 103                     ; 77   CAN_OperatingModeRequest(CAN_OperatingMode_Normal);
 105  0030 a601          	ld	a,#1
 106  0032 cd0b6a        	call	_CAN_OperatingModeRequest
 108                     ; 78   CAN->PSR = CAN_Page_RxFifo;
 110  0035 35075427      	mov	21543,#7
 111                     ; 79   CAN->Page.RxFIFO.MDLCR = CAN_MDLC_RESET_VALUE;
 113  0039 725f5429      	clr	21545
 114                     ; 80   CAN->PSR = CAN_Page_TxMailBox0;
 116  003d 725f5427      	clr	21543
 117                     ; 81   CAN->Page.TxMailbox.MDLCR = CAN_MDLC_RESET_VALUE;
 119  0041 725f5429      	clr	21545
 120                     ; 82   CAN->PSR = CAN_Page_TxMailBox1;
 122  0045 35015427      	mov	21543,#1
 123                     ; 83   CAN->Page.TxMailbox.MDLCR = CAN_MDLC_RESET_VALUE;
 125  0049 725f5429      	clr	21545
 126                     ; 84   CAN->PSR = CAN_Page_TxMailBox2;
 128  004d 35055427      	mov	21543,#5
 129                     ; 85   CAN->Page.TxMailbox.MDLCR = CAN_MDLC_RESET_VALUE;
 131  0051 725f5429      	clr	21545
 132                     ; 87   CAN->MCR = CAN_MCR_RESET_VALUE;
 134  0055 35025420      	mov	21536,#2
 135                     ; 88   CAN->MSR = (uint8_t)(~CAN_MSR_RESET_VALUE);/* rc_w1 */
 137  0059 35fd5421      	mov	21537,#253
 138                     ; 89   CAN->TSR = (uint8_t)(~CAN_TSR_RESET_VALUE);/* rc_w1 */
 140  005d 35ff5422      	mov	21538,#255
 141                     ; 90   CAN->RFR = (uint8_t)(~CAN_RFR_RESET_VALUE);/* rc_w1 */
 143  0061 35ff5424      	mov	21540,#255
 144                     ; 91   CAN->IER = CAN_IER_RESET_VALUE;
 146  0065 725f5425      	clr	21541
 147                     ; 92   CAN->DGR = CAN_DGR_RESET_VALUE;
 149  0069 350c5426      	mov	21542,#12
 150                     ; 93   CAN->PSR = CAN_PSR_RESET_VALUE;
 152  006d 725f5427      	clr	21543
 153                     ; 94 }
 156  0071 81            	ret
 707                     ; 106 CAN_InitStatus_TypeDef CAN_Init(CAN_MasterCtrl_TypeDef CAN_MasterCtrl,
 707                     ; 107                                 CAN_Mode_TypeDef CAN_Mode,
 707                     ; 108                                 CAN_SynJumpWidth_TypeDef CAN_SynJumpWidth,
 707                     ; 109                                 CAN_BitSeg1_TypeDef CAN_BitSeg1,
 707                     ; 110                                 CAN_BitSeg2_TypeDef CAN_BitSeg2,
 707                     ; 111                                 uint8_t CAN_Prescaler)
 707                     ; 112 {
 708                     	switch	.text
 709  0072               _CAN_Init:
 711  0072 89            	pushw	x
 712  0073 5204          	subw	sp,#4
 713       00000004      OFST:	set	4
 716                     ; 113   CAN_InitStatus_TypeDef InitStatus =  CAN_InitStatus_Failed;
 718                     ; 114   uint16_t timeout = CAN_ACKNOWLEDGE_TIMEOUT;
 720  0075 aeffff        	ldw	x,#65535
 721  0078 1f03          	ldw	(OFST-1,sp),x
 723                     ; 115   CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
 725  007a cd1067        	call	_CAN_GetSelectedPage
 727  007d 6b01          	ld	(OFST-3,sp),a
 729                     ; 119   assert_param(IS_CAN_MASTERCTRL_OK(CAN_MasterCtrl));
 731  007f 0d05          	tnz	(OFST+1,sp)
 732  0081 270c          	jreq	L21
 733  0083 7b05          	ld	a,(OFST+1,sp)
 734  0085 a1fd          	cp	a,#253
 735  0087 2409          	jruge	L01
 736  0089 7b05          	ld	a,(OFST+1,sp)
 737  008b a104          	cp	a,#4
 738  008d 2503          	jrult	L01
 739  008f               L21:
 740  008f 4f            	clr	a
 741  0090 2010          	jra	L41
 742  0092               L01:
 743  0092 ae0077        	ldw	x,#119
 744  0095 89            	pushw	x
 745  0096 ae0000        	ldw	x,#0
 746  0099 89            	pushw	x
 747  009a ae0008        	ldw	x,#L103
 748  009d cd0000        	call	_assert_failed
 750  00a0 5b04          	addw	sp,#4
 751  00a2               L41:
 752                     ; 120   assert_param(IS_CAN_MODE_OK(CAN_Mode));
 754  00a2 0d06          	tnz	(OFST+2,sp)
 755  00a4 2712          	jreq	L02
 756  00a6 7b06          	ld	a,(OFST+2,sp)
 757  00a8 a101          	cp	a,#1
 758  00aa 270c          	jreq	L02
 759  00ac 7b06          	ld	a,(OFST+2,sp)
 760  00ae a102          	cp	a,#2
 761  00b0 2706          	jreq	L02
 762  00b2 7b06          	ld	a,(OFST+2,sp)
 763  00b4 a103          	cp	a,#3
 764  00b6 2603          	jrne	L61
 765  00b8               L02:
 766  00b8 4f            	clr	a
 767  00b9 2010          	jra	L22
 768  00bb               L61:
 769  00bb ae0078        	ldw	x,#120
 770  00be 89            	pushw	x
 771  00bf ae0000        	ldw	x,#0
 772  00c2 89            	pushw	x
 773  00c3 ae0008        	ldw	x,#L103
 774  00c6 cd0000        	call	_assert_failed
 776  00c9 5b04          	addw	sp,#4
 777  00cb               L22:
 778                     ; 121   assert_param(IS_CAN_SYNJUMPWIDTH_OK(CAN_SynJumpWidth));
 780  00cb 0d09          	tnz	(OFST+5,sp)
 781  00cd 2712          	jreq	L62
 782  00cf 7b09          	ld	a,(OFST+5,sp)
 783  00d1 a140          	cp	a,#64
 784  00d3 270c          	jreq	L62
 785  00d5 7b09          	ld	a,(OFST+5,sp)
 786  00d7 a180          	cp	a,#128
 787  00d9 2706          	jreq	L62
 788  00db 7b09          	ld	a,(OFST+5,sp)
 789  00dd a1c0          	cp	a,#192
 790  00df 2603          	jrne	L42
 791  00e1               L62:
 792  00e1 4f            	clr	a
 793  00e2 2010          	jra	L03
 794  00e4               L42:
 795  00e4 ae0079        	ldw	x,#121
 796  00e7 89            	pushw	x
 797  00e8 ae0000        	ldw	x,#0
 798  00eb 89            	pushw	x
 799  00ec ae0008        	ldw	x,#L103
 800  00ef cd0000        	call	_assert_failed
 802  00f2 5b04          	addw	sp,#4
 803  00f4               L03:
 804                     ; 122   assert_param(IS_CAN_BITSEG1_OK(CAN_BitSeg1));
 806  00f4 7b0a          	ld	a,(OFST+6,sp)
 807  00f6 a110          	cp	a,#16
 808  00f8 2403          	jruge	L23
 809  00fa 4f            	clr	a
 810  00fb 2010          	jra	L43
 811  00fd               L23:
 812  00fd ae007a        	ldw	x,#122
 813  0100 89            	pushw	x
 814  0101 ae0000        	ldw	x,#0
 815  0104 89            	pushw	x
 816  0105 ae0008        	ldw	x,#L103
 817  0108 cd0000        	call	_assert_failed
 819  010b 5b04          	addw	sp,#4
 820  010d               L43:
 821                     ; 123   assert_param(IS_CAN_BITSEG2_OK(CAN_BitSeg2));
 823  010d 7b0b          	ld	a,(OFST+7,sp)
 824  010f a110          	cp	a,#16
 825  0111 2506          	jrult	L24
 826  0113 7b0b          	ld	a,(OFST+7,sp)
 827  0115 a171          	cp	a,#113
 828  0117 2504          	jrult	L04
 829  0119               L24:
 830  0119 0d0b          	tnz	(OFST+7,sp)
 831  011b 2603          	jrne	L63
 832  011d               L04:
 833  011d 4f            	clr	a
 834  011e 2010          	jra	L44
 835  0120               L63:
 836  0120 ae007b        	ldw	x,#123
 837  0123 89            	pushw	x
 838  0124 ae0000        	ldw	x,#0
 839  0127 89            	pushw	x
 840  0128 ae0008        	ldw	x,#L103
 841  012b cd0000        	call	_assert_failed
 843  012e 5b04          	addw	sp,#4
 844  0130               L44:
 845                     ; 124   assert_param(IS_CAN_PRESCALER_OK(CAN_Prescaler));
 847  0130 0d0c          	tnz	(OFST+8,sp)
 848  0132 2709          	jreq	L64
 849  0134 7b0c          	ld	a,(OFST+8,sp)
 850  0136 a141          	cp	a,#65
 851  0138 2403          	jruge	L64
 852  013a 4f            	clr	a
 853  013b 2010          	jra	L05
 854  013d               L64:
 855  013d ae007c        	ldw	x,#124
 856  0140 89            	pushw	x
 857  0141 ae0000        	ldw	x,#0
 858  0144 89            	pushw	x
 859  0145 ae0008        	ldw	x,#L103
 860  0148 cd0000        	call	_assert_failed
 862  014b 5b04          	addw	sp,#4
 863  014d               L05:
 864                     ; 127   CAN->MCR = CAN_MCR_INRQ;
 866  014d 35015420      	mov	21536,#1
 868  0151 2007          	jra	L703
 869  0153               L303:
 870                     ; 131     timeout--;
 872  0153 1e03          	ldw	x,(OFST-1,sp)
 873  0155 1d0001        	subw	x,#1
 874  0158 1f03          	ldw	(OFST-1,sp),x
 876  015a               L703:
 877                     ; 129   while (((uint8_t)(CAN->MSR & CAN_MSR_INAK) != 0x01) && ((uint16_t)timeout != 0))
 879  015a c65421        	ld	a,21537
 880  015d a401          	and	a,#1
 881  015f a101          	cp	a,#1
 882  0161 2704          	jreq	L313
 884  0163 1e03          	ldw	x,(OFST-1,sp)
 885  0165 26ec          	jrne	L303
 886  0167               L313:
 887                     ; 135   if ((CAN->MSR & CAN_MSR_INAK) != CAN_MSR_INAK)
 889  0167 c65421        	ld	a,21537
 890  016a a401          	and	a,#1
 891  016c a101          	cp	a,#1
 892  016e 270c          	jreq	L513
 893                     ; 138     InitStatus =  CAN_InitStatus_Failed;
 895  0170 0f02          	clr	(OFST-2,sp)
 898  0172               L713:
 899                     ; 172   CAN_SelectPage(can_page);
 901  0172 7b01          	ld	a,(OFST-3,sp)
 902  0174 cd106b        	call	_CAN_SelectPage
 904                     ; 175   return (CAN_InitStatus_TypeDef)InitStatus;
 906  0177 7b02          	ld	a,(OFST-2,sp)
 909  0179 5b06          	addw	sp,#6
 910  017b 81            	ret
 911  017c               L513:
 912                     ; 145     CAN->MCR |= (uint8_t)CAN_MasterCtrl;
 914  017c c65420        	ld	a,21536
 915  017f 1a05          	or	a,(OFST+1,sp)
 916  0181 c75420        	ld	21536,a
 917                     ; 148     CAN->DGR |= (uint8_t)CAN_Mode ;
 919  0184 c65426        	ld	a,21542
 920  0187 1a06          	or	a,(OFST+2,sp)
 921  0189 c75426        	ld	21542,a
 922                     ; 149     CAN->PSR = CAN_Page_Config;
 924  018c 35065427      	mov	21543,#6
 925                     ; 150     CAN->Page.Config.BTR1 = (uint8_t)((uint8_t)(CAN_Prescaler - (uint8_t)1) | CAN_SynJumpWidth);
 927  0190 7b0c          	ld	a,(OFST+8,sp)
 928  0192 4a            	dec	a
 929  0193 1a09          	or	a,(OFST+5,sp)
 930  0195 c7542c        	ld	21548,a
 931                     ; 151     CAN->Page.Config.BTR2 = (uint8_t)(CAN_BitSeg1 | (uint8_t)CAN_BitSeg2);
 933  0198 7b0a          	ld	a,(OFST+6,sp)
 934  019a 1a0b          	or	a,(OFST+7,sp)
 935  019c c7542d        	ld	21549,a
 936                     ; 154     CAN->MCR &= (uint8_t)(~CAN_MCR_INRQ);
 938  019f 72115420      	bres	21536,#0
 939                     ; 156     timeout = 0xFFFF;
 941  01a3 aeffff        	ldw	x,#65535
 942  01a6 1f03          	ldw	(OFST-1,sp),x
 945  01a8 2007          	jra	L523
 946  01aa               L123:
 947                     ; 159       timeout--;
 949  01aa 1e03          	ldw	x,(OFST-1,sp)
 950  01ac 1d0001        	subw	x,#1
 951  01af 1f03          	ldw	(OFST-1,sp),x
 953  01b1               L523:
 954                     ; 157     while ((((uint8_t)(CAN->MSR & CAN_MSR_INAK) == 0x01))&&(timeout != 0))
 954                     ; 158     {
 954                     ; 159       timeout--;
 956  01b1 c65421        	ld	a,21537
 957  01b4 a401          	and	a,#1
 958  01b6 a101          	cp	a,#1
 959  01b8 2604          	jrne	L133
 961  01ba 1e03          	ldw	x,(OFST-1,sp)
 962  01bc 26ec          	jrne	L123
 963  01be               L133:
 964                     ; 162     if ((CAN->MSR & CAN_MSR_INAK) == CAN_MSR_INAK)
 966  01be c65421        	ld	a,21537
 967  01c1 a401          	and	a,#1
 968  01c3 a101          	cp	a,#1
 969  01c5 2604          	jrne	L333
 970                     ; 164       InitStatus = CAN_InitStatus_Failed;
 972  01c7 0f02          	clr	(OFST-2,sp)
 975  01c9 20a7          	jra	L713
 976  01cb               L333:
 977                     ; 168       InitStatus = CAN_InitStatus_Success;
 979  01cb a601          	ld	a,#1
 980  01cd 6b02          	ld	(OFST-2,sp),a
 982  01cf 20a1          	jra	L713
1315                     ; 194 void CAN_FilterInit(CAN_FilterNumber_TypeDef CAN_FilterNumber,
1315                     ; 195                     FunctionalState CAN_FilterActivation,
1315                     ; 196                     CAN_FilterMode_TypeDef CAN_FilterMode,
1315                     ; 197                     CAN_FilterScale_TypeDef CAN_FilterScale,
1315                     ; 198                     uint8_t CAN_FilterID1,
1315                     ; 199                     uint8_t CAN_FilterID2,
1315                     ; 200                     uint8_t CAN_FilterID3,
1315                     ; 201                     uint8_t CAN_FilterID4,
1315                     ; 202                     uint8_t CAN_FilterIDMask1,
1315                     ; 203                     uint8_t CAN_FilterIDMask2,
1315                     ; 204                     uint8_t CAN_FilterIDMask3,
1315                     ; 205                     uint8_t CAN_FilterIDMask4)
1315                     ; 206 {
1316                     	switch	.text
1317  01d1               _CAN_FilterInit:
1319  01d1 89            	pushw	x
1320  01d2 5205          	subw	sp,#5
1321       00000005      OFST:	set	5
1324                     ; 207   uint8_t fact = 0;
1326                     ; 208   uint8_t fsc  = 0;
1328                     ; 209   uint8_t fmhl = 0;
1330                     ; 211   CAN_Page_TypeDef can_page_filter = CAN_Page_Filter01;
1332                     ; 212   CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
1334  01d4 cd1067        	call	_CAN_GetSelectedPage
1336  01d7 6b01          	ld	(OFST-4,sp),a
1338                     ; 215   assert_param(IS_CAN_FILTER_NUMBER_OK(CAN_FilterNumber));
1340  01d9 0d06          	tnz	(OFST+1,sp)
1341  01db 271e          	jreq	L65
1342  01dd 7b06          	ld	a,(OFST+1,sp)
1343  01df a101          	cp	a,#1
1344  01e1 2718          	jreq	L65
1345  01e3 7b06          	ld	a,(OFST+1,sp)
1346  01e5 a102          	cp	a,#2
1347  01e7 2712          	jreq	L65
1348  01e9 7b06          	ld	a,(OFST+1,sp)
1349  01eb a103          	cp	a,#3
1350  01ed 270c          	jreq	L65
1351  01ef 7b06          	ld	a,(OFST+1,sp)
1352  01f1 a104          	cp	a,#4
1353  01f3 2706          	jreq	L65
1354  01f5 7b06          	ld	a,(OFST+1,sp)
1355  01f7 a105          	cp	a,#5
1356  01f9 2603          	jrne	L45
1357  01fb               L65:
1358  01fb 4f            	clr	a
1359  01fc 2010          	jra	L06
1360  01fe               L45:
1361  01fe ae00d7        	ldw	x,#215
1362  0201 89            	pushw	x
1363  0202 ae0000        	ldw	x,#0
1364  0205 89            	pushw	x
1365  0206 ae0008        	ldw	x,#L103
1366  0209 cd0000        	call	_assert_failed
1368  020c 5b04          	addw	sp,#4
1369  020e               L06:
1370                     ; 216   assert_param(IS_FUNCTIONALSTATE_OK(CAN_FilterActivation));
1372  020e 0d07          	tnz	(OFST+2,sp)
1373  0210 2706          	jreq	L46
1374  0212 7b07          	ld	a,(OFST+2,sp)
1375  0214 a101          	cp	a,#1
1376  0216 2603          	jrne	L26
1377  0218               L46:
1378  0218 4f            	clr	a
1379  0219 2010          	jra	L66
1380  021b               L26:
1381  021b ae00d8        	ldw	x,#216
1382  021e 89            	pushw	x
1383  021f ae0000        	ldw	x,#0
1384  0222 89            	pushw	x
1385  0223 ae0008        	ldw	x,#L103
1386  0226 cd0000        	call	_assert_failed
1388  0229 5b04          	addw	sp,#4
1389  022b               L66:
1390                     ; 217   assert_param(IS_CAN_FILTER_MODE_OK(CAN_FilterMode));
1392  022b 0d0a          	tnz	(OFST+5,sp)
1393  022d 2712          	jreq	L27
1394  022f 7b0a          	ld	a,(OFST+5,sp)
1395  0231 a110          	cp	a,#16
1396  0233 270c          	jreq	L27
1397  0235 7b0a          	ld	a,(OFST+5,sp)
1398  0237 a111          	cp	a,#17
1399  0239 2706          	jreq	L27
1400  023b 7b0a          	ld	a,(OFST+5,sp)
1401  023d a101          	cp	a,#1
1402  023f 2603          	jrne	L07
1403  0241               L27:
1404  0241 4f            	clr	a
1405  0242 2010          	jra	L47
1406  0244               L07:
1407  0244 ae00d9        	ldw	x,#217
1408  0247 89            	pushw	x
1409  0248 ae0000        	ldw	x,#0
1410  024b 89            	pushw	x
1411  024c ae0008        	ldw	x,#L103
1412  024f cd0000        	call	_assert_failed
1414  0252 5b04          	addw	sp,#4
1415  0254               L47:
1416                     ; 218   assert_param(IS_CAN_FILTER_SCALE_OK(CAN_FilterScale));
1418  0254 0d0b          	tnz	(OFST+6,sp)
1419  0256 2712          	jreq	L001
1420  0258 7b0b          	ld	a,(OFST+6,sp)
1421  025a a102          	cp	a,#2
1422  025c 270c          	jreq	L001
1423  025e 7b0b          	ld	a,(OFST+6,sp)
1424  0260 a104          	cp	a,#4
1425  0262 2706          	jreq	L001
1426  0264 7b0b          	ld	a,(OFST+6,sp)
1427  0266 a106          	cp	a,#6
1428  0268 2603          	jrne	L67
1429  026a               L001:
1430  026a 4f            	clr	a
1431  026b 2010          	jra	L201
1432  026d               L67:
1433  026d ae00da        	ldw	x,#218
1434  0270 89            	pushw	x
1435  0271 ae0000        	ldw	x,#0
1436  0274 89            	pushw	x
1437  0275 ae0008        	ldw	x,#L103
1438  0278 cd0000        	call	_assert_failed
1440  027b 5b04          	addw	sp,#4
1441  027d               L201:
1442                     ; 221   if (CAN_FilterNumber == CAN_FilterNumber_0)
1444  027d 0d06          	tnz	(OFST+1,sp)
1445  027f 2610          	jrne	L535
1446                     ; 223     fact = 0x01;
1448  0281 a601          	ld	a,#1
1449  0283 6b03          	ld	(OFST-2,sp),a
1451                     ; 224     fsc  = 0x00;
1453  0285 0f04          	clr	(OFST-1,sp)
1455                     ; 225     fmhl = 0x03;
1457  0287 a603          	ld	a,#3
1458  0289 6b05          	ld	(OFST+0,sp),a
1460                     ; 227     can_page_filter = CAN_Page_Filter01;
1462  028b a602          	ld	a,#2
1463  028d 6b02          	ld	(OFST-3,sp),a
1466  028f 206c          	jra	L735
1467  0291               L535:
1468                     ; 229   else if (CAN_FilterNumber == CAN_FilterNumber_1)
1470  0291 7b06          	ld	a,(OFST+1,sp)
1471  0293 a101          	cp	a,#1
1472  0295 2612          	jrne	L145
1473                     ; 231     fact = 0x10;
1475  0297 a610          	ld	a,#16
1476  0299 6b03          	ld	(OFST-2,sp),a
1478                     ; 232     fsc  = 0x04;
1480  029b a604          	ld	a,#4
1481  029d 6b04          	ld	(OFST-1,sp),a
1483                     ; 233     fmhl = 0x0C;
1485  029f a60c          	ld	a,#12
1486  02a1 6b05          	ld	(OFST+0,sp),a
1488                     ; 235     can_page_filter = CAN_Page_Filter01;
1490  02a3 a602          	ld	a,#2
1491  02a5 6b02          	ld	(OFST-3,sp),a
1494  02a7 2054          	jra	L735
1495  02a9               L145:
1496                     ; 237   else if (CAN_FilterNumber == CAN_FilterNumber_2)
1498  02a9 7b06          	ld	a,(OFST+1,sp)
1499  02ab a102          	cp	a,#2
1500  02ad 2610          	jrne	L545
1501                     ; 239     fact = 0x01;
1503  02af a601          	ld	a,#1
1504  02b1 6b03          	ld	(OFST-2,sp),a
1506                     ; 240     fsc  = 0x00;
1508  02b3 0f04          	clr	(OFST-1,sp)
1510                     ; 241     fmhl = 0x30;
1512  02b5 a630          	ld	a,#48
1513  02b7 6b05          	ld	(OFST+0,sp),a
1515                     ; 243     can_page_filter = CAN_Page_Filter23;
1517  02b9 a603          	ld	a,#3
1518  02bb 6b02          	ld	(OFST-3,sp),a
1521  02bd 203e          	jra	L735
1522  02bf               L545:
1523                     ; 245   else if (CAN_FilterNumber == CAN_FilterNumber_3)
1525  02bf 7b06          	ld	a,(OFST+1,sp)
1526  02c1 a103          	cp	a,#3
1527  02c3 2612          	jrne	L155
1528                     ; 247     fact = 0x10;
1530  02c5 a610          	ld	a,#16
1531  02c7 6b03          	ld	(OFST-2,sp),a
1533                     ; 248     fsc  = 0x04;
1535  02c9 a604          	ld	a,#4
1536  02cb 6b04          	ld	(OFST-1,sp),a
1538                     ; 249     fmhl = 0xC0;
1540  02cd a6c0          	ld	a,#192
1541  02cf 6b05          	ld	(OFST+0,sp),a
1543                     ; 251     can_page_filter = CAN_Page_Filter23;
1545  02d1 a603          	ld	a,#3
1546  02d3 6b02          	ld	(OFST-3,sp),a
1549  02d5 2026          	jra	L735
1550  02d7               L155:
1551                     ; 253   else if (CAN_FilterNumber == CAN_FilterNumber_4)
1553  02d7 7b06          	ld	a,(OFST+1,sp)
1554  02d9 a104          	cp	a,#4
1555  02db 2610          	jrne	L555
1556                     ; 255     fact = 0x01;
1558  02dd a601          	ld	a,#1
1559  02df 6b03          	ld	(OFST-2,sp),a
1561                     ; 256     fsc  = 0x00;
1563  02e1 0f04          	clr	(OFST-1,sp)
1565                     ; 257     fmhl = 0x03;
1567  02e3 a603          	ld	a,#3
1568  02e5 6b05          	ld	(OFST+0,sp),a
1570                     ; 259     can_page_filter = CAN_Page_Filter45;
1572  02e7 a604          	ld	a,#4
1573  02e9 6b02          	ld	(OFST-3,sp),a
1576  02eb 2010          	jra	L735
1577  02ed               L555:
1578                     ; 263     fact = 0x10;
1580  02ed a610          	ld	a,#16
1581  02ef 6b03          	ld	(OFST-2,sp),a
1583                     ; 264     fsc  = 0x04;
1585  02f1 a604          	ld	a,#4
1586  02f3 6b04          	ld	(OFST-1,sp),a
1588                     ; 265     fmhl = 0x0C;
1590  02f5 a60c          	ld	a,#12
1591  02f7 6b05          	ld	(OFST+0,sp),a
1593                     ; 267     can_page_filter = CAN_Page_Filter45;
1595  02f9 a604          	ld	a,#4
1596  02fb 6b02          	ld	(OFST-3,sp),a
1598  02fd               L735:
1599                     ; 271   CAN_OperatingModeRequest(CAN_OperatingMode_Initialization);
1601  02fd 4f            	clr	a
1602  02fe cd0b6a        	call	_CAN_OperatingModeRequest
1604                     ; 273   CAN->PSR = CAN_Page_Config;
1606  0301 35065427      	mov	21543,#6
1607                     ; 278   if (can_page_filter == CAN_Page_Filter01) /* FCR1 */
1609  0305 7b02          	ld	a,(OFST-3,sp)
1610  0307 a102          	cp	a,#2
1611  0309 262b          	jrne	L165
1612                     ; 281     CAN->Page.Config.FCR1 &= (uint8_t)(~(uint8_t)(fact | (uint8_t)((uint8_t)(CAN_FCR1_FSC00|CAN_FCR1_FSC01) << fsc )));
1614  030b 7b04          	ld	a,(OFST-1,sp)
1615  030d 5f            	clrw	x
1616  030e 97            	ld	xl,a
1617  030f a606          	ld	a,#6
1618  0311 5d            	tnzw	x
1619  0312 2704          	jreq	L401
1620  0314               L601:
1621  0314 48            	sll	a
1622  0315 5a            	decw	x
1623  0316 26fc          	jrne	L601
1624  0318               L401:
1625  0318 1a03          	or	a,(OFST-2,sp)
1626  031a 43            	cpl	a
1627  031b c45432        	and	a,21554
1628  031e c75432        	ld	21554,a
1629                     ; 283     CAN->Page.Config.FCR1 |= (uint8_t)(CAN_FilterScale << fsc);
1631  0321 7b04          	ld	a,(OFST-1,sp)
1632  0323 5f            	clrw	x
1633  0324 97            	ld	xl,a
1634  0325 7b0b          	ld	a,(OFST+6,sp)
1635  0327 5d            	tnzw	x
1636  0328 2704          	jreq	L011
1637  032a               L211:
1638  032a 48            	sll	a
1639  032b 5a            	decw	x
1640  032c 26fc          	jrne	L211
1641  032e               L011:
1642  032e ca5432        	or	a,21554
1643  0331 c75432        	ld	21554,a
1645  0334 205a          	jra	L365
1646  0336               L165:
1647                     ; 285   else if (can_page_filter == CAN_Page_Filter23) /* FCR2*/
1649  0336 7b02          	ld	a,(OFST-3,sp)
1650  0338 a103          	cp	a,#3
1651  033a 262b          	jrne	L565
1652                     ; 288     CAN->Page.Config.FCR2 &= (uint8_t)~(uint8_t)( fact | (uint8_t)((uint8_t)(CAN_FCR1_FSC00|CAN_FCR1_FSC01) << fsc ));
1654  033c 7b04          	ld	a,(OFST-1,sp)
1655  033e 5f            	clrw	x
1656  033f 97            	ld	xl,a
1657  0340 a606          	ld	a,#6
1658  0342 5d            	tnzw	x
1659  0343 2704          	jreq	L411
1660  0345               L611:
1661  0345 48            	sll	a
1662  0346 5a            	decw	x
1663  0347 26fc          	jrne	L611
1664  0349               L411:
1665  0349 1a03          	or	a,(OFST-2,sp)
1666  034b 43            	cpl	a
1667  034c c45433        	and	a,21555
1668  034f c75433        	ld	21555,a
1669                     ; 291     CAN->Page.Config.FCR2 |= (uint8_t)(CAN_FilterScale << fsc);
1671  0352 7b04          	ld	a,(OFST-1,sp)
1672  0354 5f            	clrw	x
1673  0355 97            	ld	xl,a
1674  0356 7b0b          	ld	a,(OFST+6,sp)
1675  0358 5d            	tnzw	x
1676  0359 2704          	jreq	L021
1677  035b               L221:
1678  035b 48            	sll	a
1679  035c 5a            	decw	x
1680  035d 26fc          	jrne	L221
1681  035f               L021:
1682  035f ca5433        	or	a,21555
1683  0362 c75433        	ld	21555,a
1685  0365 2029          	jra	L365
1686  0367               L565:
1687                     ; 297     CAN->Page.Config.FCR3 &= (uint8_t)~(uint8_t)( fact | (uint8_t)((uint8_t)(CAN_FCR1_FSC00|CAN_FCR1_FSC01) << fsc ));
1689  0367 7b04          	ld	a,(OFST-1,sp)
1690  0369 5f            	clrw	x
1691  036a 97            	ld	xl,a
1692  036b a606          	ld	a,#6
1693  036d 5d            	tnzw	x
1694  036e 2704          	jreq	L421
1695  0370               L621:
1696  0370 48            	sll	a
1697  0371 5a            	decw	x
1698  0372 26fc          	jrne	L621
1699  0374               L421:
1700  0374 1a03          	or	a,(OFST-2,sp)
1701  0376 43            	cpl	a
1702  0377 c45434        	and	a,21556
1703  037a c75434        	ld	21556,a
1704                     ; 300     CAN->Page.Config.FCR3 |= (uint8_t)(CAN_FilterScale << fsc);
1706  037d 7b04          	ld	a,(OFST-1,sp)
1707  037f 5f            	clrw	x
1708  0380 97            	ld	xl,a
1709  0381 7b0b          	ld	a,(OFST+6,sp)
1710  0383 5d            	tnzw	x
1711  0384 2704          	jreq	L031
1712  0386               L231:
1713  0386 48            	sll	a
1714  0387 5a            	decw	x
1715  0388 26fc          	jrne	L231
1716  038a               L031:
1717  038a ca5434        	or	a,21556
1718  038d c75434        	ld	21556,a
1719  0390               L365:
1720                     ; 306   if (can_page_filter != CAN_Page_Filter45) /* FMR1*/
1722  0390 7b02          	ld	a,(OFST-3,sp)
1723  0392 a104          	cp	a,#4
1724  0394 273d          	jreq	L175
1725                     ; 309     if (CAN_FilterMode == CAN_FilterMode_IdMask)
1727  0396 0d0a          	tnz	(OFST+5,sp)
1728  0398 260b          	jrne	L375
1729                     ; 312       CAN->Page.Config.FMR1 &= (uint8_t)~(fmhl);
1731  039a 7b05          	ld	a,(OFST+0,sp)
1732  039c 43            	cpl	a
1733  039d c45430        	and	a,21552
1734  03a0 c75430        	ld	21552,a
1736  03a3 2069          	jra	L706
1737  03a5               L375:
1738                     ; 314     else if ( CAN_FilterMode == CAN_FilterMode_IdList)
1740  03a5 7b0a          	ld	a,(OFST+5,sp)
1741  03a7 a101          	cp	a,#1
1742  03a9 260a          	jrne	L775
1743                     ; 317       CAN->Page.Config.FMR1 |= (uint8_t)(fmhl);
1745  03ab c65430        	ld	a,21552
1746  03ae 1a05          	or	a,(OFST+0,sp)
1747  03b0 c75430        	ld	21552,a
1749  03b3 2059          	jra	L706
1750  03b5               L775:
1751                     ; 319     else if ( CAN_FilterMode == CAN_FilterMode_IdList_IdMask)
1753  03b5 7b0a          	ld	a,(OFST+5,sp)
1754  03b7 a111          	cp	a,#17
1755  03b9 260c          	jrne	L306
1756                     ; 322       CAN->Page.Config.FMR1 |= (uint8_t)(fmhl & CAN_IDLIST_IDMASK_MASK);
1758  03bb 7b05          	ld	a,(OFST+0,sp)
1759  03bd a455          	and	a,#85
1760  03bf ca5430        	or	a,21552
1761  03c2 c75430        	ld	21552,a
1763  03c5 2047          	jra	L706
1764  03c7               L306:
1765                     ; 327       CAN->Page.Config.FMR1 |= (uint8_t)(fmhl & CAN_IDMASK_IDLIST_MASK);
1767  03c7 7b05          	ld	a,(OFST+0,sp)
1768  03c9 a4aa          	and	a,#170
1769  03cb ca5430        	or	a,21552
1770  03ce c75430        	ld	21552,a
1771  03d1 203b          	jra	L706
1772  03d3               L175:
1773                     ; 336     if (CAN_FilterMode == CAN_FilterMode_IdMask)
1775  03d3 0d0a          	tnz	(OFST+5,sp)
1776  03d5 260b          	jrne	L116
1777                     ; 339       CAN->Page.Config.FMR2 &= (uint8_t)~(fmhl);
1779  03d7 7b05          	ld	a,(OFST+0,sp)
1780  03d9 43            	cpl	a
1781  03da c45431        	and	a,21553
1782  03dd c75431        	ld	21553,a
1784  03e0 202c          	jra	L706
1785  03e2               L116:
1786                     ; 341     else if ( CAN_FilterMode == CAN_FilterMode_IdList)
1788  03e2 7b0a          	ld	a,(OFST+5,sp)
1789  03e4 a101          	cp	a,#1
1790  03e6 260a          	jrne	L516
1791                     ; 344       CAN->Page.Config.FMR2 |= (uint8_t)(fmhl);
1793  03e8 c65431        	ld	a,21553
1794  03eb 1a05          	or	a,(OFST+0,sp)
1795  03ed c75431        	ld	21553,a
1797  03f0 201c          	jra	L706
1798  03f2               L516:
1799                     ; 346     else if ( CAN_FilterMode == CAN_FilterMode_IdList_IdMask)
1801  03f2 7b0a          	ld	a,(OFST+5,sp)
1802  03f4 a111          	cp	a,#17
1803  03f6 260c          	jrne	L126
1804                     ; 349       CAN->Page.Config.FMR2 |= (uint8_t)(fmhl & CAN_IDLIST_IDMASK_MASK);
1806  03f8 7b05          	ld	a,(OFST+0,sp)
1807  03fa a455          	and	a,#85
1808  03fc ca5431        	or	a,21553
1809  03ff c75431        	ld	21553,a
1811  0402 200a          	jra	L706
1812  0404               L126:
1813                     ; 354       CAN->Page.Config.FMR2 |= (uint8_t)(fmhl & CAN_IDMASK_IDLIST_MASK);
1815  0404 7b05          	ld	a,(OFST+0,sp)
1816  0406 a4aa          	and	a,#170
1817  0408 ca5431        	or	a,21553
1818  040b c75431        	ld	21553,a
1819  040e               L706:
1820                     ; 360   CAN->PSR = (uint8_t)can_page_filter;
1822  040e 7b02          	ld	a,(OFST-3,sp)
1823  0410 c75427        	ld	21543,a
1824                     ; 361   if (fsc != 0)
1826  0413 0d04          	tnz	(OFST-1,sp)
1827  0415 2603          	jrne	L431
1828  0417 cc04e3        	jp	L526
1829  041a               L431:
1830                     ; 364     if (CAN_FilterScale == CAN_FilterScale_8Bit)
1832  041a 0d0b          	tnz	(OFST+6,sp)
1833  041c 262c          	jrne	L726
1834                     ; 366       CAN->Page.Filter.FR09 = CAN_FilterID1;
1836  041e 7b0c          	ld	a,(OFST+7,sp)
1837  0420 c75430        	ld	21552,a
1838                     ; 367       CAN->Page.Filter.FR10 = CAN_FilterIDMask1;
1840  0423 7b10          	ld	a,(OFST+11,sp)
1841  0425 c75431        	ld	21553,a
1842                     ; 368       CAN->Page.Filter.FR11 = CAN_FilterID2;
1844  0428 7b0d          	ld	a,(OFST+8,sp)
1845  042a c75432        	ld	21554,a
1846                     ; 369       CAN->Page.Filter.FR12 = CAN_FilterIDMask2;
1848  042d 7b11          	ld	a,(OFST+12,sp)
1849  042f c75433        	ld	21555,a
1850                     ; 370       CAN->Page.Filter.FR13 = CAN_FilterID3;
1852  0432 7b0e          	ld	a,(OFST+9,sp)
1853  0434 c75434        	ld	21556,a
1854                     ; 371       CAN->Page.Filter.FR14 = CAN_FilterIDMask3;
1856  0437 7b12          	ld	a,(OFST+13,sp)
1857  0439 c75435        	ld	21557,a
1858                     ; 372       CAN->Page.Filter.FR15 = CAN_FilterID4;
1860  043c 7b0f          	ld	a,(OFST+10,sp)
1861  043e c75436        	ld	21558,a
1862                     ; 373       CAN->Page.Filter.FR16 = CAN_FilterIDMask4;
1864  0441 7b13          	ld	a,(OFST+14,sp)
1865  0443 c75437        	ld	21559,a
1867  0446 aca105a1      	jpf	L546
1868  044a               L726:
1869                     ; 375     else if (CAN_FilterScale == CAN_FilterScale_16_8Bit)
1871  044a 7b0b          	ld	a,(OFST+6,sp)
1872  044c a102          	cp	a,#2
1873  044e 262c          	jrne	L336
1874                     ; 377       CAN->Page.Filter.FR09 = CAN_FilterID1;
1876  0450 7b0c          	ld	a,(OFST+7,sp)
1877  0452 c75430        	ld	21552,a
1878                     ; 378       CAN->Page.Filter.FR10 = CAN_FilterID2;
1880  0455 7b0d          	ld	a,(OFST+8,sp)
1881  0457 c75431        	ld	21553,a
1882                     ; 379       CAN->Page.Filter.FR11 = CAN_FilterIDMask1;
1884  045a 7b10          	ld	a,(OFST+11,sp)
1885  045c c75432        	ld	21554,a
1886                     ; 380       CAN->Page.Filter.FR12 = CAN_FilterIDMask2;
1888  045f 7b11          	ld	a,(OFST+12,sp)
1889  0461 c75433        	ld	21555,a
1890                     ; 381       CAN->Page.Filter.FR13 = CAN_FilterID3;
1892  0464 7b0e          	ld	a,(OFST+9,sp)
1893  0466 c75434        	ld	21556,a
1894                     ; 382       CAN->Page.Filter.FR14 = CAN_FilterIDMask3;
1896  0469 7b12          	ld	a,(OFST+13,sp)
1897  046b c75435        	ld	21557,a
1898                     ; 383       CAN->Page.Filter.FR15 = CAN_FilterID4;
1900  046e 7b0f          	ld	a,(OFST+10,sp)
1901  0470 c75436        	ld	21558,a
1902                     ; 384       CAN->Page.Filter.FR16 = CAN_FilterIDMask4;
1904  0473 7b13          	ld	a,(OFST+14,sp)
1905  0475 c75437        	ld	21559,a
1907  0478 aca105a1      	jpf	L546
1908  047c               L336:
1909                     ; 386     else if (CAN_FilterScale == CAN_FilterScale_16Bit)
1911  047c 7b0b          	ld	a,(OFST+6,sp)
1912  047e a104          	cp	a,#4
1913  0480 262c          	jrne	L736
1914                     ; 388       CAN->Page.Filter.FR09 = CAN_FilterID1;
1916  0482 7b0c          	ld	a,(OFST+7,sp)
1917  0484 c75430        	ld	21552,a
1918                     ; 389       CAN->Page.Filter.FR10 = CAN_FilterID2;
1920  0487 7b0d          	ld	a,(OFST+8,sp)
1921  0489 c75431        	ld	21553,a
1922                     ; 390       CAN->Page.Filter.FR11 = CAN_FilterIDMask1;
1924  048c 7b10          	ld	a,(OFST+11,sp)
1925  048e c75432        	ld	21554,a
1926                     ; 391       CAN->Page.Filter.FR12 = CAN_FilterIDMask2;
1928  0491 7b11          	ld	a,(OFST+12,sp)
1929  0493 c75433        	ld	21555,a
1930                     ; 392       CAN->Page.Filter.FR13 = CAN_FilterID3;
1932  0496 7b0e          	ld	a,(OFST+9,sp)
1933  0498 c75434        	ld	21556,a
1934                     ; 393       CAN->Page.Filter.FR14 = CAN_FilterID4;
1936  049b 7b0f          	ld	a,(OFST+10,sp)
1937  049d c75435        	ld	21557,a
1938                     ; 394       CAN->Page.Filter.FR15 = CAN_FilterIDMask3;
1940  04a0 7b12          	ld	a,(OFST+13,sp)
1941  04a2 c75436        	ld	21558,a
1942                     ; 395       CAN->Page.Filter.FR16 = CAN_FilterIDMask4;
1944  04a5 7b13          	ld	a,(OFST+14,sp)
1945  04a7 c75437        	ld	21559,a
1947  04aa aca105a1      	jpf	L546
1948  04ae               L736:
1949                     ; 397     else if (CAN_FilterScale == CAN_FilterScale_32Bit)
1951  04ae 7b0b          	ld	a,(OFST+6,sp)
1952  04b0 a106          	cp	a,#6
1953  04b2 2703          	jreq	L631
1954  04b4 cc05a1        	jp	L546
1955  04b7               L631:
1956                     ; 399       CAN->Page.Filter.FR09 = CAN_FilterID1;
1958  04b7 7b0c          	ld	a,(OFST+7,sp)
1959  04b9 c75430        	ld	21552,a
1960                     ; 400       CAN->Page.Filter.FR10 = CAN_FilterID2;
1962  04bc 7b0d          	ld	a,(OFST+8,sp)
1963  04be c75431        	ld	21553,a
1964                     ; 401       CAN->Page.Filter.FR11 = CAN_FilterID3;
1966  04c1 7b0e          	ld	a,(OFST+9,sp)
1967  04c3 c75432        	ld	21554,a
1968                     ; 402       CAN->Page.Filter.FR12 = CAN_FilterID4;
1970  04c6 7b0f          	ld	a,(OFST+10,sp)
1971  04c8 c75433        	ld	21555,a
1972                     ; 403       CAN->Page.Filter.FR13 = CAN_FilterIDMask1;
1974  04cb 7b10          	ld	a,(OFST+11,sp)
1975  04cd c75434        	ld	21556,a
1976                     ; 404       CAN->Page.Filter.FR14 = CAN_FilterIDMask2;
1978  04d0 7b11          	ld	a,(OFST+12,sp)
1979  04d2 c75435        	ld	21557,a
1980                     ; 405       CAN->Page.Filter.FR15 = CAN_FilterIDMask3;
1982  04d5 7b12          	ld	a,(OFST+13,sp)
1983  04d7 c75436        	ld	21558,a
1984                     ; 406       CAN->Page.Filter.FR16 = CAN_FilterIDMask4;
1986  04da 7b13          	ld	a,(OFST+14,sp)
1987  04dc c75437        	ld	21559,a
1988  04df aca105a1      	jpf	L546
1989  04e3               L526:
1990                     ; 412     if (CAN_FilterScale == CAN_FilterScale_8Bit)
1992  04e3 0d0b          	tnz	(OFST+6,sp)
1993  04e5 262c          	jrne	L746
1994                     ; 414       CAN->Page.Filter.FR01 = CAN_FilterID1;
1996  04e7 7b0c          	ld	a,(OFST+7,sp)
1997  04e9 c75428        	ld	21544,a
1998                     ; 415       CAN->Page.Filter.FR02 = CAN_FilterIDMask1;
2000  04ec 7b10          	ld	a,(OFST+11,sp)
2001  04ee c75429        	ld	21545,a
2002                     ; 416       CAN->Page.Filter.FR03 = CAN_FilterID2;
2004  04f1 7b0d          	ld	a,(OFST+8,sp)
2005  04f3 c7542a        	ld	21546,a
2006                     ; 417       CAN->Page.Filter.FR04 = CAN_FilterIDMask2;
2008  04f6 7b11          	ld	a,(OFST+12,sp)
2009  04f8 c7542b        	ld	21547,a
2010                     ; 418       CAN->Page.Filter.FR05 = CAN_FilterID3;
2012  04fb 7b0e          	ld	a,(OFST+9,sp)
2013  04fd c7542c        	ld	21548,a
2014                     ; 419       CAN->Page.Filter.FR06 = CAN_FilterIDMask3;
2016  0500 7b12          	ld	a,(OFST+13,sp)
2017  0502 c7542d        	ld	21549,a
2018                     ; 420       CAN->Page.Filter.FR07 = CAN_FilterID4;
2020  0505 7b0f          	ld	a,(OFST+10,sp)
2021  0507 c7542e        	ld	21550,a
2022                     ; 421       CAN->Page.Filter.FR08 = CAN_FilterIDMask4;
2024  050a 7b13          	ld	a,(OFST+14,sp)
2025  050c c7542f        	ld	21551,a
2027  050f aca105a1      	jpf	L546
2028  0513               L746:
2029                     ; 423     else if (CAN_FilterScale == CAN_FilterScale_16_8Bit)
2031  0513 7b0b          	ld	a,(OFST+6,sp)
2032  0515 a102          	cp	a,#2
2033  0517 262a          	jrne	L356
2034                     ; 425       CAN->Page.Filter.FR01 = CAN_FilterID1;
2036  0519 7b0c          	ld	a,(OFST+7,sp)
2037  051b c75428        	ld	21544,a
2038                     ; 426       CAN->Page.Filter.FR02 = CAN_FilterID2;
2040  051e 7b0d          	ld	a,(OFST+8,sp)
2041  0520 c75429        	ld	21545,a
2042                     ; 427       CAN->Page.Filter.FR03 = CAN_FilterIDMask1;
2044  0523 7b10          	ld	a,(OFST+11,sp)
2045  0525 c7542a        	ld	21546,a
2046                     ; 428       CAN->Page.Filter.FR04 = CAN_FilterIDMask2;
2048  0528 7b11          	ld	a,(OFST+12,sp)
2049  052a c7542b        	ld	21547,a
2050                     ; 429       CAN->Page.Filter.FR05 = CAN_FilterID3;
2052  052d 7b0e          	ld	a,(OFST+9,sp)
2053  052f c7542c        	ld	21548,a
2054                     ; 430       CAN->Page.Filter.FR06 = CAN_FilterIDMask3;
2056  0532 7b12          	ld	a,(OFST+13,sp)
2057  0534 c7542d        	ld	21549,a
2058                     ; 431       CAN->Page.Filter.FR07 = CAN_FilterID4;
2060  0537 7b0f          	ld	a,(OFST+10,sp)
2061  0539 c7542e        	ld	21550,a
2062                     ; 432       CAN->Page.Filter.FR08 = CAN_FilterIDMask4;
2064  053c 7b13          	ld	a,(OFST+14,sp)
2065  053e c7542f        	ld	21551,a
2067  0541 205e          	jra	L546
2068  0543               L356:
2069                     ; 434     else if (CAN_FilterScale == CAN_FilterScale_16Bit)
2071  0543 7b0b          	ld	a,(OFST+6,sp)
2072  0545 a104          	cp	a,#4
2073  0547 262a          	jrne	L756
2074                     ; 436       CAN->Page.Filter.FR01 = CAN_FilterID1;
2076  0549 7b0c          	ld	a,(OFST+7,sp)
2077  054b c75428        	ld	21544,a
2078                     ; 437       CAN->Page.Filter.FR02 = CAN_FilterID2;
2080  054e 7b0d          	ld	a,(OFST+8,sp)
2081  0550 c75429        	ld	21545,a
2082                     ; 438       CAN->Page.Filter.FR03 = CAN_FilterIDMask1;
2084  0553 7b10          	ld	a,(OFST+11,sp)
2085  0555 c7542a        	ld	21546,a
2086                     ; 439       CAN->Page.Filter.FR04 = CAN_FilterIDMask2;
2088  0558 7b11          	ld	a,(OFST+12,sp)
2089  055a c7542b        	ld	21547,a
2090                     ; 440       CAN->Page.Filter.FR05 = CAN_FilterID3;
2092  055d 7b0e          	ld	a,(OFST+9,sp)
2093  055f c7542c        	ld	21548,a
2094                     ; 441       CAN->Page.Filter.FR06 = CAN_FilterID4;
2096  0562 7b0f          	ld	a,(OFST+10,sp)
2097  0564 c7542d        	ld	21549,a
2098                     ; 442       CAN->Page.Filter.FR07 = CAN_FilterIDMask3;
2100  0567 7b12          	ld	a,(OFST+13,sp)
2101  0569 c7542e        	ld	21550,a
2102                     ; 443       CAN->Page.Filter.FR08 = CAN_FilterIDMask4;
2104  056c 7b13          	ld	a,(OFST+14,sp)
2105  056e c7542f        	ld	21551,a
2107  0571 202e          	jra	L546
2108  0573               L756:
2109                     ; 445     else if (CAN_FilterScale == CAN_FilterScale_32Bit)
2111  0573 7b0b          	ld	a,(OFST+6,sp)
2112  0575 a106          	cp	a,#6
2113  0577 2628          	jrne	L546
2114                     ; 447       CAN->Page.Filter.FR01 = CAN_FilterID1;
2116  0579 7b0c          	ld	a,(OFST+7,sp)
2117  057b c75428        	ld	21544,a
2118                     ; 448       CAN->Page.Filter.FR02 = CAN_FilterID2;
2120  057e 7b0d          	ld	a,(OFST+8,sp)
2121  0580 c75429        	ld	21545,a
2122                     ; 449       CAN->Page.Filter.FR03 = CAN_FilterID3;
2124  0583 7b0e          	ld	a,(OFST+9,sp)
2125  0585 c7542a        	ld	21546,a
2126                     ; 450       CAN->Page.Filter.FR04 = CAN_FilterID4;
2128  0588 7b0f          	ld	a,(OFST+10,sp)
2129  058a c7542b        	ld	21547,a
2130                     ; 451       CAN->Page.Filter.FR05 = CAN_FilterIDMask1;
2132  058d 7b10          	ld	a,(OFST+11,sp)
2133  058f c7542c        	ld	21548,a
2134                     ; 452       CAN->Page.Filter.FR06 = CAN_FilterIDMask2;
2136  0592 7b11          	ld	a,(OFST+12,sp)
2137  0594 c7542d        	ld	21549,a
2138                     ; 453       CAN->Page.Filter.FR07 = CAN_FilterIDMask3;
2140  0597 7b12          	ld	a,(OFST+13,sp)
2141  0599 c7542e        	ld	21550,a
2142                     ; 454       CAN->Page.Filter.FR08 = CAN_FilterIDMask4;
2144  059c 7b13          	ld	a,(OFST+14,sp)
2145  059e c7542f        	ld	21551,a
2146  05a1               L546:
2147                     ; 463   CAN->PSR = CAN_Page_Config;
2149  05a1 35065427      	mov	21543,#6
2150                     ; 464   if (CAN_FilterActivation != DISABLE)
2152  05a5 0d07          	tnz	(OFST+2,sp)
2153  05a7 272a          	jreq	L566
2154                     ; 466     if ((CAN_FilterNumber & 0x06) == 0x00) /* FCR1*/
2156  05a9 7b06          	ld	a,(OFST+1,sp)
2157  05ab a506          	bcp	a,#6
2158  05ad 260a          	jrne	L766
2159                     ; 467     {   CAN->Page.Config.FCR1 |= (uint8_t)fact;
2161  05af c65432        	ld	a,21554
2162  05b2 1a03          	or	a,(OFST-2,sp)
2163  05b4 c75432        	ld	21554,a
2165  05b7 201a          	jra	L566
2166  05b9               L766:
2167                     ; 469     else if ((CAN_FilterNumber & 0x06) == 0x02) /*FCR2*/
2169  05b9 7b06          	ld	a,(OFST+1,sp)
2170  05bb a406          	and	a,#6
2171  05bd a102          	cp	a,#2
2172  05bf 260a          	jrne	L376
2173                     ; 470     { CAN->Page.Config.FCR2 |= (uint8_t)fact;
2175  05c1 c65433        	ld	a,21555
2176  05c4 1a03          	or	a,(OFST-2,sp)
2177  05c6 c75433        	ld	21555,a
2179  05c9 2008          	jra	L566
2180  05cb               L376:
2181                     ; 473     { CAN->Page.Config.FCR3 |= (uint8_t)fact;
2183  05cb c65434        	ld	a,21556
2184  05ce 1a03          	or	a,(OFST-2,sp)
2185  05d0 c75434        	ld	21556,a
2186  05d3               L566:
2187                     ; 476   CAN_OperatingModeRequest(CAN_OperatingMode_Normal);
2189  05d3 a601          	ld	a,#1
2190  05d5 cd0b6a        	call	_CAN_OperatingModeRequest
2192                     ; 478   CAN_SelectPage(can_page);
2194  05d8 7b01          	ld	a,(OFST-4,sp)
2195  05da cd106b        	call	_CAN_SelectPage
2197                     ; 479 }
2200  05dd 5b07          	addw	sp,#7
2201  05df 81            	ret
2344                     ; 487 void CAN_ITConfig(CAN_IT_TypeDef CAN_IT, FunctionalState NewState)
2344                     ; 488 {
2345                     	switch	.text
2346  05e0               _CAN_ITConfig:
2348  05e0 89            	pushw	x
2349  05e1 5203          	subw	sp,#3
2350       00000003      OFST:	set	3
2353                     ; 489   uint8_t tmperrorinterrupt = 0;
2355                     ; 490   CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
2357  05e3 cd1067        	call	_CAN_GetSelectedPage
2359  05e6 6b02          	ld	(OFST-1,sp),a
2361                     ; 494   assert_param(IS_CAN_IT_CONFIG_OK(CAN_IT));
2363  05e8 1e04          	ldw	x,(OFST+1,sp)
2364  05ea 2711          	jreq	L241
2365  05ec 1e04          	ldw	x,(OFST+1,sp)
2366  05ee 01            	rrwa	x,a
2367  05ef a470          	and	a,#112
2368  05f1 01            	rrwa	x,a
2369  05f2 a4b0          	and	a,#176
2370  05f4 01            	rrwa	x,a
2371  05f5 a30000        	cpw	x,#0
2372  05f8 2603          	jrne	L241
2373  05fa 4f            	clr	a
2374  05fb 2010          	jra	L441
2375  05fd               L241:
2376  05fd ae01ee        	ldw	x,#494
2377  0600 89            	pushw	x
2378  0601 ae0000        	ldw	x,#0
2379  0604 89            	pushw	x
2380  0605 ae0008        	ldw	x,#L103
2381  0608 cd0000        	call	_assert_failed
2383  060b 5b04          	addw	sp,#4
2384  060d               L441:
2385                     ; 495   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2387  060d 0d08          	tnz	(OFST+5,sp)
2388  060f 2706          	jreq	L051
2389  0611 7b08          	ld	a,(OFST+5,sp)
2390  0613 a101          	cp	a,#1
2391  0615 2603          	jrne	L641
2392  0617               L051:
2393  0617 4f            	clr	a
2394  0618 2010          	jra	L251
2395  061a               L641:
2396  061a ae01ef        	ldw	x,#495
2397  061d 89            	pushw	x
2398  061e ae0000        	ldw	x,#0
2399  0621 89            	pushw	x
2400  0622 ae0008        	ldw	x,#L103
2401  0625 cd0000        	call	_assert_failed
2403  0628 5b04          	addw	sp,#4
2404  062a               L251:
2405                     ; 497   tmperrorinterrupt = (uint8_t)(((uint16_t)CAN_IT) >>7);
2407  062a 1e04          	ldw	x,(OFST+1,sp)
2408  062c 4f            	clr	a
2409  062d 01            	rrwa	x,a
2410  062e 48            	sll	a
2411  062f 59            	rlcw	x
2412  0630 9f            	ld	a,xl
2413  0631 6b03          	ld	(OFST+0,sp),a
2415                     ; 498   tmperrorinterrupt = (uint8_t)((uint8_t)((uint16_t)tmperrorinterrupt & 0xF0) | 
2415                     ; 499                                 (uint8_t)((uint8_t)((uint16_t)tmperrorinterrupt & 0x0F) >>1));
2417  0633 7b03          	ld	a,(OFST+0,sp)
2418  0635 a40f          	and	a,#15
2419  0637 44            	srl	a
2420  0638 6b01          	ld	(OFST-2,sp),a
2422  063a 7b03          	ld	a,(OFST+0,sp)
2423  063c a4f0          	and	a,#240
2424  063e 1a01          	or	a,(OFST-2,sp)
2425  0640 6b03          	ld	(OFST+0,sp),a
2427                     ; 501   CAN->PSR = CAN_Page_Config;
2429  0642 35065427      	mov	21543,#6
2430                     ; 502   if (NewState != DISABLE)
2432  0646 0d08          	tnz	(OFST+5,sp)
2433  0648 2712          	jreq	L167
2434                     ; 505     CAN->IER |= (uint8_t)(CAN_IT);
2436  064a c65425        	ld	a,21541
2437  064d 1a05          	or	a,(OFST+2,sp)
2438  064f c75425        	ld	21541,a
2439                     ; 506     CAN->Page.Config.EIER |= (uint8_t)(tmperrorinterrupt);
2441  0652 c65429        	ld	a,21545
2442  0655 1a03          	or	a,(OFST+0,sp)
2443  0657 c75429        	ld	21545,a
2445  065a 2012          	jra	L367
2446  065c               L167:
2447                     ; 511     CAN->IER &= (uint8_t)~(uint8_t)((uint16_t)CAN_IT);
2449  065c 7b05          	ld	a,(OFST+2,sp)
2450  065e 43            	cpl	a
2451  065f c45425        	and	a,21541
2452  0662 c75425        	ld	21541,a
2453                     ; 512     CAN->Page.Config.EIER &= (uint8_t)~(tmperrorinterrupt);
2455  0665 7b03          	ld	a,(OFST+0,sp)
2456  0667 43            	cpl	a
2457  0668 c45429        	and	a,21545
2458  066b c75429        	ld	21545,a
2459  066e               L367:
2460                     ; 515   CAN_SelectPage(can_page);
2462  066e 7b02          	ld	a,(OFST-1,sp)
2463  0670 cd106b        	call	_CAN_SelectPage
2465                     ; 516 }
2468  0673 5b05          	addw	sp,#5
2469  0675 81            	ret
2529                     ; 525 void CAN_ST7CompatibilityCmd(CAN_ST7Compatibility_TypeDef CAN_ST7Compatibility)
2529                     ; 526 {
2530                     	switch	.text
2531  0676               _CAN_ST7CompatibilityCmd:
2533  0676 88            	push	a
2534       00000000      OFST:	set	0
2537                     ; 528   assert_param(IS_CAN_ST7_COMPATIBILITY_OK(CAN_ST7Compatibility));
2539  0677 4d            	tnz	a
2540  0678 2704          	jreq	L061
2541  067a a110          	cp	a,#16
2542  067c 2603          	jrne	L651
2543  067e               L061:
2544  067e 4f            	clr	a
2545  067f 2010          	jra	L261
2546  0681               L651:
2547  0681 ae0210        	ldw	x,#528
2548  0684 89            	pushw	x
2549  0685 ae0000        	ldw	x,#0
2550  0688 89            	pushw	x
2551  0689 ae0008        	ldw	x,#L103
2552  068c cd0000        	call	_assert_failed
2554  068f 5b04          	addw	sp,#4
2555  0691               L261:
2556                     ; 530   CAN->DGR &= (uint8_t)(~CAN_DGR_TXM2E);
2558  0691 72195426      	bres	21542,#4
2559                     ; 533   CAN->DGR |= (uint8_t)CAN_ST7Compatibility;
2561  0695 c65426        	ld	a,21542
2562  0698 1a01          	or	a,(OFST+1,sp)
2563  069a c75426        	ld	21542,a
2564                     ; 534 }
2567  069d 84            	pop	a
2568  069e 81            	ret
2616                     ; 541 void CAN_TTComModeCmd(FunctionalState NewState)
2616                     ; 542 {
2617                     	switch	.text
2618  069f               _CAN_TTComModeCmd:
2620  069f 88            	push	a
2621  06a0 88            	push	a
2622       00000001      OFST:	set	1
2625                     ; 543   CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
2627  06a1 cd1067        	call	_CAN_GetSelectedPage
2629  06a4 6b01          	ld	(OFST+0,sp),a
2631                     ; 545   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2633  06a6 0d02          	tnz	(OFST+1,sp)
2634  06a8 2706          	jreq	L071
2635  06aa 7b02          	ld	a,(OFST+1,sp)
2636  06ac a101          	cp	a,#1
2637  06ae 2603          	jrne	L661
2638  06b0               L071:
2639  06b0 4f            	clr	a
2640  06b1 2010          	jra	L271
2641  06b3               L661:
2642  06b3 ae0221        	ldw	x,#545
2643  06b6 89            	pushw	x
2644  06b7 ae0000        	ldw	x,#0
2645  06ba 89            	pushw	x
2646  06bb ae0008        	ldw	x,#L103
2647  06be cd0000        	call	_assert_failed
2649  06c1 5b04          	addw	sp,#4
2650  06c3               L271:
2651                     ; 546   if (NewState != DISABLE)
2653  06c3 0d02          	tnz	(OFST+1,sp)
2654  06c5 2726          	jreq	L5301
2655                     ; 549     CAN->MCR |= CAN_MCR_TTCM;
2657  06c7 721e5420      	bset	21536,#7
2658                     ; 551     CAN->PSR = CAN_Page_TxMailBox0;
2660  06cb 725f5427      	clr	21543
2661                     ; 552     CAN->Page.TxMailbox.MDLCR |= CAN_MDLCR_TGT;
2663  06cf 721e5429      	bset	21545,#7
2664                     ; 553     CAN->PSR = CAN_Page_TxMailBox1;
2666  06d3 35015427      	mov	21543,#1
2667                     ; 554     CAN->Page.TxMailbox.MDLCR |= CAN_MDLCR_TGT;
2669  06d7 721e5429      	bset	21545,#7
2670                     ; 555     CAN->PSR = CAN_Page_TxMailBox2;
2672  06db 35055427      	mov	21543,#5
2673                     ; 556     CAN->Page.TxMailbox.MDLCR |= CAN_MDLCR_TGT;
2675  06df 721e5429      	bset	21545,#7
2676                     ; 557     CAN->PSR = CAN_Page_RxFifo;
2678  06e3 35075427      	mov	21543,#7
2679                     ; 558     CAN->Page.RxFIFO.MDLCR |= CAN_MDLCR_TGT;
2681  06e7 721e5429      	bset	21545,#7
2683  06eb 2024          	jra	L7301
2684  06ed               L5301:
2685                     ; 563     CAN->MCR &= ((uint8_t)~CAN_MCR_TTCM);
2687  06ed 721f5420      	bres	21536,#7
2688                     ; 565     CAN->PSR = CAN_Page_TxMailBox0;
2690  06f1 725f5427      	clr	21543
2691                     ; 566     CAN->Page.TxMailbox.MDLCR &= ((uint8_t)~CAN_MDLCR_TGT);
2693  06f5 721f5429      	bres	21545,#7
2694                     ; 567     CAN->PSR = CAN_Page_TxMailBox1;
2696  06f9 35015427      	mov	21543,#1
2697                     ; 568     CAN->Page.TxMailbox.MDLCR &= ((uint8_t)~CAN_MDLCR_TGT);
2699  06fd 721f5429      	bres	21545,#7
2700                     ; 569     CAN->PSR = CAN_Page_TxMailBox2;
2702  0701 35055427      	mov	21543,#5
2703                     ; 570     CAN->Page.TxMailbox.MDLCR &= ((uint8_t)~CAN_MDLCR_TGT);
2705  0705 721f5429      	bres	21545,#7
2706                     ; 571     CAN->PSR = CAN_Page_RxFifo;
2708  0709 35075427      	mov	21543,#7
2709                     ; 572     CAN->Page.RxFIFO.MDLCR &= ((uint8_t)~CAN_MDLCR_TGT);
2711  070d 721f5429      	bres	21545,#7
2712  0711               L7301:
2713                     ; 575   CAN_SelectPage(can_page);
2715  0711 7b01          	ld	a,(OFST+0,sp)
2716  0713 cd106b        	call	_CAN_SelectPage
2718                     ; 576 }
2721  0716 85            	popw	x
2722  0717 81            	ret
2928                     .const:	section	.text
2929  0000               L602:
2930  0000 20000000      	dc.l	536870912
2931  0004               L412:
2932  0004 00000800      	dc.l	2048
2933                     ; 587 CAN_TxStatus_TypeDef CAN_Transmit(uint32_t CAN_Id,
2933                     ; 588                                   CAN_Id_TypeDef CAN_IDE,
2933                     ; 589                                   CAN_RTR_TypeDef CAN_RTR,
2933                     ; 590                                   uint8_t CAN_DLC,
2933                     ; 591                                   uint8_t *CAN_Data)
2933                     ; 592 {
2934                     	switch	.text
2935  0718               _CAN_Transmit:
2937  0718 5206          	subw	sp,#6
2938       00000006      OFST:	set	6
2941                     ; 593   CAN_TxStatus_TypeDef CAN_TxStatus = CAN_TxStatus_NoMailBox;
2943                     ; 594   CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
2945  071a cd1067        	call	_CAN_GetSelectedPage
2947  071d 6b05          	ld	(OFST-1,sp),a
2949                     ; 596   assert_param(IS_CAN_IDTYPE_OK(CAN_IDE));
2951  071f 0d0d          	tnz	(OFST+7,sp)
2952  0721 2706          	jreq	L002
2953  0723 7b0d          	ld	a,(OFST+7,sp)
2954  0725 a140          	cp	a,#64
2955  0727 2603          	jrne	L671
2956  0729               L002:
2957  0729 4f            	clr	a
2958  072a 2010          	jra	L202
2959  072c               L671:
2960  072c ae0254        	ldw	x,#596
2961  072f 89            	pushw	x
2962  0730 ae0000        	ldw	x,#0
2963  0733 89            	pushw	x
2964  0734 ae0008        	ldw	x,#L103
2965  0737 cd0000        	call	_assert_failed
2967  073a 5b04          	addw	sp,#4
2968  073c               L202:
2969                     ; 597   if (CAN_IDE != CAN_Id_Standard)
2971  073c 0d0d          	tnz	(OFST+7,sp)
2972  073e 2724          	jreq	L3511
2973                     ; 599     assert_param(IS_CAN_EXTID_OK(CAN_Id));
2975  0740 96            	ldw	x,sp
2976  0741 1c0009        	addw	x,#OFST+3
2977  0744 cd0000        	call	c_ltor
2979  0747 ae0000        	ldw	x,#L602
2980  074a cd0000        	call	c_lcmp
2982  074d 2403          	jruge	L402
2983  074f 4f            	clr	a
2984  0750 2010          	jra	L012
2985  0752               L402:
2986  0752 ae0257        	ldw	x,#599
2987  0755 89            	pushw	x
2988  0756 ae0000        	ldw	x,#0
2989  0759 89            	pushw	x
2990  075a ae0008        	ldw	x,#L103
2991  075d cd0000        	call	_assert_failed
2993  0760 5b04          	addw	sp,#4
2994  0762               L012:
2996  0762 2022          	jra	L5511
2997  0764               L3511:
2998                     ; 603     assert_param(IS_CAN_STDID_OK(CAN_Id));
3000  0764 96            	ldw	x,sp
3001  0765 1c0009        	addw	x,#OFST+3
3002  0768 cd0000        	call	c_ltor
3004  076b ae0004        	ldw	x,#L412
3005  076e cd0000        	call	c_lcmp
3007  0771 2403          	jruge	L212
3008  0773 4f            	clr	a
3009  0774 2010          	jra	L612
3010  0776               L212:
3011  0776 ae025b        	ldw	x,#603
3012  0779 89            	pushw	x
3013  077a ae0000        	ldw	x,#0
3014  077d 89            	pushw	x
3015  077e ae0008        	ldw	x,#L103
3016  0781 cd0000        	call	_assert_failed
3018  0784 5b04          	addw	sp,#4
3019  0786               L612:
3020  0786               L5511:
3021                     ; 605   assert_param(IS_CAN_RTR_OK(CAN_RTR));
3023  0786 0d0e          	tnz	(OFST+8,sp)
3024  0788 2706          	jreq	L222
3025  078a 7b0e          	ld	a,(OFST+8,sp)
3026  078c a120          	cp	a,#32
3027  078e 2603          	jrne	L022
3028  0790               L222:
3029  0790 4f            	clr	a
3030  0791 2010          	jra	L422
3031  0793               L022:
3032  0793 ae025d        	ldw	x,#605
3033  0796 89            	pushw	x
3034  0797 ae0000        	ldw	x,#0
3035  079a 89            	pushw	x
3036  079b ae0008        	ldw	x,#L103
3037  079e cd0000        	call	_assert_failed
3039  07a1 5b04          	addw	sp,#4
3040  07a3               L422:
3041                     ; 606   assert_param(IS_CAN_DLC_OK(CAN_DLC));
3043  07a3 7b0f          	ld	a,(OFST+9,sp)
3044  07a5 a109          	cp	a,#9
3045  07a7 2403          	jruge	L622
3046  07a9 4f            	clr	a
3047  07aa 2010          	jra	L032
3048  07ac               L622:
3049  07ac ae025e        	ldw	x,#606
3050  07af 89            	pushw	x
3051  07b0 ae0000        	ldw	x,#0
3052  07b3 89            	pushw	x
3053  07b4 ae0008        	ldw	x,#L103
3054  07b7 cd0000        	call	_assert_failed
3056  07ba 5b04          	addw	sp,#4
3057  07bc               L032:
3058                     ; 608   if ((CAN->TPR & CAN_TPR_TME0) == CAN_TPR_TME0)
3060  07bc c65423        	ld	a,21539
3061  07bf a404          	and	a,#4
3062  07c1 a104          	cp	a,#4
3063  07c3 2604          	jrne	L7511
3064                     ; 610     CAN_TxStatus = CAN_TxStatus_MailBox0Ok;
3066  07c5 0f06          	clr	(OFST+0,sp)
3069  07c7 2022          	jra	L1611
3070  07c9               L7511:
3071                     ; 612   else if ((CAN->TPR & CAN_TPR_TME1) == CAN_TPR_TME1)
3073  07c9 c65423        	ld	a,21539
3074  07cc a408          	and	a,#8
3075  07ce a108          	cp	a,#8
3076  07d0 2606          	jrne	L3611
3077                     ; 614     CAN_TxStatus = CAN_TxStatus_MailBox1Ok;
3079  07d2 a601          	ld	a,#1
3080  07d4 6b06          	ld	(OFST+0,sp),a
3083  07d6 2013          	jra	L1611
3084  07d8               L3611:
3085                     ; 616   else if ((CAN->TPR & CAN_TPR_TME2) == CAN_TPR_TME2)
3087  07d8 c65423        	ld	a,21539
3088  07db a410          	and	a,#16
3089  07dd a110          	cp	a,#16
3090  07df 2606          	jrne	L7611
3091                     ; 618     CAN_TxStatus = CAN_TxStatus_MailBox2Ok;
3093  07e1 a605          	ld	a,#5
3094  07e3 6b06          	ld	(OFST+0,sp),a
3097  07e5 2004          	jra	L1611
3098  07e7               L7611:
3099                     ; 622     CAN_TxStatus = CAN_TxStatus_NoMailBox;
3101  07e7 a6f4          	ld	a,#244
3102  07e9 6b06          	ld	(OFST+0,sp),a
3104  07eb               L1611:
3105                     ; 624   if (CAN_TxStatus != CAN_TxStatus_NoMailBox)
3107  07eb 7b06          	ld	a,(OFST+0,sp)
3108  07ed a1f4          	cp	a,#244
3109  07ef 2603          	jrne	L232
3110  07f1 cc08bd        	jp	L3711
3111  07f4               L232:
3112                     ; 626     CAN->PSR = (uint8_t)CAN_TxStatus;
3114  07f4 7b06          	ld	a,(OFST+0,sp)
3115  07f6 c75427        	ld	21543,a
3116                     ; 628     if (CAN_IDE != CAN_Id_Standard)
3118  07f9 0d0d          	tnz	(OFST+7,sp)
3119  07fb 273b          	jreq	L5711
3120                     ; 630       CAN_Id &= (uint32_t)CAN_EXTID_SIZE;
3122  07fd 7b09          	ld	a,(OFST+3,sp)
3123  07ff a41f          	and	a,#31
3124  0801 6b09          	ld	(OFST+3,sp),a
3125                     ; 631       CAN->Page.TxMailbox.MIDR4 = (uint8_t)(CAN_Id);
3127  0803 7b0c          	ld	a,(OFST+6,sp)
3128  0805 c7542d        	ld	21549,a
3129                     ; 632       CAN_Id = CAN_Id>>8;
3131  0808 96            	ldw	x,sp
3132  0809 1c0009        	addw	x,#OFST+3
3133  080c a608          	ld	a,#8
3134  080e cd0000        	call	c_lgursh
3136                     ; 633       CAN->Page.TxMailbox.MIDR3 = (uint8_t)(CAN_Id);
3138  0811 7b0c          	ld	a,(OFST+6,sp)
3139  0813 c7542c        	ld	21548,a
3140                     ; 634       CAN_Id = CAN_Id>>8;
3142  0816 96            	ldw	x,sp
3143  0817 1c0009        	addw	x,#OFST+3
3144  081a a608          	ld	a,#8
3145  081c cd0000        	call	c_lgursh
3147                     ; 635       CAN->Page.TxMailbox.MIDR2 = (uint8_t)(CAN_Id);
3149  081f 7b0c          	ld	a,(OFST+6,sp)
3150  0821 c7542b        	ld	21547,a
3151                     ; 636       CAN_Id = CAN_Id>>8;
3153  0824 96            	ldw	x,sp
3154  0825 1c0009        	addw	x,#OFST+3
3155  0828 a608          	ld	a,#8
3156  082a cd0000        	call	c_lgursh
3158                     ; 637       CAN->Page.TxMailbox.MIDR1 = (uint8_t)(CAN_Id |CAN_IDE | CAN_RTR);
3160  082d 7b0c          	ld	a,(OFST+6,sp)
3161  082f 1a0d          	or	a,(OFST+7,sp)
3162  0831 1a0e          	or	a,(OFST+8,sp)
3163  0833 c7542a        	ld	21546,a
3165  0836 203a          	jra	L7711
3166  0838               L5711:
3167                     ; 641       CAN_Id &= (uint16_t)CAN_STDID_SIZE;
3169  0838 7b0b          	ld	a,(OFST+5,sp)
3170  083a a407          	and	a,#7
3171  083c 6b0b          	ld	(OFST+5,sp),a
3172  083e 0f0a          	clr	(OFST+4,sp)
3173  0840 0f09          	clr	(OFST+3,sp)
3174                     ; 642       CAN->Page.TxMailbox.MIDR1 = (uint8_t)((CAN_Id>>6) | (CAN_RTR)) ;
3176  0842 7b0e          	ld	a,(OFST+8,sp)
3177  0844 b703          	ld	c_lreg+3,a
3178  0846 3f02          	clr	c_lreg+2
3179  0848 3f01          	clr	c_lreg+1
3180  084a 3f00          	clr	c_lreg
3181  084c 96            	ldw	x,sp
3182  084d 1c0001        	addw	x,#OFST-5
3183  0850 cd0000        	call	c_rtol
3186  0853 96            	ldw	x,sp
3187  0854 1c0009        	addw	x,#OFST+3
3188  0857 cd0000        	call	c_ltor
3190  085a a606          	ld	a,#6
3191  085c cd0000        	call	c_lursh
3193  085f 96            	ldw	x,sp
3194  0860 1c0001        	addw	x,#OFST-5
3195  0863 cd0000        	call	c_lor
3197  0866 b603          	ld	a,c_lreg+3
3198  0868 c7542a        	ld	21546,a
3199                     ; 643       CAN->Page.TxMailbox.MIDR2 = (uint8_t)(CAN_Id<<2);
3201  086b 7b0c          	ld	a,(OFST+6,sp)
3202  086d 48            	sll	a
3203  086e 48            	sll	a
3204  086f c7542b        	ld	21547,a
3205  0872               L7711:
3206                     ; 647     CAN->Page.TxMailbox.MDLCR &= (uint8_t)0xF0;
3208  0872 c65429        	ld	a,21545
3209  0875 a4f0          	and	a,#240
3210  0877 c75429        	ld	21545,a
3211                     ; 649     CAN->Page.TxMailbox.MDLCR |= CAN_DLC;
3213  087a c65429        	ld	a,21545
3214  087d 1a0f          	or	a,(OFST+9,sp)
3215  087f c75429        	ld	21545,a
3216                     ; 651     CAN->Page.TxMailbox.MDAR1 = CAN_Data[0];
3218  0882 1e10          	ldw	x,(OFST+10,sp)
3219  0884 f6            	ld	a,(x)
3220  0885 c7542e        	ld	21550,a
3221                     ; 652     CAN->Page.TxMailbox.MDAR2 = CAN_Data[1];
3223  0888 1e10          	ldw	x,(OFST+10,sp)
3224  088a e601          	ld	a,(1,x)
3225  088c c7542f        	ld	21551,a
3226                     ; 653     CAN->Page.TxMailbox.MDAR3 = CAN_Data[2];
3228  088f 1e10          	ldw	x,(OFST+10,sp)
3229  0891 e602          	ld	a,(2,x)
3230  0893 c75430        	ld	21552,a
3231                     ; 654     CAN->Page.TxMailbox.MDAR4 = CAN_Data[3];
3233  0896 1e10          	ldw	x,(OFST+10,sp)
3234  0898 e603          	ld	a,(3,x)
3235  089a c75431        	ld	21553,a
3236                     ; 655     CAN->Page.TxMailbox.MDAR5 = CAN_Data[4];
3238  089d 1e10          	ldw	x,(OFST+10,sp)
3239  089f e604          	ld	a,(4,x)
3240  08a1 c75432        	ld	21554,a
3241                     ; 656     CAN->Page.TxMailbox.MDAR6 = CAN_Data[5];
3243  08a4 1e10          	ldw	x,(OFST+10,sp)
3244  08a6 e605          	ld	a,(5,x)
3245  08a8 c75433        	ld	21555,a
3246                     ; 657     CAN->Page.TxMailbox.MDAR7 = CAN_Data[6];
3248  08ab 1e10          	ldw	x,(OFST+10,sp)
3249  08ad e606          	ld	a,(6,x)
3250  08af c75434        	ld	21556,a
3251                     ; 658     CAN->Page.TxMailbox.MDAR8 = CAN_Data[7];
3253  08b2 1e10          	ldw	x,(OFST+10,sp)
3254  08b4 e607          	ld	a,(7,x)
3255  08b6 c75435        	ld	21557,a
3256                     ; 660     CAN->Page.TxMailbox.MCSR |= CAN_MCSR_TXRQ;
3258  08b9 72105428      	bset	21544,#0
3259  08bd               L3711:
3260                     ; 663   CAN_SelectPage(can_page);
3262  08bd 7b05          	ld	a,(OFST-1,sp)
3263  08bf cd106b        	call	_CAN_SelectPage
3265                     ; 664   return (CAN_TxStatus_TypeDef)CAN_TxStatus;
3267  08c2 7b06          	ld	a,(OFST+0,sp)
3270  08c4 5b06          	addw	sp,#6
3271  08c6 81            	ret
3358                     ; 672 CAN_TxStatus_TypeDef CAN_TransmitStatus(CAN_TransmitMailBox_TypeDef CAN_TransmitMailbox)
3358                     ; 673 {
3359                     	switch	.text
3360  08c7               _CAN_TransmitStatus:
3362  08c7 88            	push	a
3363  08c8 88            	push	a
3364       00000001      OFST:	set	1
3367                     ; 675   CAN_TxStatus_TypeDef tstate = CAN_TxStatus_Failed;
3369                     ; 676   uint8_t tmpstate=0;
3371  08c9 0f01          	clr	(OFST+0,sp)
3373                     ; 679   assert_param(IS_CAN_TRANSMITMAILBOX_OK(CAN_TransmitMailbox));
3375  08cb 4d            	tnz	a
3376  08cc 2708          	jreq	L042
3377  08ce a101          	cp	a,#1
3378  08d0 2704          	jreq	L042
3379  08d2 a105          	cp	a,#5
3380  08d4 2603          	jrne	L632
3381  08d6               L042:
3382  08d6 4f            	clr	a
3383  08d7 2010          	jra	L242
3384  08d9               L632:
3385  08d9 ae02a7        	ldw	x,#679
3386  08dc 89            	pushw	x
3387  08dd ae0000        	ldw	x,#0
3388  08e0 89            	pushw	x
3389  08e1 ae0008        	ldw	x,#L103
3390  08e4 cd0000        	call	_assert_failed
3392  08e7 5b04          	addw	sp,#4
3393  08e9               L242:
3394                     ; 681   switch (CAN_TransmitMailbox)
3396  08e9 7b02          	ld	a,(OFST+1,sp)
3398                     ; 694     break;
3399  08eb 4d            	tnz	a
3400  08ec 2709          	jreq	L1021
3401  08ee 4a            	dec	a
3402  08ef 2718          	jreq	L3021
3403  08f1 a004          	sub	a,#4
3404  08f3 2728          	jreq	L5021
3405  08f5               L7021:
3406                     ; 692   default:
3406                     ; 693     tstate = CAN_TxStatus_Failed;
3408                     ; 694     break;
3410  08f5 203a          	jra	L5621
3411  08f7               L1021:
3412                     ; 683   case (CAN_TransmitMailBox_0): tmpstate = (uint8_t)((CAN->TSR & (uint8_t)(CAN_TSR_RQCP0|CAN_TSR_TXOK0)));
3414  08f7 c65422        	ld	a,21538
3415  08fa a411          	and	a,#17
3416  08fc 6b01          	ld	(OFST+0,sp),a
3418                     ; 684   tmpstate |= (uint8_t)((CAN->TPR & CAN_TPR_TME0));
3420  08fe c65423        	ld	a,21539
3421  0901 a404          	and	a,#4
3422  0903 1a01          	or	a,(OFST+0,sp)
3423  0905 6b01          	ld	(OFST+0,sp),a
3425                     ; 685   break;
3427  0907 2028          	jra	L5621
3428  0909               L3021:
3429                     ; 686   case (CAN_TransmitMailBox_1): tmpstate = (uint8_t)((uint8_t)(CAN->TSR & (uint8_t)(CAN_TSR_RQCP1|CAN_TSR_TXOK1))>>1);
3431  0909 c65422        	ld	a,21538
3432  090c a422          	and	a,#34
3433  090e 44            	srl	a
3434  090f 6b01          	ld	(OFST+0,sp),a
3436                     ; 687   tmpstate |= (uint8_t)((uint8_t)(CAN->TPR & CAN_TPR_TME1) >> 1);
3438  0911 c65423        	ld	a,21539
3439  0914 a408          	and	a,#8
3440  0916 44            	srl	a
3441  0917 1a01          	or	a,(OFST+0,sp)
3442  0919 6b01          	ld	(OFST+0,sp),a
3444                     ; 688   break;
3446  091b 2014          	jra	L5621
3447  091d               L5021:
3448                     ; 689   case (CAN_TransmitMailBox_2): tmpstate = (uint8_t)((uint8_t)(CAN->TSR & (uint8_t)(CAN_TSR_RQCP2|CAN_TSR_TXOK2))>>2);
3450  091d c65422        	ld	a,21538
3451  0920 a444          	and	a,#68
3452  0922 44            	srl	a
3453  0923 44            	srl	a
3454  0924 6b01          	ld	(OFST+0,sp),a
3456                     ; 690   tmpstate |= (uint8_t)((uint8_t)(CAN->TPR & CAN_TPR_TME2) >> 2);
3458  0926 c65423        	ld	a,21539
3459  0929 a410          	and	a,#16
3460  092b 44            	srl	a
3461  092c 44            	srl	a
3462  092d 1a01          	or	a,(OFST+0,sp)
3463  092f 6b01          	ld	(OFST+0,sp),a
3465                     ; 691   break;
3467  0931               L5621:
3468                     ; 697   switch (tmpstate)
3470  0931 7b01          	ld	a,(OFST+0,sp)
3472                     ; 713     break;
3473  0933 4d            	tnz	a
3474  0934 2711          	jreq	L1121
3475  0936 a004          	sub	a,#4
3476  0938 271f          	jreq	L7121
3477  093a 4a            	dec	a
3478  093b 2710          	jreq	L3121
3479  093d a010          	sub	a,#16
3480  093f 2712          	jreq	L5121
3481  0941               L1221:
3482                     ; 711   default:
3482                     ; 712     tstate = CAN_TxStatus_Failed;
3484  0941 a6f0          	ld	a,#240
3485  0943 6b01          	ld	(OFST+0,sp),a
3487                     ; 713     break;
3489  0945 2016          	jra	L1721
3490  0947               L1121:
3491                     ; 700   case (0x00): tstate = CAN_TxStatus_Pending;
3493  0947 a6f2          	ld	a,#242
3494  0949 6b01          	ld	(OFST+0,sp),a
3496                     ; 701   break;
3498  094b 2010          	jra	L1721
3499  094d               L3121:
3500                     ; 703   case (0x05): tstate = CAN_TxStatus_Failed;
3502  094d a6f0          	ld	a,#240
3503  094f 6b01          	ld	(OFST+0,sp),a
3505                     ; 704   break;
3507  0951 200a          	jra	L1721
3508  0953               L5121:
3509                     ; 706   case (0x15): tstate = CAN_TxStatus_Ok;
3511  0953 a6f1          	ld	a,#241
3512  0955 6b01          	ld	(OFST+0,sp),a
3514                     ; 707   break;
3516  0957 2004          	jra	L1721
3517  0959               L7121:
3518                     ; 709   case (0x04): tstate = CAN_TxStatus_MailBoxEmpty;
3520  0959 a6f5          	ld	a,#245
3521  095b 6b01          	ld	(OFST+0,sp),a
3523                     ; 710   break;
3525  095d               L1721:
3526                     ; 716   return (CAN_TxStatus_TypeDef)tstate;
3528  095d 7b01          	ld	a,(OFST+0,sp)
3531  095f 85            	popw	x
3532  0960 81            	ret
3581                     ; 724 void CAN_CancelTransmit(CAN_TransmitMailBox_TypeDef CAN_TransmitMailbox)
3581                     ; 725 {
3582                     	switch	.text
3583  0961               _CAN_CancelTransmit:
3585  0961 88            	push	a
3586  0962 88            	push	a
3587       00000001      OFST:	set	1
3590                     ; 726   CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
3592  0963 cd1067        	call	_CAN_GetSelectedPage
3594  0966 6b01          	ld	(OFST+0,sp),a
3596                     ; 728   assert_param(IS_CAN_TRANSMITMAILBOX_OK(CAN_TransmitMailbox));
3598  0968 0d02          	tnz	(OFST+1,sp)
3599  096a 270c          	jreq	L052
3600  096c 7b02          	ld	a,(OFST+1,sp)
3601  096e a101          	cp	a,#1
3602  0970 2706          	jreq	L052
3603  0972 7b02          	ld	a,(OFST+1,sp)
3604  0974 a105          	cp	a,#5
3605  0976 2603          	jrne	L642
3606  0978               L052:
3607  0978 4f            	clr	a
3608  0979 2010          	jra	L252
3609  097b               L642:
3610  097b ae02d8        	ldw	x,#728
3611  097e 89            	pushw	x
3612  097f ae0000        	ldw	x,#0
3613  0982 89            	pushw	x
3614  0983 ae0008        	ldw	x,#L103
3615  0986 cd0000        	call	_assert_failed
3617  0989 5b04          	addw	sp,#4
3618  098b               L252:
3619                     ; 730   CAN->PSR = (uint8_t)CAN_TransmitMailbox;
3621  098b 7b02          	ld	a,(OFST+1,sp)
3622  098d c75427        	ld	21543,a
3623                     ; 732   CAN->Page.TxMailbox.MCSR |= CAN_MCSR_ABRQ;
3625  0990 72125428      	bset	21544,#1
3626                     ; 734   CAN_SelectPage(can_page);
3628  0994 7b01          	ld	a,(OFST+0,sp)
3629  0996 cd106b        	call	_CAN_SelectPage
3631                     ; 735 }
3634  0999 85            	popw	x
3635  099a 81            	ret
3658                     ; 742 void CAN_FIFORelease(void)
3658                     ; 743 {
3659                     	switch	.text
3660  099b               _CAN_FIFORelease:
3664                     ; 745   CAN->RFR = CAN_RFR_RFOM; /*rc-w1*/
3666  099b 35205424      	mov	21540,#32
3667                     ; 746 }
3670  099f 81            	ret
3744                     ; 752 CAN_NbrPendingMessage_TypeDef CAN_MessagePending(void)
3744                     ; 753 {
3745                     	switch	.text
3746  09a0               _CAN_MessagePending:
3748  09a0 88            	push	a
3749       00000001      OFST:	set	1
3752                     ; 754   CAN_NbrPendingMessage_TypeDef msgpending = CAN_NbrPendingMessage_0;
3754                     ; 755   msgpending = (CAN_NbrPendingMessage_TypeDef)(CAN->RFR & CAN_RFR_FMP01);
3756  09a1 c65424        	ld	a,21540
3757  09a4 a403          	and	a,#3
3758  09a6 6b01          	ld	(OFST+0,sp),a
3760                     ; 756   return (CAN_NbrPendingMessage_TypeDef)msgpending;
3762  09a8 7b01          	ld	a,(OFST+0,sp)
3765  09aa 5b01          	addw	sp,#1
3766  09ac 81            	ret
3837                     ; 767 void CAN_Receive(void)
3837                     ; 768 {
3838                     	switch	.text
3839  09ad               _CAN_Receive:
3841  09ad 520d          	subw	sp,#13
3842       0000000d      OFST:	set	13
3845                     ; 769   CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
3847  09af cd1067        	call	_CAN_GetSelectedPage
3849  09b2 6b01          	ld	(OFST-12,sp),a
3851                     ; 770   uint32_t temp1 = 0, temp2 = 0, temp3 = 0;
3857                     ; 773   CAN->PSR = CAN_Page_RxFifo;
3859  09b4 35075427      	mov	21543,#7
3860                     ; 776   _IDE = (uint8_t)(CAN->Page.RxFIFO.MIDR1 & CAN_Id_Extended);
3862  09b8 c6542a        	ld	a,21546
3863  09bb a440          	and	a,#64
3864  09bd b704          	ld	__IDE,a
3865                     ; 777   if (_IDE != CAN_Id_Standard)
3867  09bf 3d04          	tnz	__IDE
3868  09c1 2602          	jrne	L262
3869  09c3 207b          	jp	L1141
3870  09c5               L262:
3871                     ; 779     temp1 = ((uint32_t)((uint32_t)CAN->Page.RxFIFO.MIDR3) << 8);
3873  09c5 c6542c        	ld	a,21548
3874  09c8 5f            	clrw	x
3875  09c9 97            	ld	xl,a
3876  09ca 90ae0100      	ldw	y,#256
3877  09ce cd0000        	call	c_umul
3879  09d1 96            	ldw	x,sp
3880  09d2 1c0006        	addw	x,#OFST-7
3881  09d5 cd0000        	call	c_rtol
3884                     ; 780     temp2 = ((uint32_t)((uint32_t)CAN->Page.RxFIFO.MIDR2) << 16);  
3886  09d8 c6542b        	ld	a,21547
3887  09db b703          	ld	c_lreg+3,a
3888  09dd 3f02          	clr	c_lreg+2
3889  09df 3f01          	clr	c_lreg+1
3890  09e1 3f00          	clr	c_lreg
3891  09e3 a610          	ld	a,#16
3892  09e5 cd0000        	call	c_llsh
3894  09e8 96            	ldw	x,sp
3895  09e9 1c000a        	addw	x,#OFST-3
3896  09ec cd0000        	call	c_rtol
3899                     ; 781     temp3 = ((uint32_t)((uint32_t)CAN->Page.RxFIFO.MIDR1 & 0x1F) << 24);
3901  09ef c6542a        	ld	a,21546
3902  09f2 b703          	ld	c_lreg+3,a
3903  09f4 3f02          	clr	c_lreg+2
3904  09f6 3f01          	clr	c_lreg+1
3905  09f8 3f00          	clr	c_lreg
3906  09fa b603          	ld	a,c_lreg+3
3907  09fc a41f          	and	a,#31
3908  09fe b703          	ld	c_lreg+3,a
3909  0a00 3f02          	clr	c_lreg+2
3910  0a02 3f01          	clr	c_lreg+1
3911  0a04 3f00          	clr	c_lreg
3912  0a06 a618          	ld	a,#24
3913  0a08 cd0000        	call	c_llsh
3915  0a0b 96            	ldw	x,sp
3916  0a0c 1c0002        	addw	x,#OFST-11
3917  0a0f cd0000        	call	c_rtol
3920                     ; 783     _Id = (uint32_t)CAN_EXTID_SIZE & ((CAN->Page.RxFIFO.MIDR4) | temp1 | temp2 | temp3 );
3922  0a12 c6542d        	ld	a,21549
3923  0a15 b703          	ld	c_lreg+3,a
3924  0a17 3f02          	clr	c_lreg+2
3925  0a19 3f01          	clr	c_lreg+1
3926  0a1b 3f00          	clr	c_lreg
3927  0a1d 96            	ldw	x,sp
3928  0a1e 1c0006        	addw	x,#OFST-7
3929  0a21 cd0000        	call	c_lor
3931  0a24 96            	ldw	x,sp
3932  0a25 1c000a        	addw	x,#OFST-3
3933  0a28 cd0000        	call	c_lor
3935  0a2b 96            	ldw	x,sp
3936  0a2c 1c0002        	addw	x,#OFST-11
3937  0a2f cd0000        	call	c_lor
3939  0a32 b600          	ld	a,c_lreg
3940  0a34 a41f          	and	a,#31
3941  0a36 b700          	ld	c_lreg,a
3942  0a38 ae0000        	ldw	x,#__Id
3943  0a3b cd0000        	call	c_rtol
3946  0a3e 204c          	jra	L3141
3947  0a40               L1141:
3948                     ; 787     temp1 = (uint16_t)((uint16_t)((uint16_t)((uint16_t)CAN->Page.RxFIFO.MIDR1 & 0x1F) << 6));
3950  0a40 c6542a        	ld	a,21546
3951  0a43 5f            	clrw	x
3952  0a44 a41f          	and	a,#31
3953  0a46 5f            	clrw	x
3954  0a47 02            	rlwa	x,a
3955  0a48 58            	sllw	x
3956  0a49 58            	sllw	x
3957  0a4a 58            	sllw	x
3958  0a4b 58            	sllw	x
3959  0a4c 58            	sllw	x
3960  0a4d 58            	sllw	x
3961  0a4e cd0000        	call	c_uitolx
3963  0a51 96            	ldw	x,sp
3964  0a52 1c0006        	addw	x,#OFST-7
3965  0a55 cd0000        	call	c_rtol
3968                     ; 788     temp2 = (uint16_t)((uint16_t)((uint16_t)CAN->Page.RxFIFO.MIDR2 >> 2)&0x3F);
3970  0a58 c6542b        	ld	a,21547
3971  0a5b 5f            	clrw	x
3972  0a5c 97            	ld	xl,a
3973  0a5d 54            	srlw	x
3974  0a5e 54            	srlw	x
3975  0a5f 9f            	ld	a,xl
3976  0a60 5f            	clrw	x
3977  0a61 a43f          	and	a,#63
3978  0a63 5f            	clrw	x
3979  0a64 cd0000        	call	c_uitol
3981  0a67 96            	ldw	x,sp
3982  0a68 1c000a        	addw	x,#OFST-3
3983  0a6b cd0000        	call	c_rtol
3986                     ; 790     _Id = (uint16_t)CAN_STDID_SIZE & (temp1 | temp2 );
3988  0a6e 96            	ldw	x,sp
3989  0a6f 1c0006        	addw	x,#OFST-7
3990  0a72 cd0000        	call	c_ltor
3992  0a75 96            	ldw	x,sp
3993  0a76 1c000a        	addw	x,#OFST-3
3994  0a79 cd0000        	call	c_lor
3996  0a7c b602          	ld	a,c_lreg+2
3997  0a7e a407          	and	a,#7
3998  0a80 b702          	ld	c_lreg+2,a
3999  0a82 3f01          	clr	c_lreg+1
4000  0a84 3f00          	clr	c_lreg
4001  0a86 ae0000        	ldw	x,#__Id
4002  0a89 cd0000        	call	c_rtol
4004  0a8c               L3141:
4005                     ; 793   _RTR = (uint8_t)((uint8_t)0x20 & CAN->Page.RxFIFO.MIDR1);
4007  0a8c c6542a        	ld	a,21546
4008  0a8f a420          	and	a,#32
4009  0a91 b705          	ld	__RTR,a
4010                     ; 796   _DLC = (uint8_t)(CAN->Page.RxFIFO.MDLCR & (uint8_t)0x0F);
4012  0a93 c65429        	ld	a,21545
4013  0a96 a40f          	and	a,#15
4014  0a98 b706          	ld	__DLC,a
4015                     ; 799   _FMI = CAN->Page.RxFIFO.MFMI;
4017  0a9a 555428000f    	mov	__FMI,21544
4018                     ; 802   _Data[0] = CAN->Page.RxFIFO.MDAR1;
4020  0a9f 55542e0007    	mov	__Data,21550
4021                     ; 803   _Data[1] = CAN->Page.RxFIFO.MDAR2;
4023  0aa4 55542f0008    	mov	__Data+1,21551
4024                     ; 804   _Data[2] = CAN->Page.RxFIFO.MDAR3;
4026  0aa9 5554300009    	mov	__Data+2,21552
4027                     ; 805   _Data[3] = CAN->Page.RxFIFO.MDAR4;
4029  0aae 555431000a    	mov	__Data+3,21553
4030                     ; 806   _Data[4] = CAN->Page.RxFIFO.MDAR5;
4032  0ab3 555432000b    	mov	__Data+4,21554
4033                     ; 807   _Data[5] = CAN->Page.RxFIFO.MDAR6;
4035  0ab8 555433000c    	mov	__Data+5,21555
4036                     ; 808   _Data[6] = CAN->Page.RxFIFO.MDAR7;
4038  0abd 555434000d    	mov	__Data+6,21556
4039                     ; 809   _Data[7] = CAN->Page.RxFIFO.MDAR8;
4041  0ac2 555435000e    	mov	__Data+7,21557
4042                     ; 812   CAN_FIFORelease();
4044  0ac7 cd099b        	call	_CAN_FIFORelease
4046                     ; 814   CAN_SelectPage(can_page);
4048  0aca 7b01          	ld	a,(OFST-12,sp)
4049  0acc cd106b        	call	_CAN_SelectPage
4051                     ; 815 }
4054  0acf 5b0d          	addw	sp,#13
4055  0ad1 81            	ret
4079                     ; 825 uint32_t CAN_GetReceivedId(void)
4079                     ; 826 {
4080                     	switch	.text
4081  0ad2               _CAN_GetReceivedId:
4085                     ; 827   return (_Id);
4087  0ad2 ae0000        	ldw	x,#__Id
4088  0ad5 cd0000        	call	c_ltor
4092  0ad8 81            	ret
4117                     ; 838 CAN_Id_TypeDef CAN_GetReceivedIDE(void)
4117                     ; 839 {
4118                     	switch	.text
4119  0ad9               _CAN_GetReceivedIDE:
4123                     ; 840   return (CAN_Id_TypeDef)(_IDE);
4125  0ad9 b604          	ld	a,__IDE
4128  0adb 81            	ret
4153                     ; 851 CAN_RTR_TypeDef CAN_GetReceivedRTR(void)
4153                     ; 852 {
4154                     	switch	.text
4155  0adc               _CAN_GetReceivedRTR:
4159                     ; 853   return (CAN_RTR_TypeDef)(_RTR);
4161  0adc b605          	ld	a,__RTR
4164  0ade 81            	ret
4188                     ; 864 uint8_t CAN_GetReceivedDLC(void)
4188                     ; 865 {
4189                     	switch	.text
4190  0adf               _CAN_GetReceivedDLC:
4194                     ; 866   return (_DLC);
4196  0adf b606          	ld	a,__DLC
4199  0ae1 81            	ret
4236                     ; 878 uint8_t CAN_GetReceivedData(uint8_t CAN_DataIndex)
4236                     ; 879 {
4237                     	switch	.text
4238  0ae2               _CAN_GetReceivedData:
4240  0ae2 88            	push	a
4241       00000000      OFST:	set	0
4244                     ; 880   assert_param(IS_CAN_DLC_OK(CAN_DataIndex));
4246  0ae3 a109          	cp	a,#9
4247  0ae5 2403          	jruge	L672
4248  0ae7 4f            	clr	a
4249  0ae8 2010          	jra	L003
4250  0aea               L672:
4251  0aea ae0370        	ldw	x,#880
4252  0aed 89            	pushw	x
4253  0aee ae0000        	ldw	x,#0
4254  0af1 89            	pushw	x
4255  0af2 ae0008        	ldw	x,#L103
4256  0af5 cd0000        	call	_assert_failed
4258  0af8 5b04          	addw	sp,#4
4259  0afa               L003:
4260                     ; 881   return (_Data[CAN_DataIndex]);
4262  0afa 7b01          	ld	a,(OFST+1,sp)
4263  0afc 5f            	clrw	x
4264  0afd 97            	ld	xl,a
4265  0afe e607          	ld	a,(__Data,x)
4268  0b00 5b01          	addw	sp,#1
4269  0b02 81            	ret
4293                     ; 892 uint8_t CAN_GetReceivedFMI(void)
4293                     ; 893 {
4294                     	switch	.text
4295  0b03               _CAN_GetReceivedFMI:
4299                     ; 894   return (_FMI);
4301  0b03 b60f          	ld	a,__FMI
4304  0b05 81            	ret
4351                     ; 902 uint16_t CAN_GetMessageTimeStamp(void)
4351                     ; 903 {
4352                     	switch	.text
4353  0b06               _CAN_GetMessageTimeStamp:
4355  0b06 5203          	subw	sp,#3
4356       00000003      OFST:	set	3
4359                     ; 904   uint16_t timestamp = 0;
4361                     ; 905   CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
4363  0b08 cd1067        	call	_CAN_GetSelectedPage
4365  0b0b 6b01          	ld	(OFST-2,sp),a
4367                     ; 908   CAN->PSR = CAN_Page_RxFifo;
4369  0b0d 35075427      	mov	21543,#7
4370                     ; 910   timestamp = CAN->Page.RxFIFO.MTSRL;
4372  0b11 c65436        	ld	a,21558
4373  0b14 5f            	clrw	x
4374  0b15 97            	ld	xl,a
4375  0b16 1f02          	ldw	(OFST-1,sp),x
4377                     ; 911   timestamp |= (uint16_t)(((uint16_t)CAN->Page.RxFIFO.MTSRH)<<8);
4379  0b18 c65437        	ld	a,21559
4380  0b1b 5f            	clrw	x
4381  0b1c 97            	ld	xl,a
4382  0b1d 4f            	clr	a
4383  0b1e 02            	rlwa	x,a
4384  0b1f 01            	rrwa	x,a
4385  0b20 1a03          	or	a,(OFST+0,sp)
4386  0b22 01            	rrwa	x,a
4387  0b23 1a02          	or	a,(OFST-1,sp)
4388  0b25 01            	rrwa	x,a
4389  0b26 1f02          	ldw	(OFST-1,sp),x
4391                     ; 914   CAN_SelectPage(can_page);
4393  0b28 7b01          	ld	a,(OFST-2,sp)
4394  0b2a cd106b        	call	_CAN_SelectPage
4396                     ; 916   return (uint16_t)(timestamp);
4398  0b2d 1e02          	ldw	x,(OFST-1,sp)
4401  0b2f 5b03          	addw	sp,#3
4402  0b31 81            	ret
4458                     ; 924 CAN_Sleep_TypeDef CAN_Sleep(void)
4458                     ; 925 {
4459                     	switch	.text
4460  0b32               _CAN_Sleep:
4462  0b32 88            	push	a
4463       00000001      OFST:	set	1
4466                     ; 926   CAN_Sleep_TypeDef sleepstatus = CAN_Sleep_Failed;
4468  0b33 0f01          	clr	(OFST+0,sp)
4470                     ; 929   CAN->MCR = (uint8_t)((uint8_t)(CAN->MCR & (uint8_t)(~CAN_MCR_INRQ)) | CAN_MCR_SLEEP);
4472  0b35 c65420        	ld	a,21536
4473  0b38 a4fe          	and	a,#254
4474  0b3a aa02          	or	a,#2
4475  0b3c c75420        	ld	21536,a
4476                     ; 932   if ((CAN->MSR & (CAN_MSR_SLAK|CAN_MSR_INAK)) == CAN_MSR_SLAK)
4478  0b3f c65421        	ld	a,21537
4479  0b42 a403          	and	a,#3
4480  0b44 a102          	cp	a,#2
4481  0b46 2604          	jrne	L3551
4482                     ; 935     sleepstatus =  CAN_Sleep_Ok;
4484  0b48 a601          	ld	a,#1
4485  0b4a 6b01          	ld	(OFST+0,sp),a
4487  0b4c               L3551:
4488                     ; 939   return (CAN_Sleep_TypeDef) sleepstatus;
4490  0b4c 7b01          	ld	a,(OFST+0,sp)
4493  0b4e 5b01          	addw	sp,#1
4494  0b50 81            	ret
4550                     ; 947 CAN_WakeUp_TypeDef CAN_WakeUp(void)
4550                     ; 948 {
4551                     	switch	.text
4552  0b51               _CAN_WakeUp:
4554  0b51 88            	push	a
4555       00000001      OFST:	set	1
4558                     ; 949   CAN_WakeUp_TypeDef wakeupstatus = CAN_WakeUp_Failed;
4560  0b52 0f01          	clr	(OFST+0,sp)
4562                     ; 952   CAN->MCR &= (uint8_t)(~CAN_MCR_SLEEP);
4564  0b54 72135420      	bres	21536,#1
4565                     ; 955   if ((CAN->MSR & CAN_MSR_SLAK) != CAN_MSR_SLAK)
4567  0b58 c65421        	ld	a,21537
4568  0b5b a402          	and	a,#2
4569  0b5d a102          	cp	a,#2
4570  0b5f 2704          	jreq	L3061
4571                     ; 958     wakeupstatus = CAN_WakeUp_Ok;
4573  0b61 a601          	ld	a,#1
4574  0b63 6b01          	ld	(OFST+0,sp),a
4576  0b65               L3061:
4577                     ; 962   return (CAN_WakeUp_TypeDef)wakeupstatus;
4579  0b65 7b01          	ld	a,(OFST+0,sp)
4582  0b67 5b01          	addw	sp,#1
4583  0b69 81            	ret
4691                     ; 974 CAN_ModeStatus_TypeDef CAN_OperatingModeRequest(CAN_OperatingMode_TypeDef CAN_OperatingMode)
4691                     ; 975 {
4692                     	switch	.text
4693  0b6a               _CAN_OperatingModeRequest:
4695  0b6a 88            	push	a
4696  0b6b 5203          	subw	sp,#3
4697       00000003      OFST:	set	3
4700                     ; 976   uint16_t timeout = CAN_ACKNOWLEDGE_TIMEOUT;
4702  0b6d aeffff        	ldw	x,#65535
4703  0b70 1f02          	ldw	(OFST-1,sp),x
4705                     ; 977   uint8_t modestatus = 0;
4707                     ; 979   assert_param(IS_CAN_OPERATINGMODE_OK(CAN_OperatingMode));
4709  0b72 4d            	tnz	a
4710  0b73 2708          	jreq	L613
4711  0b75 a101          	cp	a,#1
4712  0b77 2704          	jreq	L613
4713  0b79 a102          	cp	a,#2
4714  0b7b 2603          	jrne	L413
4715  0b7d               L613:
4716  0b7d 4f            	clr	a
4717  0b7e 2010          	jra	L023
4718  0b80               L413:
4719  0b80 ae03d3        	ldw	x,#979
4720  0b83 89            	pushw	x
4721  0b84 ae0000        	ldw	x,#0
4722  0b87 89            	pushw	x
4723  0b88 ae0008        	ldw	x,#L103
4724  0b8b cd0000        	call	_assert_failed
4726  0b8e 5b04          	addw	sp,#4
4727  0b90               L023:
4728                     ; 981   if (CAN_OperatingMode == CAN_OperatingMode_Initialization)
4730  0b90 0d04          	tnz	(OFST+1,sp)
4731  0b92 2633          	jrne	L5561
4732                     ; 984     CAN->MCR = (uint8_t)((uint8_t)(CAN->MCR & (uint8_t)(~CAN_MCR_SLEEP)) | CAN_MCR_INRQ);
4734  0b94 c65420        	ld	a,21536
4735  0b97 a4fd          	and	a,#253
4736  0b99 aa01          	or	a,#1
4737  0b9b c75420        	ld	21536,a
4739  0b9e 2007          	jra	L3661
4740  0ba0               L7561:
4741                     ; 989       timeout--;
4743  0ba0 1e02          	ldw	x,(OFST-1,sp)
4744  0ba2 1d0001        	subw	x,#1
4745  0ba5 1f02          	ldw	(OFST-1,sp),x
4747  0ba7               L3661:
4748                     ; 987     while (((CAN->MSR & CAN_MODE_MASK) != CAN_MSR_INAK) && (timeout != 0))
4750  0ba7 c65421        	ld	a,21537
4751  0baa a403          	and	a,#3
4752  0bac a101          	cp	a,#1
4753  0bae 2704          	jreq	L7661
4755  0bb0 1e02          	ldw	x,(OFST-1,sp)
4756  0bb2 26ec          	jrne	L7561
4757  0bb4               L7661:
4758                     ; 991     if ((CAN->MSR & CAN_MODE_MASK) != CAN_MSR_INAK)
4760  0bb4 c65421        	ld	a,21537
4761  0bb7 a403          	and	a,#3
4762  0bb9 a101          	cp	a,#1
4763  0bbb 2704          	jreq	L1761
4764                     ; 993       modestatus = CAN_ModeStatus_Failed;
4766  0bbd 0f01          	clr	(OFST-2,sp)
4769  0bbf 2074          	jra	L5761
4770  0bc1               L1761:
4771                     ; 997       modestatus = CAN_ModeStatus_Success;  
4773  0bc1 a601          	ld	a,#1
4774  0bc3 6b01          	ld	(OFST-2,sp),a
4776  0bc5 206e          	jra	L5761
4777  0bc7               L5561:
4778                     ; 1001   else  if (CAN_OperatingMode == CAN_OperatingMode_Normal)
4780  0bc7 7b04          	ld	a,(OFST+1,sp)
4781  0bc9 a101          	cp	a,#1
4782  0bcb 262d          	jrne	L7761
4783                     ; 1004     CAN->MCR &= (uint8_t)(~(CAN_MCR_SLEEP|CAN_MCR_INRQ));
4785  0bcd c65420        	ld	a,21536
4786  0bd0 a4fc          	and	a,#252
4787  0bd2 c75420        	ld	21536,a
4789  0bd5 2007          	jra	L3071
4790  0bd7               L1071:
4791                     ; 1009       timeout--;
4793  0bd7 1e02          	ldw	x,(OFST-1,sp)
4794  0bd9 1d0001        	subw	x,#1
4795  0bdc 1f02          	ldw	(OFST-1,sp),x
4797  0bde               L3071:
4798                     ; 1007     while (((CAN->MSR & CAN_MODE_MASK) != 0) && (timeout!=0))
4800  0bde c65421        	ld	a,21537
4801  0be1 a503          	bcp	a,#3
4802  0be3 2704          	jreq	L7071
4804  0be5 1e02          	ldw	x,(OFST-1,sp)
4805  0be7 26ee          	jrne	L1071
4806  0be9               L7071:
4807                     ; 1011     if ((CAN->MSR & CAN_MODE_MASK) != 0)
4809  0be9 c65421        	ld	a,21537
4810  0bec a503          	bcp	a,#3
4811  0bee 2704          	jreq	L1171
4812                     ; 1013       modestatus = CAN_ModeStatus_Failed;
4814  0bf0 0f01          	clr	(OFST-2,sp)
4817  0bf2 2041          	jra	L5761
4818  0bf4               L1171:
4819                     ; 1017       modestatus = CAN_ModeStatus_Success;  
4821  0bf4 a601          	ld	a,#1
4822  0bf6 6b01          	ld	(OFST-2,sp),a
4824  0bf8 203b          	jra	L5761
4825  0bfa               L7761:
4826                     ; 1020   else  if (CAN_OperatingMode == CAN_OperatingMode_Sleep)
4828  0bfa 7b04          	ld	a,(OFST+1,sp)
4829  0bfc a102          	cp	a,#2
4830  0bfe 2633          	jrne	L7171
4831                     ; 1023     CAN->MCR = (uint8_t)((uint8_t)(CAN->MCR & (uint8_t)(~CAN_MCR_INRQ)) | CAN_MCR_SLEEP);
4833  0c00 c65420        	ld	a,21536
4834  0c03 a4fe          	and	a,#254
4835  0c05 aa02          	or	a,#2
4836  0c07 c75420        	ld	21536,a
4838  0c0a 2007          	jra	L5271
4839  0c0c               L1271:
4840                     ; 1028       timeout--;
4842  0c0c 1e02          	ldw	x,(OFST-1,sp)
4843  0c0e 1d0001        	subw	x,#1
4844  0c11 1f02          	ldw	(OFST-1,sp),x
4846  0c13               L5271:
4847                     ; 1026     while (((CAN->MSR & CAN_MODE_MASK) != CAN_MSR_SLAK) && (timeout!=0))
4849  0c13 c65421        	ld	a,21537
4850  0c16 a403          	and	a,#3
4851  0c18 a102          	cp	a,#2
4852  0c1a 2704          	jreq	L1371
4854  0c1c 1e02          	ldw	x,(OFST-1,sp)
4855  0c1e 26ec          	jrne	L1271
4856  0c20               L1371:
4857                     ; 1030     if ((CAN->MSR & CAN_MODE_MASK) != CAN_MSR_SLAK)
4859  0c20 c65421        	ld	a,21537
4860  0c23 a403          	and	a,#3
4861  0c25 a102          	cp	a,#2
4862  0c27 2704          	jreq	L3371
4863                     ; 1032       modestatus = CAN_ModeStatus_Failed;  
4865  0c29 0f01          	clr	(OFST-2,sp)
4868  0c2b 2008          	jra	L5761
4869  0c2d               L3371:
4870                     ; 1036       modestatus = CAN_ModeStatus_Success;  
4872  0c2d a601          	ld	a,#1
4873  0c2f 6b01          	ld	(OFST-2,sp),a
4875  0c31 2002          	jra	L5761
4876  0c33               L7171:
4877                     ; 1041     modestatus = CAN_ModeStatus_Failed;
4879  0c33 0f01          	clr	(OFST-2,sp)
4881  0c35               L5761:
4882                     ; 1043   return (CAN_ModeStatus_TypeDef)(modestatus);
4884  0c35 7b01          	ld	a,(OFST-2,sp)
4887  0c37 5b04          	addw	sp,#4
4888  0c39 81            	ret
5007                     ; 1051 CAN_ErrorCode_TypeDef CAN_GetLastErrorCode(void)
5007                     ; 1052 {
5008                     	switch	.text
5009  0c3a               _CAN_GetLastErrorCode:
5011  0c3a 89            	pushw	x
5012       00000002      OFST:	set	2
5015                     ; 1053   CAN_ErrorCode_TypeDef errcode = CAN_ErrorCode_NoErr;
5017                     ; 1054   CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
5019  0c3b cd1067        	call	_CAN_GetSelectedPage
5021  0c3e 6b01          	ld	(OFST-1,sp),a
5023                     ; 1056   CAN->PSR = CAN_Page_Config;
5025  0c40 35065427      	mov	21543,#6
5026                     ; 1057   errcode = (CAN_ErrorCode_TypeDef)((CAN->Page.Config.ESR) & (CAN_ESR_LEC));
5028  0c44 c65428        	ld	a,21544
5029  0c47 a470          	and	a,#112
5030  0c49 6b02          	ld	(OFST+0,sp),a
5032                     ; 1060   CAN_SelectPage(can_page);
5034  0c4b 7b01          	ld	a,(OFST-1,sp)
5035  0c4d cd106b        	call	_CAN_SelectPage
5037                     ; 1062   return (CAN_ErrorCode_TypeDef)(errcode);
5039  0c50 7b02          	ld	a,(OFST+0,sp)
5042  0c52 85            	popw	x
5043  0c53 81            	ret
5174                     ; 1077 void CAN_ClearFlag(CAN_FLAG_TypeDef CAN_Flag)
5174                     ; 1078 {
5175                     	switch	.text
5176  0c54               _CAN_ClearFlag:
5178  0c54 89            	pushw	x
5179  0c55 88            	push	a
5180       00000001      OFST:	set	1
5183                     ; 1079   CAN_Page_TypeDef can_page = (CAN_Page_TypeDef)0;
5185                     ; 1081   assert_param(IS_CAN_FLAG_CLEAR_OK(CAN_Flag));
5187  0c56 a33401        	cpw	x,#13313
5188  0c59 271e          	jreq	L033
5189  0c5b a33402        	cpw	x,#13314
5190  0c5e 2719          	jreq	L033
5191  0c60 a33404        	cpw	x,#13316
5192  0c63 2714          	jreq	L033
5193  0c65 a33208        	cpw	x,#12808
5194  0c68 270f          	jreq	L033
5195  0c6a a33210        	cpw	x,#12816
5196  0c6d 270a          	jreq	L033
5197  0c6f a33108        	cpw	x,#12552
5198  0c72 2705          	jreq	L033
5199  0c74 a33070        	cpw	x,#12400
5200  0c77 2603          	jrne	L623
5201  0c79               L033:
5202  0c79 4f            	clr	a
5203  0c7a 2010          	jra	L233
5204  0c7c               L623:
5205  0c7c ae0439        	ldw	x,#1081
5206  0c7f 89            	pushw	x
5207  0c80 ae0000        	ldw	x,#0
5208  0c83 89            	pushw	x
5209  0c84 ae0008        	ldw	x,#L103
5210  0c87 cd0000        	call	_assert_failed
5212  0c8a 5b04          	addw	sp,#4
5213  0c8c               L233:
5214                     ; 1082   if (((uint16_t)CAN_Flag & 0x0700)!= RESET)
5216  0c8c 7b02          	ld	a,(OFST+1,sp)
5217  0c8e a507          	bcp	a,#7
5218  0c90 2731          	jreq	L3602
5219                     ; 1084     if (((uint16_t)CAN_Flag & 0x020B)!= RESET)
5221  0c92 1e02          	ldw	x,(OFST+1,sp)
5222  0c94 01            	rrwa	x,a
5223  0c95 a40b          	and	a,#11
5224  0c97 01            	rrwa	x,a
5225  0c98 a402          	and	a,#2
5226  0c9a 01            	rrwa	x,a
5227  0c9b a30000        	cpw	x,#0
5228  0c9e 2707          	jreq	L5602
5229                     ; 1087       CAN->RFR = (uint8_t)(CAN_Flag);
5231  0ca0 7b03          	ld	a,(OFST+2,sp)
5232  0ca2 c75424        	ld	21540,a
5234  0ca5 202e          	jra	L5702
5235  0ca7               L5602:
5236                     ; 1089     else if (((uint16_t)CAN_Flag & 0x0403)!= RESET)
5238  0ca7 1e02          	ldw	x,(OFST+1,sp)
5239  0ca9 01            	rrwa	x,a
5240  0caa a403          	and	a,#3
5241  0cac 01            	rrwa	x,a
5242  0cad a404          	and	a,#4
5243  0caf 01            	rrwa	x,a
5244  0cb0 a30000        	cpw	x,#0
5245  0cb3 2707          	jreq	L1702
5246                     ; 1092       CAN->TSR = (uint8_t)(CAN_Flag);
5248  0cb5 7b03          	ld	a,(OFST+2,sp)
5249  0cb7 c75422        	ld	21538,a
5251  0cba 2019          	jra	L5702
5252  0cbc               L1702:
5253                     ; 1097       CAN->MSR = (uint8_t)(CAN_Flag);
5255  0cbc 7b03          	ld	a,(OFST+2,sp)
5256  0cbe c75421        	ld	21537,a
5257  0cc1 2012          	jra	L5702
5258  0cc3               L3602:
5259                     ; 1103     can_page = CAN_GetSelectedPage();
5261  0cc3 cd1067        	call	_CAN_GetSelectedPage
5263  0cc6 6b01          	ld	(OFST+0,sp),a
5265                     ; 1106     CAN->PSR = CAN_Page_Config;
5267  0cc8 35065427      	mov	21543,#6
5268                     ; 1107     CAN->Page.Config.ESR = (uint8_t)RESET;
5270  0ccc 725f5428      	clr	21544
5271                     ; 1110     CAN_SelectPage(can_page);
5273  0cd0 7b01          	ld	a,(OFST+0,sp)
5274  0cd2 cd106b        	call	_CAN_SelectPage
5276  0cd5               L5702:
5277                     ; 1112 }
5280  0cd5 5b03          	addw	sp,#3
5281  0cd7 81            	ret
5360                     ; 1119 FlagStatus CAN_GetFlagStatus(CAN_FLAG_TypeDef CAN_Flag)
5360                     ; 1120 {
5361                     	switch	.text
5362  0cd8               _CAN_GetFlagStatus:
5364  0cd8 89            	pushw	x
5365  0cd9 89            	pushw	x
5366       00000002      OFST:	set	2
5369                     ; 1121   FlagStatus bitstatus = RESET;
5371                     ; 1122   CAN_Page_TypeDef can_page = (CAN_Page_TypeDef)0;
5373                     ; 1125   assert_param(IS_CAN_FLAG_STATUS_OK(CAN_Flag));
5375  0cda a33401        	cpw	x,#13313
5376  0cdd 2732          	jreq	L043
5377  0cdf a33402        	cpw	x,#13314
5378  0ce2 272d          	jreq	L043
5379  0ce4 a33404        	cpw	x,#13316
5380  0ce7 2728          	jreq	L043
5381  0ce9 a31203        	cpw	x,#4611
5382  0cec 2723          	jreq	L043
5383  0cee a33208        	cpw	x,#12808
5384  0cf1 271e          	jreq	L043
5385  0cf3 a33210        	cpw	x,#12816
5386  0cf6 2719          	jreq	L043
5387  0cf8 a33108        	cpw	x,#12552
5388  0cfb 2714          	jreq	L043
5389  0cfd a31001        	cpw	x,#4097
5390  0d00 270f          	jreq	L043
5391  0d02 a31002        	cpw	x,#4098
5392  0d05 270a          	jreq	L043
5393  0d07 a31004        	cpw	x,#4100
5394  0d0a 2705          	jreq	L043
5395  0d0c a33070        	cpw	x,#12400
5396  0d0f 2603          	jrne	L633
5397  0d11               L043:
5398  0d11 4f            	clr	a
5399  0d12 2010          	jra	L243
5400  0d14               L633:
5401  0d14 ae0465        	ldw	x,#1125
5402  0d17 89            	pushw	x
5403  0d18 ae0000        	ldw	x,#0
5404  0d1b 89            	pushw	x
5405  0d1c ae0008        	ldw	x,#L103
5406  0d1f cd0000        	call	_assert_failed
5408  0d22 5b04          	addw	sp,#4
5409  0d24               L243:
5410                     ; 1127   if (((uint16_t)CAN_Flag & 0x0700)!= RESET)
5412  0d24 7b03          	ld	a,(OFST+1,sp)
5413  0d26 a507          	bcp	a,#7
5414  0d28 276d          	jreq	L5312
5415                     ; 1129     if (((uint16_t)CAN_Flag & 0x020B)!= RESET)
5417  0d2a 1e03          	ldw	x,(OFST+1,sp)
5418  0d2c 01            	rrwa	x,a
5419  0d2d a40b          	and	a,#11
5420  0d2f 01            	rrwa	x,a
5421  0d30 a402          	and	a,#2
5422  0d32 01            	rrwa	x,a
5423  0d33 a30000        	cpw	x,#0
5424  0d36 271b          	jreq	L7312
5425                     ; 1132       if ((CAN->RFR & (uint16_t)CAN_Flag )!= RESET)
5427  0d38 c65424        	ld	a,21540
5428  0d3b 5f            	clrw	x
5429  0d3c 97            	ld	xl,a
5430  0d3d 01            	rrwa	x,a
5431  0d3e 1404          	and	a,(OFST+2,sp)
5432  0d40 01            	rrwa	x,a
5433  0d41 1403          	and	a,(OFST+1,sp)
5434  0d43 01            	rrwa	x,a
5435  0d44 a30000        	cpw	x,#0
5436  0d47 2706          	jreq	L1412
5437                     ; 1135         bitstatus = SET;
5439  0d49 a601          	ld	a,#1
5440  0d4b 6b02          	ld	(OFST+0,sp),a
5443  0d4d 206f          	jra	L3612
5444  0d4f               L1412:
5445                     ; 1140         bitstatus = RESET;
5447  0d4f 0f02          	clr	(OFST+0,sp)
5449  0d51 206b          	jra	L3612
5450  0d53               L7312:
5451                     ; 1144     else if (((uint16_t)CAN_Flag & 0x0403)!= RESET)
5453  0d53 1e03          	ldw	x,(OFST+1,sp)
5454  0d55 01            	rrwa	x,a
5455  0d56 a403          	and	a,#3
5456  0d58 01            	rrwa	x,a
5457  0d59 a404          	and	a,#4
5458  0d5b 01            	rrwa	x,a
5459  0d5c a30000        	cpw	x,#0
5460  0d5f 271b          	jreq	L7412
5461                     ; 1147       if ((CAN->TSR & (uint16_t)CAN_Flag )!= RESET)
5463  0d61 c65422        	ld	a,21538
5464  0d64 5f            	clrw	x
5465  0d65 97            	ld	xl,a
5466  0d66 01            	rrwa	x,a
5467  0d67 1404          	and	a,(OFST+2,sp)
5468  0d69 01            	rrwa	x,a
5469  0d6a 1403          	and	a,(OFST+1,sp)
5470  0d6c 01            	rrwa	x,a
5471  0d6d a30000        	cpw	x,#0
5472  0d70 2706          	jreq	L1512
5473                     ; 1150         bitstatus = SET;
5475  0d72 a601          	ld	a,#1
5476  0d74 6b02          	ld	(OFST+0,sp),a
5479  0d76 2046          	jra	L3612
5480  0d78               L1512:
5481                     ; 1155         bitstatus = RESET;
5483  0d78 0f02          	clr	(OFST+0,sp)
5485  0d7a 2042          	jra	L3612
5486  0d7c               L7412:
5487                     ; 1161       if ((CAN->MSR & (uint16_t)CAN_Flag )!= RESET)
5489  0d7c c65421        	ld	a,21537
5490  0d7f 5f            	clrw	x
5491  0d80 97            	ld	xl,a
5492  0d81 01            	rrwa	x,a
5493  0d82 1404          	and	a,(OFST+2,sp)
5494  0d84 01            	rrwa	x,a
5495  0d85 1403          	and	a,(OFST+1,sp)
5496  0d87 01            	rrwa	x,a
5497  0d88 a30000        	cpw	x,#0
5498  0d8b 2706          	jreq	L7512
5499                     ; 1164         bitstatus = SET;
5501  0d8d a601          	ld	a,#1
5502  0d8f 6b02          	ld	(OFST+0,sp),a
5505  0d91 202b          	jra	L3612
5506  0d93               L7512:
5507                     ; 1169         bitstatus = RESET;
5509  0d93 0f02          	clr	(OFST+0,sp)
5511  0d95 2027          	jra	L3612
5512  0d97               L5312:
5513                     ; 1176     can_page = CAN_GetSelectedPage();
5515  0d97 cd1067        	call	_CAN_GetSelectedPage
5517  0d9a 6b01          	ld	(OFST-1,sp),a
5519                     ; 1178     CAN->PSR = CAN_Page_Config;
5521  0d9c 35065427      	mov	21543,#6
5522                     ; 1179     if ((CAN->Page.Config.ESR & (uint16_t)CAN_Flag) != RESET)
5524  0da0 c65428        	ld	a,21544
5525  0da3 5f            	clrw	x
5526  0da4 97            	ld	xl,a
5527  0da5 01            	rrwa	x,a
5528  0da6 1404          	and	a,(OFST+2,sp)
5529  0da8 01            	rrwa	x,a
5530  0da9 1403          	and	a,(OFST+1,sp)
5531  0dab 01            	rrwa	x,a
5532  0dac a30000        	cpw	x,#0
5533  0daf 2706          	jreq	L5612
5534                     ; 1182       bitstatus = SET;
5536  0db1 a601          	ld	a,#1
5537  0db3 6b02          	ld	(OFST+0,sp),a
5540  0db5 2002          	jra	L7612
5541  0db7               L5612:
5542                     ; 1187       bitstatus = RESET;
5544  0db7 0f02          	clr	(OFST+0,sp)
5546  0db9               L7612:
5547                     ; 1190     CAN_SelectPage(can_page);
5549  0db9 7b01          	ld	a,(OFST-1,sp)
5550  0dbb cd106b        	call	_CAN_SelectPage
5552  0dbe               L3612:
5553                     ; 1195   return  (FlagStatus)bitstatus;
5555  0dbe 7b02          	ld	a,(OFST+0,sp)
5558  0dc0 5b04          	addw	sp,#4
5559  0dc2 81            	ret
5619                     ; 1203 ITStatus CAN_GetITStatus(CAN_IT_TypeDef CAN_IT)
5619                     ; 1204 {
5620                     	switch	.text
5621  0dc3               _CAN_GetITStatus:
5623  0dc3 89            	pushw	x
5624  0dc4 89            	pushw	x
5625       00000002      OFST:	set	2
5628                     ; 1205   ITStatus pendingbitstatus = RESET;
5630                     ; 1206   CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
5632  0dc5 cd1067        	call	_CAN_GetSelectedPage
5634  0dc8 6b01          	ld	(OFST-1,sp),a
5636                     ; 1209   assert_param(IS_CAN_IT_STATUS_OK(CAN_IT));
5638  0dca 1e03          	ldw	x,(OFST+1,sp)
5639  0dcc a30001        	cpw	x,#1
5640  0dcf 273f          	jreq	L053
5641  0dd1 1e03          	ldw	x,(OFST+1,sp)
5642  0dd3 a30002        	cpw	x,#2
5643  0dd6 2738          	jreq	L053
5644  0dd8 1e03          	ldw	x,(OFST+1,sp)
5645  0dda a30004        	cpw	x,#4
5646  0ddd 2731          	jreq	L053
5647  0ddf 1e03          	ldw	x,(OFST+1,sp)
5648  0de1 a30008        	cpw	x,#8
5649  0de4 272a          	jreq	L053
5650  0de6 1e03          	ldw	x,(OFST+1,sp)
5651  0de8 a30080        	cpw	x,#128
5652  0deb 2723          	jreq	L053
5653  0ded 1e03          	ldw	x,(OFST+1,sp)
5654  0def a34000        	cpw	x,#16384
5655  0df2 271c          	jreq	L053
5656  0df4 1e03          	ldw	x,(OFST+1,sp)
5657  0df6 a30100        	cpw	x,#256
5658  0df9 2715          	jreq	L053
5659  0dfb 1e03          	ldw	x,(OFST+1,sp)
5660  0dfd a30200        	cpw	x,#512
5661  0e00 270e          	jreq	L053
5662  0e02 1e03          	ldw	x,(OFST+1,sp)
5663  0e04 a30400        	cpw	x,#1024
5664  0e07 2707          	jreq	L053
5665  0e09 1e03          	ldw	x,(OFST+1,sp)
5666  0e0b a30800        	cpw	x,#2048
5667  0e0e 2603          	jrne	L643
5668  0e10               L053:
5669  0e10 4f            	clr	a
5670  0e11 2010          	jra	L253
5671  0e13               L643:
5672  0e13 ae04b9        	ldw	x,#1209
5673  0e16 89            	pushw	x
5674  0e17 ae0000        	ldw	x,#0
5675  0e1a 89            	pushw	x
5676  0e1b ae0008        	ldw	x,#L103
5677  0e1e cd0000        	call	_assert_failed
5679  0e21 5b04          	addw	sp,#4
5680  0e23               L253:
5681                     ; 1212   switch (CAN_IT)
5683  0e23 1e03          	ldw	x,(OFST+1,sp)
5685                     ; 1325     break;
5686  0e25 5a            	decw	x
5687  0e26 2746          	jreq	L1712
5688  0e28 5a            	decw	x
5689  0e29 2760          	jreq	L3712
5690  0e2b 1d0002        	subw	x,#2
5691  0e2e 2778          	jreq	L5712
5692  0e30 1d0004        	subw	x,#4
5693  0e33 2603          	jrne	L453
5694  0e35 cc0ec5        	jp	L7712
5695  0e38               L453:
5696  0e38 1d0078        	subw	x,#120
5697  0e3b 2603          	jrne	L653
5698  0e3d cc0ee2        	jp	L1022
5699  0e40               L653:
5700  0e40 1d0080        	subw	x,#128
5701  0e43 2603          	jrne	L063
5702  0e45 cc0f1c        	jp	L5022
5703  0e48               L063:
5704  0e48 1d0100        	subw	x,#256
5705  0e4b 2603          	jrne	L263
5706  0e4d cc0f39        	jp	L7022
5707  0e50               L263:
5708  0e50 1d0200        	subw	x,#512
5709  0e53 2603          	jrne	L463
5710  0e55 cc0f56        	jp	L1122
5711  0e58               L463:
5712  0e58 1d0400        	subw	x,#1024
5713  0e5b 2603          	jrne	L663
5714  0e5d cc0f73        	jp	L3122
5715  0e60               L663:
5716  0e60 1d3800        	subw	x,#14336
5717  0e63 2603          	jrne	L073
5718  0e65 cc0eff        	jp	L3022
5719  0e68               L073:
5720  0e68               L5122:
5721                     ; 1323   default :
5721                     ; 1324     pendingbitstatus = RESET;
5723  0e68 0f02          	clr	(OFST+0,sp)
5725                     ; 1325     break;
5727  0e6a ac8e0f8e      	jpf	L7422
5728  0e6e               L1712:
5729                     ; 1214   case CAN_IT_TME:
5729                     ; 1215     if ((CAN->IER & CAN_IER_TMEIE) !=RESET)
5731  0e6e c65425        	ld	a,21541
5732  0e71 a501          	bcp	a,#1
5733  0e73 2710          	jreq	L1522
5734                     ; 1217       pendingbitstatus = CheckITStatus(CAN->TSR, CAN_TSR_RQCP012);
5736  0e75 c65422        	ld	a,21538
5737  0e78 ae0007        	ldw	x,#7
5738  0e7b 95            	ld	xh,a
5739  0e7c cd106f        	call	L3_CheckITStatus
5741  0e7f 6b02          	ld	(OFST+0,sp),a
5744  0e81 ac8e0f8e      	jpf	L7422
5745  0e85               L1522:
5746                     ; 1221       pendingbitstatus = RESET;
5748  0e85 0f02          	clr	(OFST+0,sp)
5750  0e87 ac8e0f8e      	jpf	L7422
5751  0e8b               L3712:
5752                     ; 1225   case CAN_IT_FMP:
5752                     ; 1226     if ((CAN->IER & CAN_IER_FMPIE) !=RESET)
5754  0e8b c65425        	ld	a,21541
5755  0e8e a502          	bcp	a,#2
5756  0e90 2710          	jreq	L5522
5757                     ; 1228       pendingbitstatus = CheckITStatus(CAN->RFR, CAN_RFR_FMP01);
5759  0e92 c65424        	ld	a,21540
5760  0e95 ae0003        	ldw	x,#3
5761  0e98 95            	ld	xh,a
5762  0e99 cd106f        	call	L3_CheckITStatus
5764  0e9c 6b02          	ld	(OFST+0,sp),a
5767  0e9e ac8e0f8e      	jpf	L7422
5768  0ea2               L5522:
5769                     ; 1232       pendingbitstatus = RESET;
5771  0ea2 0f02          	clr	(OFST+0,sp)
5773  0ea4 ac8e0f8e      	jpf	L7422
5774  0ea8               L5712:
5775                     ; 1235   case CAN_IT_FF:
5775                     ; 1236     if ((CAN->IER & CAN_IER_FFIE) !=RESET)
5777  0ea8 c65425        	ld	a,21541
5778  0eab a504          	bcp	a,#4
5779  0ead 2710          	jreq	L1622
5780                     ; 1238       pendingbitstatus = CheckITStatus(CAN->RFR, CAN_RFR_FULL);
5782  0eaf c65424        	ld	a,21540
5783  0eb2 ae0008        	ldw	x,#8
5784  0eb5 95            	ld	xh,a
5785  0eb6 cd106f        	call	L3_CheckITStatus
5787  0eb9 6b02          	ld	(OFST+0,sp),a
5790  0ebb ac8e0f8e      	jpf	L7422
5791  0ebf               L1622:
5792                     ; 1242       pendingbitstatus = RESET;
5794  0ebf 0f02          	clr	(OFST+0,sp)
5796  0ec1 ac8e0f8e      	jpf	L7422
5797  0ec5               L7712:
5798                     ; 1245   case CAN_IT_FOV:
5798                     ; 1246     if ((CAN->IER & CAN_IER_FOVIE) !=RESET)
5800  0ec5 c65425        	ld	a,21541
5801  0ec8 a508          	bcp	a,#8
5802  0eca 2710          	jreq	L5622
5803                     ; 1248       pendingbitstatus = CheckITStatus(CAN->RFR, CAN_RFR_FOVR);
5805  0ecc c65424        	ld	a,21540
5806  0ecf ae0010        	ldw	x,#16
5807  0ed2 95            	ld	xh,a
5808  0ed3 cd106f        	call	L3_CheckITStatus
5810  0ed6 6b02          	ld	(OFST+0,sp),a
5813  0ed8 ac8e0f8e      	jpf	L7422
5814  0edc               L5622:
5815                     ; 1252       pendingbitstatus = RESET;
5817  0edc 0f02          	clr	(OFST+0,sp)
5819  0ede ac8e0f8e      	jpf	L7422
5820  0ee2               L1022:
5821                     ; 1255   case CAN_IT_WKU:
5821                     ; 1256     if ((CAN->IER & CAN_IER_WKUIE) !=RESET)
5823  0ee2 c65425        	ld	a,21541
5824  0ee5 a580          	bcp	a,#128
5825  0ee7 2710          	jreq	L1722
5826                     ; 1258       pendingbitstatus = CheckITStatus(CAN->MSR, CAN_MSR_WKUI);
5828  0ee9 c65421        	ld	a,21537
5829  0eec ae0008        	ldw	x,#8
5830  0eef 95            	ld	xh,a
5831  0ef0 cd106f        	call	L3_CheckITStatus
5833  0ef3 6b02          	ld	(OFST+0,sp),a
5836  0ef5 ac8e0f8e      	jpf	L7422
5837  0ef9               L1722:
5838                     ; 1262       pendingbitstatus = RESET;
5840  0ef9 0f02          	clr	(OFST+0,sp)
5842  0efb ac8e0f8e      	jpf	L7422
5843  0eff               L3022:
5844                     ; 1266   case CAN_IT_ERR:
5844                     ; 1267     CAN->PSR = CAN_Page_Config;
5846  0eff 35065427      	mov	21543,#6
5847                     ; 1268     if ((CAN->Page.Config.EIER & CAN_EIER_ERRIE) !=RESET)
5849  0f03 c65429        	ld	a,21545
5850  0f06 a580          	bcp	a,#128
5851  0f08 270e          	jreq	L5722
5852                     ; 1270       pendingbitstatus = CheckITStatus(CAN->Page.Config.ESR, CAN_ESR_EWGF|CAN_ESR_EPVF|CAN_ESR_BOFF|CAN_ESR_LEC);
5854  0f0a c65428        	ld	a,21544
5855  0f0d ae0077        	ldw	x,#119
5856  0f10 95            	ld	xh,a
5857  0f11 cd106f        	call	L3_CheckITStatus
5859  0f14 6b02          	ld	(OFST+0,sp),a
5862  0f16 2076          	jra	L7422
5863  0f18               L5722:
5864                     ; 1274       pendingbitstatus = RESET;
5866  0f18 0f02          	clr	(OFST+0,sp)
5868  0f1a 2072          	jra	L7422
5869  0f1c               L5022:
5870                     ; 1278   case CAN_IT_EWG:
5870                     ; 1279     CAN->PSR = CAN_Page_Config;
5872  0f1c 35065427      	mov	21543,#6
5873                     ; 1280     if ((CAN->Page.Config.EIER & CAN_EIER_EWGIE) !=RESET)
5875  0f20 c65429        	ld	a,21545
5876  0f23 a501          	bcp	a,#1
5877  0f25 270e          	jreq	L1032
5878                     ; 1282       pendingbitstatus = CheckITStatus(CAN->Page.Config.ESR, CAN_ESR_EWGF);
5880  0f27 c65428        	ld	a,21544
5881  0f2a ae0001        	ldw	x,#1
5882  0f2d 95            	ld	xh,a
5883  0f2e cd106f        	call	L3_CheckITStatus
5885  0f31 6b02          	ld	(OFST+0,sp),a
5888  0f33 2059          	jra	L7422
5889  0f35               L1032:
5890                     ; 1286       pendingbitstatus = RESET;
5892  0f35 0f02          	clr	(OFST+0,sp)
5894  0f37 2055          	jra	L7422
5895  0f39               L7022:
5896                     ; 1290   case CAN_IT_EPV:
5896                     ; 1291     CAN->PSR = CAN_Page_Config;
5898  0f39 35065427      	mov	21543,#6
5899                     ; 1292     if ((CAN->Page.Config.EIER & CAN_EIER_EPVIE) !=RESET)
5901  0f3d c65429        	ld	a,21545
5902  0f40 a502          	bcp	a,#2
5903  0f42 270e          	jreq	L5032
5904                     ; 1294       pendingbitstatus = CheckITStatus(CAN->Page.Config.ESR, CAN_ESR_EPVF);
5906  0f44 c65428        	ld	a,21544
5907  0f47 ae0002        	ldw	x,#2
5908  0f4a 95            	ld	xh,a
5909  0f4b cd106f        	call	L3_CheckITStatus
5911  0f4e 6b02          	ld	(OFST+0,sp),a
5914  0f50 203c          	jra	L7422
5915  0f52               L5032:
5916                     ; 1298       pendingbitstatus = RESET;
5918  0f52 0f02          	clr	(OFST+0,sp)
5920  0f54 2038          	jra	L7422
5921  0f56               L1122:
5922                     ; 1301   case CAN_IT_BOF:
5922                     ; 1302     CAN->PSR = CAN_Page_Config;
5924  0f56 35065427      	mov	21543,#6
5925                     ; 1303     if ((CAN->Page.Config.EIER & CAN_EIER_BOFIE) !=RESET)
5927  0f5a c65429        	ld	a,21545
5928  0f5d a504          	bcp	a,#4
5929  0f5f 270e          	jreq	L1132
5930                     ; 1305       pendingbitstatus = CheckITStatus(CAN->Page.Config.ESR, CAN_ESR_BOFF);
5932  0f61 c65428        	ld	a,21544
5933  0f64 ae0004        	ldw	x,#4
5934  0f67 95            	ld	xh,a
5935  0f68 cd106f        	call	L3_CheckITStatus
5937  0f6b 6b02          	ld	(OFST+0,sp),a
5940  0f6d 201f          	jra	L7422
5941  0f6f               L1132:
5942                     ; 1309       pendingbitstatus = RESET;
5944  0f6f 0f02          	clr	(OFST+0,sp)
5946  0f71 201b          	jra	L7422
5947  0f73               L3122:
5948                     ; 1312   case CAN_IT_LEC:
5948                     ; 1313     CAN->PSR = CAN_Page_Config;
5950  0f73 35065427      	mov	21543,#6
5951                     ; 1314     if ((CAN->Page.Config.EIER & CAN_EIER_LECIE) !=RESET)
5953  0f77 c65429        	ld	a,21545
5954  0f7a a510          	bcp	a,#16
5955  0f7c 270e          	jreq	L5132
5956                     ; 1316       pendingbitstatus = CheckITStatus(CAN->Page.Config.ESR, CAN_ESR_LEC);
5958  0f7e c65428        	ld	a,21544
5959  0f81 ae0070        	ldw	x,#112
5960  0f84 95            	ld	xh,a
5961  0f85 cd106f        	call	L3_CheckITStatus
5963  0f88 6b02          	ld	(OFST+0,sp),a
5966  0f8a 2002          	jra	L7422
5967  0f8c               L5132:
5968                     ; 1320       pendingbitstatus = RESET;
5970  0f8c 0f02          	clr	(OFST+0,sp)
5972  0f8e               L7422:
5973                     ; 1328   CAN_SelectPage(can_page);
5975  0f8e 7b01          	ld	a,(OFST-1,sp)
5976  0f90 cd106b        	call	_CAN_SelectPage
5978                     ; 1330   return  (ITStatus)pendingbitstatus;
5980  0f93 7b02          	ld	a,(OFST+0,sp)
5983  0f95 5b04          	addw	sp,#4
5984  0f97 81            	ret
6033                     ; 1348 void CAN_ClearITPendingBit(CAN_IT_TypeDef CAN_IT)
6033                     ; 1349 {
6034                     	switch	.text
6035  0f98               _CAN_ClearITPendingBit:
6037  0f98 89            	pushw	x
6038  0f99 88            	push	a
6039       00000001      OFST:	set	1
6042                     ; 1350   CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
6044  0f9a cd1067        	call	_CAN_GetSelectedPage
6046  0f9d 6b01          	ld	(OFST+0,sp),a
6048                     ; 1352   assert_param(IS_CAN_IT_PENDING_BIT_OK(CAN_IT));
6050  0f9f 1e02          	ldw	x,(OFST+1,sp)
6051  0fa1 a30001        	cpw	x,#1
6052  0fa4 2738          	jreq	L673
6053  0fa6 1e02          	ldw	x,(OFST+1,sp)
6054  0fa8 a30004        	cpw	x,#4
6055  0fab 2731          	jreq	L673
6056  0fad 1e02          	ldw	x,(OFST+1,sp)
6057  0faf a30008        	cpw	x,#8
6058  0fb2 272a          	jreq	L673
6059  0fb4 1e02          	ldw	x,(OFST+1,sp)
6060  0fb6 a30080        	cpw	x,#128
6061  0fb9 2723          	jreq	L673
6062  0fbb 1e02          	ldw	x,(OFST+1,sp)
6063  0fbd a34000        	cpw	x,#16384
6064  0fc0 271c          	jreq	L673
6065  0fc2 1e02          	ldw	x,(OFST+1,sp)
6066  0fc4 a30100        	cpw	x,#256
6067  0fc7 2715          	jreq	L673
6068  0fc9 1e02          	ldw	x,(OFST+1,sp)
6069  0fcb a30200        	cpw	x,#512
6070  0fce 270e          	jreq	L673
6071  0fd0 1e02          	ldw	x,(OFST+1,sp)
6072  0fd2 a30400        	cpw	x,#1024
6073  0fd5 2707          	jreq	L673
6074  0fd7 1e02          	ldw	x,(OFST+1,sp)
6075  0fd9 a30800        	cpw	x,#2048
6076  0fdc 2603          	jrne	L473
6077  0fde               L673:
6078  0fde 4f            	clr	a
6079  0fdf 2010          	jra	L004
6080  0fe1               L473:
6081  0fe1 ae0548        	ldw	x,#1352
6082  0fe4 89            	pushw	x
6083  0fe5 ae0000        	ldw	x,#0
6084  0fe8 89            	pushw	x
6085  0fe9 ae0008        	ldw	x,#L103
6086  0fec cd0000        	call	_assert_failed
6088  0fef 5b04          	addw	sp,#4
6089  0ff1               L004:
6090                     ; 1354   switch (CAN_IT)
6092  0ff1 1e02          	ldw	x,(OFST+1,sp)
6094                     ; 1395   default :
6094                     ; 1396     break;
6095  0ff3 5a            	decw	x
6096  0ff4 272a          	jreq	L1232
6097  0ff6 1d0003        	subw	x,#3
6098  0ff9 272b          	jreq	L3232
6099  0ffb 1d0004        	subw	x,#4
6100  0ffe 272c          	jreq	L5232
6101  1000 1d0078        	subw	x,#120
6102  1003 272d          	jreq	L7232
6103  1005 1d0080        	subw	x,#128
6104  1008 273c          	jreq	L3332
6105  100a 1d0100        	subw	x,#256
6106  100d 273d          	jreq	L5332
6107  100f 1d0200        	subw	x,#512
6108  1012 273e          	jreq	L7332
6109  1014 1d0400        	subw	x,#1024
6110  1017 273f          	jreq	L1432
6111  1019 1d3800        	subw	x,#14336
6112  101c 271a          	jreq	L1332
6113  101e 2040          	jra	L1732
6114  1020               L1232:
6115                     ; 1356   case CAN_IT_TME:
6115                     ; 1357     CAN->TSR = CAN_TSR_RQCP012;/* rc_w1*/
6117  1020 35075422      	mov	21538,#7
6118                     ; 1358     break;
6120  1024 203a          	jra	L1732
6121  1026               L3232:
6122                     ; 1360   case CAN_IT_FF:
6122                     ; 1361     CAN->RFR = CAN_RFR_FULL; /* rc_w1*/
6124  1026 35085424      	mov	21540,#8
6125                     ; 1362     break;
6127  102a 2034          	jra	L1732
6128  102c               L5232:
6129                     ; 1364   case CAN_IT_FOV:
6129                     ; 1365     CAN->RFR = CAN_RFR_FOVR; /* rc_w1*/
6131  102c 35105424      	mov	21540,#16
6132                     ; 1366     break;
6134  1030 202e          	jra	L1732
6135  1032               L7232:
6136                     ; 1368   case CAN_IT_WKU:
6136                     ; 1369     CAN->MSR = CAN_MSR_WKUI;  /* rc_w1*/
6138  1032 35085421      	mov	21537,#8
6139                     ; 1370     break;
6141  1036 2028          	jra	L1732
6142  1038               L1332:
6143                     ; 1372   case CAN_IT_ERR:
6143                     ; 1373     CAN->PSR = CAN_Page_Config;
6145  1038 35065427      	mov	21543,#6
6146                     ; 1374     CAN->Page.Config.ESR = (uint8_t)CAN_ESR_RESET_VALUE;
6148  103c 725f5428      	clr	21544
6149                     ; 1375     CAN->MSR = CAN_MSR_ERRI;
6151  1040 35045421      	mov	21537,#4
6152                     ; 1376     break;
6154  1044 201a          	jra	L1732
6155  1046               L3332:
6156                     ; 1378   case CAN_IT_EWG:
6156                     ; 1379     CAN->MSR = CAN_MSR_ERRI;
6158  1046 35045421      	mov	21537,#4
6159                     ; 1380     break;
6161  104a 2014          	jra	L1732
6162  104c               L5332:
6163                     ; 1382   case CAN_IT_EPV:
6163                     ; 1383     CAN->MSR = CAN_MSR_ERRI;
6165  104c 35045421      	mov	21537,#4
6166                     ; 1384     break;
6168  1050 200e          	jra	L1732
6169  1052               L7332:
6170                     ; 1386   case CAN_IT_BOF:
6170                     ; 1387     CAN->MSR = CAN_MSR_ERRI;
6172  1052 35045421      	mov	21537,#4
6173                     ; 1388     break;
6175  1056 2008          	jra	L1732
6176  1058               L1432:
6177                     ; 1390   case CAN_IT_LEC:
6177                     ; 1391     CAN->PSR = CAN_Page_Config;
6179  1058 35065427      	mov	21543,#6
6180                     ; 1392     CAN->Page.Config.ESR = (uint8_t)CAN_ESR_RESET_VALUE;
6182  105c 725f5428      	clr	21544
6183                     ; 1393     break;
6185  1060               L3432:
6186                     ; 1395   default :
6186                     ; 1396     break;
6188  1060               L1732:
6189                     ; 1399   CAN_SelectPage(can_page);
6191  1060 7b01          	ld	a,(OFST+0,sp)
6192  1062 ad07          	call	_CAN_SelectPage
6194                     ; 1400 }
6197  1064 5b03          	addw	sp,#3
6198  1066 81            	ret
6223                     ; 1407 CAN_Page_TypeDef CAN_GetSelectedPage(void)
6223                     ; 1408 {
6224                     	switch	.text
6225  1067               _CAN_GetSelectedPage:
6229                     ; 1409   return (CAN_Page_TypeDef)(CAN->PSR);
6231  1067 c65427        	ld	a,21543
6234  106a 81            	ret
6269                     ; 1417 void CAN_SelectPage(CAN_Page_TypeDef CAN_Page)
6269                     ; 1418 {
6270                     	switch	.text
6271  106b               _CAN_SelectPage:
6275                     ; 1419   CAN->PSR = (uint8_t)CAN_Page;
6277  106b c75427        	ld	21543,a
6278                     ; 1420 }
6281  106e 81            	ret
6335                     ; 1428 static ITStatus CheckITStatus(uint8_t CAN_Reg, uint8_t It_Bit)
6335                     ; 1429 {
6336                     	switch	.text
6337  106f               L3_CheckITStatus:
6339  106f 89            	pushw	x
6340  1070 88            	push	a
6341       00000001      OFST:	set	1
6344                     ; 1430   ITStatus pendingbitstatus = RESET;
6346                     ; 1431   if ((CAN_Reg & It_Bit) != (uint8_t)RESET)
6348  1071 9f            	ld	a,xl
6349  1072 1402          	and	a,(OFST+1,sp)
6350  1074 2706          	jreq	L7442
6351                     ; 1434     pendingbitstatus = SET;
6353  1076 a601          	ld	a,#1
6354  1078 6b01          	ld	(OFST+0,sp),a
6357  107a 2002          	jra	L1542
6358  107c               L7442:
6359                     ; 1439     pendingbitstatus = RESET;
6361  107c 0f01          	clr	(OFST+0,sp)
6363  107e               L1542:
6364                     ; 1441   return (ITStatus)pendingbitstatus;
6366  107e 7b01          	ld	a,(OFST+0,sp)
6369  1080 5b03          	addw	sp,#3
6370  1082 81            	ret
6440                     	xdef	__FMI
6441                     	xdef	__Data
6442                     	xdef	__DLC
6443                     	xdef	__RTR
6444                     	xdef	__IDE
6445                     	xdef	__Id
6446                     	xdef	_CAN_ClearITPendingBit
6447                     	xdef	_CAN_GetITStatus
6448                     	xdef	_CAN_ClearFlag
6449                     	xdef	_CAN_GetFlagStatus
6450                     	xdef	_CAN_SelectPage
6451                     	xdef	_CAN_GetSelectedPage
6452                     	xdef	_CAN_GetLastErrorCode
6453                     	xdef	_CAN_OperatingModeRequest
6454                     	xdef	_CAN_WakeUp
6455                     	xdef	_CAN_Sleep
6456                     	xdef	_CAN_GetMessageTimeStamp
6457                     	xdef	_CAN_GetReceivedFMI
6458                     	xdef	_CAN_GetReceivedData
6459                     	xdef	_CAN_GetReceivedDLC
6460                     	xdef	_CAN_GetReceivedRTR
6461                     	xdef	_CAN_GetReceivedIDE
6462                     	xdef	_CAN_GetReceivedId
6463                     	xdef	_CAN_Receive
6464                     	xdef	_CAN_MessagePending
6465                     	xdef	_CAN_FIFORelease
6466                     	xdef	_CAN_CancelTransmit
6467                     	xdef	_CAN_TransmitStatus
6468                     	xdef	_CAN_TTComModeCmd
6469                     	xdef	_CAN_Transmit
6470                     	xdef	_CAN_ST7CompatibilityCmd
6471                     	xdef	_CAN_ITConfig
6472                     	xdef	_CAN_FilterInit
6473                     	xdef	_CAN_Init
6474                     	xdef	_CAN_DeInit
6475                     	xref	_assert_failed
6476                     	switch	.const
6477  0008               L103:
6478  0008 7372635c7374  	dc.b	"src\stm8s_can.c",0
6479                     	xref.b	c_lreg
6480                     	xref.b	c_x
6481                     	xref.b	c_y
6501                     	xref	c_uitol
6502                     	xref	c_uitolx
6503                     	xref	c_llsh
6504                     	xref	c_umul
6505                     	xref	c_lor
6506                     	xref	c_rtol
6507                     	xref	c_lursh
6508                     	xref	c_lgursh
6509                     	xref	c_lcmp
6510                     	xref	c_ltor
6511                     	end
