library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity Basic_Computer is
	port(
		arst, clk : in std_logic;
		-- cpu registers
		ac_out : out std_logic_vector(15 downto 0);
		pc_out : out std_logic_vector(3 downto 0);
		ir_out : out std_logic_vector(15 downto 0);
		
		-- ram
		ram0 : out std_logic_vector(15 downto 0);
		ram1 : out std_logic_vector(15 downto 0);
		ram2 : out std_logic_vector(15 downto 0);
		ram3 : out std_logic_vector(15 downto 0);
		ram4 : out std_logic_vector(15 downto 0);
		ram5 : out std_logic_vector(15 downto 0);
		ram6 : out std_logic_vector(15 downto 0);
		ram7 : out std_logic_vector(15 downto 0);
		ram8 : out std_logic_vector(15 downto 0);
		ram9 : out std_logic_vector(15 downto 0);
		ram10 : out std_logic_vector(15 downto 0);
		ram11 : out std_logic_vector(15 downto 0);
		ram12 : out std_logic_vector(15 downto 0);
		ram13 : out std_logic_vector(15 downto 0);
		ram14 : out std_logic_vector(15 downto 0);
		ram15 : out std_logic_vector(15 downto 0);
		
		-- cpu registers
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

end Basic_Computer;

architecture Behavioral of Basic_Computer is
	
	-- for defining cpu_registers and ram as an array of vectors
	type arrayOfVectors is array(0 to 15) of std_logic_vector(15 downto 0);
	signal ram : arrayOfVectors;
	
	
	-- defining states of program(used for sequential execution of Von Neuman
	-- and also decoding opcode of Instruction Registers)
	type type_of_states is(fetch, decode, exe_Load,
	exe_Store, exe_Beq, exe_Bneq, exe_Add, exe_Sub, exe_Ror, exe_Rol, exe_Shr,
	exe_Shl, exe_Show, exe_And, exe_Or, exe_Xor, exe_Not, exe_Halt);
	signal state : type_of_states;
	
	-- defining registers of cpu
	signal PC : std_logic_vector(3 downto 0);
	signal AC : std_logic_vector(15 downto 0);
	signal IR : std_logic_vector(15 downto 0);
	
	-- 
	signal opcode, rs, rt, rd, offset : std_logic_vector(3 downto 0);
	signal instr_index : std_logic_vector(11 downto 0);
	type type_of_instructions is(I_Type, J_Type, R_Type);
	signal type_instr : type_of_instructions;
	
	
	-- write enable and output enable
	signal write_en : std_logic;
	
	-- cput registers
	signal cpu_registers : arrayOfVectors;
	
	begin	
		process(clk, arst)
		begin
			if(arst = '0') then
				PC <= (others => '0');
				AC <= (others => '0');
				cpu_registers(0)<="0000000000000000";
				cpu_registers(1)<="0000000000000001";
				cpu_registers(2)<="0000000000000010";
				cpu_registers(3)<="0000000000000011";
				cpu_registers(4)<="0000000000000100";
				cpu_registers(5)<="0000000000000101";
				cpu_registers(6)<="0000000000000110";
				cpu_registers(7)<="0000000000000111";
				cpu_registers(8)<="0000000000001000";
				cpu_registers(9)<="0000000000001001";
				cpu_registers(10)<="0000000000001010";
				cpu_registers(11)<="0000000000001011";
				cpu_registers(12)<="0000000000001100";
				cpu_registers(13)<="0000000000001101";
				cpu_registers(14)<="0000000000001110";
				cpu_registers(15)<="0000000000001111";
				
				-- rs = rt thus pc = 15
				ram(0) <= "0010011001101111";
				-- cpu_register(2) = cpu_register(1) + cpu_register(15)
				ram(1) <= "0100000111110010";
				-- cpu_register(5) = cpu_register(7) - cpu_register(3)
				ram(2) <= "0101011100110101";
				-- cpu_register(4) = ror cpu_register(13), cpu_register(3) times
				ram(3) <= "0110110100110100";
				-- cpu_register(6) = rol cpu_register(13), cpu_register(3) times
				ram(4) <= "0111110100110110";
				-- store cpu_register(7) into ram(1)
				ram(5) <= "0001011100000001";
				-- cpu_register(7) = shr cpu_register(13), cpu_register(3) times
				ram(6) <= "1000110100110111";
				-- cpu_register(8) = shl cpu_register(13), cpu_register(3) times
				ram(7) <= "1001110100111000";
				-- show cpu_register(6)
				ram(8) <= "1010011000000000";
				-- cpu_register(0) = cpu_register(3) and cpu_register(11)
				ram(9) <= "1011101100110000";
				-- cpu_register(9) = cpu_register(3) and cpu_register(11)
				ram(10) <= "1100101100111001";
				-- cpu_register(14) = cpu_register(3) and cpu_register(11)
				ram(11) <= "1101101100111110";
				-- cpu_register(1) = not cpu_register(0)
				ram(12) <= "1110000000000001";
				-- halt
				ram(13) <= "1111000000000000";
				-- load ram(1) into cpu_register(4)
				ram(14) <= "0000000001000001";
				-- rs != rt thus pc = 1
				ram(15) <= "0011011000100001";
				

				state <= fetch;
			elsif rising_edge(clk) then
				case state is
					-- Fetch
					when fetch =>
						IR <= ram(to_integer(unsigned(PC)));
						PC <= PC + 1;
						state <= decode;
					
					-- Decode
					when decode =>
						opcode <= IR(15 downto 12);
						case opcode is
							when "0000" =>
								type_instr <= I_Type;
								state <= exe_Load;
							when "0001" =>
								type_instr <= I_Type;
								state <= exe_Store;
							when "0010" =>
								type_instr <= I_Type;
								state <= exe_Beq;
							when "0011" =>
								type_instr <= I_Type;
								state <= exe_Bneq;
							when "0100" =>
								type_instr <= R_Type;
								state <= exe_Add;
							when "0101" =>
								type_instr <= R_Type;
								state <= exe_Sub;
							when "0110" =>
								type_instr <= R_Type;
								state <= exe_Ror;
							when "0111" =>
								type_instr <= R_Type;
								state <= exe_Rol;
							when "1000" =>
								type_instr <= R_Type;
								state <= exe_Shr;
							when "1001" =>
								type_instr <= R_Type;
								state <= exe_Shl;
							when "1010" =>
								type_instr <= R_Type;
								state <= exe_Show;
							when "1011" =>
								type_instr <= R_Type;
								state <= exe_And;
							when "1100" =>
								type_instr <= R_Type;
								state <= exe_Or;
							when "1101" =>
								type_instr <= R_Type;
								state <= exe_Xor;
							when "1110" =>
								type_instr <= R_Type;
								state <= exe_Not;
							when "1111" =>
								state <= exe_Halt;
							when others =>
								state <= fetch;
						end case;
						
						case type_instr is
							when I_Type =>
								rs <= IR(11 downto 8);
								rt <= IR(7 downto 4);
								offset <= IR(3 downto 0);
							when J_Type =>
								instr_index <= IR(11 downto 0);
							when R_Type =>
								rs <= IR(11 downto 8);
								rt <= IR(7 downto 4);
								rd <= IR(3 downto 0);
						end case;

						
					-- Load I_Type
					when exe_Load =>
						AC <= ram(to_integer(unsigned(offset)));
						-- AC <= ram(to_integer(unsigned(rs + offset)));
						cpu_registers(to_integer(unsigned(rt))) <= AC;
						state <= fetch;
					
					-- Store I_Type
					when exe_Store =>
						AC <= cpu_registers(to_integer(unsigned(rs)));
						-- AC <= cpu_registers(to_integer(unsigned(rt)));
						if (write_en = '1') then
							ram(to_integer(unsigned(offset))) <= AC;
							-- ram(to_integer(unsigned(rs + offset))) <= AC;
						end if;
						state <= fetch;
						
					-- Beq I_Type
					when exe_Beq =>
						if(cpu_registers(to_integer(unsigned(rs))) = cpu_registers(to_integer(unsigned(rt)))) then
							PC <= offset;
						end if;
						state <= fetch;
					
					-- Bneq I_Type
					when exe_Bneq =>
						if(cpu_registers(to_integer(unsigned(rs))) = cpu_registers(to_integer(unsigned(rt)))) then
							PC <= PC;
						else 
							PC <= offset;
						end if;
						state <= fetch;
					
					-- Add R_Type
					when exe_Add =>
						AC <= cpu_registers(to_integer(unsigned(rs))) + cpu_registers(to_integer(unsigned(rt)));
						cpu_registers(to_integer(unsigned(rd))) <= AC;
						state <= fetch;
					
					-- Sub R_Type
					when exe_Sub =>
						AC <= cpu_registers(to_integer(unsigned(rs))) - cpu_registers(to_integer(unsigned(rt)));
						cpu_registers(to_integer(unsigned(rd))) <= AC;
						state <= fetch;
						
					-- Ror R_Type
					when exe_Ror =>
						AC <= std_logic_vector(rotate_right(unsigned((cpu_registers(to_integer(unsigned(rs))))), to_integer(unsigned(cpu_registers(to_integer(unsigned(rt)))))));
						cpu_registers(to_integer(unsigned(rd))) <= AC;
						state <= fetch;
					
					-- Rol R_Type
					when exe_Rol =>
						AC <= std_logic_vector(rotate_left(unsigned((cpu_registers(to_integer(unsigned(rs))))), to_integer(unsigned(cpu_registers(to_integer(unsigned(rt)))))));
						cpu_registers(to_integer(unsigned(rd))) <= AC;
						state <= fetch;

					-- Shr R_Type
					when exe_Shr =>
						AC <= std_logic_vector(shift_right(unsigned((cpu_registers(to_integer(unsigned(rs))))), to_integer(unsigned(cpu_registers(to_integer(unsigned(rt)))))));
						cpu_registers(to_integer(unsigned(rd))) <= AC;
						state <= fetch;
					
					-- Shl R_Type
					when exe_Shl =>
						AC <= std_logic_vector(shift_left(unsigned((cpu_registers(to_integer(unsigned(rs))))), to_integer(unsigned(cpu_registers(to_integer(unsigned(rt)))))));
						cpu_registers(to_integer(unsigned(rd))) <= AC;
						state <= fetch;
					
					-- Show
					when exe_Show =>
						AC <= cpu_registers(to_integer(unsigned(rs)));
						state <= fetch;
					
					-- And R_Type
					when exe_And =>
						AC <= cpu_registers(to_integer(unsigned(rs))) and cpu_registers(to_integer(unsigned(rt)));
						cpu_registers(to_integer(unsigned(rd))) <= AC;
						state <= fetch;
						
					-- Or R_Type
					when exe_Or =>
						AC <= cpu_registers(to_integer(unsigned(rs))) or cpu_registers(to_integer(unsigned(rt)));
						cpu_registers(to_integer(unsigned(rd))) <= AC;
						state <= fetch;
						
					-- Xor R_Type
					when exe_Xor =>
						AC <= cpu_registers(to_integer(unsigned(rs))) xor cpu_registers(to_integer(unsigned(rt)));
						cpu_registers(to_integer(unsigned(rd))) <= AC;
						state <= fetch;
					
					-- Not R_Type
					when exe_Not =>
						AC <= not cpu_registers(to_integer(unsigned(rs)));
						cpu_registers(to_integer(unsigned(rd))) <= AC;
						state <= fetch;
						
					-- Halt
					when exe_Halt =>
						state <= exe_Halt;
				end case;
				
				ir_out <= IR;
				pc_out <= PC;
				ac_out <= AC;
				ram0 <= ram(0);
				ram1 <= ram(1);
				ram2 <= ram(2);
				ram3 <= ram(3);
				ram4 <= ram(4);
				ram5 <= ram(5);
				ram6 <= ram(6);
				ram7 <= ram(7);
				ram8 <= ram(8);
				ram9 <= ram(9);
				ram10 <= ram(10);
				ram11 <= ram(11);
				ram12 <= ram(12);
				ram13 <= ram(13);
				ram14 <= ram(14);
				ram15 <= ram(15);
				
				reg0 <= cpu_registers(0);
				reg1 <= cpu_registers(1);
				reg2 <= cpu_registers(2);
				reg3 <= cpu_registers(3);
				reg4 <= cpu_registers(4);
				reg5 <= cpu_registers(5);
				reg6 <= cpu_registers(6);
				reg7 <= cpu_registers(7);
				reg8 <= cpu_registers(8);
				reg9 <= cpu_registers(9);
				reg10 <= cpu_registers(10);
				reg11 <= cpu_registers(11);
				reg12 <= cpu_registers(12);
				reg13 <= cpu_registers(13);
				reg14 <= cpu_registers(14);
				reg15 <= cpu_registers(15);
				
			end if;		
		end process;
		
		with state select
					write_en <= '1' when exe_Store,
										 '0' when others;

end Behavioral;

