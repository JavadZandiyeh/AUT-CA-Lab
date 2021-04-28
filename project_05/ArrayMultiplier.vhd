library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ArrayMultiplier is
	port(
		x, y: in std_logic_vector(3 downto 0);
		product: out std_logic_vector(7 downto 0)
	);
end ArrayMultiplier;

architecture Gatelevel of ArrayMultiplier is
	component RippleAdder is
		port(
			a, b: in std_logic_vector(3 downto 0);
			carry_in: in std_logic;
			sum: out std_logic_vector(3 downto 0);
			carry_out: out std_logic
		);
	end component RippleAdder;
	
	signal p: std_logic_vector(7 downto 0);
	signal wire: std_logic_vector(14 downto 0);
	signal carry: std_logic_vector(1 downto 0);
	signal s: std_logic_vector(7 downto 0);
	signal a_0, a_1, a_2: std_logic_vector(3 downto 0);
	
	begin
		wire(0) <= x(1) and y(0);
		wire(1) <= x(2) and y(0);
		wire(2) <= x(3) and y(0);
		wire(3) <= x(0) and y(1);
		wire(4) <= x(1) and y(1);
		wire(5) <= x(2) and y(1);
		wire(6) <= x(3) and y(1);
		wire(7) <= x(0) and y(2);
		wire(8) <= x(1) and y(2);
		wire(9) <= x(2) and y(2);
		wire(10)<= x(3) and y(2);
		wire(11)<= x(0) and y(3);
		wire(12)<= x(1) and y(3);
		wire(13)<= x(2) and y(3);
		wire(14)<= x(3) and y(3);
		
		a_0 <= '0' & wire(2 downto 0);
		a_1 <= carry(0) & s(3 downto 1);
		a_2 <= carry(1) & s(7 downto 5);
		
		RA0: RippleAdder port map(a => a_0, b => wire(6 downto 3), carry_in => '0',sum => s(3 downto 0) ,carry_out => carry(0));
		RA1: RippleAdder port map(a => a_1, b => wire(10 downto 7), carry_in => '0',sum => s(7 downto 4) ,carry_out => carry(1));
		RA2: RippleAdder port map(a => a_2, b => wire(14 downto 11), carry_in => '0',sum => p(6 downto 3) ,carry_out => p(7));
		p(0) <= x(0) and y(0);
		p(1) <= s(0);
		p(2) <= s(4);
	
	product <= p;

end Gatelevel;

