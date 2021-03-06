library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter4bits_VHD is
end counter4bits_VHD;

architecture counter4bits_VHD_arch of counter4bits_VHD is

    constant N_tb: natural := 4;
    signal enable_tb: std_logic := '0';
    signal rst_tb: std_logic := '1';
    signal clk_tb: std_logic := '0';
    signal q_tb: std_logic_vector(N_tb-1 downto 0);

    begin
        counter4bits_inst: entity work.counter4bits
        generic map(
            N => N_tb
        )
        port map(
            enable => enable_tb,
            rst => rst_tb,
            clk => clk_tb,
            q => q_tb
        );
        clk_tb <= not clk_tb after 10 ns;
        enable_tb <= '1' after 30 ns;
        rst_tb <= '0' after 50 ns;
    
    end counter4bits_VHD_arch;