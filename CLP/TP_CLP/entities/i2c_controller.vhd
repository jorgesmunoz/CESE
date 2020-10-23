library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity i2c_controller is
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
        --sdo_o: out std_logic;
        i2c_sclk_o: out std_logic;
        i2c_sdat_io: inout std_logic
        --sd_Counter_i
    );
end;

architecture i2c_controller_arch of i2c_controller is
    constant CLK_REF: integer := 18432000;
    constant SAMPLE_RATE: integer := 48000;
    constant CHANNEL: integer := 2;
    constant SINE_DATA: integer := 48;
    constant SINE_RANGE: integer := 65536;

    constant SERIAL_DATA: integer := 64;

    signal i2c_data: std_logic_vector(DATA_WIDTH-1 downto 0);
    signal serial_counter: integer range 0 to SERIAL_DATA-1;
    signal sdo_o: std_logic;
    signal sclk: std_logic;
    signal ack1: std_logic;
    signal ack2: std_logic;
    signal ack3: std_logic;

    
    begin
        i2c_sdat_io <= sdo_o;
        ack_o <= ack1 or ack2 or ack3;

        --Clock de sincronismo I2C
        i2c_sclk_o <=   (sclk or '0') when serial_counter < 4 else
                        (sclk or (not clk_i)) when serial_counter >= 4 else
                        (sclk or '0') when serial_counter > 30 else
                        (sclk or '0');                
        
        --Procesos
        i2c_counter: process(clk_i) is
            begin
                if falling_edge(clk_i) then
                    if rst_i = '0' then
                        serial_counter <= 0;
                    elsif go_i = '0' then
                        serial_counter <= 0;
                    elsif serial_counter < SERIAL_DATA-1 then
                        serial_counter <= serial_counter + 1;
                    else
                        serial_counter <= 0;
                    end if;
                end if;
            end process;

        sdata_out: process(clk_i) is
            begin
                if falling_edge(clk_i) then
                    if rst_i = '0' then
                        sclk <= '1';
                        sdo_o <= '1';
                        end_o <= '1';
                        ack1 <= '0';
                        ack2 <= '0';
                        ack3 <= '0';
                    else
                        case_sdo: case serial_counter is
                            --Condicion de start del codec WM8761
                            when 0 =>   sclk <= '1';
                                        sdo_o <= '1';
                                        end_o <= '0';
                                        ack1 <= '0';
                                        ack2 <= '0';
                                        ack3 <= '0';
                            --Condicion de start
                            when 1 =>   i2c_data <= i2c_data_i;
                                        sdo_o <= '0';
                            when 2 =>   sclk <= '0';
                            --Address del modulo WM8761 (0x34)
                            --Ultimo bit de escritura (el modulo solo funciona a modo write)
                            when 3  =>   sdo_o <= i2c_data(23);
                            when 4  =>   sdo_o <= i2c_data(22);
                            when 5  =>   sdo_o <= i2c_data(21);
                            when 6  =>   sdo_o <= i2c_data(20);
                            when 7  =>   sdo_o <= i2c_data(19);
                            when 8  =>   sdo_o <= i2c_data(18);
                            when 9  =>   sdo_o <= i2c_data(17);
                            when 10 =>   sdo_o <= i2c_data(16);
                            --Recibe ACK de address
                            when 11 =>   sdo_o <= '1';
                            --Direccion de registro
                            when 12 =>   sdo_o <= i2c_data(15);
                                         ack1  <= i2c_sdat_io;
                            when 13 =>   sdo_o <= i2c_data(14);
                            when 14 =>   sdo_o <= i2c_data(13);
                            when 15 =>   sdo_o <= i2c_data(12);
                            when 16 =>   sdo_o <= i2c_data(11);
                            when 17 =>   sdo_o <= i2c_data(10);
                            when 18 =>   sdo_o <= i2c_data(9);
                            when 19 =>   sdo_o <= i2c_data(8);
                            --Recibe ACK de registro
                            when 20 =>   sdo_o <= '1';
                            --Dato de configuracion del registro
                            when 21 =>   sdo_o <= i2c_data(7);
                                         ack2  <= i2c_sdat_io;
                            when 22 =>   sdo_o <= i2c_data(6);
                            when 23 =>   sdo_o <= i2c_data(5);
                            when 24 =>   sdo_o <= i2c_data(4);
                            when 25 =>   sdo_o <= i2c_data(3);
                            when 26 =>   sdo_o <= i2c_data(2);
                            when 27 =>   sdo_o <= i2c_data(1);
                            when 28 =>   sdo_o <= i2c_data(0);
                            --Recibe ACK de dato
                            when 29 =>   sdo_o <= '1';
                            --Condicion de stop
                            when 30 =>   sdo_o <= '0';
                                         sclk  <= '0';
                                         ack3  <= i2c_sdat_io;
                            when 31 =>   sclk  <= '1';
                            when 32 =>   sdo_o <= '1';
                                         end_o <= '1';
                                         ack1 <= '0';
                                         ack2 <= '0';
                                         ack3 <= '0';
                            when others =>  sdo_o <= '1';
                                            end_o <= '1'; 
                                            ack1 <= '0';
                                            ack2 <= '0';
                                            ack3 <= '0';                   

                        end case;
                    end if;
                end if;
            end process;

end i2c_controller_arch;