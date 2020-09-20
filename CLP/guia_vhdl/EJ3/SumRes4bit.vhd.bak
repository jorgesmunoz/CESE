library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Declaracion de la entidad
entity SumRes1bit is
	port(
		a_in: in std_logic;
		b_in: in std_logic;
		c_in: in std_logic;
		sr_in: in std_logic;
		c_out: out std_logic;
		s_out: out std_logic
	);
end;

architecture SumRes1bit_arch of SumRes1bit is

-- Parte declarativa de la arquitectura

-- Parte descriptiva (indica el comportamiento)
begin
	behavior: process (sr_in, a_in, b_in, c_in) is
	begin
		if (sr_in = '1') then
			s_out <= a_in xor b_in xor c_in;
			c_out <= (a_in and b_in) or (a_in and c_in) or (b_in and c_in);
		else
			s_out <= a_in xor b_in xor c_in;
			c_out <= (not a_in and b_in) or (not a_in and c_in) or (b_in and c_in);
		end if;
	end process behavior;
end;