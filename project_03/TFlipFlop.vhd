library ieee;
use ieee.std_logic_1164.all;

entity TFlipFlop is
	port(
		input, arst, clk: in std_logic;
		output: out std_logic
	);
end entity;

architecture Behavioral of TFlipFlop is
	signal qout: std_logic;
begin
	prcs: process(clk, arst) is
	--variable qout: std_logic; 
	begin
		if(arst = '1') then
			qout <= '0';
		else 
			if(clk'event and clk = '1') then
				qout <= input xor qout;
			end if;
		end if;
	end process;
	output <= qout;
end Behavioral;