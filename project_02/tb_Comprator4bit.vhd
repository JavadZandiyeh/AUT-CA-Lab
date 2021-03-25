library ieee;
use ieee.std_logic_1164.all;

entity tb_Comprator4bit is
end entity tb_Comprator4bit;

architecture gatelevel of tb_Comprator4bit is
	component Comprator4bit is
		port(
			a, b: in std_logic_vector(3 downto 0);
			a_gt_b, a_eq_b, a_lt_b: out std_logic
		);
	end component;

	signal tb_a, tb_b: std_logic_vector(3 downto 0);
	signal tb_a_gt_b, tb_a_eq_b, tb_a_lt_b: std_logic;
	
	begin
		uut: Comprator4bit port map(a=>tb_a, b=>tb_b, a_gt_b=>tb_a_gt_b, a_eq_b=>tb_a_eq_b, a_lt_b=>tb_a_lt_b);
		tb_a <= "0011", "1001" after 10ns, "0101" after 20ns;
		tb_b <= "0101", "0111" after 10ns, "0101" after 20ns;
end gatelevel;