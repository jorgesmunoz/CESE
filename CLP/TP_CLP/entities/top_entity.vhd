library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top_entity is
    port(
        CLOCK_50: in std_logic;
        CLOCK_18: in std_logic;
        SW: in std_logic_vector(0 downto 0);
        I2C_SCLK: out std_logic;
        I2C_SDAT: inout std_logic;
        AUD_BCLK: out std_logic;
        AUD_DACLRCK: out std_logic;
        AUD_DACDAT: out std_logic
    );
end;

architecture top_entity_arch of top_entity is

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

    component audio_dac is
        port(
            clk_i: in std_logic;
            rst_i: in std_logic;
            bclk_o: out std_logic;
            lrck_o: out std_logic;
            data_o: out std_logic
        );
    end component;
    
    constant N_tb: natural := 24;
    signal ack_signal: std_logic;
    signal i2c_clk_signal: std_logic;
    signal go_signal: std_logic;
    signal i2c_data_signal: std_logic_vector(N_tb-1 downto 0);
    signal reset: std_logic;
    
    begin

        reset <= SW(0);
        
        u0: i2c_audio
        port map(
            clk_i => CLOCK_50,
            rst_i => reset,
            i2c_sclk => I2C_SCLK,
            i2c_sdat => I2C_SDAT
        );

        u1: audio_dac
        port map(
            clk_i => CLOCK_18,
            rst_i => reset,
            bclk_o => AUD_BCLK,
            lrck_o => AUD_DACLRCK,
            data_o => AUD_DACDAT
        );


end top_entity_arch;