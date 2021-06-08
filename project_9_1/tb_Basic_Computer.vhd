LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY tb_Basic_Computer IS
END tb_Basic_Computer;
 
ARCHITECTURE behavior OF tb_Basic_Computer IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT Basic_Computer
    PORT(
         arst : IN  std_logic;
         clk : IN  std_logic;
         ac_out : OUT  std_logic_vector(15 downto 0);
         pc_out : OUT  std_logic_vector(3 downto 0);
         ir_out : OUT  std_logic_vector(15 downto 0);
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
         ram15 : OUT  std_logic_vector(15 downto 0);
			
			reg0 : out std_logic_vector(15 downto 0);
			reg1 : out std_logic_vector(15 downto 0);
			reg2 : out std_logic_vector(15 downto 0);
			reg3 : out std_logic_vector(15 downto 0);
			reg4 : out std_logic_vector(15 downto 0);
			reg5 : out std_logic_vector(15 downto 0);
			reg6 : out std_logic_vector(15 downto 0);
			reg7 : out std_logic_vector(15 downto 0);
			reg8 : out std_logic_vector(15 downto 0);
			reg9 : out std_logic_vector(15 downto 0);
			reg10 : out std_logic_vector(15 downto 0);
			reg11 : out std_logic_vector(15 downto 0);
			reg12 : out std_logic_vector(15 downto 0);
			reg13 : out std_logic_vector(15 downto 0);
			reg14 : out std_logic_vector(15 downto 0);
			reg15 : out std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal arst : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal ac_out : std_logic_vector(15 downto 0);
   signal pc_out : std_logic_vector(3 downto 0);
   signal ir_out : std_logic_vector(15 downto 0);
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
	
	
	signal reg0 : std_logic_vector(15 downto 0);
	signal reg1 : std_logic_vector(15 downto 0);
	signal reg2 : std_logic_vector(15 downto 0);
	signal reg3 : std_logic_vector(15 downto 0);
	signal reg4 : std_logic_vector(15 downto 0);
	signal reg5 : std_logic_vector(15 downto 0);
	signal reg6 : std_logic_vector(15 downto 0);
	signal reg7 : std_logic_vector(15 downto 0);
	signal reg8 : std_logic_vector(15 downto 0);
	signal reg9 : std_logic_vector(15 downto 0);
	signal reg10 : std_logic_vector(15 downto 0);
	signal reg11 : std_logic_vector(15 downto 0);
	signal reg12 : std_logic_vector(15 downto 0);
	signal reg13 : std_logic_vector(15 downto 0);
	signal reg14 : std_logic_vector(15 downto 0);
	signal reg15 : std_logic_vector(15 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Basic_Computer PORT MAP (
          arst => arst,
          clk => clk,
          ac_out => ac_out,
          pc_out => pc_out,
          ir_out => ir_out,
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
          ram15 => ram15,
			 
			 reg0 => reg0,
          reg1 => reg1,
          reg2 => reg2,
          reg3 => reg3,
          reg4 => reg4,
          reg5 => reg5,
          reg6 => reg6,
          reg7 => reg7,
          reg8 => reg8,
          reg9 => reg9,
          reg10 => reg10,
          reg11 => reg11,
          reg12 => reg12,
          reg13 => reg13,
          reg14 => reg14,
          reg15 => reg15		 
        );

	arst <= '0', '1' after 5 ns;
	
   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for 10 ns;
		clk <= '1';
		wait for 10 ns;
   end process;
 
END;
