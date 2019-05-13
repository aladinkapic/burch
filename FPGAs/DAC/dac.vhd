library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dac is
generic(
		CLK_DIV      : integer := 50000000 );              -- Dijeljenje frenkvencije sa 100, odnosno sa 50Mhz na 0.5 Mhz
	port(
		i_clk        : in std_logic;                       -- input clock => R8
		out_data     : out std_logic_vector(9 downto 0);   -- output value
		o_LED        : out std_logic;                      -- LED
		
		
		-- VCC and GND
		Vcc          : out std_logic
	);
end dac;


architecture dac_serial of dac is
	signal r_counter_clock            : integer range 0 to CLK_DIV;    -- Brojač za dijeljenje frenkvencije
	signal r_sclk_rise                : std_logic;                  	 -- detekcija uzlazne ivice
	signal r_sclk_fall                : std_logic;  					 	 -- detekcija silazne ivice 
	signal LED                        : std_logic;
	
	begin
	
	-- set VCC to HIGH
	vcc <= '1';
	
	
	blink_led : process(r_sclk_rise)
		begin
		if rising_edge(r_sclk_rise) then
			LED <= not LED;
		end if;
	end process blink_led;
	
		
	-- CLOCK divider
	p_counter_clock : process(i_clk)
	begin
		if(rising_edge(i_clk)) then
			-- U ovom slučaju povećavamo brojač r_counter_clock do CLK_DIV - 1, kada dođe do te vrijednosti, setujemo ga na 0
			if(r_counter_clock=(CLK_DIV/2)-1) then
					
				-- kada smo došli do polovine intervala, onda podignemo flag za padajuću ivicu
				-- a spustimo flag za rastuću ivicu
				-- uvećavamo counter sve do vrijednosti CLK_DIV - 1
				r_counter_clock            <= r_counter_clock + 1;
				r_sclk_rise                <= '1';
				r_sclk_fall                <= '0';		
				
			elsif(r_counter_clock=(CLK_DIV-1)) then
			
				-- Kada dođemo do CLK_DIV - 1, onda podignemo flag za rastuću ivicu
				-- a spustimo flag za padajuću ivicu
				-- resetujemo brojač
				r_counter_clock            <=  0 ;
				r_sclk_rise                <= '0';
				r_sclk_fall                <= '1';
			else
				
				-- ako se nalazimo u međuintervalu, povećavamo brojač i spustimo flagove za padajuću i rastuću ivicu
				r_counter_clock            <= r_counter_clock + 1;
				-- r_sclk_rise                <= '0'; -- treba nam da bude trajanje čitav poluinterval
				-- r_sclk_fall                <= '0'; -- treba nam da bude trajanje čitav poluinterval
			end if;
			
		end if;
	end process p_counter_clock;
		
	o_led <= LED;

end dac_serial;