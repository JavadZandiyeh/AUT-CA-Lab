library ieee;
use ieee.std_logic_1164.all;

entity Multiplexer16to1 is
	port(
		I: in std_logic_vector(15 downto 0);
		S: in std_logic_vector(3 downto 0);
		Output: out std_logic
	);
end entity Multiplexer16to1;

architecture gatelevel of Multiplexer16to1 is
	component Multiplexer4to1 is
		port(
			i: in std_logic_vector(3 downto 0);
			s: in std_logic_vector(1 downto 0);
			output: out std_logic
		);
	end component;
	
	signal B: std_logic_vector(3 downto 0);

	begin
		mux_ins0: Multiplexer4to1 port map(i => I(3 downto 0), s => S(1 downto 0), output => B(0));
		mux_ins1: Multiplexer4to1 port map(i => I(7 downto 4), s => S(1 downto 0), output => B(1));
		mux_ins2: Multiplexer4to1 port map(i => I(11 downto 8), s => S(1 downto 0), output => B(2));
		mux_ins3: Multiplexer4to1 port map(i => I(15 downto 12), s => S(1 downto 0), output => B(3));
		mux_ins4: Multiplexer4to1 port map(i => B, s => S(3 downto 2), output => Output);
end gatelevel;
