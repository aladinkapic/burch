
// LCD module connections
sbit LCD_RS at RD2_bit;
sbit LCD_EN at RD3_bit;
sbit LCD_D4 at RD4_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D7 at RD7_bit;

sbit LCD_RS_Direction at TRISD2_bit;
sbit LCD_EN_Direction at TRISD3_bit;
sbit LCD_D4_Direction at TRISD4_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D7_Direction at TRISD7_bit;





unsigned int ADCResult= 0;       // rezulatat A/D konverzije
long voltage;                    // pomocna promjenljiva za prikaz napona na LCD
char voltageTxt[15];             // pomocna promjenljiva za prikaz napona na LCD
const unsigned short VREF = 5;   //vrijednost referentnog napona konverzije
char *temp = "0000";             // pomocna promjenljiva za prikaz napona na LCD
int Count;


void interrupt() {          //ISR za opsluzivanje TMR0
  if (TMR0IF_bit) {          //Ispitivanje staja flag-a koji pokazuje prekoracenje tajmera TMR0
    Count++;                 //Ako je došlo do prekoracenja, inkrementira se Count
    TMR0IF_bit=0;            //Brisanje flag-a koji daje informaciju o prekoracenju TMR0
    TMR0   = 0x04;           //Pocetna vrijednost koju je potrebno upisati u TMR0
  }
}

void LCD_prikaz()                 // funkcija za prikaz napona na LCD sa 3 decimalna mjesta
{    temp[0] = voltage/1000 + 48;
     temp[1] = (voltage/100)%10 + 48;
     temp[2] = (voltage/10)%10 + 48;
     temp[3] = voltage%10 + 48;
     Lcd_out(2,1,"Napon:");
     Lcd_Chr(2,7,temp[0]);
     Lcd_Chr(2,8,46);
     Lcd_Chr(2,9,temp[1]);
     Lcd_Chr(2,10,temp[2]);
     Lcd_Chr(2,11,temp[3]);
     Lcd_Chr(2,13,86);
     }

void main() {
ANSEL = 0x10;           // konfigurisati da je pin RA5/AN4 PORTA analogni ulaz
ANSELH = 0x00;          // konfigurisati da su ostali pinovi PORTA digitalni I/O
TRISA = 0x20;           //  konfigurisati da je pin RA5/AN4 PORTA ulazni
ADCON1=0x80;             // izabrati desno poravnanje rezultata konverzije i
                         // referentne napone Vdd i Vss
ADCON0=0x91;            // izabrati takt konverzije Fosc/32 i AN4 kao analogni ulaz i startovati AD konverziju

TRISC=0;
PORTC=0;

GIE_bit=1;              //omogucavanje interapta u INTCON registru
PEIE_bit=1;
TMR0IE_bit=1;
TMR0IF_bit=0;

Count=0;

  Lcd_Init();                        // Initializacije LCD-a
  Lcd_Cmd(_LCD_CLEAR);               // Obrisati LCD
  Lcd_Cmd(_LCD_CURSOR_OFF);          // Obrisati kursor
  Lcd_Out(1, 2, "AD konverzija");    // ispis AD konverzija

  do {
  if(Count==930)
  {
  if (ADCON0.F1 == 0)                   //ako je konverzija zavrsena
     {ADCResult = ADRESH*256+ADRESL;    //pomnoziti visi bajt  rezultata konverzije sa 256
                                     // i sabrati sa nizim bajtom rezultata konverzije
     //ADCResult = (ADRESH<<8)+ADRESL;
     voltage =1000.0* (ADCResult * VREF)/1024.0;  // dobijenu vrijednost pomnoziti sa VREF i podijeliti sa
                                            // 1024 jer se radi o 10-bitnoj konverziji
                                            // pokrenuti AD konverziju ponovo
     ADCON0.F1 = 1;

    }
     Count=0;
     }
     LCD_prikaz();

  } while(1);

}