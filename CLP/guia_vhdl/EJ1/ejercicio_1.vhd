library IEEE;
use IEEE.std_logic_1164.all;

-- Declaracion de la entidad
entity ejercicio_1 is
	port(
		a_in: in std_logic;
		b_in: in std_logic;
		c_in: in std_logic;
		c_out: out std_logic;
		s_out: out std_logic
	);
end;

architecture ejercicio_1_tb of ejercicio_1 is

-- Parte declarativa de la arquitectura
begin

-- Parte descriptiva (indica el comportamiento)
	s_out <= a_in xor b_in xor c_in;
	c_out <= (a_in and b_in) or (a_in and c_in) or (b_in and c_in);

end;