library ieee;
use ieee.std_logic_1164.all;

entity tb_RippleCounter_4bit is
end entity tb_RippleCounter_4bit;

architecture test of tb_RippleCounter_4bit is
	component RippleCounter_4bit is
		port(
			t_clk, t_arst: in std_logic;
			t_output: out std_logic_vector(3 downto 0)
		);
	end component;

	signal t_clk, t_arst: std_logic;
	signal t_output: std_logic_vector(3 downto 0);

begin
	uut: RippleCounter_4bit port map(t_clk => t_clk, t_arst => t_arst, t_output => t_output);
	t_arst <= '0', '1' after 2 ns, '0' after 4 ns;
	clock_process :process
	begin
		t_clk <= '0';
		wait for 5 ns;
		t_clk <= '1';
		wait for 5 ns;
	end process;
end test;