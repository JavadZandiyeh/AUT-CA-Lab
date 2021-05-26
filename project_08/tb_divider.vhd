LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_divider IS
END tb_divider;
 
ARCHITECTURE behavior OF tb_divider IS 
 
    COMPONENT divide
    PORT(
         a : IN  std_logic_vector(7 downto 0);
         b : IN  std_logic_vector(3 downto 0);
         clk : IN  std_logic;
         arst : IN  std_logic;
         overflow : OUT  std_logic;
         q : OUT  std_logic_vector(3 downto 0);
         r : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(7 downto 0) := (others => '0');
   signal b : std_logic_vector(3 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal arst : std_logic := '0';

 	--Outputs
   signal overflow : std_logic;
   signal q : std_logic_vector(3 downto 0);
   signal r : std_logic_vector(3 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: divide PORT MAP (
          a => a,
          b => b,
          clk => clk,
          arst => arst,
          overflow => overflow,
          q => q,
          r => r
        );

	arst<='1','0' after 10 ns,'1' after 505ns,'0' after 510ns,'1' after 1005ns,'0' after 1010ns;
	a<="01011001","10010110" after 500ns,"00000111" after 1000ns;
	b<="1001","0110" after 500ns;
   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for 50ns;
		clk <= '1';
		wait for 50ns;
   end process;
 
END;
