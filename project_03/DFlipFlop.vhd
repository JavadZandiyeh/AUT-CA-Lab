library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DFlipFlop is
	port(
    	input, arst, clk:in std_logic;
    	output:out std_logic
  	);
end entity;

architecture behavioral of DFlipFlop is
begin
	prcs: process(clk, arst)
    begin
    	if(arst = '0')then
       		output <= '0';    
        else 
        	if(clk'event and clk = '1')then
            	output <= input;
          	end if;
       	end if;
	end process;
end behavioral;
