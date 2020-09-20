library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg4bits_serie is
	generic(
		N: natural := 4
	);
	port(
		input_in: in std_logic;
		clk_in: in std_logic;
		enable_in: in std_logic;
		rst_in: in std_logic;
		output_out: out std_logic
	);
end;

architecture reg4bits_arch of reg4bits_serie is
	signal auxVector: std_logic_vector(N downto 0);
	signal clk_int: std_logic;

	begin
		auxVector(0) <= input_in;
		output_out <= auxVector(N);

		reg4bits_gen: for i in 0 to N-1 generate
			reg_inst: entity work.ffd
				port map(
					d => auxVector(i),
					clk => clk_int,
					rst => rst_in,
					q => auxVector(i+1)
				);
		end generate;
		
		gate_inst: entity work.gate
			port map(
				clk_gate => clk_in,
				enable => enable_in,
				clk_out => clk_int	
			);
end;