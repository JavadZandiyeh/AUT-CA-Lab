LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_Shift_Register IS
END tb_Shift_Register;
 
ARCHITECTURE behavior OF tb_Shift_Register IS 

    COMPONENT Shift_Register
    PORT(
         Parallel_IN : IN  std_logic_vector(3 downto 0);
         LR : IN  std_logic_vector(1 downto 0);
         Load : IN  std_logic;
         Reset : IN  std_logic;
         Clk : IN  std_logic;
         Reg_out : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Parallel_IN : std_logic_vector(3 downto 0) := (others => '0');
   signal LR : std_logic_vector(1 downto 0) := (others => '0');
   signal Load : std_logic := '0';
   signal Reset : std_logic := '0';
   signal Clk : std_logic := '0';

 	--Outputs
   signal Reg_out : std_logic_vector(3 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Shift_Register PORT MAP (
          Parallel_IN => Parallel_IN,
          LR => LR,
          Load => Load,
          Reset => Reset,
          Clk => Clk,
          Reg_out => Reg_out
        );

	Reset <= '1', '0' after 5 ns;
	Load <= '1', '0' after 10 ns;
	Parallel_IN <= "1011";
	LR <= "00", "01" after 30 ns, "10" after 50 ns, "11" after 70 ns;
	Clk_process: process
	begin
		Clk <= '0';
		wait for 5 ns;
		Clk <= '1';
		wait for 5 ns;
	end process;
END;
