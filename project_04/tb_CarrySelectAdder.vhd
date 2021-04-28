library ieee;
use ieee.std_logic_1164.all;

entity tb_CarrySelectAdder is
end entity;

architecture test of tb_CarrySelectAdder is
	component CarrySelectAdder is
		port(
			a_csa, b_csa: in std_logic_vector(3 downto 0);
			carry_in_csa: in std_logic;
			sum_csa: out std_logic_vector(3 downto 0);
			carry_out_csa: out std_logic
		);
	end component;

	signal carry_in_csa: std_logic;
	signal a_csa, b_csa, sum_csa: std_logic_vector(3 downto 0);
	signal carry_out_csa: std_logic;

	begin
		uut: CarrySelectAdder port map(a_csa=>a_csa, b_csa=>b_csa, carry_in_csa=>carry_in_csa, sum_csa=>sum_csa, carry_out_csa=>carry_out_csa);
		a_csa <= "0000", "1011" after 10 ns, "0101" after 20 ns;
		b_csa <= "1100", "0111" after 5 ns, "0001" after 12 ns, "1111" after 22 ns;
		carry_in_csa <= '0', '1' after 6 ns, '0' after 14 ns;
end test;
