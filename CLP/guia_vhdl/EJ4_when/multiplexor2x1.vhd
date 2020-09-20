library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity multiplexor2x1 is
    port(
        signal_in: in std_logic_vector(0 to 1);
        sel_in: in std_logic;
        out_out: out std_logic
    );

end entity;

architecture behav of multiplexor2x1 is
    begin
        out_out <=  signal_in(0) when sel_in = '0' else
                    signal_in(1);
    end architecture;