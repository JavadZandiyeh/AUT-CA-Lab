library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Clk1000 is
	port(
		inClk, arst: in std_logic;
		outClk: out std_logic
	);
end Clk1000;

architecture Behavioral of Clk1000 is
	begin
		prcs : process(inClk, arst)
		variable counter : integer := 0;
		begin
			if(arst = '1') then
				counter := 0;
				outClk <= '0';
			else
				if(inClk'event and inClk = '1') then
					counter := counter + 1;
					if(counter = 500) then
						outClk <= '1';
					elsif(counter = 1000) then
						outClk <= '0';
						counter := 0;
					end if;
				end if;
			end if;
		end process;
end Behavioral;
