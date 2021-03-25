library ieee;
use ieee.std_logic_1164.all;

entity Encoder4to2 is
	port(
		i: in std_logic_vector(3 downto 0);
		o: out std_logic_vector(1 downto 0)
	);
end entity Encoder4to2;

architecture gatelevel of Encoder4to2 is
	signal A: std_logic_vector(3 downto 0);
	signal not_i: std_logic_vector(3 downto 0);

	begin
		not_i <= not i;

		A(0) <= not_i(0) and i(1) and not_i(2) and not_i(3);
		A(1) <= not_i(0) and not_i(1) and not_i(2) and i(3);
		o(0) <= A(0) or A(1);
		
		A(2) <= not_i(0) and not_i(1) and i(2) and not_i(3);
		A(3) <= not_i(0) and not_i(1) and not_i(2) and i(3);
		o(1) <= A(2) or A(3);end gatelevel;
