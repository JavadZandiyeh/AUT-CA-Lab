library ieee;
use ieee.std_logic_1164.all;

entity Comprator4bit is
	port(
		a, b: in std_logic_vector(3 downto 0);
		a_gt_b, a_eq_b, a_lt_b: out std_logic
	);
end entity Comprator4bit;

architecture gatelevel of Comprator4bit is
	component Comprator is
		port(
			A, B, GT, EQ, LT: in std_logic;
			A_GT_B, A_EQ_B, A_LT_B: out std_logic
		);
	end component;
	
	signal a_gt_b_0, a_eq_b_0, a_lt_b_0: std_logic;
	signal a_gt_b_1, a_eq_b_1, a_lt_b_1: std_logic;
	signal a_gt_b_2, a_eq_b_2, a_lt_b_2: std_logic;

	begin
		Comprator_ins0: Comprator port map(A=>a(0), B=>b(0), GT=>'0', EQ=>'1', LT=>'0', A_GT_B=>a_gt_b_0, A_EQ_B=>a_eq_b_0, A_LT_B=>a_lt_b_0);
		Comprator_ins1: Comprator port map(A=>a(1), B=>b(1), GT=>a_gt_b_0, EQ=>a_eq_b_0, LT=>a_lt_b_0, A_GT_B=>a_gt_b_1, A_EQ_B=>a_eq_b_1, A_LT_B=>a_lt_b_1);
		Comprator_ins2: Comprator port map(A=>a(2), B=>b(2), GT=>a_gt_b_1, EQ=>a_eq_b_1, LT=>a_lt_b_1, A_GT_B=>a_gt_b_2, A_EQ_B=>a_eq_b_2, A_LT_B=>a_lt_b_2);
		Comprator_ins3: Comprator port map(A=>a(3), B=>b(3), GT=>a_gt_b_2, EQ=>a_eq_b_2, LT=>a_lt_b_2, A_GT_B=>a_gt_b, A_EQ_B=>a_eq_b, A_LT_B=>a_lt_b);
end gatelevel;
