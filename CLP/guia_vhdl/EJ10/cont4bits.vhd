library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cont4bits is
    port(
        enable_in: in std_logic;
        clk_in: in std_logic;
        and_out: out std_logic;
        cont_out: out std_logic
    );
end;

architecture cont1bit_arch of cont4bits is
    signal aux_q: std_logic;
    signal aux_d: std_logic;
    --signal aux_cont: std_logic;
    --signal aux_xor: std_logic;
    signal aux_and: std_logic;	 
    
    begin
        aux_d <= enable_in xor aux_q;
        and_out <= enable_in and aux_q;
        cont_out <= aux_q;
		cont_inst0: entity work.ffd
            port map(
                d => aux_d,
                clk => clk_in,
                q => aux_q
            );
        
    end cont1bit_arch;