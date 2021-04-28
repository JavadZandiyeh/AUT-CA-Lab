library ieee;
use ieee.std_logic_1164.all;

entity tb_full_adder is
end entity tb_full_adder;

architecture test of tb_full_adder is
	component full_adder is
		port(
			i0, i1, cin: in std_logic;
			s, cout: out std_logic
		);
	end component;
	
	signal input0, input1, carry_in, sum, carry_out: std_logic;
	
	begin 
		uut: full_adder port map(i0 => input0, i1 => input1, cin => carry_in, s => sum, cout => carry_out);
		input0 <= '0', '1' after 10 ns, '0' after 40 ns, '1' after 50 ns;
		input1 <= '1', '0' after 10 ns, '1' after 20 ns, '0' after 30 ns;
		carry_in <= '0';

end test;
