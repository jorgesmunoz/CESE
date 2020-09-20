library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Declaracion de la entidad
entity SumRes4bit is
	generic(
		N: natural:= 4
	);
	port(
		aNum_in: in std_logic_vector(N-1 downto 0);
		bNum_in: in std_logic_vector(N-1 downto 0);
		carry_in: in std_logic;
		srEnable_in: in std_logic;
		carry_out: out std_logic;
		res_out: out std_logic_vector(N-1 downto 0)
	);
end;

architecture SumRes4bit_arch of SumRes4bit is

-- Parte declarativa de la arquitectura
	signal auxVector: std_logic_vector(N downto 0);

-- Parte descriptiva (indica el comportamiento)
begin
	auxVector(0) <= carry_in;
	carry_out <= auxVector(N);
	
	SumRes4bit: for i in 0 to N-1 generate
		SumRes: entity work.SumRes1bit
			port map(
				a_in => aNum_in(i),
				b_in => bNum_in(i),
				c_in => auxVector(i),
				sr_in => srEnable_in,
				c_out => auxVector(i+1),
				s_out => res_out(i)
			);
	end generate;
end;