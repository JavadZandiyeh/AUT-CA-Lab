library ieee;
use ieee.std_logic_1164.all;

entity tb_CarryLookaheadAdder is
end entity;

architecture test of tb_CarryLookaheadAdder is
	component CarryLookaheadAdder is
		port(
			a, b: in std_logic_vector(3 downto 0);
			carry_in: in std_logic;
			sum: out std_logic_vector(3 downto 0);
			carry_out: out std_logic
		);
	end component;

	signal carry_in: std_logic;
	signal a, b, sum: std_logic_vector(3 downto 0);
	signal carry_out: std_logic;

	begin
		uut: CarryLookaheadAdder port map(a=>a, b=>b, carry_in=>carry_in, sum=>sum, carry_out=>carry_out);
		a <= "0000", "1011" after 10 ns, "0101" after 20 ns;
		b <= "1100", "0111" after 5 ns, "0001" after 12 ns, "1111" after 22 ns;
		carry_in <= '0', '1' after 6 ns, '0' after 14 ns;
end test;