library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter_VHD is
end counter_VHD;

architecture counter_VHD_arch of counter_VHD is

    constant N_tb: natural := 8;
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
            enable_counter_in => enable_tb,
            rst_counter_in => rst_tb,
            clk_counter_in => clk_tb,
            q_counter_out => q_tb
        );
        clk_tb <= not clk_tb after 10 ns;
        enable_tb <= '1' after 30 ns;
        rst_tb <= '0' after 50 ns;
    
    end counter_VHD_arch;
