library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity audio_dac_tb is
end;

architecture audio_dac_tb_arch of audio_dac_tb is

    component audio_dac is
        port(
            clk_i: in std_logic;
            rst_i: in std_logic;
            bclk_o: out std_logic;
            lrck_o: out std_logic;
            data_o: out std_logic        
        );
    end component;

    signal clk_tb: std_logic := '0';
    signal rst_tb: std_logic := '0';
    signal bclk_tb: std_logic;
    signal lrck_tb: std_logic;
    signal data_tb: std_logic;
    
    begin

        clk_tb <= not clk_tb after 54 ns;
        rst_tb <= '1' after 30 ns;        

        DUT: audio_dac
        port map(
            clk_i => clk_tb,
            rst_i => rst_tb,
            bclk_o => bclk_tb,
            lrck_o => lrck_tb,
            data_o => data_tb
        );
        

end audio_dac_tb_arch;