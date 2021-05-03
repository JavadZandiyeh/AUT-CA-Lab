library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Booth is
	port(
		a : in std_logic_vector(3 downto 0);
		b : in std_logic_vector(3 downto 0);
		clk : in std_logic; 
		arst : in std_logic;
		p : out std_logic_vector(7 downto 0)
	);
end Booth;

architecture Behavioral of Booth is
begin
	prcs : process(clk,arst)
		variable g : std_logic;
		variable q,q2 : std_logic_vector(3 downto 0);
		variable aa,bb : std_logic_vector(3 downto 0);
		variable sc : integer;
	begin
			if(arst = '1')then
				sc := 4;
				q :="0000";
				g :='0';
				bb := b;
				aa := a;
				p <= "00000000";
			else
				if(clk'event and clk = '1' and sc>0)then
					if(bb(0)='0' and g='1')then
						q := q + a;
					else
						if(bb(0)='1' and g='0')then
							q := q + not(a) + 1;
						end if;
					end if;
					g := bb(0);
					bb(0) := bb(1);
					bb(1) := bb(2);
					bb(2) := bb(3);
					bb(3) := q(0);
					q(0) := q(1);
					q(1) := q(2);
					q(2) := q(3);
					sc := sc - 1;
					p <= q&bb;
				end if;
			end if;
	end process;
end Behavioral;
