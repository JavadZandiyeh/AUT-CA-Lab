library ieee;
use ieee.std_logic_1164.all;

entity full_adder_tb is
end entity full_adder_tb;

architecture test of full_adder_tb is
	component full_adder is
		port(
			i0, i1, cin: in std_logic;
			s, cout: out std_logic
		);
	end component;
	
	signal input0, input1, carry_in, sum, carry_out: std_logic;
	
	begin 
		uut: full_adder port map(i0 => input0, i1 => input1, cin => carry_in, s => sum, cout => carry_out);
		input0 <= '0', '1' after 10ns, '0' after 40ns, '1' after 50 ns;
		input1 <= '1', '0' after 10ns, '1' after 20ns, '0' after 30 ns;
		carry_in <= '0';

end test;
