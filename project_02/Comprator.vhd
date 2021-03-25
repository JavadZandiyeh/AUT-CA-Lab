library ieee;
use ieee.std_logic_1164.all;

entity Comprator is
	port(
		A, B, GT, EQ, LT: in std_logic;
		A_GT_B, A_EQ_B, A_LT_B: out std_logic
	);
end entity Comprator;

architecture gatelevel of Comprator is
	signal xn, not_B, not_A: std_logic;

	begin
		xn <= A xnor B;
		not_A <= not A;
		not_B <= not B;
		A_GT_B <= (A and not_B) or (xn and GT);			
		A_EQ_B <= xn and EQ;
		A_LT_B <= (not_A and B) or (xn and LT);
end gatelevel;
