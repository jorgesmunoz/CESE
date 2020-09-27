library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counterBCD1dig is
    generic(
        N: natural := 4
    );
    port(
        enable_in: in std_logic;
        rst_in: in std_logic;
        clk_in: in std_logic;
        q_out: out std_logic_vector(N-1 downto 0)
    );
end;

architecture counterBCD1dig_arch of counterBCD1dig is
    signal aux_q: std_logic_vector(N-1 downto 0);

    begin
        process(clk_in) is
            variable counter: unsigned(N-1 downto 0);
            begin
                if rising_edge(clk_in) then
                    if rst_in = '1' then
                        counter := (N-1 downto 0 => '0');
                    elsif enable_in = '1' then
                        if counter < 9 then
                            counter := counter + 1;
                        else
                            counter := (N-1 downto 0 => '0');
                        end if;
                    end if;
                end if;
                q_out <= std_logic_vector(counter);
            end process;   
    end counterBCD1dig_arch;