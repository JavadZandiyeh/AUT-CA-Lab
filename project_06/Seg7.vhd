library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Seg7 is
	port(
		input: in std_logic_vector(3 downto 0);
		output: out std_logic_vector(6 downto 0)
	);
end Seg7;

architecture Behavioral of Seg7 is
	--type of output is like abcdefg
	begin
		prcs: process(input)
		begin
			if(input = "0000")then
				output <= "1111110";
			elsif(input = "0001")then
				output <= "0110000";
			elsif(input = "0010")then
				output <= "1101101";
			elsif(input = "0011")then
				output <= "1111001";
			elsif(input = "0100")then
				output <= "0110011";
			elsif(input = "0101")then
				output <= "1011011";
			elsif(input = "0110")then
				output <= "1011111";
			elsif(input = "0111")then
				output <= "1110010";
			elsif(input = "1000")then
				output <= "1111111";
			elsif(input = "1001")then
				output <= "1111011";
			--hex
			elsif(input = "1010") then
				output <= "1110111";
			elsif(input = "1011") then
				output <= "0011111";
			elsif(input = "1100") then
				output <= "1001110";
			elsif(input = "1101") then
				output <= "0111101";
			elsif(input = "1110") then
				output <= "1001111";
			else
				output <= "1000111";
			end if;
		end process;

end Behavioral;
