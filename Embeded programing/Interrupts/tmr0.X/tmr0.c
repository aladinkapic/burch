#include <xc.h>
#include "lcd.h";

#define RS RD2
#define EN RD3
#define D4 RD4
#define D5 RD5
#define D6 RD6
#define D7 RD7
#define SBIT_PS1  5
#define SBIT_PS0  4


char value = 0;
#define SBIT_PS2  2

void __interrupt () my_isr_routine (void){  
    if(TMR0IF==1)
    {
        value=~value;   // complement the value for blinking the LEDs
        TMR0 = 101;     /*Load the timer Value, (Note: Timervalue is 101 instaed of 100 as the
                          TImer0 needs two instruction Cycles to start incrementing TMR0 */
        TMR0IF=0;       // Clear timer interrupt flag
    } 
}


void main(){
    lcd_init();
    
    TRISD=0x00;    //COnfigure PORTD as output to blink the LEDs

    

    
    lcd_clear();
    lcd_set_cursor(1,1);
    
    lcd_write_string("Welcome motherfuckers");
    
    while(1){
        
    }
}