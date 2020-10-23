library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sin_genrator_tb is
end;

architecture sin_genrator_tb_arch of sin_genrator_tb is

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

    signal clk_tb: std_logic := '0';
    signal rst_tb: std_logic := '0';
    signal end_tb: std_logic := '0';
    signal ack_tb: std_logic;
    signal i2c_clk: std_logic;
    signal go: std_logic;
    signal i2c_data_tb: std_logic_vector(DATA_WIDTH-1 downto 0);

    begin
       
        bclk_tb <= not bclk_tb after 326 ns;
        lrck_tb <= not lrck_tb after 10 ms;
        rst_tb <= '1' after 30 ns;        

        DUT: sin_generator
        port map(
            bclk_s => bclk_tb,
            lrck_s => lrck_tb,
            rst_i => rst_tb,
            data_o => data_tb
        );

end sin_genrator_tb_arch;
