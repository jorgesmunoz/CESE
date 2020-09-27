library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity generador is
    generic(
        N: natural := 4
    );
    port(
        clk_in: in std_logic;
        rst_in: in std_logic;
        s_out: out std_logic
    );
end;

architecture generador_arch of generador is
    signal aux_out: std_logic;
    
    begin
        gen_proc: process (clk_in) is
            --aux_out <= '0';
            variable counter: natural;
            begin
                if rising_edge(clk_in) then
                    if rst_in = '1' then
                        counter := 0;
                        aux_out <= '0';
                    elsif counter = N then
                        aux_out <= '1';
                        counter := 0;
                    else
                        counter := counter + 1;
                        aux_out <= '0';
                    end if;
                end if;
            end process;
			s_out <= '1' when aux_out = '1' else '0';
    end generador_arch;