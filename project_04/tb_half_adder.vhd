library ieee;
use ieee.std_logic_1164.all;

entity tb_half_adder is
end entity tb_half_adder;

architecture test of tb_half_adder is
	component half_adder is
		port(
			in1, in2: in std_logic;
			out1, out2: out std_logic
		);
	end component;
	
	signal in1, in2, out1, out2: std_logic;
	
	begin 
		uut: half_adder port map(in1=>in1, in2=>in2, out1=>out1, out2=>out2);
		in1 <= '0', '1' after 10 ns, '0' after 40 ns, '1' after 50 ns;
		in2 <= '1', '0' after 10 ns, '1' after 20 ns, '0' after 30 ns;

end test;
