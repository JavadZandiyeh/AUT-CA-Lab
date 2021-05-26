library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity divide is
	port(
		a : in std_logic_vector(7 downto 0);
		b : in std_logic_vector(3 downto 0);
		clk : in std_logic; 
		arst : in std_logic;
		overflow : out std_logic;
		q : out std_logic_vector(3 downto 0);
		r : out std_logic_vector(3 downto 0)
	);
end divide;

architecture Behavioral of divide is
	begin
		prcs : process(clk,arst)
		variable e_r_a : std_logic_vector(8 downto 0);
		variable ovrflw : std_logic;
		variable sc : integer;
		
		begin
			if(arst = '1')then
				sc := 4;
				q <="0000";
				r <="0000";
				e_r_a :='0'&a;
				overflow <= '0';
				ovrflw:='0';
			else
				if(clk'event and clk = '1' and sc>0)then
					if(sc = 4 and ovrflw='0')then
						e_r_a(8 downto 4) := ('0'&e_r_a(7 downto 4)) + not(b) + 1;
					
					if(e_r_a(8) = '1')then--overflow
						overflow<='1';
						ovrflw:='1';
					else
						overflow<='0';
						ovrflw:='0';
						e_r_a(8 downto 4) := ('0'&e_r_a(7 downto 4)) + b;
						e_r_a(8 downto 1) := e_r_a(7 downto 0);
						e_r_a(0) :='0';
					
					if(e_r_a(8) = '1')then
						e_r_a(8 downto 4) := ('0'&e_r_a(7 downto 4)) + not(b) + 1;
						e_r_a(0) := '1';
			      else
						e_r_a(8 downto 4) := ('0'&e_r_a(7 downto 4)) + not(b) + 1;
						if(e_r_a(8) = '1')then
							e_r_a(0) := '1';
						else
							e_r_a(8 downto 4) := ('0'&e_r_a(7 downto 4)) + b;
							e_r_a(0) := '0';
						end if;
					end if;
					
					sc := sc - 1;
					q <= e_r_a(3 downto 0);
					r <= e_r_a(7 downto 4);
				end if;
			else
				if(ovrflw='0')then
					e_r_a(8 downto 1) := e_r_a(7 downto 0);
					e_r_a(0) :='0';
					
					if(e_r_a(8) = '1')then
						e_r_a(8 downto 4) := ('0'&e_r_a(7 downto 4)) + not(b) + 1;
						e_r_a(0) := '1';
					else
						e_r_a(8 downto 4) := ('0'&e_r_a(7 downto 4)) + not(b) + 1;
						if(e_r_a(8) = '1')then
							e_r_a(0) := '1';
						else
							e_r_a(8 downto 4) := ('0'&e_r_a(7 downto 4)) + b;
							e_r_a(0) := '0';
						end if;
					end if;
						
					sc := sc - 1;
					q <= e_r_a(3 downto 0);
					r <= e_r_a(7 downto 4);
				end if;
			end if;
		end if;
	end if;
	end process;
			
end Behavioral;

