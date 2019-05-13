library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity lowPassFilter is
	port (
	
		input_data             : in  std_logic_vector(11 downto 0);         -- input data vector
		output_data            : out std_logic_vector(11 downto 0);
		divided_clock          : in  std_logic                              -- Ulazni clock u filter
	
	);
	  
end lowPassFilter;


architecture filterBody of lowPassFilter is	
	signal x_2, x_1, x         : unsigned(11 downto 0);
	signal y_2, y_1, y         : unsigned(11 downto 0);
	

begin
	
	getValues : process(divided_clock)
	begin
		if(rising_edge(divided_clock)) then
			x_2  <= x_1;
			x_1  <= x;
			x    <= unsigned(input_data);
		
			y_2  <= y_1;
			y_1  <= y;
			-- y    <= 
			
			y    <= unsigned(input_data);
			
			output_data <= std_logic_vector(y);  -- ispisi vrijednosti
			
		
			-- output_data <= input_data;
		end if;
	end process getValues;

	
end filterBody;