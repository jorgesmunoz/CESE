library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cont4bits_VHD is
end;

architecture cont4bits_VHD_arch of cont4bits_VHD is
    signal enable_tb: std_logic := '0';
    signal clk_tb: std_logic := '0';
    signal and_tb: std_logic;
    signal cont_tb: std_logic;

    begin
        clk_tb <= not clk_tb after 10 ns;
        enable_tb <= '1' after 30 ns;

        dut: entity work.cont4bits
            port map(
                enable_in => enable_tb,
                clk_in => clk_tb,
                and_out => and_tb,
                cont_out => cont_tb              
            );
        
    end cont4bits_VHD_arch;
