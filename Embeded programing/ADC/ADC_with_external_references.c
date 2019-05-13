/*
 * Project name:  Interfacing LCD to PIC Microcontroller using MikroC Pro for PIC
 * Copyright:  (c) www.studentcompanion.co.za, 2013.
 * Test configuration:
     MCU:             PIC18F45K22
                      http://ww1.microchip.com/downloads/en/DeviceDoc/41412D.pdf
     Oscillator:      HS-PLL 32.0000 MHz, 8.0000 MHz Crystal
*/

// LCD module connections
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
  ANSELB = 0;                        // Configure PORTB pins as digital
  ANSELE = 0x02;                     // Configure RE1 pin as analog
  TRISE1_bit = 1;                    // Configure RE1 pin as input

  ADC_Init();                        // Initialize ADC

  Lcd_Init();                        // Initialize LCD
  Lcd_Cmd(_LCD_CLEAR);               // Clear display
  Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off

  Lcd_Out(1, 8, "ADC");

  do {
    ADCResult = ADC_Get_Sample(6);       // Get 10-bit results of AD conversion
    voltage = (ADCResult * 5.00 )/1024;  // Read the voltage


    FloatToStr(voltage, voltageTxt);    // Convert voltage to string
    //sprintf(voltageTxt, "%2.2f", voltage); You can also use sprintf to convert Float to string
    voltageTxt[4] = 0;                  //Remove extra digit after 2 decimal point.
    Lcd_Out(2,1,"Voltage: ");           // Write string "Voltage: "in first row
    Lcd_Out(2,10,voltageTxt);           // Write voltage in second row
    Lcd_Out(2,14,"V");                  // Write string "V" after voltage
    Delay_ms(300);
  } while(1);
}