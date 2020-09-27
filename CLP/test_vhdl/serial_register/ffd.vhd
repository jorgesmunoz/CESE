library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ffd is
    port(
        d_in: in std_logic;
        clk_in: in std_logic;
        rst_in: in std_logic;
        q_out: out std_logic
    );
end;

architecture ffd_arch of ffd is
    
    begin
        process(clk_in) is
            begin
                if rising_edge(clk_in) then
                    if (rst_in = '1') then
                        q_out <= '0';
                    else
                        q_out <= d_in;
                    end if;
                end if;
            end process;				 
    end ffd_arch;