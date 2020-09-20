library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ffd is
    port(
        d: in std_logic;
        rst: in std_logic;
        clk: in std_logic;
        q: out std_logic
    );
end;

architecture ffd_arch of ffd is
    begin
        process(clk, rst, d) is
            begin
                if rising_edge(clk) then
                    if rst = '1' then
                        q <= '0';
                    else
                        q <= d;
                    end if;
                end if;
        end process;
    end ffd_arch; 