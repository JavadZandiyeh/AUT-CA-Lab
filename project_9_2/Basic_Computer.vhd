library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity Basic_Computer is
	generic(
		W : integer := 8;
		C: integer := 5
	);
	
	port(
		clk, rst : in std_logic;
		PC_out : out std_logic_vector(C-1 downto 0);  
		MAR_out : out std_logic_vector(C-1 downto 0);
		ACC_out : out std_logic_vector(W-1 downto 0);
		MDR_out : out std_logic_vector(W-1 downto 0);
		IR_out : out std_logic_vector(W-1 downto 0);
		CF_out : out std_logic;
		state_out : out std_logic_vector(3 downto 0)
	);

end Basic_Computer;

architecture Behavioral of Basic_Computer is
	
	component RAM is
		port(
			WR, Clock, Reset: in std_logic;
			Addr: in std_logic_vector(C-1 downto 0);
			Data_in: in std_logic_vector(W-1 downto 0);
			Data_out: out std_logic_vector(W-1 downto 0)
		);
	end component;

	signal state : std_logic_vector(3 downto 0);
	signal MAR : std_logic_vector(C-1 downto 0);

	signal WR: std_logic;	
	signal in_Data : std_logic_vector(W-1 downto 0);
	signal out_Data : std_logic_vector(W-1 downto 0);

	
	begin		
		ram_block : RAM port map(WR => WR, Clock => clk, Reset => rst, Addr => MAR, Data_in => in_Data, Data_out => out_Data);
		
		
		process(clk, rst)
			variable temp : std_logic_vector(8 downto 0);
			variable PC : unsigned(C-1 downto 0);
			variable ACC : std_logic_vector(W-1 downto 0);
			variable MDR : std_logic_vector(W-1 downto 0);
			variable IR : std_logic_vector(W-1 downto 0);
			variable CF : std_logic;	
		begin
			if(rst = '0') then
				PC := (others => '0');
				MAR <= (others => '0');
				ACC := (others => '0');
				MDR := (others => '0');
				IR := (others => '0');
				CF := '0';
				WR <= '0';
				state <= "0000";
			elsif rising_edge(clk) then			
				case state is
					-- fetch0
					when "0000" =>
						MAR <= std_logic_vector(PC);
						state <= "0001";
					
					-- fetch1
					when "0001" =>
						IR := out_Data;
						PC := PC + 1;
						state <= "0010";
					
					-- decode0
					when "0010" =>
						case IR(7 downto 5) is
							when "110" =>
								MAR <= MAR;
							when "111" =>
								MAR <= MAR;
							when others => 
								MAR <= IR(4 downto 0);
						end case;
						state <= "1011";
						
					-- decode1
					when "1011" =>
						case IR(7 downto 5) is
							-- LD
							when "000" =>
								state <= "0011";
							
							-- ST
							when "001" =>
								in_Data <= ACC;
								WR <= '1';
								state <= "0100";
							
							-- JP
							when "010" =>
								state <= "0101";
							
							-- JPC
							when "011" =>
								state <= "0110";
							
							-- AND
							when "100" =>
								state <= "0111";
							
							-- ADD
							when "101" =>
								state <= "1000";
							
							-- NOT
							when "110" =>
								state <= "1001";
							
							-- SHR
							when "111" =>
								state <= "1010";
							when others =>
								state <= "0000";
						end case;
						
					-- LD
					when "0011" =>
						MDR := out_Data;
						ACC := out_Data;
						state <= "0000";
						
					-- ST
					when "0100" =>
						WR <= '0';
						state <= "0000";

					-- JP
					when "0101" =>
						PC := unsigned(MAR);
						state <= "0000";
						
					-- JPC
					when "0110" =>
						if(CF = '1') then
							PC := unsigned(MAR);
						end if;
						state <= "0000";
					
					-- AND
					when "0111" =>
						MDR := out_Data;
						ACC := ACC and out_Data;
						state <= "0000";
					
					-- ADD
					when "1000" =>
						MDR := out_Data;
						temp(8 downto 0) := std_logic_vector(to_unsigned(to_integer(unsigned(ACC)) + to_integer(unsigned(out_Data)), 9));
						ACC := temp(7 downto 0);
						CF := temp(8);
						state <= "0000";
					
					-- NOT
					when "1001" =>
						ACC := not ACC;
						state <= "0000";
					
					-- SHR
					when "1010" =>
						ACC := std_logic_vector(shift_right(unsigned(ACC), 1));
						state <= "0000";
					
					when others =>
						state <= "0000";
				end case;
						
			end if;
			
					
			PC_out <= std_logic_vector(PC);  
			MAR_out <= MAR;
			ACC_out <= ACC;
			MDR_out <= MDR;
			IR_out <= IR;
			CF_out <= CF;
			state_out <= state;
			
		end process;
		
end Behavioral;
