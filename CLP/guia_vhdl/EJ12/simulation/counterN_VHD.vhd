library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--use ieee.std_logic_unsigned.all;

entity counterNbit_VHD is
end;

architecture counterNbit_VHD_arch of counterNbit_VHD is
    constant N_tb: natural := 16;
    signal enable_tb: std_logic := '0';
    signal rst_tb: std_logic := '1';
    signal clk_tb: std_logic := '0';
    signal q_tb: std_logic_vector(N_tb-1 downto 0);

    begin
	    clk_tb <= not clk_tb after 10 ns;
        enable_tb <= '1' after 50 ns;
        rst_tb <= '0' after 30 ns;

        dut: entity work.counterNbit
        generic map(
            N => N_tb
        )
        port map(
            enable_counter_in => enable_tb,
            rst_counter_in => rst_tb,
            clk_counter_in => clk_tb,
            q_counter_out => q_tb
        );

    end counterNbit_VHD_arch;
