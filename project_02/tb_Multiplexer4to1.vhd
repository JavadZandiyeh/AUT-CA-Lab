library ieee;
use ieee.std_logic_1164.all;

entity tb_Multiplexer4to1 is
end entity tb_Multiplexer4to1;

architecture test of tb_Multiplexer4to1 is
	component Multiplexer4to1 is
		port(
			i: in std_logic_vector(3 downto 0);
			s: in std_logic_vector(1 downto 0);
			output: out std_logic
		);
	end component;
		
	signal tb_i: std_logic_vector(3 downto 0);
	signal tb_s: std_logic_vector(1 downto 0);
	signal tb_output: std_logic;

	begin
		uut: Multiplexer4to1 port map(i => tb_i, s => tb_s, output => tb_output);
		tb_i <= "1111", "1101" after 10ns, "0010" after 20ns;
		tb_s <= "00", "01" after 5ns, "10" after 15ns, "11" after 25ns;
end test;
