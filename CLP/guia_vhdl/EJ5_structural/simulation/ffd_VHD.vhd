
library ieee;
use ieee.std_logic_1164.all;

entity ffd_VHD is
end;

architecture ffd_VHD_arch of ffd_VHD is

    signal d_tb: std_logic := '0';
    signal clk_tb: std_logic := '0';
    signal q_tb: std_logic;

    begin
        clk_tb <= not clk_tb after 10 ns;
        d_tb <= not d_tb after 20 ns;

        dut: entity work.ffd
            port map(
                d => d_tb,
                clk => clk_tb,
                q => q_tb
            );
    end ffd_VHD_arch;