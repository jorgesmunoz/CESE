library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity SumRes1bit_VHD is
end SumRes1bit_VHD;

-- -- Declaracion de la entidad
-- entity SumRes1bit is
-- 	port(
-- 		a_in: in std_logic;
-- 		b_in: in std_logic;
-- 		c_in: in std_logic;
-- 		sr_in: in std_logic;
-- 		c_out: out std_logic;
-- 		s_out: out std_logic
-- 	);
-- end;

architecture behav of SumRes1bit_VHD is

-- Parte declarativa de la arquitectura
	
    signal a_tb: std_logic := '0';
    signal b_tb: std_logic := '0';
    signal ci_tb: std_logic := '0';
    signal sr_tb: std_logic := '0';
    signal co_tb: std_logic;
    signal s_tb: std_logic;
-- Parte descriptiva (indica el comportamiento)
begin
        a_tb <= not a_tb after 20 ns;
        b_tb <= not b_tb after 40 ns;
        ci_tb <= not ci_tb after 80 ns;
        sr_tb <= not sr_tb after 160 ns;


    dut: entity work.SumRes1bit
    generic map(
        N => N_tb
    );
    port map(
        a_in => a_tb,
        b_in => b_tb,
        c_in => ci_tb,
        sr_in => sr_tb,
        c_out => co_tb,
        s_out => s_tb
    );

end;
