library ieee;
use ieee.std_logic_1164.all;

entity Multiplexer4to1 is
	port(
		i: in std_logic_vector(3 downto 0);
		s: in std_logic_vector(1 downto 0);
		output: out std_logic
	);
end entity Multiplexer4to1;

architecture gatelevel of Multiplexer4to1 is
	signal A: std_logic_vector(3 downto 0);
	signal not_s: std_logic_vector(1 downto 0);

	begin
		not_s <= not s;
		A(0) <= not_s(1) and not_s(0) and i(0);			
		A(1) <= not_s(1) and s(0) and i(1);
		A(2) <= s(1) and not_s(0) and i(2);
		A(3) <= s(1) and s(0) and i(3);
		output <= A(0) or A(1) or A(2) or A(3); 
end gatelevel;

