LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_Dual_Port_RAM IS
END tb_Dual_Port_RAM;
 
ARCHITECTURE behavior OF tb_Dual_Port_RAM IS 
 
    COMPONENT Dual_Port_RAM
    PORT(
         WR : IN  std_logic;
         RD : IN  std_logic;
         Reset : IN  std_logic;
         Clk : IN  std_logic;
         Addr : IN  std_logic_vector(3 downto 0);
         Data_in : IN  std_logic_vector(3 downto 0);
         Data_out : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal WR : std_logic := '0';
   signal RD : std_logic := '0';
   signal Reset : std_logic := '0';
   signal Clk : std_logic := '0';
   signal Addr : std_logic_vector(3 downto 0) := (others => '0');
   signal Data_in : std_logic_vector(3 downto 0) := "0000";
   signal Data_out : std_logic_vector(3 downto 0) := "0000";
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Dual_Port_RAM PORT MAP (
          WR => WR,
          RD => RD,
          Reset => Reset,
          Clk => Clk,
          Addr => Addr,
          Data_in => Data_in,
          Data_out => Data_out
        );
	
	prcs: process
	begin
		Clk <= '0';
		wait for 5 ns;
		Clk <= '1';
		wait for 5 ns;
	end process;
	
	data_in <= "0000", "1011" after 12 ns, "1100" after 29 ns, "0010" after 41 ns;
	WR <= '0', '1' after 18 ns, '0' after 31 ns, '1' after 42 ns;
	RD <= '1', '0' after 50 ns;
	Reset <= '0', '1' after 2 ns;
	Addr <= "1001", "1100" after 15 ns, "0000" after 24 ns;

END;
