library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cam is
	generic(
		w, c: integer := 4
	);
	
	port(
		clk, arst : in std_logic;
		data : in std_logic_vector(w-1 downto 0);
		match : out std_logic
	);
end cam;


architecture Behavioral of cam is
	type arrayOfVectors is array(0 to (2**c)-1) of std_logic_vector(w-1 downto 0);
	signal cam : arrayOfVectors;
	
	begin
		prcs : process(arst,clk)
		variable countOfData : integer;
		variable isfound : std_logic;
		begin
			if(arst='0')then
				countOfData := 0;
				match <= '0';
			else
				if(Clk'event and Clk = '1')then
					isfound :='0';
					checkLoop : for i in 0 to (2**c)-1 loop
						if(cam(i) = data and i<countOfData)then
							match <= '1';
							isfound :='1';
						end if;
					end loop;
				
					if(isfound = '0')then
						cam(countOfData) <= data;
						match <= '0';
						countOfData := countOfData + 1;
					end if;
				end if;
			end if;
	end process;
	
end Behavioral;