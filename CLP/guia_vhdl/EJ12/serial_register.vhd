library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity serial_register is
    generic(
        N: natural := 4
    );
    port(
        d_in: in std_logic_vector(N-1 downto 0);
        clk_in: in std_logic;
        rst_in: in std_logic;
        q_out: out std_logic_vector(N-1 downto 0)
    );
end;

architecture serial_register_arch of serial_register is
    begin
        reg: process (clk_in) is
		  begin
            if rising_edge(clk_in) then
                if rst_in = '1' then
                    q_out <= (N-1 downto 0 => '0');
                else
                    q_out <= d_in;
                end if;
            end if;
			end process;
    end serial_register_arch;