LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_ROM IS
END tb_ROM;
 
ARCHITECTURE behavior OF tb_ROM IS 
 
    COMPONENT ROM
    PORT(
         RD : IN  std_logic;
         Reset : IN  std_logic;
         Clk : IN  std_logic;
         Addr : IN  std_logic_vector(3 downto 0);
         Data : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal RD : std_logic := '0';
   signal Reset : std_logic := '0';
   signal Clk : std_logic := '0';
   signal Addr : std_logic_vector(3 downto 0) := (others => '0');
   signal Data : std_logic_vector(3 downto 0) := "0000";
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ROM PORT MAP (
          RD => RD,
          Reset => Reset,
          Clk => Clk,
          Addr => Addr,
          Data => Data
        );
		  
	prcs: process
	begin
		Clk <= '0';
		wait for 5 ns;
		Clk <= '1';
		wait for 5 ns;
	end process;
	
	RD <= '1', '0' after 50 ns;
	Reset <= '0', '1' after 2 ns;
	Addr <= "1001", "1100" after 14 ns, "0000" after 24 ns, "1011" after 34 ns, "0001" after 44 ns;
END;
