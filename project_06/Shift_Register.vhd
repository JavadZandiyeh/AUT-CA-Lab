library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Shift_Register is
	port(
		Parallel_IN: in std_logic_vector(3 downto 0);
		LR: in std_logic_vector(1 downto 0);
		Load, Reset, Clk: in std_logic;
		Reg_out: out std_logic_vector(3 downto 0)
	);
end Shift_Register;

architecture Behavioral of Shift_Register is
	begin
		prcs: process(Reset, Clk)
		variable reg_output : std_logic_vector(3 downto 0);
		begin
			if(Reset = '1') then
				reg_output := "0000";
			elsif(Clk'event and Clk = '1') then
				if(Load = '1') then
					reg_output := Parallel_IN;
				else
					-- "00" no change
					-- "01" for SHR
					-- "10" for SHL and SAL
					-- "11" for SAR
					if(LR = "01") then
						reg_output := '0' & reg_output(3 downto 1);
					elsif(LR = "10") then
						reg_output := reg_output(2 downto 0) & '0';
					elsif(LR = "11") then
						reg_output := reg_output(3) & reg_output(3 downto 1);
					end if;
				end if;
			end if;
		
		Reg_out <= reg_output;
		end process;
end Behavioral;

