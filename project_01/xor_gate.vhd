library IEEE;
use IEEE.std_logic_1164.all;

entity xor_gate is
	port(
		A, B: in std_logic;
		C: out std_logic
	);
end entity xor_gate;

architecture gatelevel of xor_gate is
	begin
	C <= A xor B;
end gatelevel;
