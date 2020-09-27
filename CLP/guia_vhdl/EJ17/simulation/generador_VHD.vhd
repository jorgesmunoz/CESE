library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity generador_VHD is
end;

architecture generador_VHD_arch of generador_VHD is
    constant N_tb: natural := 4;
    signal clk_tb: std_logic := '0';
    signal rst_tb: std_logic := '1';
    signal s_tb: std_logic;
    
    begin
        clk_tb <= not clk_tb after 10 ns;
        rst_tb <= '0' after 50 ns;

        dut: entity work.generador
        generic map(
            N => N_tb
        )
        port map(
            clk_in => clk_tb,
            rst_in => rst_tb,
            s_out => s_tb
        );
    end generador_VHD_arch;