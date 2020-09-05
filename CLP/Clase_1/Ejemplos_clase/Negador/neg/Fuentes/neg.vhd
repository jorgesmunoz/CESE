library IEEE;
use IEEE.std_logic_1164.all;

-- Declaracion de la entidad
entity neg is
	port(
		a_i: in std_logic;
		b_o: out std_logic;
	);
end;

architecture neg_tb of neg is

-- Parte declarativa de la arquitectura
begin

-- Parte descriptiva (indica el comportamiento)
	b <= not a;

end;