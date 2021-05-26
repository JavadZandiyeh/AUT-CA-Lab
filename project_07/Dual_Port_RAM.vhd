library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.Numeric_Std.All;

entity Dual_Port_RAM is
	generic(
		W, C: integer := 4
	);
	port(
		WR, RD, Reset, Clk: in std_logic;
		Addr: in std_logic_vector(C-1 downto 0);
		Data_in: in std_logic_vector(W-1 downto 0);
		Data_out: out std_logic_vector(W-1 downto 0)
	);
end Dual_Port_RAM;

architecture Behavioral of Dual_Port_RAM is
	type array_of_vectors_for_ram is array(0 to (2**C)-1) of std_logic_vector(W-1 downto 0);
	signal my_ram: array_of_vectors_for_ram;

	begin
		prcs: process(Clk, Reset)
		begin
			if(Reset = '0') then
				rst_loop: for i in 0 to (2**C)-1 loop
					my_ram(i) <= std_logic_vector(to_unsigned(i, W));
				end loop;
			elsif(Clk'event and Clk = '1') then
				if(WR = '1') then
					my_ram(to_integer(unsigned(Addr))) <= Data_in;
				end if;
				if(RD = '1') then
					Data_out <= my_ram(to_integer(unsigned(Addr)));
				end if;
			end if;
		end process;
		
end Behavioral;

