LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb_seg7 IS
END tb_seg7;
 
ARCHITECTURE behavior OF tb_seg7 IS 
 
    COMPONENT Seg7
    PORT(
         input : IN  std_logic_vector(3 downto 0);
         output : OUT  std_logic_vector(6 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal input : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal output : std_logic_vector(6 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Seg7 PORT MAP (
          input => input,
          output => output
        );
	
	input<="0000","0001" after 100ns,"0010" after 200ns,"0011" after 300ns,"0100" after 400ns,"0101" after 500ns,"0110" after 600ns,"0111" after 700ns,"1000" after 800ns,"1001" after 900ns,"1010" after 1000ns, "1011" after 1100 ns, "1100" after 1200 ns, "1101" after 1300 ns, "1110" after 1400 ns, "1111" after 1500 ns;	
END;
