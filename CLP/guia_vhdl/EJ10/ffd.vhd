library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ffd is
    port(
        d: in std_logic;
        clk: in std_logic;
        q: out std_logic
    );
end;

architecture ffd_arch of ffd is
    signal aux_a: std_logic;
    signal aux_b: std_logic;
	signal aux_q: std_logic;
    signal aux_qb: std_logic;

    begin
        aux_a <= d nand clk;
        aux_b <= (not d) nand clk;
        aux_q <= aux_a nand aux_qb;
        aux_qb <= aux_b nand aux_q;
        q <= aux_q;
        
    end ffd_arch;