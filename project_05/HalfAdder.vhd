library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity HalfAdder is
	port(
		in1, in2: in std_logic;
		out1, out2: out std_logic
	);
end HalfAdder;

architecture GateLevel of HalfAdder is
	begin
		out1 <= in1 xor in2;
		out2 <= in1 and in2;
end GateLevel;