library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity audio_dac is
    port(
        clk_i: in std_logic;
        rst_i: in std_logic;
        bclk_o: out std_logic;
        lrck_o: out std_logic;
        data_o: out std_logic        
    );
end;

architecture audio_dac_arch of audio_dac is
    constant CLK_REF: integer := 18432000;
    constant SAMPLE_RATE: integer := 48000;
    constant DATA_WIDTH: integer := 16;
    constant CHANNEL: integer := 2;
    constant SINE_DATA: integer := 48;
    constant SINE_RANGE: integer := 65536;
    

    signal bclk_s: std_logic := '0';
    signal lrck_s: std_logic := '0';
    signal sin_out: std_logic_vector(DATA_WIDTH-1 downto 0);
    signal sin_counter: integer range 0 to SINE_DATA-1;
    signal sel_counter: integer range 0 to DATA_WIDTH-1;
    
    begin

        -- Proceso para generacion de bit clock (BCLK)
        bclk_gen: process(clk_i) is
            variable bclk_div: natural;
            begin
                if falling_edge(clk_i) then
                    if rst_i = '0' then
                        bclk_div := 0;
                        bclk_s <= '0';
                    elsif (bclk_div >= CLK_REF / (SAMPLE_RATE*DATA_WIDTH*CHANNEL*2) - 1) then
                        bclk_div := 0;
                        bclk_s <= not bclk_s;
                    else 
                        bclk_div := bclk_div + 1;
                    end if;
                end if;
            end process;
            bclk_o <= bclk_s;
        
        -- Proceso para generacion de clock DAC (DACLRCK)
        lrck_gen: process(clk_i) is
            variable lrck_div: natural;
            begin
                if falling_edge(clk_i) then
                    if rst_i = '0' then
                        lrck_div := 0;
                        lrck_s <= '0';
                    elsif (lrck_div >= CLK_REF / (SAMPLE_RATE*2) - 1) then
                        lrck_div := 0;
                        lrck_s <= not lrck_s;
                    else 
                        lrck_div := lrck_div + 1;
                    end if;
                end if;
            end process;
            lrck_o <= not lrck_s;

        
        sin_ctrl: process(bclk_s) is
            begin
                if falling_edge(bclk_s) then
                    if rst_i = '0' then
                        sel_counter <= 0;
                    elsif sel_counter < DATA_WIDTH-1 then
                        sel_counter <= sel_counter + 1;
                    else
                        sel_counter <= 0;
                    end if;
                end if;
                data_o <= sin_out(sel_counter);
            end process;

        sin_select: process(lrck_s) is
            begin
                if falling_edge(lrck_s) then
                    if rst_i = '0' then
                        sin_counter <= 0;
                    elsif sin_counter < SINE_DATA-1 then
                        sin_counter <= sin_counter + 1;
                    else
                        sin_counter <= 0;
                    end if;
                end if;
            end process;

        with sin_counter select
            sin_out <=  std_logic_vector(to_signed(0, DATA_WIDTH)) when 0,
                        std_logic_vector(to_signed(4276, DATA_WIDTH)) when 1,
                        std_logic_vector(to_signed(8480, DATA_WIDTH)) when 2,
                        std_logic_vector(to_signed(12539, DATA_WIDTH)) when 3,
                        std_logic_vector(to_signed(16383, DATA_WIDTH)) when 4,
                        std_logic_vector(to_signed(19947, DATA_WIDTH)) when 5,
                        std_logic_vector(to_signed(23169, DATA_WIDTH)) when 6,
                        std_logic_vector(to_signed(25995, DATA_WIDTH)) when 7,
                        std_logic_vector(to_signed(28377, DATA_WIDTH)) when 8,
                        std_logic_vector(to_signed(30272, DATA_WIDTH)) when 9,
                        std_logic_vector(to_signed(31650, DATA_WIDTH)) when 10,
                        std_logic_vector(to_signed(32486, DATA_WIDTH)) when 11,
                        std_logic_vector(to_signed(32767, DATA_WIDTH)) when 12,
                        std_logic_vector(to_signed(32486, DATA_WIDTH)) when 13,
                        std_logic_vector(to_signed(31650, DATA_WIDTH)) when 14,
                        std_logic_vector(to_signed(30272, DATA_WIDTH)) when 15,
                        std_logic_vector(to_signed(28377, DATA_WIDTH)) when 16,
                        std_logic_vector(to_signed(25995, DATA_WIDTH)) when 17,
                        std_logic_vector(to_signed(23169, DATA_WIDTH)) when 18,
                        std_logic_vector(to_signed(19947, DATA_WIDTH)) when 19,
                        std_logic_vector(to_signed(16383, DATA_WIDTH)) when 20,
                        std_logic_vector(to_signed(12539, DATA_WIDTH)) when 21,
                        std_logic_vector(to_signed(8480, DATA_WIDTH)) when 22,
                        std_logic_vector(to_signed(4276, DATA_WIDTH)) when 23,
                        std_logic_vector(to_signed(0, DATA_WIDTH)) when 24,
                        std_logic_vector(to_signed(61259, DATA_WIDTH)) when 25,
                        std_logic_vector(to_signed(57056, DATA_WIDTH)) when 26,
                        std_logic_vector(to_signed(52997, DATA_WIDTH)) when 27,
                        std_logic_vector(to_signed(49153, DATA_WIDTH)) when 28,
                        std_logic_vector(to_signed(45589, DATA_WIDTH)) when 29,
                        std_logic_vector(to_signed(42366, DATA_WIDTH)) when 30,
                        std_logic_vector(to_signed(39540, DATA_WIDTH)) when 31,
                        std_logic_vector(to_signed(37159, DATA_WIDTH)) when 32,
                        std_logic_vector(to_signed(35263, DATA_WIDTH)) when 33,
                        std_logic_vector(to_signed(33885, DATA_WIDTH)) when 34,
                        std_logic_vector(to_signed(33049, DATA_WIDTH)) when 35,
                        std_logic_vector(to_signed(32768, DATA_WIDTH)) when 36,
                        std_logic_vector(to_signed(33049, DATA_WIDTH)) when 37,
                        std_logic_vector(to_signed(33885, DATA_WIDTH)) when 38,
                        std_logic_vector(to_signed(35263, DATA_WIDTH)) when 39,
                        std_logic_vector(to_signed(37159, DATA_WIDTH)) when 40,
                        std_logic_vector(to_signed(39540, DATA_WIDTH)) when 41,
                        std_logic_vector(to_signed(42366, DATA_WIDTH)) when 42,
                        std_logic_vector(to_signed(45589, DATA_WIDTH)) when 43,
                        std_logic_vector(to_signed(49152, DATA_WIDTH)) when 44,
                        std_logic_vector(to_signed(52997, DATA_WIDTH)) when 45,
                        std_logic_vector(to_signed(57056, DATA_WIDTH)) when 46,
                        std_logic_vector(to_signed(61259, DATA_WIDTH)) when 47;

end audio_dac_arch;
