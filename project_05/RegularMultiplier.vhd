library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RegularMultiplier is
	port(
		x, y: in std_logic_vector(3 downto 0);
		product: out std_logic_vector(7 downto 0)	
	);
end RegularMultiplier;

architecture Gatelevel of RegularMultiplier is
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
	signal l1, l2: std_logic_vector(3 downto 0);
	signal l3: std_logic_vector(2 downto 0);
	signal t1, t2: std_logic_vector(2 downto 0);
	signal a: std_logic_vector(11 downto 0);
	signal b: std_logic_vector(2 downto 0);
	begin
			a(0) <= x(0) and y(1);
			a(1) <= x(1) and y(1);
			a(2) <= x(2) and y(1);
			a(3) <= x(3) and y(1);
			a(4) <= x(0) and y(2);
			a(5) <= x(1) and y(2);
			a(6) <= x(2) and y(2);
			a(7) <= x(3) and y(2);
			a(8) <= x(0) and y(3);
			a(9) <= x(1) and y(3);
			a(10) <= x(2) and y(3);
			a(11) <= x(3) and y(3);
			
			b(0) <= x(1) and y(0);
			b(1) <= x(2) and y(0);
			b(2) <= x(3) and y(0);


			p(0) <= x(0) and y(0);
			ha_1: HalfAdder port map(in1 => a(0), in2 => b(0), out1 => p(1), out2 => l1(0));
			fa_1: FullAdder port map(i0 =>  a(1), i1 =>  b(1), cin =>  l1(0), s => t1(0), cout => l1(1));
			fa_2: FullAdder port map(i0 =>  a(2), i1 =>  b(2), cin =>  l1(1), s => t1(1), cout => l1(2));
			ha_2: HalfAdder port map(in1 => a(3), in2 => l1(2), out1 => t1(2), out2 => l1(3));
			ha_3: HalfAdder port map(in1 => a(4), in2 => t1(0), out1 => p(2), out2 => l2(0));
			fa_3: FullAdder port map(i0 =>  a(5), i1 =>  t1(1), cin =>  l2(0), s => t2(0), cout => l2(1));
			fa_4: FullAdder port map(i0 =>  a(6), i1 =>  t1(2), cin =>  l2(1), s => t2(1), cout => l2(2));
			fa_5: FullAdder port map(i0 =>  a(7), i1 =>  l1(3), cin =>  l2(2), s => t2(2), cout => l2(3));
			ha_4: HalfAdder port map(in1 => a(8), in2 => t2(0), out1 => p(3), out2 => l3(0));
			fa_6: FullAdder port map(i0 =>  a(9), i1 =>  t2(1), cin =>  l3(0), s => p(4), cout => l3(1));
			fa_7: FullAdder port map(i0 =>  a(10), i1 => t2(2), cin =>  l3(1), s => p(5), cout => l3(2));
			fa_8: FullAdder port map(i0 =>  a(11), i1 => l2(3), cin =>  l3(2), s => p(6), cout => p(7));

	product <= p;
end Gatelevel;

