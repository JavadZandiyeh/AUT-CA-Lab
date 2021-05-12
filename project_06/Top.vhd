library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Top is
	port(
		Clk_Top, Load_Top, Reset_Top: in std_logic;
		Parallel_IN_Top: in std_logic_vector(3 downto 0);
		LR_Top: in std_logic_vector(1 downto 0);
		output_Top: out std_logic_vector(6 downto 0)
	);
end Top;

architecture Behavioral of Top is
	component Clk1000 is
		port(
			inClk, arst: in std_logic;
			outClk: out std_logic
		);
	end component;
	
	component Shift_Register is
		port(
			Parallel_IN: in std_logic_vector(3 downto 0);
			LR: in std_logic_vector(1 downto 0);
			Load, Reset, Clk: in std_logic;
			Reg_out: out std_logic_vector(3 downto 0)
		);
	end component;
		
	component Seg7 is
		port(
			input: in std_logic_vector(3 downto 0);
			output: out std_logic_vector(6 downto 0)
		);
	end component;
	
	signal outClk_Top: std_logic;
	signal Reg_out_Top: std_logic_vector(3 downto 0);

	begin
		Clk1000_ins: Clk1000 port map(inClk => Clk_Top, arst => Reset_Top, outClk => outClk_Top);
		Shift_Register_ins: Shift_Register port map(Parallel_IN => Parallel_IN_Top, LR => LR_Top, Load => Load_Top, Reset => Reset_Top, Clk => outClk_Top, Reg_out => Reg_out_Top);
		Seg7_ins: Seg7 port map(input => Reg_out_Top, output => output_Top);
		

end Behavioral;

