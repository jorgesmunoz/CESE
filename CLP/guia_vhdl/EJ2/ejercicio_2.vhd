library IEEE;
use IEEE.std_logic_1164.all;

entity ejercicio_2 is
	generic(
		N: natural:= 4
	);
	port(
		aSum_in: in std_logic_vector(N-1 downto 0);
		bSum_in: in std_logic_vector(N-1 downto 0);
		carry_in: in std_logic;
		sSum_out: out std_logic_vector(N-1 downto 0);
		carry_out: out std_logic
	);
end;

architecture sumNbit of ejercicio_2 is
	signal auxVector: std_logic_Vector(N downto 0);
begin
	auxVector(0) <= carry_in;
	carry_out <= auxVector(N);
	
	sumNbit_gen: for i in 0 to N-1 generate
		sum_inst: entity work.sum1b
			port map(
				a_i => aSum_in(i),
				b_i => bSum_in(i),
				ci_i => auxVector(i),
				s_o => sSum_out(i),
				co_o => auxVector(i+1)
			);
	end generate;
end;