library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FullAdder is
	port(
		i0, i1, cin: in std_logic;
		s, cout: out std_logic
	);
end FullAdder;

architecture Gatelevel of FullAdder is
	component HalfAdder is
		port(
			in1, in2: in std_logic;
			out1, out2: out std_logic
		);
	end component HalfAdder;

	signal internal_signal0, internal_signal1, internal_signal2: std_logic;

	begin
		half_adder_instance0: HalfAdder port map(in1 => i0, in2 => i1, out1 => internal_signal0, out2 => internal_signal1);
  		half_adder_instance1: HalfAdder port map(in1 => internal_signal0, in2 => cin, out1 => s, out2 => internal_signal2);
		cout <= internal_signal1 or internal_signal2;
end Gatelevel;

