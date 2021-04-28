library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity and_gate is
	port(
		A, B: in std_logic;
		C: out std_logic
	);
end entity and_gate;

architecture Gatelevel of and_gate is
	begin
	C <= A and B;
end Gatelevel;
