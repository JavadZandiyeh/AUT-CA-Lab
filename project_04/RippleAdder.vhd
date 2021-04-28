library ieee;
use ieee.std_logic_1164.all;

entity RippleAdder is
	port(
		a, b: in std_logic_vector(3 downto 0);
		carry_in: in std_logic;
		sum: out std_logic_vector(3 downto 0);
		carry_out: out std_logic
	);
end entity;

architecture gatelevel of RippleAdder is
	component full_adder is
		port(
			i0, i1, cin: in std_logic;
			s, cout: out std_logic
		);
	end component;

	signal c: std_logic_vector(3 downto 0);	

	begin
		full_adder0: full_adder port map(i0=>a(0), i1=>b(0), cin=>carry_in, s=>sum(0), cout=>c(0));
		full_adder1: full_adder port map(i0=>a(1), i1=>b(1), cin=>c(0), s=>sum(1), cout=>c(1));
		full_adder2: full_adder port map(i0=>a(2), i1=>b(2), cin=>c(1), s=>sum(2), cout=>c(2));
		full_adder3: full_adder port map(i0=>a(3), i1=>b(3), cin=>c(2), s=>sum(3), cout=>c(3));
	
	carry_out <= c(3);

end gatelevel;
