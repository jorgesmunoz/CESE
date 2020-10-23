library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity i2c_audio is
    generic(
            DATA_WIDTH: natural := 24
        );
    port(
        clk_i: in std_logic;
        rst_i: in std_logic;
        i2c_sclk: out std_logic;
        end_end: out std_logic;
        i2c_sdat: inout std_logic
    );
end;

architecture i2c_audio_arch of i2c_audio is

    component i2c_audio_config is
        generic(
            DATA_WIDTH: natural := 24
        );
        port(
            clk_i: in std_logic;
            rst_i: in std_logic;
            end_i: in std_logic;
            ack_i: in std_logic;
            i2c_clk_o: out std_logic;
            go_o: out std_logic;
            i2c_data_o: out std_logic_vector(DATA_WIDTH-1 downto 0)
        );
    end component;

    component i2c_controller is
        generic(
            DATA_WIDTH: natural := 24
        );
        port(
            clk_i: in std_logic;
            rst_i: in std_logic;
            go_i: in std_logic;
            i2c_data_i: in std_logic_vector(DATA_WIDTH-1 downto 0);
            end_o: out std_logic;
            ack_o: out std_logic;
            i2c_sclk_o: out std_logic;
            i2c_sdat_io: inout std_logic
        );
    end component;
    
    signal end_signal: std_logic;
    signal ack_signal: std_logic;
    signal i2c_clk_signal: std_logic;
    signal go_signal: std_logic;
    signal i2c_data_signal: std_logic_vector(DATA_WIDTH-1 downto 0);
    
    begin
        end_end <= end_signal;


        u0: i2c_audio_config
        port map(
            clk_i => clk_i,
            rst_i => rst_i,
            end_i => end_signal,
            ack_i => ack_signal,
            i2c_clk_o => i2c_clk_signal,
            go_o => go_signal,
            i2c_data_o => i2c_data_signal
        );

        u1: i2c_controller
        port map(
            clk_i => i2c_clk_signal,
            rst_i => rst_i,
            go_i => go_signal,
            i2c_data_i => i2c_data_signal,
            end_o => end_signal,
            ack_o => ack_signal,
            i2c_sclk_o => i2c_sclk,
            i2c_sdat_io => i2c_sdat
        );


end i2c_audio_arch;