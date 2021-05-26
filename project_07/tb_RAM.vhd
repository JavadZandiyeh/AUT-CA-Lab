LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_RAM IS
END tb_RAM;
 
ARCHITECTURE behavior OF tb_RAM IS 
  
    COMPONENT RAM
    PORT(
			WR : IN  std_logic;
         RD : IN  std_logic;
         Reset : IN  std_logic;
         Clk : IN  std_logic;
         Addr : IN  std_logic_vector(3 downto 0);
         Data : INOUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
	signal WR : std_logic := '0';
   signal RD : std_logic := '0';
   signal Reset : std_logic := '0';
   signal Clk : std_logic := '0';
   signal Addr : std_logic_vector(3 downto 0) := (others => '0');

	--BiDirs
   signal Data : std_logic_vector(3 downto 0);

BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: RAM PORT MAP (
          WR => WR,
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
	
	WR <= '0', '1' after 18 ns, '0' after 31 ns, '1' after 42 ns;
	RD <= '1', '0' after 50 ns;
	Reset <= '0', '1' after 2 ns;
	Addr <= "1001", "1100" after 15 ns, "0000" after 24 ns;
	
END;
