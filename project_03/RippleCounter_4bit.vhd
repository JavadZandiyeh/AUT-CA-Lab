library ieee;
use ieee.std_logic_1164.all;

entity RippleCounter_4bit is
	port(
		t_clk, t_arst: in std_logic;
		t_output: out std_logic_vector(3 downto 0)
	);
end entity RippleCounter_4bit;

architecture Behavioral of RippleCounter_4bit is
	component TFlipFlop is
		port(
			input, arst, clk: in std_logic;
			output: out std_logic
		);
	end component;
	
	signal qout: std_logic_vector(3 downto 0) := "0000";

begin
	TFF_ins0: TFlipFlop port map(input => '1', arst => t_arst, clk => t_clk, output => qout(0)); 
	TFF_ins1: TFlipFlop port map(input => '1', arst => t_arst, clk => qout(0), output => qout(1)); 
	TFF_ins2: TFlipFlop port map(input => '1', arst => t_arst, clk => qout(1), output => qout(2)); 
	TFF_ins3: TFlipFlop port map(input => '1', arst => t_arst, clk => qout(2), output => qout(3));

	t_output <= not qout;
end Behavioral;	