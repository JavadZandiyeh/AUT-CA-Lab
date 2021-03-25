library ieee;
use ieee.std_logic_1164.all;

entity tb_Encoder4to2 is
end entity tb_Encoder4to2;

architecture test of tb_Encoder4to2 is
	component Encoder4to2 is
		port(
			i: in std_logic_vector(3 downto 0);
			o: out std_logic_vector(1 downto 0)
		);
	end component;

	signal tb_i: std_logic_vector(3 downto 0);
	signal tb_o: std_logic_vector(1 downto 0);
	
	begin
		uut: Encoder4to2 port map(i => tb_i, o => tb_o);
		tb_i <= "0001", "0010" after 5ns, "0100" after 10ns, "1000" after 15ns;
end test;
