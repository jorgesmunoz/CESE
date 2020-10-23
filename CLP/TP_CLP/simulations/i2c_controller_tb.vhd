library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity i2c_controller_tb is
end;

architecture i2c_controller_tb_arch of i2c_controller_tb is

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
    
    constant N_tb: natural := 24;
    signal clk_tb: std_logic := '0';
    signal rst_tb: std_logic := '0';
    signal go_tb: std_logic := '0';
    signal i2c_data_tb: std_logic_vector(N_tb-1 downto 0) := (N_tb-1 downto 0 => '0');
    signal end_tb: std_logic;
    signal ack_tb: std_logic;
    signal i2c_sclk_tb: std_logic;
    signal i2c_sdat_tb: std_logic;
    
    begin
       
        clk_tb <= not clk_tb after 50 ns;
        rst_tb <= '1' after 30 ns;
        go_tb <= not go_tb after 4000 ns;
        i2c_data_tb <= x"3C3C3C" after 80 ns;

        DUT: i2c_controller
        port map(
            clk_i => clk_tb,
            rst_i => rst_tb,
            go_i => go_tb,
            i2c_data_i => i2c_data_tb,
            end_o => end_tb,
            ack_o => ack_tb,
            i2c_sclk_o => i2c_sclk_tb,
            i2c_sdat_io => i2c_sdat_tb
        );

end i2c_controller_tb_arch;
