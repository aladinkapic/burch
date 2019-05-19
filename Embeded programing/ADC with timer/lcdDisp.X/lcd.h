void lcd_port (char a)
{
    if(a & 1)
        D4=1;
    else
        D4=0;
    
     if(a & 2)
        D5=1;
    else
        D5=0;
    
     if(a & 4)
        D6=1;
    else
        D6=0;
    
     if(a & 8)
        D7=1;
    else
        D7=0;
    
}

void lcd_cmd(char a)
{
    RS=0;
    lcd_port(a);
    EN=1;
    __delay_ms(4);
    EN=0;
}

void lcd_clear()
{
    lcd_cmd(0);
     lcd_cmd(1);
}

void lcd_set_cursor(char a, char b)
{
    char temp,z,y;
    if(a==1)
    {
        temp=0x80+b-1;
        z=temp>>4;
        y=temp & 0x0F;
        lcd_cmd(z);
        lcd_cmd(y);
    }
    
    else if(a==2)
    {
         temp=0xC0+b-1;
        z=temp>>4;
        y=temp & 0x0F;
        lcd_cmd(z);
        lcd_cmd(y);
    }
}

void lcd_init()
{
    lcd_port(0x00);
    __delay_ms(20);
    lcd_cmd(0x03);
    __delay_ms(5);
    lcd_cmd(0x03);
    __delay_ms(11);
    lcd_cmd(0x03);
    
    lcd_cmd(0x02);
    lcd_cmd(0x02);
    lcd_cmd(0x08);
    lcd_cmd(0x00);
    lcd_cmd(0x0C);
    lcd_cmd(0x00);
    lcd_cmd(0x06);
}

void lcd_write_char(char a){
    char temp,y;
    temp=a&0x0F;
    y=a&0xF0;
    RS=1;
    lcd_port(y>>4);
    EN=1;
    __delay_us(40);
    EN=0;
    lcd_port(temp);
    EN=1;
    __delay_us(40);
    EN=0;
    
}void lcd_write_string(char *a)
{
    int i;
    for(i=0;a[i]!='\0';i++)
        lcd_write_char(a[i]);
}

void lcd_shift_right()
{
    lcd_cmd(0x01);
    lcd_cmd(0x0C);
}

void lcd_shift_left()
{
    lcd_cmd(0x01);
    lcd_cmd(0x08);
}

