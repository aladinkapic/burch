#define _XTAL_FREQ 20000000

#define RS RD2
#define EN RD3
#define D4 RD4
#define D5 RD5
#define D6 RD6
#define D7 RD7

#define SBIT_ADON     0
#define SBIT_CHS0     3
#define SBIT_ADFM     7

#define SBIT_PS1  5
#define SBIT_PS0  4

#include <xc.h>
#include "lcd.h";
#include <stdio.h>
#include <stdlib.h>

void ADC_Init(){
   ADCON0=0x00;  // sampling freq=osc_freq/2,ADC off initially
   ADCON1=(1<<SBIT_ADFM);  // All pins are configured as Analog pins and ADC result is right justified  
}


int ADC_Read(int adcChannel){  
    ADCON0 = (1<<SBIT_ADON) | (adcChannel<SBIT_CHS0);  //select required channel and turn ON adc
   
    GO=1;                           // Start ADC conversion
    while(GO_DONE==1);              // Wait for the conversion to complete
                                    // GO_DONE bit will be cleared once conversion is complete

    return((ADRESH<<8) + ADRESL);   // return right justified 10-bit result
 }

float counter = 0;

void __interrupt () my_isr_routine (void) {
    if(TMR1IE && TMR1IF){
        TMR1IF=0; 
        
        lcd_clear();
        lcd_set_cursor(1,1);

        float val = ((float)ADC_Read(0) * 5) / 1023;
        
        
        
        char buf[30];
        sprintf (buf, "A = %f",  val);


        lcd_write_string(buf);
        
    } 
}

void init_timer(void) {
    T1CON = (1<<SBIT_PS1) | (1<<SBIT_PS0); // Timer0 with external freq and 8 as prescalar
    TMR1H=0x0B;     // Load the time value(0xBDC) for 100ms delay
    TMR1L=0xDC;       
    TMR1IE=1;       //Enable timer interrupt bit in PIE1 register
    GIE=1;          //Enable Global Interrupt
    PEIE=1;         //Enable the Peripheral Interrupt
    TMR1ON = 1;     //Start Timer1 
}

int main(){
    char a = 0;
    TRISD=0x00;
    PORTD=0x00;
    TRISB=0x00;
    PORTB=0x00;
    ADC_Init(); 
    lcd_init();
    init_timer();
    
    while(1){}
    return 0;
}
