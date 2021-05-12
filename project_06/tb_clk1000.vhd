LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_clk1000 IS
END tb_clk1000;
 
ARCHITECTURE behavior OF tb_clk1000 IS 
  
    COMPONENT Clk1000
    PORT(
         inClk : IN  std_logic;
         arst : IN  std_logic;
         outClk : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal inClk : std_logic := '0';
   signal arst : std_logic := '0';

 	--Outputs
   signal outClk : std_logic;
 
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: Clk1000 PORT MAP (
          inClk => inClk,
          arst => arst,
          outClk => outClk
        );

	arst <= '1', '0' after 20 ns;
	inClk_process : process
	begin
		inClk <= '0';
		wait for 0.5 ms;
		inClk <= '1';
		wait for 0.5 ms;
	end process;

END;
