LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb_booth IS
END tb_booth;
 
ARCHITECTURE behavior OF tb_booth IS 
 
    COMPONENT Booth
    PORT(
         a : IN  std_logic_vector(3 downto 0);
         b : IN  std_logic_vector(3 downto 0);
         clk : IN  std_logic;
         arst : IN  std_logic;
         p : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(3 downto 0) := (others => '0');
   signal b : std_logic_vector(3 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal arst : std_logic := '0';

 	--Outputs
   signal p : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Booth PORT MAP (
          a => a,
          b => b,
          clk => clk,
          arst => arst,
          p => p
        );
	 a <= "0010","1100" after 200ns;
	 b <= "0100","0001" after 400ns;
	 arst <= '1','0' after 5ns,'1' after 205ns,'0' after 210ns,'1' after 405ns,'0' after 410ns;
   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for 10ns;
		clk <= '1';
		wait for 10ns;
   end process;

END;
