library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CarrySaveAdderMultiplier is
	port(
		x, y: in std_logic_vector(3 downto 0);
		product: out std_logic_vector(7 downto 0)
	);
end CarrySaveAdderMultiplier;

architecture Gatelevel of CarrySaveAdderMultiplier is

	component HalfAdder is
		port(
			in1, in2: in std_logic;
			out1, out2: out std_logic
		);
	end component HalfAdder;
	
	component FullAdder is
		port(
			i0, i1, cin: in std_logic;
			s, cout: out std_logic
		);
	end component FullAdder;
	
	signal p: std_logic_vector(7 downto 0);
	signal c: std_logic_vector(10 downto 0);
	signal sum: std_logic_vector(5 downto 0);
	signal a: std_logic_vector(15 downto 0);
	
	begin
			a(0)  <= x(0) and y(0);
			a(1)  <= x(1) and y(0);
			a(2)  <= x(2) and y(0);
			a(3)  <= x(3) and y(0);
			a(4)  <= x(0) and y(1);
			a(5)  <= x(1) and y(1);
			a(6)  <= x(2) and y(1);
			a(7)  <= x(3) and y(1);
			a(8)  <= x(0) and y(2);
			a(9)  <= x(1) and y(2);
			a(10) <= x(2) and y(2);
			a(11) <= x(3) and y(2);
			a(12) <= x(0) and y(3);
			a(13) <= x(1) and y(3);
			a(14) <= x(2) and y(3);
			a(15) <= x(3) and y(3);
			
			p(0) <= a(0);
			HA0: HalfAdder port map(in1 => a(4), in2 => a(1), out1 => p(1), out2 => c(0));
			HA1: HalfAdder port map(in1 => a(5), in2 => a(2), out1 => sum(0), out2 => c(1));
			HA2: HalfAdder port map(in1 => a(6), in2 => a(3), out1 => sum(1), out2 => c(2));
			FA0: FullAdder port map(i0 =>  sum(0), i1 =>  a(8), cin =>  c(0), s => p(2), cout => c(3));
			FA1: FullAdder port map(i0 =>  sum(1), i1 =>  a(9), cin =>  c(1), s => sum(2), cout => c(4));
			FA2: FullAdder port map(i0 =>  a(7), i1 =>  a(10), cin =>  c(2), s => sum(3), cout => c(5));
			FA3: FullAdder port map(i0 =>  sum(2), i1 =>  a(12), cin =>  c(3), s => p(3), cout => c(6));
			FA4: FullAdder port map(i0 =>  sum(3), i1 =>  a(13), cin =>  c(4), s => sum(4), cout => c(7));
			FA5: FullAdder port map(i0 =>  a(11), i1 =>  a(14), cin =>  c(5), s => sum(5), cout => c(8));
			HA3: HalfAdder port map(in1 => sum(4), in2 => c(6), out1 => p(4), out2 => c(9));
			FA6: FullAdder port map(i0 =>  sum(5), i1 =>  c(9), cin =>  c(7), s => p(5), cout => c(10));
			FA7: FullAdder port map(i0 =>  a(15), i1 =>  c(10), cin =>  c(8), s => p(6), cout => p(7));


			product <= p;
			
end Gatelevel;

