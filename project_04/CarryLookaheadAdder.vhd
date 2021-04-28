library ieee;
use ieee.std_logic_1164.all;

entity CarryLookaheadAdder is
	port(
		a, b: in std_logic_vector(3 downto 0);
		carry_in: in std_logic;
		sum: out std_logic_vector(3 downto 0);
		carry_out: out std_logic
	);
end entity;

architecture gatelevel of CarryLookaheadAdder is
	signal c, g, p: std_logic_vector(3 downto 0);
	begin
		g <= a and b;
		p <= a or b;
		c(0) <= g(0) or (carry_in and p(0));
		c(1) <= g(1) or (g(0) and p(1)) or (carry_in and p(0) and p(1));
		c(2) <= g(2) or (g(1) and p(2)) or (g(0) and p(1) and p(2)) or (carry_in and p(0) and p(1) and p(2));
		c(3) <= g(3) or (g(2) and p(3)) or (g(1) and p(2) and p(3)) or (g(0) and p(1) and p(2) and p(3)) or (carry_in and p(0) and p(1) and p(2) and p(3));
		sum(0) <= a(0) xor b(0) xor carry_in;
		sum(1) <= a(1) xor b(1) xor c(0);
		sum(2) <= a(2) xor b(2) xor c(1);
		sum(3) <= a(3) xor b(3) xor c(2);
		carry_out <= c(3); 
end gatelevel;
