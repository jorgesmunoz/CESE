library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top_entity_tb is
end;

architecture top_entity_tb_arch of top_entity_tb is

    component top_entity is
        port(
            CLOCK_50: in std_logic;
            CLOCK_18: in std_logic;
            rst_i: in std_logic;
            I2C_SCLK: out std_logic;
            I2C_SDAT: inout std_logic;
            AUD_BCLK: out std_logic;
            AUD_DACLRCK: out std_logic;
            AUD_DACDAT: out std_logic
        );
    end component;

    signal CLOCK_50_tb: std_logic := '0';
    signal CLOCK_18_tb: std_logic := '0';
    signal rst_tb: std_logic := '0';
    signal I2C_SCLK_tb: std_logic;
    signal I2C_SDAT_tb: std_logic;
    signal AUD_BCLK_tb: std_logic;
    signal AUD_DACLRCK_tb: std_logic;
    signal AUD_DACDAT_tb: std_logic;
    
    begin
       
        CLOCK_50_tb <= not CLOCK_50_tb after 20 ns;
        CLOCK_18_tb <= not CLOCK_18_tb after 55 ns;
        rst_tb <= '1' after 55 ns;

        DUT: top_entity
        port map(
            CLOCK_50 => CLOCK_50_tb,
            CLOCK_18 => CLOCK_18_tb,
            rst_i => rst_tb,
            I2C_SCLK => I2C_SCLK_tb,
            I2C_SDAT => I2C_SDAT_tb,
            AUD_BCLK => AUD_BCLK_tb,
            AUD_DACLRCK => AUD_DACLRCK_tb,
            AUD_DACDAT => AUD_DACDAT_tb
        );

end top_entity_tb_arch;