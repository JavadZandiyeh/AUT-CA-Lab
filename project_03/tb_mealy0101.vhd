library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_mealy0101 is
end entity;

architecture test of tb_mealy0101 is
    component mealy0101 is
  		port(
    		input,clk : in std_logic;
    		output : out std_logic
  		);
	end component;

	signal input : std_logic;
	signal clk : std_logic;
	signal output : std_logic;

begin
   	u : mealy0101 port map(input=>input , clk=>clk , output=>output);
    input <= '1' , '0' after 9 ns , '1' after 28 ns, '0' after 48 ns, '1' after 68 ns, '0' after 88 ns, '1' after 108 ns, '0' after 115 ns;
	clk <='0' , '1' after 10 ns , '0' after 20 ns , '1' after 30 ns , '0' after 40 ns , '1' after 50 ns ,'0' after 60 ns , '1' after 70 ns , '0' after 80 ns , '1' after 90 ns, '0' after 100 ns, '1' after 110 ns, '0' after 120 ns;
end test;