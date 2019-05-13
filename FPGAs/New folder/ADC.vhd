library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ADC is
	port(
		-- glavni 50Mhz clock
		clock      : in std_logic; -- PIN_R8
		
		-- signalizacija LED-om
		first_led  : out std_logic
	);
end ADC;

architecture conv of ADC is
	signal clock_3MHz      : std_logic;

begin


end conv;