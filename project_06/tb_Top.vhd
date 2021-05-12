LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE std.env.finish;

ENTITY tb_Top IS
END tb_Top;
 
ARCHITECTURE behavior OF tb_Top IS 
 
    COMPONENT Top
    PORT(
         Clk_Top : IN  std_logic;
         Load_Top : IN  std_logic;
         Reset_Top : IN  std_logic;
         Parallel_IN_Top : IN  std_logic_vector(3 downto 0);
         LR_Top : IN  std_logic_vector(1 downto 0);
         output_Top : OUT  std_logic_vector(6 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Clk_Top : std_logic := '0';
   signal Load_Top : std_logic := '0';
   signal Reset_Top : std_logic := '0';
   signal Parallel_IN_Top : std_logic_vector(3 downto 0) := (others => '0');
   signal LR_Top : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal output_Top : std_logic_vector(6 downto 0);

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Top PORT MAP (
          Clk_Top => Clk_Top,
          Load_Top => Load_Top,
          Reset_Top => Reset_Top,
          Parallel_IN_Top => Parallel_IN_Top,
          LR_Top => LR_Top,
          output_Top => output_Top
        );
	
	Reset_Top <= '1', '0' after 500 ms;
	Load_Top <= '1', '0' after 1000 ms;
	Parallel_IN_Top <= "1011";
	LR_Top <= "00", "01" after 3000 ms, "10" after 5000 ms, "11" after 7000 ms;
	Clk_Top_process: process
	begin
		Clk_Top <= '0';
		wait for 0.5 ms;
		Clk_Top <= '1';
		wait for 0.5 ms;
	end process;
	--simulate for 10 s
END;
