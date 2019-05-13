
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

----------------------------------
--		Entity Declaration 		--
----------------------------------
-- Here we specify all input/output ports

entity blinkLed is
	port(
		clk_50mhz : in std_logic ;
		reset_btn : in std_logic;
		green_led : out std_logic
	);
end entity;

----------------------------------
--	Architecture Declaration 	--
----------------------------------
--	here we put the description code of the design

architecture behave of blinkLed is

-- signal declaration

signal clk_1hz : std_logic ;
signal scaler : integer range 0 to 25000000 ;
signal LED  : std_logic ;

begin

-- this process is used to scale down the 50mhz frequency
-- In reality, clk_1hz is not periodic but i used it to get 2 clock cycle by second ( 2 rising edge ).
-- 50 mhz means 50 000 000 cycle in one second : 
-- by using the scaler , i will have 2 cycle by second so that led will be on 1/2 s and off 1/2 s
 
	clk_1hz_process : process( clk_50mhz , reset_btn )
	begin
		if (reset_btn = '0') then 
			clk_1hz <= '0';
			scaler <= 0;
		elsif(rising_edge(clk_50mhz)) then 
			if (scaler < 20000000) then 
				scaler <= scaler + 1 ;
				clk_1hz <= '0';
			else
				scaler <= 0;
				clk_1hz <= '1';
			end if;
		end if;
	end process clk_1hz_process;

-- blinking LED process : led turn on and off	
	blinking_process : process (clk_1hz,reset_btn)
	begin
		if (reset_btn = '0') then 
			LED <= '0';
		elsif rising_edge(clk_1hz) then
			LED <= not LED ;
		end if ;
	end process blinking_process;

	green_led <= LED;
	end behave;