library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity i2c_audio_tb is
end;

architecture i2c_audio_tb_arch of i2c_audio_tb is
    
    component i2c_audio is
        generic(
            DATA_WIDTH: natural := 24
        );
        port(
            clk_i: in std_logic;
            rst_i: in std_logic;
            i2c_sclk: out std_logic;
            i2c_sdat: inout std_logic
        );
    end component;

    signal clk_tb: std_logic := '0';
    signal rst_tb: std_logic := '0';
    signal i2c_sclk_tb: std_logic;
    signal i2c_sdat_tb: std_logic;
    
    begin
       
        clk_tb <= not clk_tb after 20 ns;
        rst_tb <= '1' after 30 ns;        

        DUT: i2c_audio
        port map(
            clk_i => clk_tb,
            rst_i => rst_tb,
            i2c_sclk => i2c_sclk_tb,
            i2c_sdat => i2c_sdat_tb
        );

end i2c_audio_tb_arch;