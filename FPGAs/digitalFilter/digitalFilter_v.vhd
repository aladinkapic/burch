library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity digitalFilter_v is
	generic(
		CLK_DIV               : integer := 5000 );  -- Dijeljenje frenkvencije sa 100, odnosno sa 50Mhz na 0.5 Mhz
	port (
	  -- glavni clock sa ploče, 50MHz
		i_clk                       : in  std_logic;                     -- => PIN_R8
		i_rstb                      : in  std_logic;                     -- Reset button - vežemo ga za push button => PIN_J15
		i_conv_ena                  : in  std_logic;                     -- Dozvoli odnosno zabrani ADC , vezano za switch[0] => PIN_M1
		i_adc_ch                    : in  std_logic_vector(2 downto 0);  -- ADC channel 0-7 - ovdje smo izabrali koji channel preko preostala tri switch-a
		o_adc_ch                    : out std_logic_vector(2 downto 0);  -- ADC converted channel
		o_adc_data                  : out std_logic_vector(11 downto 0); -- adc parallel data => vezali smo 8 najvažnijih bita na 8 LED-ova
		
		-- ADC interface
		o_sclk                      : out std_logic;    -- ADC clock 50/16 MHz => PIN_B14
		o_ss                        : out std_logic;    -- CHIP SELECT => PIN_A10
		o_mosi                      : out std_logic;    -- Sa ovim biramo channel , na osnovu očitavanja sa SWITCH-eva => PIN_B10
		i_miso                      : in  std_logic;    -- Očitana vrijednost sa AD konvertora 12 bitni podataka => PIN_A9
		v3v3                        : out std_logic;	   -- 3V3 napon radi testiranja, pošto sa izlaznog kanala imamo vrijednost 3V3 da  
		
		-- DAC interface
		
		dac_sclk                    : out std_logic;    -- DAC clock 50/16 Mhz => PIN_B16
		dac_cs                      : out std_logic;    -- DAC CHIP SELECT => PIN_C16
		dac_din                     : out std_logic;    -- DAC data output => PIN_D16
		
		-- Dodatne varijable
		d_clock                     : out std_logic;    -- Brojač sa podijeljenom frenkvencijom
		final_value                 : out std_logic     -- Kada se podigne flag na "1", možemo pokupiti vrijednosti iz buffera i procesirati ih dalje ..
		
	  );
	  
end digitalFilter_v;
architecture rtl of digitalFilter_v is
	constant C_N                      : integer := 16;              	 -- 
	signal r_counter_clock            : integer range 0 to CLK_DIV; 	 -- Brojač za dijeljenje frenkvencije, 
	signal r_sclk_rise                : std_logic;                  	 -- detekcija uzlazne ivice
	signal r_sclk_fall                : std_logic;  					 	 -- detekcija silazne ivice 
	signal r_counter_data             : integer range 0 to C_N-1;      -- Brojač koji broji podatke, maksimalna vrijednost mu je 15, jer čitamo 16 bitni podatak (0 - 15)
	signal r_tc_counter_data          : std_logic;                     -- PODIŽE SE FLAG KADA ZAVRŠI CIKLUS, KADA JE ovaj brojač na log1, onda je konverzija završena i možemo pročitati podatak
	signal r_conversion_running       : std_logic;  						 -- Ako je vrijednost switch[0] = '1', onda ovo postavimo na log1 i dozvolimo ADC
	signal r_miso                     : std_logic;  						 -- pročitani bit sa izlaza ADC (jedan od 12 bita)
	signal r_conv_ena                 : std_logic;  						 -- enable ADC convesion
	signal r_adc_ch                   : std_logic_vector(2 downto 0);  -- Odabrani ADC kanal - varijabla tipa vektor
	signal r_adc_data                 : std_logic_vector(11 downto 0); -- Pročitana vrijednost sa izlaza, smiješta se u vektor od 12 bita
begin
---------------------------------------------------------------------- FSM

v3v3 <= '1';

-- Ovdje kontrolišemo da li ćemo vršiti AD konverziju ili ne putem switch[0]

p_conversion_control : process(i_clk,i_rstb)
begin
	if(rising_edge(i_clk)) then
		-- Na rastuću ivicu glavnog clocka, provjeri da li je switch[0] ON ili OFF i dodijeli tu vrijednost varijabli r_conv_ena (Read conversation enable)
		r_conv_ena             <= i_conv_ena;
		if(r_conv_ena='1') then
		-- ako je switch[0] = '1' , onda je i r_conv_ena = '1' onda postavi r_conversation_runing na vriednost logičke jedinice
			r_conversion_running   <= '1';
		elsif(r_conv_ena='0') then
		-- ako je switch[0g = '0' , onda prekini sve konverzije
			r_conversion_running   <= '0'; 
		end if;
	end if;
end process p_conversion_control;


-- Ovdje brojimo pročitane podatke, od 0 do 15 (riječ je dužine 16 bita)
p_counter_data : process(i_clk,i_rstb)
begin
	if(rising_edge(i_clk)) then
		if(r_conversion_running = '1') then
				-- ovdje brojimo ulazni podatke u FPGA na rastuću ivicu clock-a
				if(r_sclk_rise='1') then
					if(r_counter_data<C_N-1) then	
						-- kada je r_counter_data manji od 15, povećavamo ga i onemogućujemo mogućnost čitanja podataka sa izlaza
						r_counter_data     <= r_counter_data + 1;
						r_tc_counter_data  <= '0';
						
						final_value        <= '0';  -- Spusti flag za čitanje iz buffera ADC-a
					else
						-- ako je counter došao do 15, to znači da je došla cijela 16 bitna riječ te da se informacija 
						-- može dalje obrađivati, filtrirati , etc ..
						r_counter_data     <= 0;
						r_tc_counter_data  <= '1';
						
						final_value        <= '1';  -- Podignut flag - pročitaj podatke iz buffera ADC-a
					end if;
				else
				  r_tc_counter_data  <= '0';
				end if;
		 else
			r_counter_data     <= 0;
			r_tc_counter_data  <= '0';
		 end if;
  end if;
end process p_counter_data;



-- Ovdje očitavamo vrijednost sa AD konvertora i smiještamo je u vektor logičkih vrijednost r_adc_data;
p_serial_input : process(i_clk,i_rstb)
begin
	if(rising_edge(i_clk)) then
		r_miso               <= i_miso; -- Smjesti vrijednost jednogbitnog pročitanog podatka sa AD konvertora
		
		-- samo ako je pristigla cijela riječ na ulaz FPGA, onda ponovo setuj željeni kanal s kojeg želimo čitati
		if(r_tc_counter_data='1') then
			r_adc_ch             <= i_adc_ch; -- Ovdje postavljamo vrijednost zadanog ulaznog kanala u varijablu r_adc_ch
		end if;
		case r_counter_data is
			when  0  =>
				dac_din <= '0';
			when  1  => 
				dac_din <= '0';
			when  2  => 
				dac_din <= '0';
			when  3  => 
				dac_din <= '1';
			when  4  => 
				r_adc_data(11)  <= r_miso;
				dac_din <= '0';
			when  5  => 
				r_adc_data(10)  <= r_miso;
				dac_din <= '0';
			when  6  => 
				r_adc_data( 9)  <= r_miso;
				dac_din <= '0';
			when  7  => 
				r_adc_data( 8)  <= r_miso;
				dac_din <= '0';
			when  8  => 
				r_adc_data( 7)  <= r_miso;
				dac_din <= '0';
			when  9  => 
				r_adc_data( 6)  <= r_miso;
				dac_din <= '0';
			when 10  => 
				r_adc_data( 5)  <= r_miso;
				dac_din <= '0';
			when 11  => 
				r_adc_data( 4)  <= r_miso;
				dac_din <= '0';
			when 12  => 
				r_adc_data( 3)  <= r_miso;
				dac_din <= '0';
			when 13  => 
				r_adc_data( 2)  <= r_miso;
				dac_din <= '0';
			when 14  => 
				r_adc_data( 1)  <= r_miso;
				dac_din <= '0';
			when 15  => 
				r_adc_data( 0)  <= r_miso;
				dac_din <= '0';
			when others => NULL;
		end case;
  end if;
end process p_serial_input;




-- U ovom dijelu biramo ulazni kanal u ADC konvertor na osnovu 3 switch-a 
p_serial_output : process(i_clk,i_rstb)
begin
	if(rising_edge(i_clk)) then
		o_ss                 <= not r_conversion_running; -- Ako je omogućena konverzija, spusti CS bit na logičku nulu --
		dac_cs               <= not r_conversion_running; -- Ako je omogućena konverzija, spusti CS bit na logičku nulu --
		
		-- Kao i u slučaju mijenjanja kanala, da bi pročitali riječ odnosno ispisali je na izlazu, mora biti završena cijela 16bitna sekvenca
		if(r_tc_counter_data='1') then
			o_adc_ch             <= r_adc_ch; 	-- Pročitaj vrijednost zadatog kanala i na osnovu nje odaberi ulazni kanal u ADC --

			-- u ovom dijelu osim paljenja ledica, možemo raditi sa izlaznim podatkom šta hoćemo  --
			o_adc_data           <= r_adc_data; -- pali ledice u zavisnosti od pročitanog podatka --
		end if;
		
		-- sclk = '1' by default 
		-- Ovdje mijenjamo vrijednost clock-a za AD konvertor, tj PRAVIMO OSCILACIJE
		-- Kada u procesu skaliranja dođe vrijeme da se se flag podigne odnosno spusti
		if(r_conversion_running='1') then  
			if(r_sclk_rise='1') then
				-- Ovdje na osnovu countera došlo vrijeme za promjenu skaliranog clock-a sa log0 na log1
				o_sclk   <= '1';
				dac_sclk <= '1';
			elsif(r_sclk_fall='1') then
				-- Ovdje na osnovu countera došlo vrijeme za promjenu skaliranog clock-a sa log1 na log0
				o_sclk   <= '0';
				dac_sclk <= '0';
			end if;
		else
			o_sclk   <= '1';
			dac_sclk <= '1';
		end if;
		
		-- ako je detektovana padajuća ivica podijeljenog clock-a, onda pošalji 3-bitni podataka na ulaz
		-- AD konvertora i odaberimo željeni kanal 
		if(r_sclk_fall='1') then 
			case r_counter_data is
				when  2  => o_mosi <= r_adc_ch(2);
				when  3  => o_mosi <= r_adc_ch(1);
				when  4  => o_mosi <= r_adc_ch(0);
				when others => NULL;
			end case;
		end if;
	end if;
end process p_serial_output;



-- CLOCK divider
p_counter_clock : process(i_clk,i_rstb)
begin
	if(rising_edge(i_clk)) then
		-- ako je ADC uključen
		if(r_conversion_running = '1') then 
		
			-- U ovom slučaju povećavamo brojač r_counter_clock do CLK_DIV - 1, kada dođe do te vrijednosti, setujemo ga na 0
			if(r_counter_clock=(CLK_DIV/2)-1) then
					
				-- kada smo došli do polovine intervala, onda podignemo flag za padajuću ivicu
				-- a spustimo flag za rastuću ivicu
				-- uvećavamo counter sve do vrijednosti CLK_DIV - 1
				r_counter_clock            <= r_counter_clock + 1;
				r_sclk_rise                <= '0';
				r_sclk_fall                <= '1';
				
				d_clock <= '1';            -- Ovdje imamo podijeljenu frenkvenciju clock-a, u zavisnosti od parametra !!
			elsif(r_counter_clock=(CLK_DIV-1)) then
			
				-- Kada dođemo do CLK_DIV - 1, onda podignemo flag za rastuću ivicu
				-- a spustimo flag za padajuću ivicu
				-- resetujemo brojač
				r_counter_clock            <=  0 ;
				r_sclk_rise                <= '1';
				r_sclk_fall                <= '0';
				
				d_clock <= '0';            -- Ovdje imamo podijeljenu frenkvenciju clock-a, u zavisnosti od parametra !!
			else
			
				-- ako se nalazimo u međuintervalu, povećavamo brojač i spustimo flagove za padajuću i rastuću ivicu
				r_counter_clock            <= r_counter_clock + 1;
				r_sclk_rise                <= '0';
				r_sclk_fall                <= '0';
			end if;
			 
		
		-- ako konverzija nije omogućena, odnosno ako je u međuvremenu isključimo
		-- spustimo flagove za rastuću i padajuću ivicu
		-- brojač resetujemo na nulu
		else
			r_counter_clock            <=  0 ;
			r_sclk_rise                <= '0';
			r_sclk_fall                <= '0';
		end if;
	end if;
end process p_counter_clock;
end rtl;