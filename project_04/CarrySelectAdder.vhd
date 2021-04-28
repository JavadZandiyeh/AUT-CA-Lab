library ieee;
use ieee.std_logic_1164.all;

entity CarrySelectAdder is
	port(
		a_csa, b_csa: in std_logic_vector(3 downto 0);
		carry_in_csa: in std_logic;
		sum_csa: out std_logic_vector(3 downto 0);
		carry_out_csa: out std_logic
	);
end entity;

architecture gatelevel of CarrySelectAdder is

	component RippleAdder is
		port(
			a, b: in std_logic_vector(3 downto 0);
			carry_in: in std_logic;
			sum: out std_logic_vector(3 downto 0);
			carry_out: out std_logic
		);
	end component;
	
	signal s0, s1: std_logic_vector(3 downto 0);
	signal c0, c1: std_logic;

	begin
		RippleAdder0: RippleAdder port map(a=>a_csa, b=>b_csa, carry_in=>'0', sum=>s0, carry_out=>c0);
		RippleAdder1: RippleAdder port map(a=>a_csa, b=>b_csa, carry_in=>'1', sum=>s1, carry_out=>c1);
		carry_out_csa <= ((not carry_in_csa) and c0) or (carry_in_csa and c1);
		sum_csa(0) <= ((not carry_in_csa) and s0(0)) or (carry_in_csa and s1(0));
		sum_csa(1) <= ((not carry_in_csa) and s0(1)) or (carry_in_csa and s1(1));
		sum_csa(2) <= ((not carry_in_csa) and s0(2)) or (carry_in_csa and s1(2));
		sum_csa(3) <= ((not carry_in_csa) and s0(3)) or (carry_in_csa and s1(3));
		
end gatelevel;