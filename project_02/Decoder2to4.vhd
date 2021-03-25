library ieee;
use ieee.std_logic_1164.all;

entity Decoder2to4 is
	port(
		i: in std_logic_vector(1 downto 0);
		o: out std_logic_vector(3 downto 0)	
	);
end entity Decoder2to4;

architecture gatelevel of Decoder2to4 is
	signal not_i: std_logic_vector(1 downto 0);

	begin
		not_i <= not i;
		o(0) <= not_i(1) and not_i(0);	
		o(1) <= not_i(1) and i(0);	
		o(2) <= i(1) and not_i(0);	
		o(3) <= i(1) and i(0);	
end gatelevel;
