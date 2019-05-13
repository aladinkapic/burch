#line 1 "C:/Users/Heisenberg/Desktop/ADC - EP/ADC_with_external_references.c"
#line 11 "C:/Users/Heisenberg/Desktop/ADC - EP/ADC_with_external_references.c"
sbit LCD_RS at LATB4_bit;
sbit LCD_EN at LATB5_bit;
sbit LCD_D4 at LATB0_bit;
sbit LCD_D5 at LATB1_bit;
sbit LCD_D6 at LATB2_bit;
sbit LCD_D7 at LATB3_bit;

sbit LCD_RS_Direction at TRISB4_bit;
sbit LCD_EN_Direction at TRISB5_bit;
sbit LCD_D4_Direction at TRISB0_bit;
sbit LCD_D5_Direction at TRISB1_bit;
sbit LCD_D6_Direction at TRISB2_bit;
sbit LCD_D7_Direction at TRISB3_bit;


unsigned int ADCResult= 0;
float voltage;
char voltageTxt[15];

void main() {
 ANSELB = 0;
 ANSELE = 0x02;
 TRISE1_bit = 1;

 ADC_Init();

 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);

 Lcd_Out(1, 8, "ADC");

 do {
 ADCResult = ADC_Get_Sample(6);
 voltage = (ADCResult * 5.00 )/1024;


 FloatToStr(voltage, voltageTxt);

 voltageTxt[4] = 0;
 Lcd_Out(2,1,"Voltage: ");
 Lcd_Out(2,10,voltageTxt);
 Lcd_Out(2,14,"V");
 Delay_ms(300);
 } while(1);
}
