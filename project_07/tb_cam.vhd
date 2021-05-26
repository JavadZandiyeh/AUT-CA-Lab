LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb_cam IS
END tb_cam;
 
ARCHITECTURE behavior OF tb_cam IS 

    COMPONENT cam
    PORT(
         clk : IN  std_logic;
         arst : IN  std_logic;
         data : IN  std_logic_vector(3 downto 0);
         match : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal arst : std_logic := '0';
   signal data : std_logic_vector(3 downto 0);

 	--Outputs
   signal match : std_logic;

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: cam PORT MAP (
          clk => clk,
          arst => arst,
          data => data,
          match => match
        );

	arst<='0','1' after 2ns;
	data<="1101","1111" after 300ns;
   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for 50ns;
		clk <= '1';
		wait for 50ns;
   end process;

END;
