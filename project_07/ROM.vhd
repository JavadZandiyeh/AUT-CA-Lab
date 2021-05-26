library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.Numeric_Std.All;

entity ROM is
	generic(
		W, C: integer := 4
	);
	port(
		RD, Reset, Clk: in std_logic;
		Addr: in std_logic_vector(C-1 downto 0);
		Data: out std_logic_vector(W-1 downto 0)
	);
end ROM;

architecture Behavioral of ROM is
	type array_of_vectors_for_rom is array(0 to (2**C)-1) of std_logic_vector(W-1 downto 0);
	signal my_rom: array_of_vectors_for_rom;
	
	begin
		prcs: process(Clk, Reset)
		begin
			if(Reset = '0') then
				rst_loop: for i in 0 to (2**C)-1 loop
					my_rom(i) <= std_logic_vector(to_unsigned(i, W));
				end loop;
			elsif(Clk'event and Clk = '1') then
				if(RD = '1') then
					Data <= my_rom(to_integer(unsigned(Addr)));
				end if;
			end if;
		end process;
end Behavioral;

