library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity multiplexor2x1_VHD is
end multiplexor2x1_VHD;

architecture behav of multiplexor2x1_VHD is

-- Parte declarativa de la arquitectura	
    signal signal_tb: std_logic_vector(0 to 1) := (0 to 1 => '0');
    signal sel_tb: std_logic := '0';
    signal out_tb: std_logic;
-- Parte descriptiva (indica el comportamiento)
begin
        signal_tb <= "01" after 20 ns, 
                     "10" after 40 ns, 
                     "11" after 60 ns,
                     "00" after 80 ns, 
                     "01" after 100 ns, 
                     "10" after 120 ns,
                     "11" after 140 ns;
        sel_tb <= not sel_tb after 60 ns;

    dut: entity work.multiplexor2x1
    port map(
        signal_in => signal_tb,
        sel_in => sel_tb,
        out_out => out_tb
    );

end;

