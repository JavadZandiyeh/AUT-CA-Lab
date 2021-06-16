--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:49:39 06/09/2021
-- Design Name:   
-- Module Name:   C:/Users/aal/Xilinx/basic_Comouter/tb_basicComputer1.vhd
-- Project Name:  basic_Comouter
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Basic_Computer
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_basicComputer1 IS
END tb_basicComputer1;
 
ARCHITECTURE behavior OF tb_basicComputer1 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Basic_Computer
    PORT(
         arst : IN  std_logic;
         clk : IN  std_logic;
         akku : INOUT  std_logic_vector(15 downto 0);
         irReg : OUT  std_logic_vector(15 downto 0);
         ram0 : OUT  std_logic_vector(15 downto 0);
         ram1 : OUT  std_logic_vector(15 downto 0);
         ram2 : OUT  std_logic_vector(15 downto 0);
         ram3 : OUT  std_logic_vector(15 downto 0);
         ram4 : OUT  std_logic_vector(15 downto 0);
         ram5 : OUT  std_logic_vector(15 downto 0);
         ram6 : OUT  std_logic_vector(15 downto 0);
         ram7 : OUT  std_logic_vector(15 downto 0);
         ram8 : OUT  std_logic_vector(15 downto 0);
         ram9 : OUT  std_logic_vector(15 downto 0);
         ram10 : OUT  std_logic_vector(15 downto 0);
         ram11 : OUT  std_logic_vector(15 downto 0);
         ram12 : OUT  std_logic_vector(15 downto 0);
         ram13 : OUT  std_logic_vector(15 downto 0);
         ram14 : OUT  std_logic_vector(15 downto 0);
         ram15 : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal arst : std_logic := '0';
   signal clk : std_logic := '0';

	--BiDirs
   signal akku : std_logic_vector(15 downto 0);

 	--Outputs
   signal irReg : std_logic_vector(15 downto 0);
   signal ram0 : std_logic_vector(15 downto 0);
   signal ram1 : std_logic_vector(15 downto 0);
   signal ram2 : std_logic_vector(15 downto 0);
   signal ram3 : std_logic_vector(15 downto 0);
   signal ram4 : std_logic_vector(15 downto 0);
   signal ram5 : std_logic_vector(15 downto 0);
   signal ram6 : std_logic_vector(15 downto 0);
   signal ram7 : std_logic_vector(15 downto 0);
   signal ram8 : std_logic_vector(15 downto 0);
   signal ram9 : std_logic_vector(15 downto 0);
   signal ram10 : std_logic_vector(15 downto 0);
   signal ram11 : std_logic_vector(15 downto 0);
   signal ram12 : std_logic_vector(15 downto 0);
   signal ram13 : std_logic_vector(15 downto 0);
   signal ram14 : std_logic_vector(15 downto 0);
   signal ram15 : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Basic_Computer PORT MAP (
          arst => arst,
          clk => clk,
          akku => akku,
          irReg => irReg,
          ram0 => ram0,
          ram1 => ram1,
          ram2 => ram2,
          ram3 => ram3,
          ram4 => ram4,
          ram5 => ram5,
          ram6 => ram6,
          ram7 => ram7,
          ram8 => ram8,
          ram9 => ram9,
          ram10 => ram10,
          ram11 => ram11,
          ram12 => ram12,
          ram13 => ram13,
          ram14 => ram14,
          ram15 => ram15
        );
	arst<='1','0' after 5ns;
   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for 50ns;
		clk <= '1';
		wait for 50ns;
   end process;
 

 

END;
