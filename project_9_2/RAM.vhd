library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.Numeric_Std.All;

entity RAM is
	generic(
		W : integer := 8;
		C: integer := 5
	);
	
	port(
		WR, Clock, Reset: in std_logic;
		Addr: in std_logic_vector(C-1 downto 0);
		Data_in: in std_logic_vector(W-1 downto 0);
		Data_out: out std_logic_vector(W-1 downto 0)
	);
end RAM;

architecture Behavioral of RAM is
	type array_of_vectors_for_ram is array(0 to (2**C)-1) of std_logic_vector(W-1 downto 0);
	signal my_ram: array_of_vectors_for_ram;
	
	begin
		prcs: process(Clock, Reset)
		begin
			if(Reset = '0') then
				rst_loop: for i in 0 to (2**C)-1 loop
					my_ram(i) <= std_logic_vector(to_unsigned(0, W));
				end loop;
				-- JP to address 10
				my_ram(0) <= "01001010";
				-- load value of address 11 in acc
				my_ram(10) <= "00001011";
				-- not ACC
				my_ram(11) <= "11011111";
				-- shr acc
				my_ram(12) <= "11100000";
				-- not ACC
				my_ram(13) <= "11011111";
				-- add ACC with value of address 15
				my_ram(14) <= "10101111";
				-- JPC to address 29
				my_ram(15) <= "01111101";
				-- and acc with address 30
				my_ram(29) <= "10011110";
				-- store value of ACC in address 1
				my_ram(30) <= "00100001";
			elsif(Clock'event and Clock = '1') then
				if(WR = '1') then
					my_ram(to_integer(unsigned(Addr))) <= Data_in;
				end if;
				Data_out <= my_ram(to_integer(unsigned(Addr)));
			end if;
		end process;
		
end Behavioral;
