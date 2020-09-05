library IEEE;
use IEEE.std_logic_1164.all;

-- Declaracion de la entidad (el testbench no tiene ni entradas ni salidas)
-- Es una entidad vacia
entity neg_tb is
end;

architecture neg_tb_arq of neg_tb is

	-- Parte declarativa de la arquitectura
	-- Se incluye el componente que queremos probar
	-- Se declara el componente
	component neg is
		port(
			a_i: in std_logic;
			b_o: out std_logic;
		);	
	end component;
	
	signal a_tb: std_logic := '0';	-- Arranca en cero
	signal b_tb: std_logic;
	
begin

	-- Se asignan valores cambiantes a tb (testbench)
	-- A a_tb se le asigna el valor '1' luego de 100 ns y un '0' luego de 200 ns iniciada la simulacion	
	a_tb <= '1' after 100 ns, '0' after 200 ns;
	
	-- Si se quiere hacer periodico se hace lo siguiente (descomentar y comentar la linea anterior)
	--a_tb <= not a_tb after 10 ns;
	
	-- Parte descriptiva (se instancia el componente en el banco de pruebas)
	-- DUT: es un etiqueta (Device Under Test)
	DUT: neg
		port map(
			a_i => ,a_tb,
			b_o => b_tb
		);

end;