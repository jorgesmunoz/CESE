-- library ieee;
-- use ieee.std_logic_1164.all;
-- use ieee.numeric_std.all;

-- entity sin_generator is
--     port(
--         lrck_i: in std_logic
--         bclk_i: in std_logic;
--         rst_i: in std_logic;
--         data_o: out std_logic        
--     );
-- end;

-- architecture sin_generator_arch of sin_generator is
--     constant CLK_REF: integer := 18432000;
--     constant SAMPLE_RATE: integer := 48000;
--     constant DATA_WIDTH: integer := 16;
--     constant CHANNEL: integer := 2;
--     constant SIN_DATA: integer := 48;

--     signal bclk_s: std_logic;
--     signal lrck_s: std_logic;
    
--     begin

--         -- Proceso para ir cambiando de muestra de 16 bits
--         -- mediante el clock DACLRCK
--         bclk_gen: process(clk_i) is
--             variable bclk_div: natural;
--             begin
--                 if falling_edge(clk_i) then
--                     if rst_i = '1' then
--                         bclk_div := 0;
--                         bclk_s <= '0';
--                     elsif (bclk_div >= CLK_REF / (SAMPLE_RATE*DATA_WIDTH*CHANNEL*2) - 1) then
--                         bclk_div := 0;
--                         bclk_s <= not bclk_s;
--                     else 
--                         bclk_div := bclk_div + 1;
--                     end if;
--                 end if;
--             end process;
--             bclk_o <= bclk_s;
        
--         -- Proceso para hacer el envio bit a bit de cada muestra de 16 bits
--         -- mediante el clock BCLK
--         lrck_gen: process(clk_i) is
--             variable lrck_div: natural;
--             begin
--                 if falling_edge(clk_i) then
--                     if rst_i = '1' then
--                         lrck_div := 0;
--                         lrck_s <= '0';
--                     elsif (lrck_div >= CLK_REF / (SAMPLE_RATE*2) - 1) then
--                         lrck_div := 0;
--                         lrck_s <= not lrck_s;
--                     else 
--                         lrck_div := lrck_div + 1;
--                     end if;
--                 end if;
--             end process;
--             lrck_o <= lrck_s;

-- end sin_generator_arch;