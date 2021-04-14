library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_DFlipFlop is
end entity tb_DFlipFlop;

architecture test of tb_DFlipFlop is
	component DFlipFlop is
  		port(
    		input,arst,clk: in std_logic;
    		output: out std_logic
  		);
	end component;

	signal input : std_logic;
	signal arst : std_logic;
	signal clk : std_logic;
	signal output : std_logic;

	begin
  	uut: DFlipFlop port map(input=>input , arst=>arst , clk=>clk , output=>output);
    input <= '1', '0' after 38 ns;
    arst <='0' , '1' after 20 ns;
    clk <= '0', '1' after 10 ns, '0' after 20 ns , '1' after 30 ns , '0' after 40 ns, '1' after 50 ns;

end test;
