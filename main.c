// generuje na v˝stupu PC5 kladn˝ impulz o dÈlce PULSE_LEN jako spouötÏcÌ impulz pro ultrazvukv˝ modul
// detekuje na pinu PC1 (TIM1_CH1) pomocÌ funkce input capture p¯Ìchod echo pulzu z ultrazvukovÈho modulu a mÏ¯Ì jeho dÈlku
// mÏ¯enÌ zpracov·v· neblokujÌcÌm zp˘sobem periodicky opakuje. V˝sledek vracÌ do promÏnnÈ capture 
// pomocÌ promÏnnÈ/vlajky capture_flag informuje zbytek programu ûe byl zmÏ¯en nov˝ v˝sledek
#include "stm8s.h"
#include "milis.h"
#include "stm8_hd44780.h"
#include "stdio.h"
#include "swi2c.h"
#include "stm8s.h"

#define PULSE_LEN 2 // dÈlka spouötÏcÌho (trigger) pulzu pro ultrazvuk
#define MEASURMENT_PERIOD 100 // perioda mÏ¯enÌ ultrazvukem (mÏla by b˝t vÌc jak (maxim·lnÌ_dosah*2)/rychlost_zvuku)
void process_measurment(void);
void init_tim1(void);
uint16_t capture; // tady bude aktu·lnÌ v˝sledek mÏ¯enÌ (Ëasu), v mikrosekund·ch us
uint8_t capture_flag=0; // tady budeme indikovat ûe v capture je Ëerstv˝ v˝sledek
char text[16];
uint32_t time2=0;
uint32_t vzdalenost=0;
uint16_t vzd1=0;
#define DETEKCE_VZDALENOSTI 10

#define RTC_ADRESS 0b11010000   //Makro pro adresu RTC obvodu
void init_tim3(void);  //funkce, kter· nastavÌ timer 3 
void read_RTC(void);   //funkce, kter· kaûd˝ch 100 ms vyËÌt· informace z RTC
void process_RTC(void);  //funkce, kter· n·m vyËtenÈ hodnoty p¯evede 
volatile uint8_t error;
volatile uint8_t RTC_precteno[7];    // pole o dÈlce 7 byt˘, kam ukl·d·m data o Ëase
volatile uint8_t zapis[7];				   //pole o dÈlce 7 byt˘, ze kterÈho zapisuju data do RTC
uint16_t sec,des_sec,min,des_min,hod,des_hod,zbytek_hod;
volatile bool read_flag=0;
uint8_t stav=0;


#define ENKODER_TLAC_A_GPIO GPIOE
#define ENKODER_TLAC_B_GPIO GPIOE
#define ENKODER_TLAC_GPIO GPIOE
//#define ENKODER_TLAC_GPIO GPIOA
#define ENKODER_TLAC_A_PIN GPIO_PIN_1
#define ENKODER_TLAC_B_PIN GPIO_PIN_2
#define ENKODER_TLAC_PIN GPIO_PIN_4
//#define ENKODER_TLAC_PIN GPIO_PIN_5
bool rezim=0;
uint16_t zaznamy[10][6];
uint8_t cislo_zaznamu=0;
bool zmena_rezimu=0,zmena_zaznamu=0,sepnuto=0;
uint8_t pocet_zaznamu=0;
uint8_t i=0;
void process_enc(void);


void main(void){
CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1); // 16MHz z internÌho RC oscil·toru
init_milis(); // milis kv˘li delay_ms()
init_tim1(); // nastavit a spustit timer
lcd_init();
lcd_clear();
GPIO_Init(GPIOG, GPIO_PIN_0, GPIO_MODE_OUT_PP_LOW_SLOW); // v˝stup - "trigger pulz pro ultrazvuk"

enableInterrupts();  //glob·lnÏ povolÌ p¯eruöenÌ
swi2c_init();
init_tim3(); // nastavit a spustit timer
zapis[0] = 0b00000000;
zapis[1] = 0b01010100;
zapis[2] = 0b00011000;//prvnÌ p˘lka desÌtky, druh· jednotky
swi2c_write_buf(RTC_ADRESS,0x00,zapis,3);


  while (1){
		
		read_RTC();
		process_RTC();
		process_measurment(); // obsluhuje neblokujÌcÌm zp˘sobem mÏ¯enÌ ultrazvukem
		process_enc();
		
		
		switch(rezim){
			case 0:
				if (read_flag){
					read_flag=0;
					sprintf(text,"time: %u%u:%u%u:%u%u",des_hod,hod,des_min,min,des_sec,sec);//
					lcd_gotoxy(0,1);
					lcd_puts(text);
				}
				//pocet_zazanmu++;
				if (milis()-time2>332){
					time2=milis();
					vzdalenost=capture/2;
					vzdalenost=vzdalenost*343;
					vzd1=vzdalenost/10000;
					sprintf(text,"distance: %3ucm",vzd1);
					lcd_gotoxy(0,0);
					lcd_puts(text);
						
					switch(sepnuto){
						case 0:
							if (vzd1<DETEKCE_VZDALENOSTI){
								pocet_zaznamu++;
								
								if(pocet_zaznamu>10){
									for(i=0;i<9;i++){
										zaznamy[i][0]=zaznamy[i+1][0];
										zaznamy[i][1]=zaznamy[i+1][1];
										zaznamy[i][2]=zaznamy[i+1][2];
										zaznamy[i][3]=zaznamy[i+1][3];
										zaznamy[i][4]=zaznamy[i+1][4];
										zaznamy[i][5]=zaznamy[i+1][5];
										pocet_zaznamu=10;
									}
								}
									
								zaznamy[pocet_zaznamu-1][0]=sec;
								zaznamy[pocet_zaznamu-1][1]=des_sec;
								zaznamy[pocet_zaznamu-1][2]=min;
								zaznamy[pocet_zaznamu-1][3]=des_min;
								zaznamy[pocet_zaznamu-1][4]=hod;
								zaznamy[pocet_zaznamu-1][5]=des_hod;
								sepnuto=1;
							}
							break;
						
						case 1:
							if (vzd1>DETEKCE_VZDALENOSTI+3){
								sepnuto=0;
							}
							break;
					}
				}
				
				
				if (zmena_rezimu){
					zmena_rezimu=0;
					cislo_zaznamu=0;
					lcd_clear();
					
					if(pocet_zaznamu==0){
						sprintf(text,"EMPTY");
						lcd_gotoxy(0,0);
						lcd_puts(text);
					}
					
					else if(pocet_zaznamu==1){
						sprintf(text,"%u: %u%u:%u%u:%u%u",cislo_zaznamu+1,zaznamy[cislo_zaznamu][5],zaznamy[cislo_zaznamu][4],zaznamy[cislo_zaznamu][3],zaznamy[cislo_zaznamu][2],zaznamy[cislo_zaznamu][1],zaznamy[cislo_zaznamu][0]);
						lcd_gotoxy(0,0);
						lcd_puts(text);
					}
					
					else{
						sprintf(text,"%u: %u%u:%u%u:%u%u",cislo_zaznamu+1,zaznamy[cislo_zaznamu][5],zaznamy[cislo_zaznamu][4],zaznamy[cislo_zaznamu][3],zaznamy[cislo_zaznamu][2],zaznamy[cislo_zaznamu][1],zaznamy[cislo_zaznamu][0]);
						lcd_gotoxy(0,0);
						lcd_puts(text);
						
						sprintf(text,"%u: %u%u:%u%u:%u%u",cislo_zaznamu+2,zaznamy[cislo_zaznamu+1][5],zaznamy[cislo_zaznamu+1][4],zaznamy[cislo_zaznamu+1][3],zaznamy[cislo_zaznamu+1][2],zaznamy[cislo_zaznamu+1][1],zaznamy[cislo_zaznamu+1][0]);
						lcd_gotoxy(0,1);
						lcd_puts(text);
					}
					rezim++;
				}
			break;
			
			
			
			
			
			case 1:
				if (zmena_zaznamu){
					lcd_clear();
					zmena_zaznamu=0;
					if(pocet_zaznamu>0 && pocet_zaznamu<20){
						sprintf(text,"%u: %u%u:%u%u:%u%u",cislo_zaznamu+1,zaznamy[cislo_zaznamu][5],zaznamy[cislo_zaznamu][4],zaznamy[cislo_zaznamu][3],zaznamy[cislo_zaznamu][2],zaznamy[cislo_zaznamu][1],zaznamy[cislo_zaznamu][0]);
						lcd_gotoxy(0,0);
						lcd_puts(text);
					}
					
					if(cislo_zaznamu==9){
						sprintf(text,"%u: %u%u:%u%u:%u%u",1,zaznamy[0][5],zaznamy[0][4],zaznamy[0][3],zaznamy[0][2],zaznamy[0][1],zaznamy[0][0]);
						lcd_gotoxy(0,1);
						lcd_puts(text);
					}
					else if(pocet_zaznamu>1 && pocet_zaznamu<20){
						sprintf(text,"%u: %u%u:%u%u:%u%u",cislo_zaznamu+2,zaznamy[cislo_zaznamu+1][5],zaznamy[cislo_zaznamu+1][4],zaznamy[cislo_zaznamu+1][3],zaznamy[cislo_zaznamu+1][2],zaznamy[cislo_zaznamu+1][1],zaznamy[cislo_zaznamu+1][0]);
						lcd_gotoxy(0,1);
						lcd_puts(text);
					}
				}
				
			//do something
				if (zmena_rezimu){
					zmena_rezimu=0;
					lcd_clear();
					rezim++;
				}
				
			break;
			
			default:
				rezim=0;
		}
  }
}



void process_enc(void){
	static bool minuleA=0; // pamatuje si minul˝ stav vstupu A (nutnÈ k detekov·nÌ sestupnÈ hrany)
	static bool minuleB=0; // pamatuje si minul˝ stav vstupu A (nutnÈ k detekov·nÌ sestupnÈ hrany)
	// pokud je na vstupu A hodnota 0 a minule byla hodnota 1 tak jsme zachytili sestupnou hranu
	static uint32_t pocatek_stisku=0;
	static bool minule_stisk=0,ted_stisk=0,konec_stisku=0;
	
		if (GPIO_ReadInputPin(ENKODER_TLAC_GPIO,ENKODER_TLAC_PIN)==RESET){
			ted_stisk=1;
		}
		else{ted_stisk=0;}
		
		if((ted_stisk==1) && (minule_stisk==0)){pocatek_stisku=milis();}
		if(ted_stisk==0 && minule_stisk==1){konec_stisku=1;}
		
		if (konec_stisku==1 && ((milis()-pocatek_stisku)>999)){
			konec_stisku=0;
			//delete z·znam
			//if (cislo_zaznamu>sizeof(zaznamy)){cislo_zaznamu=0;}
		}
		else if(konec_stisku==1 && ((milis()-pocatek_stisku)<1000)){
			zmena_rezimu=1;
			konec_stisku=0;
		}
	
	
	if((GPIO_ReadInputPin(ENKODER_TLAC_B_GPIO,ENKODER_TLAC_B_PIN) != RESET) && minuleB==0 && GPIO_ReadInputPin(ENKODER_TLAC_A_GPIO,ENKODER_TLAC_A_PIN) == RESET){
		zmena_zaznamu=1;
		cislo_zaznamu--;

		if (cislo_zaznamu>9){//p¯eteËe
			if(pocet_zaznamu==1){
				cislo_zaznamu=0;
			}
			else{cislo_zaznamu=pocet_zaznamu-2;}
		}
	}
	if((GPIO_ReadInputPin(ENKODER_TLAC_B_GPIO,ENKODER_TLAC_B_PIN) == RESET) && minuleB==1 && GPIO_ReadInputPin(ENKODER_TLAC_A_GPIO,ENKODER_TLAC_A_PIN) != RESET){
		zmena_zaznamu=1;
		cislo_zaznamu--;
		if (cislo_zaznamu>9){//p¯eteËe
			if(pocet_zaznamu==1){
				cislo_zaznamu=0;
			}
			else{cislo_zaznamu=pocet_zaznamu-2;}
		}
	}
	
	if((GPIO_ReadInputPin(ENKODER_TLAC_A_GPIO,ENKODER_TLAC_A_PIN) != RESET) && minuleA==0 && GPIO_ReadInputPin(ENKODER_TLAC_B_GPIO,ENKODER_TLAC_B_PIN) == RESET){
		zmena_zaznamu=1;
		cislo_zaznamu++;
		if (cislo_zaznamu+1>(pocet_zaznamu-1)){
			cislo_zaznamu=0;
		}
	}
	if((GPIO_ReadInputPin(ENKODER_TLAC_A_GPIO,ENKODER_TLAC_A_PIN) == RESET) && minuleA==1 && GPIO_ReadInputPin(ENKODER_TLAC_B_GPIO,ENKODER_TLAC_B_PIN) != RESET){
		zmena_zaznamu=1;
		cislo_zaznamu++;
		if (cislo_zaznamu+1>(pocet_zaznamu-1)){
			cislo_zaznamu=0;
		}
	
	}
	
	if(GPIO_ReadInputPin(ENKODER_TLAC_A_GPIO,ENKODER_TLAC_A_PIN) != RESET){minuleA = 1;} // pokud je vstup A v log.1
	else{minuleA=0;}
	if(GPIO_ReadInputPin(ENKODER_TLAC_B_GPIO,ENKODER_TLAC_B_PIN) != RESET){minuleB = 1;} // pokud je vstup A v log.1
	else{minuleB=0;}

	minule_stisk=ted_stisk;
}



void read_RTC(void){
static uint16_t last_time=0;      // kaûd˝ch 100ms p¯eËte obsah RTC
  if(milis() - last_time >= 100){
    last_time = milis(); 
    error=swi2c_read_buf(RTC_ADRESS,0x00,RTC_precteno,7); 
  }
}

void process_RTC(void){
  sec = (RTC_precteno[0] & 0b00001111);              //sekundy
  des_sec = ((RTC_precteno[0] >> 4) & 0b00001111);		 //desÌtky sekund
	min = (RTC_precteno[1] & 0b00001111);		                //minuty
	des_min = ((RTC_precteno[1] >> 4) & 0b00001111);   //desÌtky minut
	hod = (RTC_precteno[2] & 0b00001111); 						//hodiny
	des_hod = ((RTC_precteno[2] >> 4) & 0b00000011);  //desÌtky hodin
	zbytek_hod = ((RTC_precteno[2] >> 4) & 0b00001111);   //zbytek dat hodin 
}

void init_tim3(void){
TIM3_TimeBaseInit(TIM3_PRESCALER_16,1999); // clock 1MHz, strop 5000 => perioda p¯eteËenÌ 5 ms
TIM3_ITConfig(TIM3_IT_UPDATE, ENABLE); // povolÌme p¯eruöenÌ od update ud·losti (p¯eteËenÌ) timeru 3
TIM3_Cmd(ENABLE); // spustÌme timer 3
}


INTERRUPT_HANDLER(TIM3_UPD_OVF_BRK_IRQHandler, 15){    //funkce pro obsluhu displej˘
  TIM3_ClearITPendingBit(TIM3_IT_UPDATE);
	read_flag=1;
}


void process_measurment(void){
	static uint8_t stage=0; // stavov˝ automat
	static uint16_t time=0; // pro Ëasov·nÌ pomocÌ milis
	switch(stage){
	case 0:	// Ëek·me neû uplyne  MEASURMENT_PERIOD abychom odstartovali mÏ¯enÌ
		if(milis()-time > MEASURMENT_PERIOD){
			time = milis(); 
			GPIO_WriteHigh(GPIOG,GPIO_PIN_0); // zah·jÌme trigger pulz
			stage = 1; // a bdueme Ëekat aû uplyne Ëas trigger pulzu
		}
		break;
	case 1: // Ëek·me neû uplyne PULSE_LEN (generuje trigger pulse)
		if(milis()-time > PULSE_LEN){
			GPIO_WriteLow(GPIOG,GPIO_PIN_0); // ukonËÌme trigger pulz
			stage = 2; // a p¯ejdeme do f·ze kdy oËek·v·me echo
		}
		break;
	case 2: // Ëek·me jestli dostaneme odezvu (Ëek·me na echo)
		if(TIM1_GetFlagStatus(TIM1_FLAG_CC2) != RESET){ // hlÌd·me zda timer hl·sÌ zmÏ¯enÌ pulzu
			capture = TIM1_GetCapture2(); // uloûÌme v˝sledek mÏ¯enÌ
			capture_flag=1; // d·me vÏdÏt zbytku programu ûe m·me nov˝ platn˝ v˝sledek
			stage = 0; // a zaËneme znovu od zaË·tku
		}else if(milis()-time > MEASURMENT_PERIOD){ // pokud timer nezachytil pulz po dlouhou dobu, tak echo nep¯ijde
			stage = 0; // a zaËneme znovu od zaË·tku
		}		
		break;
	default: // pokud se cokoli pokazÌ
	stage = 0; // zaËneme znovu od zaË·tku
	}	
}

void init_tim1(void){
GPIO_Init(GPIOC, GPIO_PIN_1, GPIO_MODE_IN_FL_NO_IT); // PC1 (TIM1_CH1) jako vstup
TIM1_TimeBaseInit(15,TIM1_COUNTERMODE_UP,0xffff,0); // timer nech·me volnÏ bÏûet (do maxim·lnÌho stropu) s Ëasovou z·kladnou 1MHz (1us)
// Konfigurujeme parametry capture kan·lu 1 - komplikovanÈ, nelze popsat v kr·tkÈm koment·¯i
TIM1_ICInit(TIM1_CHANNEL_1,TIM1_ICPOLARITY_RISING,TIM1_ICSELECTION_DIRECTTI,TIM1_ICPSC_DIV1,0);
// Konfigurujeme parametry capture kan·lu 2 - komplikovanÈ, nelze popsat v kr·tkÈm koment·¯i
TIM1_ICInit(TIM1_CHANNEL_2,TIM1_ICPOLARITY_FALLING,TIM1_ICSELECTION_INDIRECTTI,TIM1_ICPSC_DIV1,0);
TIM1_SelectInputTrigger(TIM1_TS_TI1FP1); // Zdroj sign·lu pro Clock/Trigger controller 
TIM1_SelectSlaveMode(TIM1_SLAVEMODE_RESET); // Clock/Trigger m· po p¯Ìchodu sign·lu provÈst RESET timeru
TIM1_ClearFlag(TIM1_FLAG_CC2); // pro jistotu vyËistÌme vlajku signalizujÌcÌ z·chyt a zmÏ¯enÌ echo pulzu
TIM1_Cmd(ENABLE); // spustÌme timer aù bÏûÌ na pozadÌ
}


#ifdef USE_FULL_ASSERT
void assert_failed(u8* file, u32 line)
{ 
  while (1){}
}
#endif
