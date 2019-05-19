#define _XTAL_FREQ 20000000

#define RS RD2
#define EN RD3
#define D4 RD4
#define D5 RD5
#define D6 RD6
#define D7 RD7
#define SBIT_PS1  5
#define SBIT_PS0  4


#define SBIT_ADON     0
#define SBIT_CHS0     3
#define SBIT_ADFM     7



#include <xc.h>
#include "lcd.h";
#include <stdio.h>
#include <stdlib.h>


float counter = 0, sekunde = 0;

char value = 0;
#define SBIT_PS2  2

char get_result(){
    ADCON0bits.GO_DONE = 1;
    
    while(ADCON0bits.GO_DONE);
    return (ADRESH * (char)256);
}

void __interrupt () my_isr_routine (void){  
    if(TMR0IF==1){
        TMR0IF=0;       // Clear timer interrupt flag
        if(counter == 74){
            TMR0 = 0x06;     /*Load the timer Value, (Note: Timervalue is 101 instaed of 100 as the
                               TImer0 needs two instruction Cycles to start incrementing TMR0 */
            counter = 0;
            
            
            lcd_clear();
            lcd_set_cursor(1,1);
            lcd_write_string("ADC Result");
            
            
            ADCON0bits.GO_DONE = 1;
            while(ADCON0bits.GO_DONE);
            
            
            
            lcd_set_cursor(2,1);
            float val = ((float)((float)ADRESH * 256 + (float)ADRESL) * 5) / 1023;
            char buf[30];
            sprintf (buf, "A = %f",  val);
            
            lcd_write_string(buf);
            
            if(!value){
                value = 1;
                PORTBbits.RB1 = 1;
            }else{
                value = 0;
                PORTBbits.RB1 = 0;                
            }

        }else counter++;
        
    } 
}



void init_timer(void) {    
    OPTION_REG = 0x87;  // Timer0 with external freq and 32 as prescalar
    TMR0=0x06;          // Load the time value for 1ms delay
    TMR0IE=1;           //Enable timer interrupt bit in PIE1 register
    GIE=1;              //Enable Global Interrupt
    PEIE=1;             //Enable the Peripheral Interrupt
}

void adc_init(){
    ADCON0bits.ADCS0 = 1;
    ADCON0bits.ADCS1 = 1;
    ADCON0bits.CHS0  = 1;
    ADCON0bits.ADON  = 1;
    ADCON1bits.ADFM  = 1;

    ADCON1bits.PCFG3 = 1;
}



int main(){
    char a = 0;
    TRISD=0x00;  // Definiramo smjer kao izlazni
    PORTD=0x00;  // Postavimo sve na nulu
    TRISB=0x00;  // Definiramo smjer kao izlazni
    PORTB=0x00;  // Postavimo sve na nulu
    
    lcd_init();
    init_timer();
    adc_init();
    
    
    lcd_clear();
    lcd_set_cursor(1,1);
    
    lcd_write_string("Welcome motherfuckers");
    
    while(1){
        
    }
    return 0;
}
