library ieee;
use ieee.std_logic_1164.all;

entity tb_Multiplexer16to1 is
end entity tb_Multiplexer16to1;

architecture test of tb_Multiplexer16to1 is 
	component Multiplexer16to1 is
		port(
			I: in std_logic_vector(15 downto 0);
			S: in std_logic_vector(3 downto 0);
			Output: out std_logic
		);
	end component;
	
	signal tb_I: std_logic_vector(15 downto 0);
	signal tb_S: std_logic_vector(3 downto 0);
	signal tb_Output: std_logic;

	begin
		uut: Multiplexer16to1 port map(I => tb_I, S => tb_S, Output => tb_Output);
		tb_I <= "1000110010111101", "1000111010100011" after 5ns, "1000111110110010" after 10ns, "0100101000100011" after 15ns;
		tb_S <= "0000", "0001" after 3ns, "0010" after 6ns, "0011" after 9ns, "1001" after 12ns, "1111" after 18ns;
end test;