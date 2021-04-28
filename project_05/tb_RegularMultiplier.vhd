LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb_RegularMultiplier IS
END tb_RegularMultiplier;
 
ARCHITECTURE behavior OF tb_RegularMultiplier IS 
  
    COMPONENT RegularMultiplier
		PORT(
         x : IN  std_logic_vector(3 downto 0);
         y : IN  std_logic_vector(3 downto 0);
         product : OUT  std_logic_vector(7 downto 0)
       );
    END COMPONENT;
    

   signal x : std_logic_vector(3 downto 0) := (others => '0');
   signal y : std_logic_vector(3 downto 0) := (others => '0');
   signal product : std_logic_vector(7 downto 0);
 
	BEGIN
		uut: RegularMultiplier PORT MAP (x => x, y => y, product => product);
		x <= "0100", "1101" after 20 ns, "1010" after 40 ns, "0000" after 60 ns;
		y <= "1000", "0001" after 10 ns, "0110" after 30 ns, "0111" after 50 ns;
END;
