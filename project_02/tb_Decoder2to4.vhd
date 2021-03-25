library ieee;
use ieee.std_logic_1164.all;

entity tb_Decoder2to4 is
end entity tb_Decoder2to4;

architecture test of tb_Decoder2to4 is
	component Decoder2to4 is
		port(
			i: in std_logic_vector(1 downto 0);
			o: out std_logic_vector(3 downto 0)	
		);	
	end component;
	
	signal tb_i: std_logic_vector(1 downto 0);
	signal tb_o: std_logic_vector(3 downto 0);	
	
	begin
		uut: Decoder2to4 port map(i => tb_i, o => tb_o);
		tb_i <= "00", "01" after 5ns, "10" after 10ns, "11" after 15ns;
		
end test;
