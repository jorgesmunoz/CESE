library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter4bits is
    generic(
        N: natural := 4
    );
    port(
        enable: in std_logic;
        rst: in std_logic;
        clk: in std_logic;
        q: out std_logic_vector(N-1 downto 0)
    );
end;

architecture counter4bits_arch of counter4bits is
    signal aux_q: std_logic_vector(N-1 downto 0);

    begin
        process(clk) is
            begin
                if rising_edge(clk) then
                    if rst = '1' then
                        aux_q <= (N-1 downto 0 => '0');
                    elsif enable = '1' then
                        aux_q <= std_logic_vector(unsigned(aux_q) + 1);
                    end if;
                end if;
            end process;
				q <= aux_q;
    
    end counter4bits_arch;