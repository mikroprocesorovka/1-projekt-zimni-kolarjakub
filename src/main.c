#include "milis.h"
#include "stm8s.h" 
#include "stm8_hd44780.h"
//#include "stm8s_tim1.h"
//#include "stm8s_conf.h"
#include "stdio.h"
//#include "delay.h"
  

#define PULSE_LEN 2 // délka spouštěcího (trigger) pulzu pro ultrazvuk
#define MEASURMENT_PERIOD 100 // perioda měření ultrazvukem (měla by být víc jak (maximální_dosah*2)/rychlost_zvuku)

#define TRIGGER_PIN GPIO_PIN_0
#define TRIGGER_GPIO GPIOG



#define _ISOC99_SOURCE
#define _GNU_SOURCE




char text[16];
void setup(void);
void init_tim1(void);
void process_measurment(void);

uint16_t capture=0; // tady bude aktuální výsledek měření (času)
uint8_t capture_flag=0; // tady budeme indikovat že v capture je čerstvý výsledek
uint32_t time2 = 0;



int main(void){

 
    
    setup();

    lcd_gotoxy(0,0);
    lcd_puts("ahoooooooooj");

    while (1) {
		
		//delay_ms(200);

		//process_measurment();

		if (milis() - time2 > 333) {
            GPIO_WriteReverse(GPIOC,GPIO_PIN_5); 
            time2 = milis();
			sprintf(text,"length: %5u",capture);
    		lcd_gotoxy(0,1);
		    lcd_puts(text);
        }
    }
}



void setup(void){
    CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);      // taktovani MCU na 16MHz   
    lcd_init();
    init_milis();

    GPIO_Init(TRIGGER_GPIO, TRIGGER_PIN, GPIO_MODE_OUT_PP_LOW_SLOW); // výstup - "trigger pulz pro ultrazvuk"
	GPIO_Init(GPIOC, GPIO_PIN_5, GPIO_MODE_OUT_PP_HIGH_SLOW);
    init_tim1(); // nastavit a spustit timer
}


void init_tim1(void){
    GPIO_Init(GPIOC, GPIO_PIN_1, GPIO_MODE_IN_FL_NO_IT); // PC1 (TIM1_CH1) jako vstup
    TIM1_TimeBaseInit(15,TIM1_COUNTERMODE_UP,0xffff,0); // timer necháme volně běžet (do maximálního stropu) s časovou základnou 1MHz (1us)
    // Konfigurujeme parametry capture kanálu 1 - komplikované, nelze popsat v krátkém komentáři
    TIM1_ICInit(TIM1_CHANNEL_1,TIM1_ICPOLARITY_RISING,TIM1_ICSELECTION_DIRECTTI,TIM1_ICPSC_DIV1,0);
    // Konfigurujeme parametry capture kanálu 2 - komplikované, nelze popsat v krátkém komentáři
    TIM1_ICInit(TIM1_CHANNEL_2,TIM1_ICPOLARITY_FALLING,TIM1_ICSELECTION_INDIRECTTI,TIM1_ICPSC_DIV1,0);
    TIM1_SelectInputTrigger(TIM1_TS_TI1FP1); // Zdroj signálu pro Clock/Trigger controller 
    TIM1_SelectSlaveMode(TIM1_SLAVEMODE_RESET); // Clock/Trigger má po příchodu signálu provést RESET timeru
    TIM1_ClearFlag(TIM1_FLAG_CC2); // pro jistotu vyčistíme vlajku signalizující záchyt a změření echo pulzu
    TIM1_Cmd(ENABLE); // spustíme timer ať běží na pozadí
}


void process_measurment(void){
	static uint8_t stage=0; // stavový automat
	static uint16_t time=0; // pro časování pomocí milis
	switch(stage){
	case 0:	// čekáme než uplyne  MEASURMENT_PERIOD abychom odstartovali měření
		if(milis()-time > MEASURMENT_PERIOD){
			time = milis(); 
			GPIO_WriteHigh(GPIOC,GPIO_PIN_5); // zahájíme trigger pulz
			stage = 1; // a bdueme čekat až uplyne čas trigger pulzu
		}
		break;
	case 1: // čekáme než uplyne PULSE_LEN (generuje trigger pulse)
		if(milis()-time > PULSE_LEN){
			GPIO_WriteLow(GPIOC,GPIO_PIN_5); // ukončíme trigger pulz
			stage = 2; // a přejdeme do fáze kdy očekáváme echo
		}
		break;
	case 2: // čekáme jestli dostaneme odezvu (čekáme na echo)
		if(TIM1_GetFlagStatus(TIM1_FLAG_CC2) != RESET){ // hlídáme zda timer hlásí změření pulzu
			capture = TIM1_GetCapture2(); // uložíme výsledek měření
			capture_flag=1; // dáme vědět zbytku programu že máme nový platný výsledek
			stage = 0; // a začneme znovu od začátku
		}else if(milis()-time > MEASURMENT_PERIOD){ // pokud timer nezachytil pulz po dlouhou dobu, tak echo nepřijde
			stage = 0; // a začneme znovu od začátku
		}		
		break;
	default: // pokud se cokoli pokazí
	stage = 0; // začneme znovu od začátku
	}	
}






/*-------------------------------  Assert -----------------------------------*/
#include "__assert__.h"