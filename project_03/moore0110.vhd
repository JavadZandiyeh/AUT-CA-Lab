library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity moore0110 is
	port(
    	input,clk : in std_logic;
    	output : out std_logic
  	);
end entity;

architecture Behavioral of moore0110 is
	type states is (s0 , s1 , s2 , s3 , s4);

	signal present_state : states := s0;
	signal next_state : states := s0;
begin
    prcs : process(input,present_state)
    	begin
        	case present_state is
            	when s0=>
              		if(input = '0')then
                		next_state <= s1;
              		else
                		next_state <= s0;
            		end if;
            	when s1=>
              		if(input = '0')then
                		next_state <= s1;
              		else
                		next_state <= s2;
            		end if;
            	when s2=>
              		if(input = '0')then
                		next_state <= s1;
              		else
                		next_state <= s3;
            		end if;
            	when s3=>
              		if(input = '0')then
                		next_state <= s4;
              		else
                		next_state <= s0;
            		end if;
            	when s4=>
              		if(input = '0')then
                		next_state <= s1;
              		else
                		next_state <= s2;
            		end if;
      		end case;
	end process;
  
  	clkPrcs : process(clk)
    begin
        if(clk'event and clk = '1')then
          	present_state <= next_state;
      	end if;
  	end process;

	output <= '1' when present_state = s4 else '0';
end Behavioral;

