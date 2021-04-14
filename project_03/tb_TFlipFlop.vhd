library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_TFlipFlop is
end entity tb_TFlipFlop;

architecture test of tb_TFlipFlop is
	component TFlipFlop
		port(
			input, arst, clk: in std_logic;
			output: out std_logic
		);
	end component;

	signal input, arst, clk, output: std_logic;

	begin
	uut: TFlipFlop port map(input=>input, arst=>arst, clk=>clk, output=>output);
	arst <= '0', '1' after 2 ns, '0' after 4 ns;
	input <= '0', '1' after 10 ns, '0' after 20 ns, '1' after 32 ns;
	clk <= '0', '1' after 8 ns, '0' after 12 ns, '1' after 18 ns, '0' after 22 ns, '1' after 28 ns, '0' after 34 ns, '1' after 38 ns;
	
end test;
