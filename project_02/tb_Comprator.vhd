library ieee;
use ieee.std_logic_1164.all;

entity tb_Comprator is
end entity tb_Comprator;

architecture test of tb_Comprator is
	component Comprator is
		port(
			A, B, GT, EQ, LT: in std_logic;
			A_GT_B, A_EQ_B, A_LT_B: out std_logic
		);
	end component;

	signal tb_A, tb_B, tb_GT, tb_EQ, tb_LT, tb_A_GT_B, tb_A_EQ_B, tb_A_LT_B: std_logic;

	begin
		uut: Comprator port map(A=>tb_A, B=>tb_B, GT=>tb_GT, EQ=>tb_EQ, LT=>tb_LT, A_GT_B=>tb_A_GT_B, A_EQ_B=>tb_A_EQ_B, A_LT_B=>tb_A_LT_B);
		tb_GT <= '0';
		tb_EQ <= '1';
		tb_LT <= '0';

		tb_A <= '0', '1' after 20ns;
		tb_B <= '0', '1' after 10ns, '0' after 20ns, '1' after 30ns;
end test;