library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity BarrelShifter4bits_VHD is
end BarrelShifter4bits_VHD;

architecture BarrelShifter4bits_VHD_arch of BarrelShifter4bits_VHD is

    constant N_tb: natural := 4;
    constant M_tb: natural := 2;
    
    signal word_in_tb: std_logic_vector(N_tb-1 downto 0) := "0110";
    signal sel_in_tb: std_logic_vector(M_tb-1 downto 0) := (M_tb-1 downto 0 => '0');
    signal word_out_tb: std_logic_vector(N_tb-1 downto 0);

    begin
        sel_in_tb(0) <= not sel_in_tb(0) after 20 ns;
        sel_in_tb(1) <= not sel_in_tb(1) after 40 ns;

        BarrelShifter_inst: entity work.BarrelShifter4bits
            port map(
                word_in => word_in_tb,
                sel_in => sel_in_tb,
                word_out => word_out_tb
            );

end architecture;