library ieee;
use ieee.std_logic_1164.all;

entity ffd is
    port(
        d: in std_logic;
        clk: in std_logic;
        q: inout std_logic
    );
end;

architecture ffd_arch of ffd is
    signal aux_a: std_logic;
    signal aux_b: std_logic;
    signal aux_qb: std_logic;

    begin
        aux_a <= d nand clk;
        aux_b <= (not d) nand clk;
        aux_qb <= aux_b nand q;
        q <= aux_a nand aux_qb;        
        
    end ffd_arch; 