library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity i2c_audio_config is
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
end;

architecture i2c_audio_config_arch of i2c_audio_config is
    constant CLK_REF: integer := 50000000;
    constant I2C_FREQ: integer := 20000;
    constant REG_RANGE: integer := 51;
    constant STREAM_DATA_RANGE: integer := 16;
    constant STREAM_RANGE: integer := 3;
    
    signal i2c_clk: std_logic;
    signal reg_counter: integer range 0 to REG_RANGE-1;
    signal stream_fsm: integer range 0 to STREAM_RANGE-1;
    signal stream_data: std_logic_vector(STREAM_DATA_RANGE-1 downto 0);
    
    begin

        -- Proceso para generacion de bit clock (BCLK)
        i2c_clk_gen: process(clk_i) is
            variable i2c_clk_counter: natural;
            begin
                if rising_edge(clk_i) then
                    if rst_i = '0' then
                        i2c_clk_counter := 0;
                        i2c_clk <= '0';
                    elsif (i2c_clk_counter < (CLK_REF / I2C_FREQ)) then
                        i2c_clk_counter := i2c_clk_counter + 1;
                    else 
                        i2c_clk_counter := 0;
                        i2c_clk <= not i2c_clk;
                    end if;
                end if;
            end process;
            i2c_clk_o <= i2c_clk;

        
        i2c_clk_process: process(i2c_clk) is
            variable reg_index: natural;
            begin
                if rising_edge(i2c_clk) then
                    if rst_i = '0' then
                        reg_counter <= 0;
                        stream_fsm <= 0;
                        go_o <= '0';
                    elsif (reg_counter < REG_RANGE) then
                        case_reg: case stream_fsm is
                            
                            when 0 =>   i2c_data_o <= "00110100" & stream_data;
                                        go_o <= '1';
                                        stream_fsm <= 1;
                            when 1 =>   if end_i = '1' then
                                            if ack_i = '0' then
                                                stream_fsm <= 2;
                                            else
                                                stream_fsm <= 0;
                                                go_o <= '0';
                                            end if;
                                        end if;
                            when 2 =>   reg_counter <= reg_counter + 1;
                                        stream_fsm <= 0;
                        end case;
                    end if;
                end if;
            end process;
        

        with reg_counter select
            stream_data <=  x"001A" when 1,
                            x"021A" when 2,
                            x"047B" when 3,
                            x"067B" when 4,
                            x"08F8" when 5,
                            x"0A06" when 6,
                            x"0C00" when 7,
                            x"0E01" when 8,
                            x"1002" when 9,
                            x"1201" when 10,
                            x"0000" when others;

end i2c_audio_config_arch;
