LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_Basic_Computer IS
END tb_Basic_Computer;
 
ARCHITECTURE behavior OF tb_Basic_Computer IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Basic_Computer
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         PC_out : OUT  std_logic_vector(4 downto 0);
         MAR_out : OUT  std_logic_vector(4 downto 0);
         ACC_out : OUT  std_logic_vector(7 downto 0);
         MDR_out : OUT  std_logic_vector(7 downto 0);
         IR_out : OUT  std_logic_vector(7 downto 0);
         CF_out : OUT  std_logic;
			state_out : out std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
   signal PC_out : std_logic_vector(4 downto 0);
   signal MAR_out : std_logic_vector(4 downto 0);
   signal ACC_out : std_logic_vector(7 downto 0);
   signal MDR_out : std_logic_vector(7 downto 0);
   signal IR_out : std_logic_vector(7 downto 0);
   signal CF_out : std_logic;
	signal state_out : std_logic_vector(3 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Basic_Computer PORT MAP (
          clk => clk,
          rst => rst,
          PC_out => PC_out,
          MAR_out => MAR_out,
          ACC_out => ACC_out,
          MDR_out => MDR_out,
          IR_out => IR_out,
          CF_out => CF_out,
			 state_out => state_out
        );

	rst <= '0', '1' after 5 ns;
	
   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for 10 ns;
		clk <= '1';
		wait for 10 ns;
   end process;
 
END;
