-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 20.1.0 Build 711 06/05/2020 SJ Lite Edition"

-- DATE "10/19/2020 00:40:40"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_ASDO_DATA1~	=>  Location: PIN_F4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_FLASH_nCE_nCSO~	=>  Location: PIN_E2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DCLK~	=>  Location: PIN_P3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DATA0~	=>  Location: PIN_N7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCEO~	=>  Location: PIN_P28,	 I/O Standard: 2.5 V,	 Current Strength: 8mA


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~padout\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~padout\ : std_logic;
SIGNAL \~ALTERA_DATA0~~padout\ : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_DATA0~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	audio_dac IS
    PORT (
	clk_i : IN std_logic;
	rst_i : IN std_logic;
	bclk_o : BUFFER std_logic;
	lrck_o : BUFFER std_logic;
	data_o : BUFFER std_logic
	);
END audio_dac;

-- Design Ports Information
-- bclk_o	=>  Location: PIN_M23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- lrck_o	=>  Location: PIN_AC14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_o	=>  Location: PIN_P26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk_i	=>  Location: PIN_J1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rst_i	=>  Location: PIN_A19,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF audio_dac IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk_i : std_logic;
SIGNAL ww_rst_i : std_logic;
SIGNAL ww_bclk_o : std_logic;
SIGNAL ww_lrck_o : std_logic;
SIGNAL ww_data_o : std_logic;
SIGNAL \bclk_s~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk_i~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \bclk_o~output_o\ : std_logic;
SIGNAL \lrck_o~output_o\ : std_logic;
SIGNAL \data_o~output_o\ : std_logic;
SIGNAL \clk_i~input_o\ : std_logic;
SIGNAL \clk_i~inputclkctrl_outclk\ : std_logic;
SIGNAL \bclk_gen:bclk_div[0]~1_combout\ : std_logic;
SIGNAL \rst_i~input_o\ : std_logic;
SIGNAL \LessThan0~6_combout\ : std_logic;
SIGNAL \LessThan0~5_combout\ : std_logic;
SIGNAL \LessThan0~7_combout\ : std_logic;
SIGNAL \LessThan0~3_combout\ : std_logic;
SIGNAL \LessThan0~0_combout\ : std_logic;
SIGNAL \LessThan0~1_combout\ : std_logic;
SIGNAL \LessThan0~2_combout\ : std_logic;
SIGNAL \LessThan0~4_combout\ : std_logic;
SIGNAL \bclk_gen:bclk_div[3]~1_combout\ : std_logic;
SIGNAL \bclk_gen:bclk_div[0]~q\ : std_logic;
SIGNAL \bclk_gen:bclk_div[0]~2\ : std_logic;
SIGNAL \bclk_gen:bclk_div[1]~1_combout\ : std_logic;
SIGNAL \bclk_gen:bclk_div[1]~q\ : std_logic;
SIGNAL \bclk_gen:bclk_div[1]~2\ : std_logic;
SIGNAL \bclk_gen:bclk_div[2]~1_combout\ : std_logic;
SIGNAL \bclk_gen:bclk_div[2]~q\ : std_logic;
SIGNAL \bclk_gen:bclk_div[2]~2\ : std_logic;
SIGNAL \bclk_gen:bclk_div[3]~2_combout\ : std_logic;
SIGNAL \bclk_gen:bclk_div[3]~q\ : std_logic;
SIGNAL \bclk_gen:bclk_div[3]~3\ : std_logic;
SIGNAL \bclk_gen:bclk_div[4]~1_combout\ : std_logic;
SIGNAL \bclk_gen:bclk_div[4]~q\ : std_logic;
SIGNAL \bclk_gen:bclk_div[4]~2\ : std_logic;
SIGNAL \bclk_gen:bclk_div[5]~1_combout\ : std_logic;
SIGNAL \bclk_gen:bclk_div[5]~q\ : std_logic;
SIGNAL \bclk_gen:bclk_div[5]~2\ : std_logic;
SIGNAL \bclk_gen:bclk_div[6]~1_combout\ : std_logic;
SIGNAL \bclk_gen:bclk_div[6]~q\ : std_logic;
SIGNAL \bclk_gen:bclk_div[6]~2\ : std_logic;
SIGNAL \bclk_gen:bclk_div[7]~1_combout\ : std_logic;
SIGNAL \bclk_gen:bclk_div[7]~q\ : std_logic;
SIGNAL \bclk_gen:bclk_div[7]~2\ : std_logic;
SIGNAL \bclk_gen:bclk_div[8]~1_combout\ : std_logic;
SIGNAL \bclk_gen:bclk_div[8]~q\ : std_logic;
SIGNAL \bclk_gen:bclk_div[8]~2\ : std_logic;
SIGNAL \bclk_gen:bclk_div[9]~1_combout\ : std_logic;
SIGNAL \bclk_gen:bclk_div[9]~q\ : std_logic;
SIGNAL \bclk_gen:bclk_div[9]~2\ : std_logic;
SIGNAL \bclk_gen:bclk_div[10]~1_combout\ : std_logic;
SIGNAL \bclk_gen:bclk_div[10]~q\ : std_logic;
SIGNAL \bclk_gen:bclk_div[10]~2\ : std_logic;
SIGNAL \bclk_gen:bclk_div[11]~1_combout\ : std_logic;
SIGNAL \bclk_gen:bclk_div[11]~q\ : std_logic;
SIGNAL \bclk_gen:bclk_div[11]~2\ : std_logic;
SIGNAL \bclk_gen:bclk_div[12]~1_combout\ : std_logic;
SIGNAL \bclk_gen:bclk_div[12]~q\ : std_logic;
SIGNAL \bclk_gen:bclk_div[12]~2\ : std_logic;
SIGNAL \bclk_gen:bclk_div[13]~1_combout\ : std_logic;
SIGNAL \bclk_gen:bclk_div[13]~q\ : std_logic;
SIGNAL \bclk_gen:bclk_div[13]~2\ : std_logic;
SIGNAL \bclk_gen:bclk_div[14]~1_combout\ : std_logic;
SIGNAL \bclk_gen:bclk_div[14]~q\ : std_logic;
SIGNAL \bclk_gen:bclk_div[14]~2\ : std_logic;
SIGNAL \bclk_gen:bclk_div[15]~1_combout\ : std_logic;
SIGNAL \bclk_gen:bclk_div[15]~q\ : std_logic;
SIGNAL \bclk_gen:bclk_div[15]~2\ : std_logic;
SIGNAL \bclk_gen:bclk_div[16]~1_combout\ : std_logic;
SIGNAL \bclk_gen:bclk_div[16]~q\ : std_logic;
SIGNAL \bclk_gen:bclk_div[16]~2\ : std_logic;
SIGNAL \bclk_gen:bclk_div[17]~1_combout\ : std_logic;
SIGNAL \bclk_gen:bclk_div[17]~q\ : std_logic;
SIGNAL \bclk_gen:bclk_div[17]~2\ : std_logic;
SIGNAL \bclk_gen:bclk_div[18]~1_combout\ : std_logic;
SIGNAL \bclk_gen:bclk_div[18]~q\ : std_logic;
SIGNAL \bclk_gen:bclk_div[18]~2\ : std_logic;
SIGNAL \bclk_gen:bclk_div[19]~1_combout\ : std_logic;
SIGNAL \bclk_gen:bclk_div[19]~q\ : std_logic;
SIGNAL \bclk_gen:bclk_div[19]~2\ : std_logic;
SIGNAL \bclk_gen:bclk_div[20]~1_combout\ : std_logic;
SIGNAL \bclk_gen:bclk_div[20]~q\ : std_logic;
SIGNAL \bclk_gen:bclk_div[20]~2\ : std_logic;
SIGNAL \bclk_gen:bclk_div[21]~1_combout\ : std_logic;
SIGNAL \bclk_gen:bclk_div[21]~q\ : std_logic;
SIGNAL \bclk_gen:bclk_div[21]~2\ : std_logic;
SIGNAL \bclk_gen:bclk_div[22]~1_combout\ : std_logic;
SIGNAL \bclk_gen:bclk_div[22]~q\ : std_logic;
SIGNAL \bclk_gen:bclk_div[22]~2\ : std_logic;
SIGNAL \bclk_gen:bclk_div[23]~1_combout\ : std_logic;
SIGNAL \bclk_gen:bclk_div[23]~q\ : std_logic;
SIGNAL \bclk_gen:bclk_div[23]~2\ : std_logic;
SIGNAL \bclk_gen:bclk_div[24]~1_combout\ : std_logic;
SIGNAL \bclk_gen:bclk_div[24]~q\ : std_logic;
SIGNAL \bclk_gen:bclk_div[24]~2\ : std_logic;
SIGNAL \bclk_gen:bclk_div[25]~1_combout\ : std_logic;
SIGNAL \bclk_gen:bclk_div[25]~q\ : std_logic;
SIGNAL \bclk_gen:bclk_div[25]~2\ : std_logic;
SIGNAL \bclk_gen:bclk_div[26]~1_combout\ : std_logic;
SIGNAL \bclk_gen:bclk_div[26]~q\ : std_logic;
SIGNAL \bclk_gen:bclk_div[26]~2\ : std_logic;
SIGNAL \bclk_gen:bclk_div[27]~1_combout\ : std_logic;
SIGNAL \bclk_gen:bclk_div[27]~q\ : std_logic;
SIGNAL \bclk_gen:bclk_div[27]~2\ : std_logic;
SIGNAL \bclk_gen:bclk_div[28]~1_combout\ : std_logic;
SIGNAL \bclk_gen:bclk_div[28]~q\ : std_logic;
SIGNAL \bclk_gen:bclk_div[28]~2\ : std_logic;
SIGNAL \bclk_gen:bclk_div[29]~1_combout\ : std_logic;
SIGNAL \bclk_gen:bclk_div[29]~q\ : std_logic;
SIGNAL \bclk_gen:bclk_div[29]~2\ : std_logic;
SIGNAL \bclk_gen:bclk_div[30]~1_combout\ : std_logic;
SIGNAL \bclk_gen:bclk_div[30]~q\ : std_logic;
SIGNAL \LessThan0~8_combout\ : std_logic;
SIGNAL \LessThan0~9_combout\ : std_logic;
SIGNAL \bclk_s~0_combout\ : std_logic;
SIGNAL \bclk_s~q\ : std_logic;
SIGNAL \lrck_gen:lrck_div[0]~1_combout\ : std_logic;
SIGNAL \lrck_gen:lrck_div[15]~1_combout\ : std_logic;
SIGNAL \lrck_gen:lrck_div[0]~q\ : std_logic;
SIGNAL \lrck_gen:lrck_div[0]~2\ : std_logic;
SIGNAL \lrck_gen:lrck_div[1]~1_combout\ : std_logic;
SIGNAL \lrck_gen:lrck_div[1]~q\ : std_logic;
SIGNAL \lrck_gen:lrck_div[1]~2\ : std_logic;
SIGNAL \lrck_gen:lrck_div[2]~1_combout\ : std_logic;
SIGNAL \lrck_gen:lrck_div[2]~q\ : std_logic;
SIGNAL \lrck_gen:lrck_div[2]~2\ : std_logic;
SIGNAL \lrck_gen:lrck_div[3]~1_combout\ : std_logic;
SIGNAL \lrck_gen:lrck_div[3]~q\ : std_logic;
SIGNAL \lrck_gen:lrck_div[3]~2\ : std_logic;
SIGNAL \lrck_gen:lrck_div[4]~1_combout\ : std_logic;
SIGNAL \lrck_gen:lrck_div[4]~q\ : std_logic;
SIGNAL \lrck_gen:lrck_div[4]~2\ : std_logic;
SIGNAL \lrck_gen:lrck_div[5]~1_combout\ : std_logic;
SIGNAL \lrck_gen:lrck_div[5]~q\ : std_logic;
SIGNAL \lrck_gen:lrck_div[5]~2\ : std_logic;
SIGNAL \lrck_gen:lrck_div[6]~1_combout\ : std_logic;
SIGNAL \lrck_gen:lrck_div[6]~q\ : std_logic;
SIGNAL \lrck_gen:lrck_div[6]~2\ : std_logic;
SIGNAL \lrck_gen:lrck_div[7]~1_combout\ : std_logic;
SIGNAL \lrck_gen:lrck_div[7]~q\ : std_logic;
SIGNAL \lrck_gen:lrck_div[7]~2\ : std_logic;
SIGNAL \lrck_gen:lrck_div[8]~1_combout\ : std_logic;
SIGNAL \lrck_gen:lrck_div[8]~q\ : std_logic;
SIGNAL \lrck_gen:lrck_div[8]~2\ : std_logic;
SIGNAL \lrck_gen:lrck_div[9]~1_combout\ : std_logic;
SIGNAL \lrck_gen:lrck_div[9]~q\ : std_logic;
SIGNAL \lrck_gen:lrck_div[9]~2\ : std_logic;
SIGNAL \lrck_gen:lrck_div[10]~1_combout\ : std_logic;
SIGNAL \lrck_gen:lrck_div[10]~q\ : std_logic;
SIGNAL \lrck_gen:lrck_div[10]~2\ : std_logic;
SIGNAL \lrck_gen:lrck_div[11]~1_combout\ : std_logic;
SIGNAL \lrck_gen:lrck_div[11]~q\ : std_logic;
SIGNAL \lrck_gen:lrck_div[11]~2\ : std_logic;
SIGNAL \lrck_gen:lrck_div[12]~1_combout\ : std_logic;
SIGNAL \lrck_gen:lrck_div[12]~q\ : std_logic;
SIGNAL \lrck_gen:lrck_div[12]~2\ : std_logic;
SIGNAL \lrck_gen:lrck_div[13]~1_combout\ : std_logic;
SIGNAL \lrck_gen:lrck_div[13]~q\ : std_logic;
SIGNAL \lrck_gen:lrck_div[13]~2\ : std_logic;
SIGNAL \lrck_gen:lrck_div[14]~1_combout\ : std_logic;
SIGNAL \lrck_gen:lrck_div[14]~q\ : std_logic;
SIGNAL \lrck_gen:lrck_div[14]~2\ : std_logic;
SIGNAL \lrck_gen:lrck_div[15]~2_combout\ : std_logic;
SIGNAL \lrck_gen:lrck_div[15]~q\ : std_logic;
SIGNAL \lrck_gen:lrck_div[15]~3\ : std_logic;
SIGNAL \lrck_gen:lrck_div[16]~1_combout\ : std_logic;
SIGNAL \lrck_gen:lrck_div[16]~q\ : std_logic;
SIGNAL \lrck_gen:lrck_div[16]~2\ : std_logic;
SIGNAL \lrck_gen:lrck_div[17]~1_combout\ : std_logic;
SIGNAL \lrck_gen:lrck_div[17]~q\ : std_logic;
SIGNAL \lrck_gen:lrck_div[17]~2\ : std_logic;
SIGNAL \lrck_gen:lrck_div[18]~1_combout\ : std_logic;
SIGNAL \lrck_gen:lrck_div[18]~q\ : std_logic;
SIGNAL \lrck_gen:lrck_div[18]~2\ : std_logic;
SIGNAL \lrck_gen:lrck_div[19]~1_combout\ : std_logic;
SIGNAL \lrck_gen:lrck_div[19]~q\ : std_logic;
SIGNAL \lrck_gen:lrck_div[19]~2\ : std_logic;
SIGNAL \lrck_gen:lrck_div[20]~1_combout\ : std_logic;
SIGNAL \lrck_gen:lrck_div[20]~q\ : std_logic;
SIGNAL \lrck_gen:lrck_div[20]~2\ : std_logic;
SIGNAL \lrck_gen:lrck_div[21]~1_combout\ : std_logic;
SIGNAL \lrck_gen:lrck_div[21]~q\ : std_logic;
SIGNAL \lrck_gen:lrck_div[21]~2\ : std_logic;
SIGNAL \lrck_gen:lrck_div[22]~1_combout\ : std_logic;
SIGNAL \lrck_gen:lrck_div[22]~q\ : std_logic;
SIGNAL \lrck_gen:lrck_div[22]~2\ : std_logic;
SIGNAL \lrck_gen:lrck_div[23]~1_combout\ : std_logic;
SIGNAL \lrck_gen:lrck_div[23]~q\ : std_logic;
SIGNAL \lrck_gen:lrck_div[23]~2\ : std_logic;
SIGNAL \lrck_gen:lrck_div[24]~1_combout\ : std_logic;
SIGNAL \lrck_gen:lrck_div[24]~q\ : std_logic;
SIGNAL \lrck_gen:lrck_div[24]~2\ : std_logic;
SIGNAL \lrck_gen:lrck_div[25]~1_combout\ : std_logic;
SIGNAL \lrck_gen:lrck_div[25]~q\ : std_logic;
SIGNAL \lrck_gen:lrck_div[25]~2\ : std_logic;
SIGNAL \lrck_gen:lrck_div[26]~1_combout\ : std_logic;
SIGNAL \lrck_gen:lrck_div[26]~q\ : std_logic;
SIGNAL \lrck_gen:lrck_div[26]~2\ : std_logic;
SIGNAL \lrck_gen:lrck_div[27]~1_combout\ : std_logic;
SIGNAL \lrck_gen:lrck_div[27]~q\ : std_logic;
SIGNAL \lrck_gen:lrck_div[27]~2\ : std_logic;
SIGNAL \lrck_gen:lrck_div[28]~1_combout\ : std_logic;
SIGNAL \lrck_gen:lrck_div[28]~q\ : std_logic;
SIGNAL \lrck_gen:lrck_div[28]~2\ : std_logic;
SIGNAL \lrck_gen:lrck_div[29]~1_combout\ : std_logic;
SIGNAL \lrck_gen:lrck_div[29]~q\ : std_logic;
SIGNAL \lrck_gen:lrck_div[29]~2\ : std_logic;
SIGNAL \lrck_gen:lrck_div[30]~1_combout\ : std_logic;
SIGNAL \lrck_gen:lrck_div[30]~q\ : std_logic;
SIGNAL \LessThan1~5_combout\ : std_logic;
SIGNAL \LessThan1~6_combout\ : std_logic;
SIGNAL \LessThan1~7_combout\ : std_logic;
SIGNAL \LessThan1~8_combout\ : std_logic;
SIGNAL \LessThan1~2_combout\ : std_logic;
SIGNAL \LessThan1~3_combout\ : std_logic;
SIGNAL \LessThan1~1_combout\ : std_logic;
SIGNAL \LessThan1~0_combout\ : std_logic;
SIGNAL \LessThan1~4_combout\ : std_logic;
SIGNAL \LessThan1~9_combout\ : std_logic;
SIGNAL \lrck_s~0_combout\ : std_logic;
SIGNAL \lrck_s~q\ : std_logic;
SIGNAL \bclk_s~clkctrl_outclk\ : std_logic;
SIGNAL \sin_ctrl:sel_counter[0]~1_combout\ : std_logic;
SIGNAL \sin_ctrl:sel_counter[0]~q\ : std_logic;
SIGNAL \sin_ctrl:sel_counter[0]~2\ : std_logic;
SIGNAL \sin_ctrl:sel_counter[1]~1_combout\ : std_logic;
SIGNAL \sin_ctrl:sel_counter[1]~q\ : std_logic;
SIGNAL \sin_ctrl:sel_counter[1]~2\ : std_logic;
SIGNAL \sin_ctrl:sel_counter[2]~1_combout\ : std_logic;
SIGNAL \sin_ctrl:sel_counter[2]~q\ : std_logic;
SIGNAL \sin_ctrl:sel_counter[2]~2\ : std_logic;
SIGNAL \sin_ctrl:sel_counter[3]~1_combout\ : std_logic;
SIGNAL \sin_ctrl:sel_counter[3]~q\ : std_logic;
SIGNAL \Mux0~0_combout\ : std_logic;
SIGNAL \ALT_INV_clk_i~inputclkctrl_outclk\ : std_logic;
SIGNAL \ALT_INV_bclk_s~clkctrl_outclk\ : std_logic;
SIGNAL \ALT_INV_rst_i~input_o\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_clk_i <= clk_i;
ww_rst_i <= rst_i;
bclk_o <= ww_bclk_o;
lrck_o <= ww_lrck_o;
data_o <= ww_data_o;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\bclk_s~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \bclk_s~q\);

\clk_i~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk_i~input_o\);
\ALT_INV_clk_i~inputclkctrl_outclk\ <= NOT \clk_i~inputclkctrl_outclk\;
\ALT_INV_bclk_s~clkctrl_outclk\ <= NOT \bclk_s~clkctrl_outclk\;
\ALT_INV_rst_i~input_o\ <= NOT \rst_i~input_o\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X115_Y40_N9
\bclk_o~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \bclk_s~q\,
	devoe => ww_devoe,
	o => \bclk_o~output_o\);

-- Location: IOOBUF_X56_Y0_N23
\lrck_o~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \lrck_s~q\,
	devoe => ww_devoe,
	o => \lrck_o~output_o\);

-- Location: IOOBUF_X115_Y40_N2
\data_o~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux0~0_combout\,
	devoe => ww_devoe,
	o => \data_o~output_o\);

-- Location: IOIBUF_X0_Y36_N8
\clk_i~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk_i,
	o => \clk_i~input_o\);

-- Location: CLKCTRL_G2
\clk_i~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk_i~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk_i~inputclkctrl_outclk\);

-- Location: LCCOMB_X79_Y41_N2
\bclk_gen:bclk_div[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \bclk_gen:bclk_div[0]~1_combout\ = \bclk_gen:bclk_div[0]~q\ $ (VCC)
-- \bclk_gen:bclk_div[0]~2\ = CARRY(\bclk_gen:bclk_div[0]~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \bclk_gen:bclk_div[0]~q\,
	datad => VCC,
	combout => \bclk_gen:bclk_div[0]~1_combout\,
	cout => \bclk_gen:bclk_div[0]~2\);

-- Location: IOIBUF_X81_Y73_N15
\rst_i~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rst_i,
	o => \rst_i~input_o\);

-- Location: LCCOMB_X80_Y40_N30
\LessThan0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~6_combout\ = (!\bclk_gen:bclk_div[22]~q\ & (!\bclk_gen:bclk_div[21]~q\ & (!\bclk_gen:bclk_div[23]~q\ & !\bclk_gen:bclk_div[20]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bclk_gen:bclk_div[22]~q\,
	datab => \bclk_gen:bclk_div[21]~q\,
	datac => \bclk_gen:bclk_div[23]~q\,
	datad => \bclk_gen:bclk_div[20]~q\,
	combout => \LessThan0~6_combout\);

-- Location: LCCOMB_X80_Y40_N28
\LessThan0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~5_combout\ = (!\bclk_gen:bclk_div[19]~q\ & (!\bclk_gen:bclk_div[18]~q\ & (!\bclk_gen:bclk_div[17]~q\ & !\bclk_gen:bclk_div[16]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bclk_gen:bclk_div[19]~q\,
	datab => \bclk_gen:bclk_div[18]~q\,
	datac => \bclk_gen:bclk_div[17]~q\,
	datad => \bclk_gen:bclk_div[16]~q\,
	combout => \LessThan0~5_combout\);

-- Location: LCCOMB_X80_Y40_N14
\LessThan0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~7_combout\ = (\LessThan0~6_combout\ & \LessThan0~5_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \LessThan0~6_combout\,
	datad => \LessThan0~5_combout\,
	combout => \LessThan0~7_combout\);

-- Location: LCCOMB_X80_Y40_N12
\LessThan0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~3_combout\ = (!\bclk_gen:bclk_div[14]~q\ & (!\bclk_gen:bclk_div[15]~q\ & (!\bclk_gen:bclk_div[13]~q\ & !\bclk_gen:bclk_div[12]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bclk_gen:bclk_div[14]~q\,
	datab => \bclk_gen:bclk_div[15]~q\,
	datac => \bclk_gen:bclk_div[13]~q\,
	datad => \bclk_gen:bclk_div[12]~q\,
	combout => \LessThan0~3_combout\);

-- Location: LCCOMB_X80_Y40_N0
\LessThan0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~0_combout\ = (!\bclk_gen:bclk_div[3]~q\ & (((!\bclk_gen:bclk_div[0]~q\ & !\bclk_gen:bclk_div[1]~q\)) # (!\bclk_gen:bclk_div[2]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100010011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bclk_gen:bclk_div[2]~q\,
	datab => \bclk_gen:bclk_div[3]~q\,
	datac => \bclk_gen:bclk_div[0]~q\,
	datad => \bclk_gen:bclk_div[1]~q\,
	combout => \LessThan0~0_combout\);

-- Location: LCCOMB_X79_Y41_N0
\LessThan0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~1_combout\ = (!\bclk_gen:bclk_div[5]~q\ & (!\bclk_gen:bclk_div[7]~q\ & (!\bclk_gen:bclk_div[6]~q\ & !\bclk_gen:bclk_div[4]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bclk_gen:bclk_div[5]~q\,
	datab => \bclk_gen:bclk_div[7]~q\,
	datac => \bclk_gen:bclk_div[6]~q\,
	datad => \bclk_gen:bclk_div[4]~q\,
	combout => \LessThan0~1_combout\);

-- Location: LCCOMB_X80_Y40_N18
\LessThan0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~2_combout\ = (!\bclk_gen:bclk_div[11]~q\ & (!\bclk_gen:bclk_div[8]~q\ & (!\bclk_gen:bclk_div[9]~q\ & !\bclk_gen:bclk_div[10]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bclk_gen:bclk_div[11]~q\,
	datab => \bclk_gen:bclk_div[8]~q\,
	datac => \bclk_gen:bclk_div[9]~q\,
	datad => \bclk_gen:bclk_div[10]~q\,
	combout => \LessThan0~2_combout\);

-- Location: LCCOMB_X80_Y40_N24
\LessThan0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~4_combout\ = (\LessThan0~3_combout\ & (\LessThan0~0_combout\ & (\LessThan0~1_combout\ & \LessThan0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~3_combout\,
	datab => \LessThan0~0_combout\,
	datac => \LessThan0~1_combout\,
	datad => \LessThan0~2_combout\,
	combout => \LessThan0~4_combout\);

-- Location: LCCOMB_X80_Y40_N10
\bclk_gen:bclk_div[3]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \bclk_gen:bclk_div[3]~1_combout\ = (((!\LessThan0~4_combout\) # (!\LessThan0~7_combout\)) # (!\rst_i~input_o\)) # (!\LessThan0~9_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~9_combout\,
	datab => \rst_i~input_o\,
	datac => \LessThan0~7_combout\,
	datad => \LessThan0~4_combout\,
	combout => \bclk_gen:bclk_div[3]~1_combout\);

-- Location: FF_X79_Y41_N3
\bclk_gen:bclk_div[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk_i~inputclkctrl_outclk\,
	d => \bclk_gen:bclk_div[0]~1_combout\,
	sclr => \bclk_gen:bclk_div[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bclk_gen:bclk_div[0]~q\);

-- Location: LCCOMB_X79_Y41_N4
\bclk_gen:bclk_div[1]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \bclk_gen:bclk_div[1]~1_combout\ = (\bclk_gen:bclk_div[1]~q\ & (!\bclk_gen:bclk_div[0]~2\)) # (!\bclk_gen:bclk_div[1]~q\ & ((\bclk_gen:bclk_div[0]~2\) # (GND)))
-- \bclk_gen:bclk_div[1]~2\ = CARRY((!\bclk_gen:bclk_div[0]~2\) # (!\bclk_gen:bclk_div[1]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \bclk_gen:bclk_div[1]~q\,
	datad => VCC,
	cin => \bclk_gen:bclk_div[0]~2\,
	combout => \bclk_gen:bclk_div[1]~1_combout\,
	cout => \bclk_gen:bclk_div[1]~2\);

-- Location: FF_X79_Y41_N5
\bclk_gen:bclk_div[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk_i~inputclkctrl_outclk\,
	d => \bclk_gen:bclk_div[1]~1_combout\,
	sclr => \bclk_gen:bclk_div[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bclk_gen:bclk_div[1]~q\);

-- Location: LCCOMB_X79_Y41_N6
\bclk_gen:bclk_div[2]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \bclk_gen:bclk_div[2]~1_combout\ = (\bclk_gen:bclk_div[2]~q\ & (\bclk_gen:bclk_div[1]~2\ $ (GND))) # (!\bclk_gen:bclk_div[2]~q\ & (!\bclk_gen:bclk_div[1]~2\ & VCC))
-- \bclk_gen:bclk_div[2]~2\ = CARRY((\bclk_gen:bclk_div[2]~q\ & !\bclk_gen:bclk_div[1]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bclk_gen:bclk_div[2]~q\,
	datad => VCC,
	cin => \bclk_gen:bclk_div[1]~2\,
	combout => \bclk_gen:bclk_div[2]~1_combout\,
	cout => \bclk_gen:bclk_div[2]~2\);

-- Location: FF_X79_Y41_N7
\bclk_gen:bclk_div[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk_i~inputclkctrl_outclk\,
	d => \bclk_gen:bclk_div[2]~1_combout\,
	sclr => \bclk_gen:bclk_div[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bclk_gen:bclk_div[2]~q\);

-- Location: LCCOMB_X79_Y41_N8
\bclk_gen:bclk_div[3]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \bclk_gen:bclk_div[3]~2_combout\ = (\bclk_gen:bclk_div[3]~q\ & (!\bclk_gen:bclk_div[2]~2\)) # (!\bclk_gen:bclk_div[3]~q\ & ((\bclk_gen:bclk_div[2]~2\) # (GND)))
-- \bclk_gen:bclk_div[3]~3\ = CARRY((!\bclk_gen:bclk_div[2]~2\) # (!\bclk_gen:bclk_div[3]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \bclk_gen:bclk_div[3]~q\,
	datad => VCC,
	cin => \bclk_gen:bclk_div[2]~2\,
	combout => \bclk_gen:bclk_div[3]~2_combout\,
	cout => \bclk_gen:bclk_div[3]~3\);

-- Location: FF_X79_Y41_N9
\bclk_gen:bclk_div[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk_i~inputclkctrl_outclk\,
	d => \bclk_gen:bclk_div[3]~2_combout\,
	sclr => \bclk_gen:bclk_div[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bclk_gen:bclk_div[3]~q\);

-- Location: LCCOMB_X79_Y41_N10
\bclk_gen:bclk_div[4]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \bclk_gen:bclk_div[4]~1_combout\ = (\bclk_gen:bclk_div[4]~q\ & (\bclk_gen:bclk_div[3]~3\ $ (GND))) # (!\bclk_gen:bclk_div[4]~q\ & (!\bclk_gen:bclk_div[3]~3\ & VCC))
-- \bclk_gen:bclk_div[4]~2\ = CARRY((\bclk_gen:bclk_div[4]~q\ & !\bclk_gen:bclk_div[3]~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bclk_gen:bclk_div[4]~q\,
	datad => VCC,
	cin => \bclk_gen:bclk_div[3]~3\,
	combout => \bclk_gen:bclk_div[4]~1_combout\,
	cout => \bclk_gen:bclk_div[4]~2\);

-- Location: FF_X79_Y41_N11
\bclk_gen:bclk_div[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk_i~inputclkctrl_outclk\,
	d => \bclk_gen:bclk_div[4]~1_combout\,
	sclr => \bclk_gen:bclk_div[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bclk_gen:bclk_div[4]~q\);

-- Location: LCCOMB_X79_Y41_N12
\bclk_gen:bclk_div[5]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \bclk_gen:bclk_div[5]~1_combout\ = (\bclk_gen:bclk_div[5]~q\ & (!\bclk_gen:bclk_div[4]~2\)) # (!\bclk_gen:bclk_div[5]~q\ & ((\bclk_gen:bclk_div[4]~2\) # (GND)))
-- \bclk_gen:bclk_div[5]~2\ = CARRY((!\bclk_gen:bclk_div[4]~2\) # (!\bclk_gen:bclk_div[5]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bclk_gen:bclk_div[5]~q\,
	datad => VCC,
	cin => \bclk_gen:bclk_div[4]~2\,
	combout => \bclk_gen:bclk_div[5]~1_combout\,
	cout => \bclk_gen:bclk_div[5]~2\);

-- Location: FF_X79_Y41_N13
\bclk_gen:bclk_div[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk_i~inputclkctrl_outclk\,
	d => \bclk_gen:bclk_div[5]~1_combout\,
	sclr => \bclk_gen:bclk_div[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bclk_gen:bclk_div[5]~q\);

-- Location: LCCOMB_X79_Y41_N14
\bclk_gen:bclk_div[6]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \bclk_gen:bclk_div[6]~1_combout\ = (\bclk_gen:bclk_div[6]~q\ & (\bclk_gen:bclk_div[5]~2\ $ (GND))) # (!\bclk_gen:bclk_div[6]~q\ & (!\bclk_gen:bclk_div[5]~2\ & VCC))
-- \bclk_gen:bclk_div[6]~2\ = CARRY((\bclk_gen:bclk_div[6]~q\ & !\bclk_gen:bclk_div[5]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \bclk_gen:bclk_div[6]~q\,
	datad => VCC,
	cin => \bclk_gen:bclk_div[5]~2\,
	combout => \bclk_gen:bclk_div[6]~1_combout\,
	cout => \bclk_gen:bclk_div[6]~2\);

-- Location: FF_X79_Y41_N15
\bclk_gen:bclk_div[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk_i~inputclkctrl_outclk\,
	d => \bclk_gen:bclk_div[6]~1_combout\,
	sclr => \bclk_gen:bclk_div[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bclk_gen:bclk_div[6]~q\);

-- Location: LCCOMB_X79_Y41_N16
\bclk_gen:bclk_div[7]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \bclk_gen:bclk_div[7]~1_combout\ = (\bclk_gen:bclk_div[7]~q\ & (!\bclk_gen:bclk_div[6]~2\)) # (!\bclk_gen:bclk_div[7]~q\ & ((\bclk_gen:bclk_div[6]~2\) # (GND)))
-- \bclk_gen:bclk_div[7]~2\ = CARRY((!\bclk_gen:bclk_div[6]~2\) # (!\bclk_gen:bclk_div[7]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \bclk_gen:bclk_div[7]~q\,
	datad => VCC,
	cin => \bclk_gen:bclk_div[6]~2\,
	combout => \bclk_gen:bclk_div[7]~1_combout\,
	cout => \bclk_gen:bclk_div[7]~2\);

-- Location: FF_X79_Y41_N17
\bclk_gen:bclk_div[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk_i~inputclkctrl_outclk\,
	d => \bclk_gen:bclk_div[7]~1_combout\,
	sclr => \bclk_gen:bclk_div[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bclk_gen:bclk_div[7]~q\);

-- Location: LCCOMB_X79_Y41_N18
\bclk_gen:bclk_div[8]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \bclk_gen:bclk_div[8]~1_combout\ = (\bclk_gen:bclk_div[8]~q\ & (\bclk_gen:bclk_div[7]~2\ $ (GND))) # (!\bclk_gen:bclk_div[8]~q\ & (!\bclk_gen:bclk_div[7]~2\ & VCC))
-- \bclk_gen:bclk_div[8]~2\ = CARRY((\bclk_gen:bclk_div[8]~q\ & !\bclk_gen:bclk_div[7]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \bclk_gen:bclk_div[8]~q\,
	datad => VCC,
	cin => \bclk_gen:bclk_div[7]~2\,
	combout => \bclk_gen:bclk_div[8]~1_combout\,
	cout => \bclk_gen:bclk_div[8]~2\);

-- Location: FF_X79_Y41_N19
\bclk_gen:bclk_div[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk_i~inputclkctrl_outclk\,
	d => \bclk_gen:bclk_div[8]~1_combout\,
	sclr => \bclk_gen:bclk_div[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bclk_gen:bclk_div[8]~q\);

-- Location: LCCOMB_X79_Y41_N20
\bclk_gen:bclk_div[9]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \bclk_gen:bclk_div[9]~1_combout\ = (\bclk_gen:bclk_div[9]~q\ & (!\bclk_gen:bclk_div[8]~2\)) # (!\bclk_gen:bclk_div[9]~q\ & ((\bclk_gen:bclk_div[8]~2\) # (GND)))
-- \bclk_gen:bclk_div[9]~2\ = CARRY((!\bclk_gen:bclk_div[8]~2\) # (!\bclk_gen:bclk_div[9]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \bclk_gen:bclk_div[9]~q\,
	datad => VCC,
	cin => \bclk_gen:bclk_div[8]~2\,
	combout => \bclk_gen:bclk_div[9]~1_combout\,
	cout => \bclk_gen:bclk_div[9]~2\);

-- Location: FF_X79_Y41_N21
\bclk_gen:bclk_div[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk_i~inputclkctrl_outclk\,
	d => \bclk_gen:bclk_div[9]~1_combout\,
	sclr => \bclk_gen:bclk_div[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bclk_gen:bclk_div[9]~q\);

-- Location: LCCOMB_X79_Y41_N22
\bclk_gen:bclk_div[10]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \bclk_gen:bclk_div[10]~1_combout\ = (\bclk_gen:bclk_div[10]~q\ & (\bclk_gen:bclk_div[9]~2\ $ (GND))) # (!\bclk_gen:bclk_div[10]~q\ & (!\bclk_gen:bclk_div[9]~2\ & VCC))
-- \bclk_gen:bclk_div[10]~2\ = CARRY((\bclk_gen:bclk_div[10]~q\ & !\bclk_gen:bclk_div[9]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bclk_gen:bclk_div[10]~q\,
	datad => VCC,
	cin => \bclk_gen:bclk_div[9]~2\,
	combout => \bclk_gen:bclk_div[10]~1_combout\,
	cout => \bclk_gen:bclk_div[10]~2\);

-- Location: FF_X79_Y41_N23
\bclk_gen:bclk_div[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk_i~inputclkctrl_outclk\,
	d => \bclk_gen:bclk_div[10]~1_combout\,
	sclr => \bclk_gen:bclk_div[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bclk_gen:bclk_div[10]~q\);

-- Location: LCCOMB_X79_Y41_N24
\bclk_gen:bclk_div[11]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \bclk_gen:bclk_div[11]~1_combout\ = (\bclk_gen:bclk_div[11]~q\ & (!\bclk_gen:bclk_div[10]~2\)) # (!\bclk_gen:bclk_div[11]~q\ & ((\bclk_gen:bclk_div[10]~2\) # (GND)))
-- \bclk_gen:bclk_div[11]~2\ = CARRY((!\bclk_gen:bclk_div[10]~2\) # (!\bclk_gen:bclk_div[11]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \bclk_gen:bclk_div[11]~q\,
	datad => VCC,
	cin => \bclk_gen:bclk_div[10]~2\,
	combout => \bclk_gen:bclk_div[11]~1_combout\,
	cout => \bclk_gen:bclk_div[11]~2\);

-- Location: FF_X79_Y41_N25
\bclk_gen:bclk_div[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk_i~inputclkctrl_outclk\,
	d => \bclk_gen:bclk_div[11]~1_combout\,
	sclr => \bclk_gen:bclk_div[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bclk_gen:bclk_div[11]~q\);

-- Location: LCCOMB_X79_Y41_N26
\bclk_gen:bclk_div[12]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \bclk_gen:bclk_div[12]~1_combout\ = (\bclk_gen:bclk_div[12]~q\ & (\bclk_gen:bclk_div[11]~2\ $ (GND))) # (!\bclk_gen:bclk_div[12]~q\ & (!\bclk_gen:bclk_div[11]~2\ & VCC))
-- \bclk_gen:bclk_div[12]~2\ = CARRY((\bclk_gen:bclk_div[12]~q\ & !\bclk_gen:bclk_div[11]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bclk_gen:bclk_div[12]~q\,
	datad => VCC,
	cin => \bclk_gen:bclk_div[11]~2\,
	combout => \bclk_gen:bclk_div[12]~1_combout\,
	cout => \bclk_gen:bclk_div[12]~2\);

-- Location: FF_X79_Y41_N27
\bclk_gen:bclk_div[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk_i~inputclkctrl_outclk\,
	d => \bclk_gen:bclk_div[12]~1_combout\,
	sclr => \bclk_gen:bclk_div[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bclk_gen:bclk_div[12]~q\);

-- Location: LCCOMB_X79_Y41_N28
\bclk_gen:bclk_div[13]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \bclk_gen:bclk_div[13]~1_combout\ = (\bclk_gen:bclk_div[13]~q\ & (!\bclk_gen:bclk_div[12]~2\)) # (!\bclk_gen:bclk_div[13]~q\ & ((\bclk_gen:bclk_div[12]~2\) # (GND)))
-- \bclk_gen:bclk_div[13]~2\ = CARRY((!\bclk_gen:bclk_div[12]~2\) # (!\bclk_gen:bclk_div[13]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \bclk_gen:bclk_div[13]~q\,
	datad => VCC,
	cin => \bclk_gen:bclk_div[12]~2\,
	combout => \bclk_gen:bclk_div[13]~1_combout\,
	cout => \bclk_gen:bclk_div[13]~2\);

-- Location: FF_X79_Y41_N29
\bclk_gen:bclk_div[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk_i~inputclkctrl_outclk\,
	d => \bclk_gen:bclk_div[13]~1_combout\,
	sclr => \bclk_gen:bclk_div[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bclk_gen:bclk_div[13]~q\);

-- Location: LCCOMB_X79_Y41_N30
\bclk_gen:bclk_div[14]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \bclk_gen:bclk_div[14]~1_combout\ = (\bclk_gen:bclk_div[14]~q\ & (\bclk_gen:bclk_div[13]~2\ $ (GND))) # (!\bclk_gen:bclk_div[14]~q\ & (!\bclk_gen:bclk_div[13]~2\ & VCC))
-- \bclk_gen:bclk_div[14]~2\ = CARRY((\bclk_gen:bclk_div[14]~q\ & !\bclk_gen:bclk_div[13]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bclk_gen:bclk_div[14]~q\,
	datad => VCC,
	cin => \bclk_gen:bclk_div[13]~2\,
	combout => \bclk_gen:bclk_div[14]~1_combout\,
	cout => \bclk_gen:bclk_div[14]~2\);

-- Location: FF_X79_Y41_N31
\bclk_gen:bclk_div[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk_i~inputclkctrl_outclk\,
	d => \bclk_gen:bclk_div[14]~1_combout\,
	sclr => \bclk_gen:bclk_div[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bclk_gen:bclk_div[14]~q\);

-- Location: LCCOMB_X79_Y40_N0
\bclk_gen:bclk_div[15]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \bclk_gen:bclk_div[15]~1_combout\ = (\bclk_gen:bclk_div[15]~q\ & (!\bclk_gen:bclk_div[14]~2\)) # (!\bclk_gen:bclk_div[15]~q\ & ((\bclk_gen:bclk_div[14]~2\) # (GND)))
-- \bclk_gen:bclk_div[15]~2\ = CARRY((!\bclk_gen:bclk_div[14]~2\) # (!\bclk_gen:bclk_div[15]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \bclk_gen:bclk_div[15]~q\,
	datad => VCC,
	cin => \bclk_gen:bclk_div[14]~2\,
	combout => \bclk_gen:bclk_div[15]~1_combout\,
	cout => \bclk_gen:bclk_div[15]~2\);

-- Location: FF_X79_Y40_N1
\bclk_gen:bclk_div[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk_i~inputclkctrl_outclk\,
	d => \bclk_gen:bclk_div[15]~1_combout\,
	sclr => \bclk_gen:bclk_div[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bclk_gen:bclk_div[15]~q\);

-- Location: LCCOMB_X79_Y40_N2
\bclk_gen:bclk_div[16]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \bclk_gen:bclk_div[16]~1_combout\ = (\bclk_gen:bclk_div[16]~q\ & (\bclk_gen:bclk_div[15]~2\ $ (GND))) # (!\bclk_gen:bclk_div[16]~q\ & (!\bclk_gen:bclk_div[15]~2\ & VCC))
-- \bclk_gen:bclk_div[16]~2\ = CARRY((\bclk_gen:bclk_div[16]~q\ & !\bclk_gen:bclk_div[15]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \bclk_gen:bclk_div[16]~q\,
	datad => VCC,
	cin => \bclk_gen:bclk_div[15]~2\,
	combout => \bclk_gen:bclk_div[16]~1_combout\,
	cout => \bclk_gen:bclk_div[16]~2\);

-- Location: FF_X79_Y40_N3
\bclk_gen:bclk_div[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk_i~inputclkctrl_outclk\,
	d => \bclk_gen:bclk_div[16]~1_combout\,
	sclr => \bclk_gen:bclk_div[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bclk_gen:bclk_div[16]~q\);

-- Location: LCCOMB_X79_Y40_N4
\bclk_gen:bclk_div[17]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \bclk_gen:bclk_div[17]~1_combout\ = (\bclk_gen:bclk_div[17]~q\ & (!\bclk_gen:bclk_div[16]~2\)) # (!\bclk_gen:bclk_div[17]~q\ & ((\bclk_gen:bclk_div[16]~2\) # (GND)))
-- \bclk_gen:bclk_div[17]~2\ = CARRY((!\bclk_gen:bclk_div[16]~2\) # (!\bclk_gen:bclk_div[17]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \bclk_gen:bclk_div[17]~q\,
	datad => VCC,
	cin => \bclk_gen:bclk_div[16]~2\,
	combout => \bclk_gen:bclk_div[17]~1_combout\,
	cout => \bclk_gen:bclk_div[17]~2\);

-- Location: FF_X79_Y40_N5
\bclk_gen:bclk_div[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk_i~inputclkctrl_outclk\,
	d => \bclk_gen:bclk_div[17]~1_combout\,
	sclr => \bclk_gen:bclk_div[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bclk_gen:bclk_div[17]~q\);

-- Location: LCCOMB_X79_Y40_N6
\bclk_gen:bclk_div[18]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \bclk_gen:bclk_div[18]~1_combout\ = (\bclk_gen:bclk_div[18]~q\ & (\bclk_gen:bclk_div[17]~2\ $ (GND))) # (!\bclk_gen:bclk_div[18]~q\ & (!\bclk_gen:bclk_div[17]~2\ & VCC))
-- \bclk_gen:bclk_div[18]~2\ = CARRY((\bclk_gen:bclk_div[18]~q\ & !\bclk_gen:bclk_div[17]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bclk_gen:bclk_div[18]~q\,
	datad => VCC,
	cin => \bclk_gen:bclk_div[17]~2\,
	combout => \bclk_gen:bclk_div[18]~1_combout\,
	cout => \bclk_gen:bclk_div[18]~2\);

-- Location: FF_X79_Y40_N7
\bclk_gen:bclk_div[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk_i~inputclkctrl_outclk\,
	d => \bclk_gen:bclk_div[18]~1_combout\,
	sclr => \bclk_gen:bclk_div[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bclk_gen:bclk_div[18]~q\);

-- Location: LCCOMB_X79_Y40_N8
\bclk_gen:bclk_div[19]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \bclk_gen:bclk_div[19]~1_combout\ = (\bclk_gen:bclk_div[19]~q\ & (!\bclk_gen:bclk_div[18]~2\)) # (!\bclk_gen:bclk_div[19]~q\ & ((\bclk_gen:bclk_div[18]~2\) # (GND)))
-- \bclk_gen:bclk_div[19]~2\ = CARRY((!\bclk_gen:bclk_div[18]~2\) # (!\bclk_gen:bclk_div[19]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \bclk_gen:bclk_div[19]~q\,
	datad => VCC,
	cin => \bclk_gen:bclk_div[18]~2\,
	combout => \bclk_gen:bclk_div[19]~1_combout\,
	cout => \bclk_gen:bclk_div[19]~2\);

-- Location: FF_X79_Y40_N9
\bclk_gen:bclk_div[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk_i~inputclkctrl_outclk\,
	d => \bclk_gen:bclk_div[19]~1_combout\,
	sclr => \bclk_gen:bclk_div[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bclk_gen:bclk_div[19]~q\);

-- Location: LCCOMB_X79_Y40_N10
\bclk_gen:bclk_div[20]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \bclk_gen:bclk_div[20]~1_combout\ = (\bclk_gen:bclk_div[20]~q\ & (\bclk_gen:bclk_div[19]~2\ $ (GND))) # (!\bclk_gen:bclk_div[20]~q\ & (!\bclk_gen:bclk_div[19]~2\ & VCC))
-- \bclk_gen:bclk_div[20]~2\ = CARRY((\bclk_gen:bclk_div[20]~q\ & !\bclk_gen:bclk_div[19]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bclk_gen:bclk_div[20]~q\,
	datad => VCC,
	cin => \bclk_gen:bclk_div[19]~2\,
	combout => \bclk_gen:bclk_div[20]~1_combout\,
	cout => \bclk_gen:bclk_div[20]~2\);

-- Location: FF_X79_Y40_N11
\bclk_gen:bclk_div[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk_i~inputclkctrl_outclk\,
	d => \bclk_gen:bclk_div[20]~1_combout\,
	sclr => \bclk_gen:bclk_div[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bclk_gen:bclk_div[20]~q\);

-- Location: LCCOMB_X79_Y40_N12
\bclk_gen:bclk_div[21]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \bclk_gen:bclk_div[21]~1_combout\ = (\bclk_gen:bclk_div[21]~q\ & (!\bclk_gen:bclk_div[20]~2\)) # (!\bclk_gen:bclk_div[21]~q\ & ((\bclk_gen:bclk_div[20]~2\) # (GND)))
-- \bclk_gen:bclk_div[21]~2\ = CARRY((!\bclk_gen:bclk_div[20]~2\) # (!\bclk_gen:bclk_div[21]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bclk_gen:bclk_div[21]~q\,
	datad => VCC,
	cin => \bclk_gen:bclk_div[20]~2\,
	combout => \bclk_gen:bclk_div[21]~1_combout\,
	cout => \bclk_gen:bclk_div[21]~2\);

-- Location: FF_X79_Y40_N13
\bclk_gen:bclk_div[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk_i~inputclkctrl_outclk\,
	d => \bclk_gen:bclk_div[21]~1_combout\,
	sclr => \bclk_gen:bclk_div[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bclk_gen:bclk_div[21]~q\);

-- Location: LCCOMB_X79_Y40_N14
\bclk_gen:bclk_div[22]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \bclk_gen:bclk_div[22]~1_combout\ = (\bclk_gen:bclk_div[22]~q\ & (\bclk_gen:bclk_div[21]~2\ $ (GND))) # (!\bclk_gen:bclk_div[22]~q\ & (!\bclk_gen:bclk_div[21]~2\ & VCC))
-- \bclk_gen:bclk_div[22]~2\ = CARRY((\bclk_gen:bclk_div[22]~q\ & !\bclk_gen:bclk_div[21]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \bclk_gen:bclk_div[22]~q\,
	datad => VCC,
	cin => \bclk_gen:bclk_div[21]~2\,
	combout => \bclk_gen:bclk_div[22]~1_combout\,
	cout => \bclk_gen:bclk_div[22]~2\);

-- Location: FF_X79_Y40_N15
\bclk_gen:bclk_div[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk_i~inputclkctrl_outclk\,
	d => \bclk_gen:bclk_div[22]~1_combout\,
	sclr => \bclk_gen:bclk_div[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bclk_gen:bclk_div[22]~q\);

-- Location: LCCOMB_X79_Y40_N16
\bclk_gen:bclk_div[23]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \bclk_gen:bclk_div[23]~1_combout\ = (\bclk_gen:bclk_div[23]~q\ & (!\bclk_gen:bclk_div[22]~2\)) # (!\bclk_gen:bclk_div[23]~q\ & ((\bclk_gen:bclk_div[22]~2\) # (GND)))
-- \bclk_gen:bclk_div[23]~2\ = CARRY((!\bclk_gen:bclk_div[22]~2\) # (!\bclk_gen:bclk_div[23]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \bclk_gen:bclk_div[23]~q\,
	datad => VCC,
	cin => \bclk_gen:bclk_div[22]~2\,
	combout => \bclk_gen:bclk_div[23]~1_combout\,
	cout => \bclk_gen:bclk_div[23]~2\);

-- Location: FF_X79_Y40_N17
\bclk_gen:bclk_div[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk_i~inputclkctrl_outclk\,
	d => \bclk_gen:bclk_div[23]~1_combout\,
	sclr => \bclk_gen:bclk_div[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bclk_gen:bclk_div[23]~q\);

-- Location: LCCOMB_X79_Y40_N18
\bclk_gen:bclk_div[24]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \bclk_gen:bclk_div[24]~1_combout\ = (\bclk_gen:bclk_div[24]~q\ & (\bclk_gen:bclk_div[23]~2\ $ (GND))) # (!\bclk_gen:bclk_div[24]~q\ & (!\bclk_gen:bclk_div[23]~2\ & VCC))
-- \bclk_gen:bclk_div[24]~2\ = CARRY((\bclk_gen:bclk_div[24]~q\ & !\bclk_gen:bclk_div[23]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \bclk_gen:bclk_div[24]~q\,
	datad => VCC,
	cin => \bclk_gen:bclk_div[23]~2\,
	combout => \bclk_gen:bclk_div[24]~1_combout\,
	cout => \bclk_gen:bclk_div[24]~2\);

-- Location: FF_X79_Y40_N19
\bclk_gen:bclk_div[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk_i~inputclkctrl_outclk\,
	d => \bclk_gen:bclk_div[24]~1_combout\,
	sclr => \bclk_gen:bclk_div[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bclk_gen:bclk_div[24]~q\);

-- Location: LCCOMB_X79_Y40_N20
\bclk_gen:bclk_div[25]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \bclk_gen:bclk_div[25]~1_combout\ = (\bclk_gen:bclk_div[25]~q\ & (!\bclk_gen:bclk_div[24]~2\)) # (!\bclk_gen:bclk_div[25]~q\ & ((\bclk_gen:bclk_div[24]~2\) # (GND)))
-- \bclk_gen:bclk_div[25]~2\ = CARRY((!\bclk_gen:bclk_div[24]~2\) # (!\bclk_gen:bclk_div[25]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \bclk_gen:bclk_div[25]~q\,
	datad => VCC,
	cin => \bclk_gen:bclk_div[24]~2\,
	combout => \bclk_gen:bclk_div[25]~1_combout\,
	cout => \bclk_gen:bclk_div[25]~2\);

-- Location: FF_X79_Y40_N21
\bclk_gen:bclk_div[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk_i~inputclkctrl_outclk\,
	d => \bclk_gen:bclk_div[25]~1_combout\,
	sclr => \bclk_gen:bclk_div[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bclk_gen:bclk_div[25]~q\);

-- Location: LCCOMB_X79_Y40_N22
\bclk_gen:bclk_div[26]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \bclk_gen:bclk_div[26]~1_combout\ = (\bclk_gen:bclk_div[26]~q\ & (\bclk_gen:bclk_div[25]~2\ $ (GND))) # (!\bclk_gen:bclk_div[26]~q\ & (!\bclk_gen:bclk_div[25]~2\ & VCC))
-- \bclk_gen:bclk_div[26]~2\ = CARRY((\bclk_gen:bclk_div[26]~q\ & !\bclk_gen:bclk_div[25]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bclk_gen:bclk_div[26]~q\,
	datad => VCC,
	cin => \bclk_gen:bclk_div[25]~2\,
	combout => \bclk_gen:bclk_div[26]~1_combout\,
	cout => \bclk_gen:bclk_div[26]~2\);

-- Location: FF_X79_Y40_N23
\bclk_gen:bclk_div[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk_i~inputclkctrl_outclk\,
	d => \bclk_gen:bclk_div[26]~1_combout\,
	sclr => \bclk_gen:bclk_div[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bclk_gen:bclk_div[26]~q\);

-- Location: LCCOMB_X79_Y40_N24
\bclk_gen:bclk_div[27]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \bclk_gen:bclk_div[27]~1_combout\ = (\bclk_gen:bclk_div[27]~q\ & (!\bclk_gen:bclk_div[26]~2\)) # (!\bclk_gen:bclk_div[27]~q\ & ((\bclk_gen:bclk_div[26]~2\) # (GND)))
-- \bclk_gen:bclk_div[27]~2\ = CARRY((!\bclk_gen:bclk_div[26]~2\) # (!\bclk_gen:bclk_div[27]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \bclk_gen:bclk_div[27]~q\,
	datad => VCC,
	cin => \bclk_gen:bclk_div[26]~2\,
	combout => \bclk_gen:bclk_div[27]~1_combout\,
	cout => \bclk_gen:bclk_div[27]~2\);

-- Location: FF_X79_Y40_N25
\bclk_gen:bclk_div[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk_i~inputclkctrl_outclk\,
	d => \bclk_gen:bclk_div[27]~1_combout\,
	sclr => \bclk_gen:bclk_div[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bclk_gen:bclk_div[27]~q\);

-- Location: LCCOMB_X79_Y40_N26
\bclk_gen:bclk_div[28]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \bclk_gen:bclk_div[28]~1_combout\ = (\bclk_gen:bclk_div[28]~q\ & (\bclk_gen:bclk_div[27]~2\ $ (GND))) # (!\bclk_gen:bclk_div[28]~q\ & (!\bclk_gen:bclk_div[27]~2\ & VCC))
-- \bclk_gen:bclk_div[28]~2\ = CARRY((\bclk_gen:bclk_div[28]~q\ & !\bclk_gen:bclk_div[27]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bclk_gen:bclk_div[28]~q\,
	datad => VCC,
	cin => \bclk_gen:bclk_div[27]~2\,
	combout => \bclk_gen:bclk_div[28]~1_combout\,
	cout => \bclk_gen:bclk_div[28]~2\);

-- Location: FF_X79_Y40_N27
\bclk_gen:bclk_div[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk_i~inputclkctrl_outclk\,
	d => \bclk_gen:bclk_div[28]~1_combout\,
	sclr => \bclk_gen:bclk_div[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bclk_gen:bclk_div[28]~q\);

-- Location: LCCOMB_X79_Y40_N28
\bclk_gen:bclk_div[29]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \bclk_gen:bclk_div[29]~1_combout\ = (\bclk_gen:bclk_div[29]~q\ & (!\bclk_gen:bclk_div[28]~2\)) # (!\bclk_gen:bclk_div[29]~q\ & ((\bclk_gen:bclk_div[28]~2\) # (GND)))
-- \bclk_gen:bclk_div[29]~2\ = CARRY((!\bclk_gen:bclk_div[28]~2\) # (!\bclk_gen:bclk_div[29]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \bclk_gen:bclk_div[29]~q\,
	datad => VCC,
	cin => \bclk_gen:bclk_div[28]~2\,
	combout => \bclk_gen:bclk_div[29]~1_combout\,
	cout => \bclk_gen:bclk_div[29]~2\);

-- Location: FF_X79_Y40_N29
\bclk_gen:bclk_div[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk_i~inputclkctrl_outclk\,
	d => \bclk_gen:bclk_div[29]~1_combout\,
	sclr => \bclk_gen:bclk_div[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bclk_gen:bclk_div[29]~q\);

-- Location: LCCOMB_X79_Y40_N30
\bclk_gen:bclk_div[30]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \bclk_gen:bclk_div[30]~1_combout\ = \bclk_gen:bclk_div[30]~q\ $ (!\bclk_gen:bclk_div[29]~2\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bclk_gen:bclk_div[30]~q\,
	cin => \bclk_gen:bclk_div[29]~2\,
	combout => \bclk_gen:bclk_div[30]~1_combout\);

-- Location: FF_X79_Y40_N31
\bclk_gen:bclk_div[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk_i~inputclkctrl_outclk\,
	d => \bclk_gen:bclk_div[30]~1_combout\,
	sclr => \bclk_gen:bclk_div[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bclk_gen:bclk_div[30]~q\);

-- Location: LCCOMB_X80_Y40_N20
\LessThan0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~8_combout\ = (!\bclk_gen:bclk_div[25]~q\ & (!\bclk_gen:bclk_div[26]~q\ & (!\bclk_gen:bclk_div[24]~q\ & !\bclk_gen:bclk_div[27]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bclk_gen:bclk_div[25]~q\,
	datab => \bclk_gen:bclk_div[26]~q\,
	datac => \bclk_gen:bclk_div[24]~q\,
	datad => \bclk_gen:bclk_div[27]~q\,
	combout => \LessThan0~8_combout\);

-- Location: LCCOMB_X80_Y40_N26
\LessThan0~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~9_combout\ = (!\bclk_gen:bclk_div[28]~q\ & (!\bclk_gen:bclk_div[29]~q\ & (!\bclk_gen:bclk_div[30]~q\ & \LessThan0~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bclk_gen:bclk_div[28]~q\,
	datab => \bclk_gen:bclk_div[29]~q\,
	datac => \bclk_gen:bclk_div[30]~q\,
	datad => \LessThan0~8_combout\,
	combout => \LessThan0~9_combout\);

-- Location: LCCOMB_X80_Y40_N22
\bclk_s~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \bclk_s~0_combout\ = \bclk_s~q\ $ ((((!\LessThan0~7_combout\) # (!\LessThan0~4_combout\)) # (!\LessThan0~9_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000001111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~9_combout\,
	datab => \LessThan0~4_combout\,
	datac => \LessThan0~7_combout\,
	datad => \bclk_s~q\,
	combout => \bclk_s~0_combout\);

-- Location: FF_X80_Y40_N7
bclk_s : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk_i~inputclkctrl_outclk\,
	asdata => \bclk_s~0_combout\,
	sclr => \ALT_INV_rst_i~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bclk_s~q\);

-- Location: LCCOMB_X55_Y37_N2
\lrck_gen:lrck_div[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \lrck_gen:lrck_div[0]~1_combout\ = \lrck_gen:lrck_div[0]~q\ $ (VCC)
-- \lrck_gen:lrck_div[0]~2\ = CARRY(\lrck_gen:lrck_div[0]~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \lrck_gen:lrck_div[0]~q\,
	datad => VCC,
	combout => \lrck_gen:lrck_div[0]~1_combout\,
	cout => \lrck_gen:lrck_div[0]~2\);

-- Location: LCCOMB_X56_Y36_N12
\lrck_gen:lrck_div[15]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \lrck_gen:lrck_div[15]~1_combout\ = (!\LessThan1~9_combout\) # (!\rst_i~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \rst_i~input_o\,
	datad => \LessThan1~9_combout\,
	combout => \lrck_gen:lrck_div[15]~1_combout\);

-- Location: FF_X55_Y37_N3
\lrck_gen:lrck_div[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk_i~inputclkctrl_outclk\,
	d => \lrck_gen:lrck_div[0]~1_combout\,
	sclr => \lrck_gen:lrck_div[15]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lrck_gen:lrck_div[0]~q\);

-- Location: LCCOMB_X55_Y37_N4
\lrck_gen:lrck_div[1]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \lrck_gen:lrck_div[1]~1_combout\ = (\lrck_gen:lrck_div[1]~q\ & (!\lrck_gen:lrck_div[0]~2\)) # (!\lrck_gen:lrck_div[1]~q\ & ((\lrck_gen:lrck_div[0]~2\) # (GND)))
-- \lrck_gen:lrck_div[1]~2\ = CARRY((!\lrck_gen:lrck_div[0]~2\) # (!\lrck_gen:lrck_div[1]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \lrck_gen:lrck_div[1]~q\,
	datad => VCC,
	cin => \lrck_gen:lrck_div[0]~2\,
	combout => \lrck_gen:lrck_div[1]~1_combout\,
	cout => \lrck_gen:lrck_div[1]~2\);

-- Location: FF_X55_Y37_N5
\lrck_gen:lrck_div[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk_i~inputclkctrl_outclk\,
	d => \lrck_gen:lrck_div[1]~1_combout\,
	sclr => \lrck_gen:lrck_div[15]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lrck_gen:lrck_div[1]~q\);

-- Location: LCCOMB_X55_Y37_N6
\lrck_gen:lrck_div[2]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \lrck_gen:lrck_div[2]~1_combout\ = (\lrck_gen:lrck_div[2]~q\ & (\lrck_gen:lrck_div[1]~2\ $ (GND))) # (!\lrck_gen:lrck_div[2]~q\ & (!\lrck_gen:lrck_div[1]~2\ & VCC))
-- \lrck_gen:lrck_div[2]~2\ = CARRY((\lrck_gen:lrck_div[2]~q\ & !\lrck_gen:lrck_div[1]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \lrck_gen:lrck_div[2]~q\,
	datad => VCC,
	cin => \lrck_gen:lrck_div[1]~2\,
	combout => \lrck_gen:lrck_div[2]~1_combout\,
	cout => \lrck_gen:lrck_div[2]~2\);

-- Location: FF_X55_Y37_N7
\lrck_gen:lrck_div[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk_i~inputclkctrl_outclk\,
	d => \lrck_gen:lrck_div[2]~1_combout\,
	sclr => \lrck_gen:lrck_div[15]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lrck_gen:lrck_div[2]~q\);

-- Location: LCCOMB_X55_Y37_N8
\lrck_gen:lrck_div[3]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \lrck_gen:lrck_div[3]~1_combout\ = (\lrck_gen:lrck_div[3]~q\ & (!\lrck_gen:lrck_div[2]~2\)) # (!\lrck_gen:lrck_div[3]~q\ & ((\lrck_gen:lrck_div[2]~2\) # (GND)))
-- \lrck_gen:lrck_div[3]~2\ = CARRY((!\lrck_gen:lrck_div[2]~2\) # (!\lrck_gen:lrck_div[3]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \lrck_gen:lrck_div[3]~q\,
	datad => VCC,
	cin => \lrck_gen:lrck_div[2]~2\,
	combout => \lrck_gen:lrck_div[3]~1_combout\,
	cout => \lrck_gen:lrck_div[3]~2\);

-- Location: FF_X55_Y37_N9
\lrck_gen:lrck_div[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk_i~inputclkctrl_outclk\,
	d => \lrck_gen:lrck_div[3]~1_combout\,
	sclr => \lrck_gen:lrck_div[15]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lrck_gen:lrck_div[3]~q\);

-- Location: LCCOMB_X55_Y37_N10
\lrck_gen:lrck_div[4]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \lrck_gen:lrck_div[4]~1_combout\ = (\lrck_gen:lrck_div[4]~q\ & (\lrck_gen:lrck_div[3]~2\ $ (GND))) # (!\lrck_gen:lrck_div[4]~q\ & (!\lrck_gen:lrck_div[3]~2\ & VCC))
-- \lrck_gen:lrck_div[4]~2\ = CARRY((\lrck_gen:lrck_div[4]~q\ & !\lrck_gen:lrck_div[3]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \lrck_gen:lrck_div[4]~q\,
	datad => VCC,
	cin => \lrck_gen:lrck_div[3]~2\,
	combout => \lrck_gen:lrck_div[4]~1_combout\,
	cout => \lrck_gen:lrck_div[4]~2\);

-- Location: FF_X55_Y37_N11
\lrck_gen:lrck_div[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk_i~inputclkctrl_outclk\,
	d => \lrck_gen:lrck_div[4]~1_combout\,
	sclr => \lrck_gen:lrck_div[15]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lrck_gen:lrck_div[4]~q\);

-- Location: LCCOMB_X55_Y37_N12
\lrck_gen:lrck_div[5]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \lrck_gen:lrck_div[5]~1_combout\ = (\lrck_gen:lrck_div[5]~q\ & (!\lrck_gen:lrck_div[4]~2\)) # (!\lrck_gen:lrck_div[5]~q\ & ((\lrck_gen:lrck_div[4]~2\) # (GND)))
-- \lrck_gen:lrck_div[5]~2\ = CARRY((!\lrck_gen:lrck_div[4]~2\) # (!\lrck_gen:lrck_div[5]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \lrck_gen:lrck_div[5]~q\,
	datad => VCC,
	cin => \lrck_gen:lrck_div[4]~2\,
	combout => \lrck_gen:lrck_div[5]~1_combout\,
	cout => \lrck_gen:lrck_div[5]~2\);

-- Location: FF_X55_Y37_N13
\lrck_gen:lrck_div[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk_i~inputclkctrl_outclk\,
	d => \lrck_gen:lrck_div[5]~1_combout\,
	sclr => \lrck_gen:lrck_div[15]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lrck_gen:lrck_div[5]~q\);

-- Location: LCCOMB_X55_Y37_N14
\lrck_gen:lrck_div[6]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \lrck_gen:lrck_div[6]~1_combout\ = (\lrck_gen:lrck_div[6]~q\ & (\lrck_gen:lrck_div[5]~2\ $ (GND))) # (!\lrck_gen:lrck_div[6]~q\ & (!\lrck_gen:lrck_div[5]~2\ & VCC))
-- \lrck_gen:lrck_div[6]~2\ = CARRY((\lrck_gen:lrck_div[6]~q\ & !\lrck_gen:lrck_div[5]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \lrck_gen:lrck_div[6]~q\,
	datad => VCC,
	cin => \lrck_gen:lrck_div[5]~2\,
	combout => \lrck_gen:lrck_div[6]~1_combout\,
	cout => \lrck_gen:lrck_div[6]~2\);

-- Location: FF_X55_Y37_N15
\lrck_gen:lrck_div[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk_i~inputclkctrl_outclk\,
	d => \lrck_gen:lrck_div[6]~1_combout\,
	sclr => \lrck_gen:lrck_div[15]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lrck_gen:lrck_div[6]~q\);

-- Location: LCCOMB_X55_Y37_N16
\lrck_gen:lrck_div[7]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \lrck_gen:lrck_div[7]~1_combout\ = (\lrck_gen:lrck_div[7]~q\ & (!\lrck_gen:lrck_div[6]~2\)) # (!\lrck_gen:lrck_div[7]~q\ & ((\lrck_gen:lrck_div[6]~2\) # (GND)))
-- \lrck_gen:lrck_div[7]~2\ = CARRY((!\lrck_gen:lrck_div[6]~2\) # (!\lrck_gen:lrck_div[7]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \lrck_gen:lrck_div[7]~q\,
	datad => VCC,
	cin => \lrck_gen:lrck_div[6]~2\,
	combout => \lrck_gen:lrck_div[7]~1_combout\,
	cout => \lrck_gen:lrck_div[7]~2\);

-- Location: FF_X55_Y37_N17
\lrck_gen:lrck_div[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk_i~inputclkctrl_outclk\,
	d => \lrck_gen:lrck_div[7]~1_combout\,
	sclr => \lrck_gen:lrck_div[15]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lrck_gen:lrck_div[7]~q\);

-- Location: LCCOMB_X55_Y37_N18
\lrck_gen:lrck_div[8]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \lrck_gen:lrck_div[8]~1_combout\ = (\lrck_gen:lrck_div[8]~q\ & (\lrck_gen:lrck_div[7]~2\ $ (GND))) # (!\lrck_gen:lrck_div[8]~q\ & (!\lrck_gen:lrck_div[7]~2\ & VCC))
-- \lrck_gen:lrck_div[8]~2\ = CARRY((\lrck_gen:lrck_div[8]~q\ & !\lrck_gen:lrck_div[7]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \lrck_gen:lrck_div[8]~q\,
	datad => VCC,
	cin => \lrck_gen:lrck_div[7]~2\,
	combout => \lrck_gen:lrck_div[8]~1_combout\,
	cout => \lrck_gen:lrck_div[8]~2\);

-- Location: FF_X55_Y37_N19
\lrck_gen:lrck_div[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk_i~inputclkctrl_outclk\,
	d => \lrck_gen:lrck_div[8]~1_combout\,
	sclr => \lrck_gen:lrck_div[15]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lrck_gen:lrck_div[8]~q\);

-- Location: LCCOMB_X55_Y37_N20
\lrck_gen:lrck_div[9]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \lrck_gen:lrck_div[9]~1_combout\ = (\lrck_gen:lrck_div[9]~q\ & (!\lrck_gen:lrck_div[8]~2\)) # (!\lrck_gen:lrck_div[9]~q\ & ((\lrck_gen:lrck_div[8]~2\) # (GND)))
-- \lrck_gen:lrck_div[9]~2\ = CARRY((!\lrck_gen:lrck_div[8]~2\) # (!\lrck_gen:lrck_div[9]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \lrck_gen:lrck_div[9]~q\,
	datad => VCC,
	cin => \lrck_gen:lrck_div[8]~2\,
	combout => \lrck_gen:lrck_div[9]~1_combout\,
	cout => \lrck_gen:lrck_div[9]~2\);

-- Location: FF_X55_Y37_N21
\lrck_gen:lrck_div[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk_i~inputclkctrl_outclk\,
	d => \lrck_gen:lrck_div[9]~1_combout\,
	sclr => \lrck_gen:lrck_div[15]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lrck_gen:lrck_div[9]~q\);

-- Location: LCCOMB_X55_Y37_N22
\lrck_gen:lrck_div[10]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \lrck_gen:lrck_div[10]~1_combout\ = (\lrck_gen:lrck_div[10]~q\ & (\lrck_gen:lrck_div[9]~2\ $ (GND))) # (!\lrck_gen:lrck_div[10]~q\ & (!\lrck_gen:lrck_div[9]~2\ & VCC))
-- \lrck_gen:lrck_div[10]~2\ = CARRY((\lrck_gen:lrck_div[10]~q\ & !\lrck_gen:lrck_div[9]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \lrck_gen:lrck_div[10]~q\,
	datad => VCC,
	cin => \lrck_gen:lrck_div[9]~2\,
	combout => \lrck_gen:lrck_div[10]~1_combout\,
	cout => \lrck_gen:lrck_div[10]~2\);

-- Location: FF_X55_Y37_N23
\lrck_gen:lrck_div[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk_i~inputclkctrl_outclk\,
	d => \lrck_gen:lrck_div[10]~1_combout\,
	sclr => \lrck_gen:lrck_div[15]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lrck_gen:lrck_div[10]~q\);

-- Location: LCCOMB_X55_Y37_N24
\lrck_gen:lrck_div[11]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \lrck_gen:lrck_div[11]~1_combout\ = (\lrck_gen:lrck_div[11]~q\ & (!\lrck_gen:lrck_div[10]~2\)) # (!\lrck_gen:lrck_div[11]~q\ & ((\lrck_gen:lrck_div[10]~2\) # (GND)))
-- \lrck_gen:lrck_div[11]~2\ = CARRY((!\lrck_gen:lrck_div[10]~2\) # (!\lrck_gen:lrck_div[11]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \lrck_gen:lrck_div[11]~q\,
	datad => VCC,
	cin => \lrck_gen:lrck_div[10]~2\,
	combout => \lrck_gen:lrck_div[11]~1_combout\,
	cout => \lrck_gen:lrck_div[11]~2\);

-- Location: FF_X55_Y37_N25
\lrck_gen:lrck_div[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk_i~inputclkctrl_outclk\,
	d => \lrck_gen:lrck_div[11]~1_combout\,
	sclr => \lrck_gen:lrck_div[15]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lrck_gen:lrck_div[11]~q\);

-- Location: LCCOMB_X55_Y37_N26
\lrck_gen:lrck_div[12]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \lrck_gen:lrck_div[12]~1_combout\ = (\lrck_gen:lrck_div[12]~q\ & (\lrck_gen:lrck_div[11]~2\ $ (GND))) # (!\lrck_gen:lrck_div[12]~q\ & (!\lrck_gen:lrck_div[11]~2\ & VCC))
-- \lrck_gen:lrck_div[12]~2\ = CARRY((\lrck_gen:lrck_div[12]~q\ & !\lrck_gen:lrck_div[11]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \lrck_gen:lrck_div[12]~q\,
	datad => VCC,
	cin => \lrck_gen:lrck_div[11]~2\,
	combout => \lrck_gen:lrck_div[12]~1_combout\,
	cout => \lrck_gen:lrck_div[12]~2\);

-- Location: FF_X55_Y37_N27
\lrck_gen:lrck_div[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk_i~inputclkctrl_outclk\,
	d => \lrck_gen:lrck_div[12]~1_combout\,
	sclr => \lrck_gen:lrck_div[15]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lrck_gen:lrck_div[12]~q\);

-- Location: LCCOMB_X55_Y37_N28
\lrck_gen:lrck_div[13]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \lrck_gen:lrck_div[13]~1_combout\ = (\lrck_gen:lrck_div[13]~q\ & (!\lrck_gen:lrck_div[12]~2\)) # (!\lrck_gen:lrck_div[13]~q\ & ((\lrck_gen:lrck_div[12]~2\) # (GND)))
-- \lrck_gen:lrck_div[13]~2\ = CARRY((!\lrck_gen:lrck_div[12]~2\) # (!\lrck_gen:lrck_div[13]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \lrck_gen:lrck_div[13]~q\,
	datad => VCC,
	cin => \lrck_gen:lrck_div[12]~2\,
	combout => \lrck_gen:lrck_div[13]~1_combout\,
	cout => \lrck_gen:lrck_div[13]~2\);

-- Location: FF_X55_Y37_N29
\lrck_gen:lrck_div[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk_i~inputclkctrl_outclk\,
	d => \lrck_gen:lrck_div[13]~1_combout\,
	sclr => \lrck_gen:lrck_div[15]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lrck_gen:lrck_div[13]~q\);

-- Location: LCCOMB_X55_Y37_N30
\lrck_gen:lrck_div[14]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \lrck_gen:lrck_div[14]~1_combout\ = (\lrck_gen:lrck_div[14]~q\ & (\lrck_gen:lrck_div[13]~2\ $ (GND))) # (!\lrck_gen:lrck_div[14]~q\ & (!\lrck_gen:lrck_div[13]~2\ & VCC))
-- \lrck_gen:lrck_div[14]~2\ = CARRY((\lrck_gen:lrck_div[14]~q\ & !\lrck_gen:lrck_div[13]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \lrck_gen:lrck_div[14]~q\,
	datad => VCC,
	cin => \lrck_gen:lrck_div[13]~2\,
	combout => \lrck_gen:lrck_div[14]~1_combout\,
	cout => \lrck_gen:lrck_div[14]~2\);

-- Location: FF_X55_Y37_N31
\lrck_gen:lrck_div[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk_i~inputclkctrl_outclk\,
	d => \lrck_gen:lrck_div[14]~1_combout\,
	sclr => \lrck_gen:lrck_div[15]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lrck_gen:lrck_div[14]~q\);

-- Location: LCCOMB_X55_Y36_N0
\lrck_gen:lrck_div[15]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \lrck_gen:lrck_div[15]~2_combout\ = (\lrck_gen:lrck_div[15]~q\ & (!\lrck_gen:lrck_div[14]~2\)) # (!\lrck_gen:lrck_div[15]~q\ & ((\lrck_gen:lrck_div[14]~2\) # (GND)))
-- \lrck_gen:lrck_div[15]~3\ = CARRY((!\lrck_gen:lrck_div[14]~2\) # (!\lrck_gen:lrck_div[15]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \lrck_gen:lrck_div[15]~q\,
	datad => VCC,
	cin => \lrck_gen:lrck_div[14]~2\,
	combout => \lrck_gen:lrck_div[15]~2_combout\,
	cout => \lrck_gen:lrck_div[15]~3\);

-- Location: FF_X55_Y36_N1
\lrck_gen:lrck_div[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk_i~inputclkctrl_outclk\,
	d => \lrck_gen:lrck_div[15]~2_combout\,
	sclr => \lrck_gen:lrck_div[15]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lrck_gen:lrck_div[15]~q\);

-- Location: LCCOMB_X55_Y36_N2
\lrck_gen:lrck_div[16]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \lrck_gen:lrck_div[16]~1_combout\ = (\lrck_gen:lrck_div[16]~q\ & (\lrck_gen:lrck_div[15]~3\ $ (GND))) # (!\lrck_gen:lrck_div[16]~q\ & (!\lrck_gen:lrck_div[15]~3\ & VCC))
-- \lrck_gen:lrck_div[16]~2\ = CARRY((\lrck_gen:lrck_div[16]~q\ & !\lrck_gen:lrck_div[15]~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \lrck_gen:lrck_div[16]~q\,
	datad => VCC,
	cin => \lrck_gen:lrck_div[15]~3\,
	combout => \lrck_gen:lrck_div[16]~1_combout\,
	cout => \lrck_gen:lrck_div[16]~2\);

-- Location: FF_X55_Y36_N3
\lrck_gen:lrck_div[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk_i~inputclkctrl_outclk\,
	d => \lrck_gen:lrck_div[16]~1_combout\,
	sclr => \lrck_gen:lrck_div[15]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lrck_gen:lrck_div[16]~q\);

-- Location: LCCOMB_X55_Y36_N4
\lrck_gen:lrck_div[17]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \lrck_gen:lrck_div[17]~1_combout\ = (\lrck_gen:lrck_div[17]~q\ & (!\lrck_gen:lrck_div[16]~2\)) # (!\lrck_gen:lrck_div[17]~q\ & ((\lrck_gen:lrck_div[16]~2\) # (GND)))
-- \lrck_gen:lrck_div[17]~2\ = CARRY((!\lrck_gen:lrck_div[16]~2\) # (!\lrck_gen:lrck_div[17]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \lrck_gen:lrck_div[17]~q\,
	datad => VCC,
	cin => \lrck_gen:lrck_div[16]~2\,
	combout => \lrck_gen:lrck_div[17]~1_combout\,
	cout => \lrck_gen:lrck_div[17]~2\);

-- Location: FF_X55_Y36_N5
\lrck_gen:lrck_div[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk_i~inputclkctrl_outclk\,
	d => \lrck_gen:lrck_div[17]~1_combout\,
	sclr => \lrck_gen:lrck_div[15]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lrck_gen:lrck_div[17]~q\);

-- Location: LCCOMB_X55_Y36_N6
\lrck_gen:lrck_div[18]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \lrck_gen:lrck_div[18]~1_combout\ = (\lrck_gen:lrck_div[18]~q\ & (\lrck_gen:lrck_div[17]~2\ $ (GND))) # (!\lrck_gen:lrck_div[18]~q\ & (!\lrck_gen:lrck_div[17]~2\ & VCC))
-- \lrck_gen:lrck_div[18]~2\ = CARRY((\lrck_gen:lrck_div[18]~q\ & !\lrck_gen:lrck_div[17]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \lrck_gen:lrck_div[18]~q\,
	datad => VCC,
	cin => \lrck_gen:lrck_div[17]~2\,
	combout => \lrck_gen:lrck_div[18]~1_combout\,
	cout => \lrck_gen:lrck_div[18]~2\);

-- Location: FF_X55_Y36_N7
\lrck_gen:lrck_div[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk_i~inputclkctrl_outclk\,
	d => \lrck_gen:lrck_div[18]~1_combout\,
	sclr => \lrck_gen:lrck_div[15]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lrck_gen:lrck_div[18]~q\);

-- Location: LCCOMB_X55_Y36_N8
\lrck_gen:lrck_div[19]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \lrck_gen:lrck_div[19]~1_combout\ = (\lrck_gen:lrck_div[19]~q\ & (!\lrck_gen:lrck_div[18]~2\)) # (!\lrck_gen:lrck_div[19]~q\ & ((\lrck_gen:lrck_div[18]~2\) # (GND)))
-- \lrck_gen:lrck_div[19]~2\ = CARRY((!\lrck_gen:lrck_div[18]~2\) # (!\lrck_gen:lrck_div[19]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \lrck_gen:lrck_div[19]~q\,
	datad => VCC,
	cin => \lrck_gen:lrck_div[18]~2\,
	combout => \lrck_gen:lrck_div[19]~1_combout\,
	cout => \lrck_gen:lrck_div[19]~2\);

-- Location: FF_X55_Y36_N9
\lrck_gen:lrck_div[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk_i~inputclkctrl_outclk\,
	d => \lrck_gen:lrck_div[19]~1_combout\,
	sclr => \lrck_gen:lrck_div[15]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lrck_gen:lrck_div[19]~q\);

-- Location: LCCOMB_X55_Y36_N10
\lrck_gen:lrck_div[20]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \lrck_gen:lrck_div[20]~1_combout\ = (\lrck_gen:lrck_div[20]~q\ & (\lrck_gen:lrck_div[19]~2\ $ (GND))) # (!\lrck_gen:lrck_div[20]~q\ & (!\lrck_gen:lrck_div[19]~2\ & VCC))
-- \lrck_gen:lrck_div[20]~2\ = CARRY((\lrck_gen:lrck_div[20]~q\ & !\lrck_gen:lrck_div[19]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \lrck_gen:lrck_div[20]~q\,
	datad => VCC,
	cin => \lrck_gen:lrck_div[19]~2\,
	combout => \lrck_gen:lrck_div[20]~1_combout\,
	cout => \lrck_gen:lrck_div[20]~2\);

-- Location: FF_X55_Y36_N11
\lrck_gen:lrck_div[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk_i~inputclkctrl_outclk\,
	d => \lrck_gen:lrck_div[20]~1_combout\,
	sclr => \lrck_gen:lrck_div[15]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lrck_gen:lrck_div[20]~q\);

-- Location: LCCOMB_X55_Y36_N12
\lrck_gen:lrck_div[21]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \lrck_gen:lrck_div[21]~1_combout\ = (\lrck_gen:lrck_div[21]~q\ & (!\lrck_gen:lrck_div[20]~2\)) # (!\lrck_gen:lrck_div[21]~q\ & ((\lrck_gen:lrck_div[20]~2\) # (GND)))
-- \lrck_gen:lrck_div[21]~2\ = CARRY((!\lrck_gen:lrck_div[20]~2\) # (!\lrck_gen:lrck_div[21]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \lrck_gen:lrck_div[21]~q\,
	datad => VCC,
	cin => \lrck_gen:lrck_div[20]~2\,
	combout => \lrck_gen:lrck_div[21]~1_combout\,
	cout => \lrck_gen:lrck_div[21]~2\);

-- Location: FF_X55_Y36_N13
\lrck_gen:lrck_div[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk_i~inputclkctrl_outclk\,
	d => \lrck_gen:lrck_div[21]~1_combout\,
	sclr => \lrck_gen:lrck_div[15]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lrck_gen:lrck_div[21]~q\);

-- Location: LCCOMB_X55_Y36_N14
\lrck_gen:lrck_div[22]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \lrck_gen:lrck_div[22]~1_combout\ = (\lrck_gen:lrck_div[22]~q\ & (\lrck_gen:lrck_div[21]~2\ $ (GND))) # (!\lrck_gen:lrck_div[22]~q\ & (!\lrck_gen:lrck_div[21]~2\ & VCC))
-- \lrck_gen:lrck_div[22]~2\ = CARRY((\lrck_gen:lrck_div[22]~q\ & !\lrck_gen:lrck_div[21]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \lrck_gen:lrck_div[22]~q\,
	datad => VCC,
	cin => \lrck_gen:lrck_div[21]~2\,
	combout => \lrck_gen:lrck_div[22]~1_combout\,
	cout => \lrck_gen:lrck_div[22]~2\);

-- Location: FF_X55_Y36_N15
\lrck_gen:lrck_div[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk_i~inputclkctrl_outclk\,
	d => \lrck_gen:lrck_div[22]~1_combout\,
	sclr => \lrck_gen:lrck_div[15]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lrck_gen:lrck_div[22]~q\);

-- Location: LCCOMB_X55_Y36_N16
\lrck_gen:lrck_div[23]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \lrck_gen:lrck_div[23]~1_combout\ = (\lrck_gen:lrck_div[23]~q\ & (!\lrck_gen:lrck_div[22]~2\)) # (!\lrck_gen:lrck_div[23]~q\ & ((\lrck_gen:lrck_div[22]~2\) # (GND)))
-- \lrck_gen:lrck_div[23]~2\ = CARRY((!\lrck_gen:lrck_div[22]~2\) # (!\lrck_gen:lrck_div[23]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \lrck_gen:lrck_div[23]~q\,
	datad => VCC,
	cin => \lrck_gen:lrck_div[22]~2\,
	combout => \lrck_gen:lrck_div[23]~1_combout\,
	cout => \lrck_gen:lrck_div[23]~2\);

-- Location: FF_X55_Y36_N17
\lrck_gen:lrck_div[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk_i~inputclkctrl_outclk\,
	d => \lrck_gen:lrck_div[23]~1_combout\,
	sclr => \lrck_gen:lrck_div[15]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lrck_gen:lrck_div[23]~q\);

-- Location: LCCOMB_X55_Y36_N18
\lrck_gen:lrck_div[24]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \lrck_gen:lrck_div[24]~1_combout\ = (\lrck_gen:lrck_div[24]~q\ & (\lrck_gen:lrck_div[23]~2\ $ (GND))) # (!\lrck_gen:lrck_div[24]~q\ & (!\lrck_gen:lrck_div[23]~2\ & VCC))
-- \lrck_gen:lrck_div[24]~2\ = CARRY((\lrck_gen:lrck_div[24]~q\ & !\lrck_gen:lrck_div[23]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \lrck_gen:lrck_div[24]~q\,
	datad => VCC,
	cin => \lrck_gen:lrck_div[23]~2\,
	combout => \lrck_gen:lrck_div[24]~1_combout\,
	cout => \lrck_gen:lrck_div[24]~2\);

-- Location: FF_X55_Y36_N19
\lrck_gen:lrck_div[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk_i~inputclkctrl_outclk\,
	d => \lrck_gen:lrck_div[24]~1_combout\,
	sclr => \lrck_gen:lrck_div[15]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lrck_gen:lrck_div[24]~q\);

-- Location: LCCOMB_X55_Y36_N20
\lrck_gen:lrck_div[25]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \lrck_gen:lrck_div[25]~1_combout\ = (\lrck_gen:lrck_div[25]~q\ & (!\lrck_gen:lrck_div[24]~2\)) # (!\lrck_gen:lrck_div[25]~q\ & ((\lrck_gen:lrck_div[24]~2\) # (GND)))
-- \lrck_gen:lrck_div[25]~2\ = CARRY((!\lrck_gen:lrck_div[24]~2\) # (!\lrck_gen:lrck_div[25]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \lrck_gen:lrck_div[25]~q\,
	datad => VCC,
	cin => \lrck_gen:lrck_div[24]~2\,
	combout => \lrck_gen:lrck_div[25]~1_combout\,
	cout => \lrck_gen:lrck_div[25]~2\);

-- Location: FF_X55_Y36_N21
\lrck_gen:lrck_div[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk_i~inputclkctrl_outclk\,
	d => \lrck_gen:lrck_div[25]~1_combout\,
	sclr => \lrck_gen:lrck_div[15]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lrck_gen:lrck_div[25]~q\);

-- Location: LCCOMB_X55_Y36_N22
\lrck_gen:lrck_div[26]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \lrck_gen:lrck_div[26]~1_combout\ = (\lrck_gen:lrck_div[26]~q\ & (\lrck_gen:lrck_div[25]~2\ $ (GND))) # (!\lrck_gen:lrck_div[26]~q\ & (!\lrck_gen:lrck_div[25]~2\ & VCC))
-- \lrck_gen:lrck_div[26]~2\ = CARRY((\lrck_gen:lrck_div[26]~q\ & !\lrck_gen:lrck_div[25]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \lrck_gen:lrck_div[26]~q\,
	datad => VCC,
	cin => \lrck_gen:lrck_div[25]~2\,
	combout => \lrck_gen:lrck_div[26]~1_combout\,
	cout => \lrck_gen:lrck_div[26]~2\);

-- Location: FF_X55_Y36_N23
\lrck_gen:lrck_div[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk_i~inputclkctrl_outclk\,
	d => \lrck_gen:lrck_div[26]~1_combout\,
	sclr => \lrck_gen:lrck_div[15]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lrck_gen:lrck_div[26]~q\);

-- Location: LCCOMB_X55_Y36_N24
\lrck_gen:lrck_div[27]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \lrck_gen:lrck_div[27]~1_combout\ = (\lrck_gen:lrck_div[27]~q\ & (!\lrck_gen:lrck_div[26]~2\)) # (!\lrck_gen:lrck_div[27]~q\ & ((\lrck_gen:lrck_div[26]~2\) # (GND)))
-- \lrck_gen:lrck_div[27]~2\ = CARRY((!\lrck_gen:lrck_div[26]~2\) # (!\lrck_gen:lrck_div[27]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \lrck_gen:lrck_div[27]~q\,
	datad => VCC,
	cin => \lrck_gen:lrck_div[26]~2\,
	combout => \lrck_gen:lrck_div[27]~1_combout\,
	cout => \lrck_gen:lrck_div[27]~2\);

-- Location: FF_X55_Y36_N25
\lrck_gen:lrck_div[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk_i~inputclkctrl_outclk\,
	d => \lrck_gen:lrck_div[27]~1_combout\,
	sclr => \lrck_gen:lrck_div[15]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lrck_gen:lrck_div[27]~q\);

-- Location: LCCOMB_X55_Y36_N26
\lrck_gen:lrck_div[28]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \lrck_gen:lrck_div[28]~1_combout\ = (\lrck_gen:lrck_div[28]~q\ & (\lrck_gen:lrck_div[27]~2\ $ (GND))) # (!\lrck_gen:lrck_div[28]~q\ & (!\lrck_gen:lrck_div[27]~2\ & VCC))
-- \lrck_gen:lrck_div[28]~2\ = CARRY((\lrck_gen:lrck_div[28]~q\ & !\lrck_gen:lrck_div[27]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \lrck_gen:lrck_div[28]~q\,
	datad => VCC,
	cin => \lrck_gen:lrck_div[27]~2\,
	combout => \lrck_gen:lrck_div[28]~1_combout\,
	cout => \lrck_gen:lrck_div[28]~2\);

-- Location: FF_X55_Y36_N27
\lrck_gen:lrck_div[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk_i~inputclkctrl_outclk\,
	d => \lrck_gen:lrck_div[28]~1_combout\,
	sclr => \lrck_gen:lrck_div[15]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lrck_gen:lrck_div[28]~q\);

-- Location: LCCOMB_X55_Y36_N28
\lrck_gen:lrck_div[29]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \lrck_gen:lrck_div[29]~1_combout\ = (\lrck_gen:lrck_div[29]~q\ & (!\lrck_gen:lrck_div[28]~2\)) # (!\lrck_gen:lrck_div[29]~q\ & ((\lrck_gen:lrck_div[28]~2\) # (GND)))
-- \lrck_gen:lrck_div[29]~2\ = CARRY((!\lrck_gen:lrck_div[28]~2\) # (!\lrck_gen:lrck_div[29]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \lrck_gen:lrck_div[29]~q\,
	datad => VCC,
	cin => \lrck_gen:lrck_div[28]~2\,
	combout => \lrck_gen:lrck_div[29]~1_combout\,
	cout => \lrck_gen:lrck_div[29]~2\);

-- Location: FF_X55_Y36_N29
\lrck_gen:lrck_div[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk_i~inputclkctrl_outclk\,
	d => \lrck_gen:lrck_div[29]~1_combout\,
	sclr => \lrck_gen:lrck_div[15]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lrck_gen:lrck_div[29]~q\);

-- Location: LCCOMB_X55_Y36_N30
\lrck_gen:lrck_div[30]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \lrck_gen:lrck_div[30]~1_combout\ = \lrck_gen:lrck_div[30]~q\ $ (!\lrck_gen:lrck_div[29]~2\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \lrck_gen:lrck_div[30]~q\,
	cin => \lrck_gen:lrck_div[29]~2\,
	combout => \lrck_gen:lrck_div[30]~1_combout\);

-- Location: FF_X55_Y36_N31
\lrck_gen:lrck_div[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk_i~inputclkctrl_outclk\,
	d => \lrck_gen:lrck_div[30]~1_combout\,
	sclr => \lrck_gen:lrck_div[15]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lrck_gen:lrck_div[30]~q\);

-- Location: LCCOMB_X56_Y36_N28
\LessThan1~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan1~5_combout\ = (!\lrck_gen:lrck_div[27]~q\ & (!\lrck_gen:lrck_div[26]~q\ & (!\lrck_gen:lrck_div[25]~q\ & !\lrck_gen:lrck_div[24]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lrck_gen:lrck_div[27]~q\,
	datab => \lrck_gen:lrck_div[26]~q\,
	datac => \lrck_gen:lrck_div[25]~q\,
	datad => \lrck_gen:lrck_div[24]~q\,
	combout => \LessThan1~5_combout\);

-- Location: LCCOMB_X56_Y36_N26
\LessThan1~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan1~6_combout\ = (!\lrck_gen:lrck_div[28]~q\ & (!\lrck_gen:lrck_div[29]~q\ & (!\lrck_gen:lrck_div[30]~q\ & \LessThan1~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lrck_gen:lrck_div[28]~q\,
	datab => \lrck_gen:lrck_div[29]~q\,
	datac => \lrck_gen:lrck_div[30]~q\,
	datad => \LessThan1~5_combout\,
	combout => \LessThan1~6_combout\);

-- Location: LCCOMB_X55_Y37_N0
\LessThan1~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan1~7_combout\ = (((!\lrck_gen:lrck_div[2]~q\) # (!\lrck_gen:lrck_div[3]~q\)) # (!\lrck_gen:lrck_div[1]~q\)) # (!\lrck_gen:lrck_div[0]~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lrck_gen:lrck_div[0]~q\,
	datab => \lrck_gen:lrck_div[1]~q\,
	datac => \lrck_gen:lrck_div[3]~q\,
	datad => \lrck_gen:lrck_div[2]~q\,
	combout => \LessThan1~7_combout\);

-- Location: LCCOMB_X56_Y36_N4
\LessThan1~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan1~8_combout\ = (!\lrck_gen:lrck_div[6]~q\ & (((\LessThan1~7_combout\) # (!\lrck_gen:lrck_div[4]~q\)) # (!\lrck_gen:lrck_div[5]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lrck_gen:lrck_div[6]~q\,
	datab => \lrck_gen:lrck_div[5]~q\,
	datac => \LessThan1~7_combout\,
	datad => \lrck_gen:lrck_div[4]~q\,
	combout => \LessThan1~8_combout\);

-- Location: LCCOMB_X56_Y36_N22
\LessThan1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan1~2_combout\ = (!\lrck_gen:lrck_div[19]~q\ & (!\lrck_gen:lrck_div[18]~q\ & (!\lrck_gen:lrck_div[17]~q\ & !\lrck_gen:lrck_div[16]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lrck_gen:lrck_div[19]~q\,
	datab => \lrck_gen:lrck_div[18]~q\,
	datac => \lrck_gen:lrck_div[17]~q\,
	datad => \lrck_gen:lrck_div[16]~q\,
	combout => \LessThan1~2_combout\);

-- Location: LCCOMB_X56_Y36_N20
\LessThan1~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan1~3_combout\ = (!\lrck_gen:lrck_div[22]~q\ & (!\lrck_gen:lrck_div[21]~q\ & (!\lrck_gen:lrck_div[23]~q\ & !\lrck_gen:lrck_div[20]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lrck_gen:lrck_div[22]~q\,
	datab => \lrck_gen:lrck_div[21]~q\,
	datac => \lrck_gen:lrck_div[23]~q\,
	datad => \lrck_gen:lrck_div[20]~q\,
	combout => \LessThan1~3_combout\);

-- Location: LCCOMB_X56_Y36_N8
\LessThan1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan1~1_combout\ = (!\lrck_gen:lrck_div[14]~q\ & (!\lrck_gen:lrck_div[15]~q\ & (!\lrck_gen:lrck_div[13]~q\ & !\lrck_gen:lrck_div[12]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lrck_gen:lrck_div[14]~q\,
	datab => \lrck_gen:lrck_div[15]~q\,
	datac => \lrck_gen:lrck_div[13]~q\,
	datad => \lrck_gen:lrck_div[12]~q\,
	combout => \LessThan1~1_combout\);

-- Location: LCCOMB_X56_Y36_N6
\LessThan1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan1~0_combout\ = (!\lrck_gen:lrck_div[11]~q\ & (!\lrck_gen:lrck_div[9]~q\ & (!\lrck_gen:lrck_div[8]~q\ & !\lrck_gen:lrck_div[10]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lrck_gen:lrck_div[11]~q\,
	datab => \lrck_gen:lrck_div[9]~q\,
	datac => \lrck_gen:lrck_div[8]~q\,
	datad => \lrck_gen:lrck_div[10]~q\,
	combout => \LessThan1~0_combout\);

-- Location: LCCOMB_X56_Y36_N2
\LessThan1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan1~4_combout\ = (\LessThan1~2_combout\ & (\LessThan1~3_combout\ & (\LessThan1~1_combout\ & \LessThan1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan1~2_combout\,
	datab => \LessThan1~3_combout\,
	datac => \LessThan1~1_combout\,
	datad => \LessThan1~0_combout\,
	combout => \LessThan1~4_combout\);

-- Location: LCCOMB_X56_Y36_N18
\LessThan1~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan1~9_combout\ = (\LessThan1~6_combout\ & (\LessThan1~4_combout\ & ((\LessThan1~8_combout\) # (!\lrck_gen:lrck_div[7]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan1~6_combout\,
	datab => \lrck_gen:lrck_div[7]~q\,
	datac => \LessThan1~8_combout\,
	datad => \LessThan1~4_combout\,
	combout => \LessThan1~9_combout\);

-- Location: LCCOMB_X56_Y36_N16
\lrck_s~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \lrck_s~0_combout\ = \lrck_s~q\ $ (!\LessThan1~9_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \lrck_s~q\,
	datad => \LessThan1~9_combout\,
	combout => \lrck_s~0_combout\);

-- Location: FF_X56_Y36_N17
lrck_s : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk_i~inputclkctrl_outclk\,
	d => \lrck_s~0_combout\,
	sclr => \ALT_INV_rst_i~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lrck_s~q\);

-- Location: CLKCTRL_G5
\bclk_s~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \bclk_s~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \bclk_s~clkctrl_outclk\);

-- Location: LCCOMB_X81_Y40_N12
\sin_ctrl:sel_counter[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \sin_ctrl:sel_counter[0]~1_combout\ = \sin_ctrl:sel_counter[0]~q\ $ (VCC)
-- \sin_ctrl:sel_counter[0]~2\ = CARRY(\sin_ctrl:sel_counter[0]~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sin_ctrl:sel_counter[0]~q\,
	datad => VCC,
	combout => \sin_ctrl:sel_counter[0]~1_combout\,
	cout => \sin_ctrl:sel_counter[0]~2\);

-- Location: FF_X81_Y40_N13
\sin_ctrl:sel_counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_bclk_s~clkctrl_outclk\,
	d => \sin_ctrl:sel_counter[0]~1_combout\,
	sclr => \ALT_INV_rst_i~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sin_ctrl:sel_counter[0]~q\);

-- Location: LCCOMB_X81_Y40_N14
\sin_ctrl:sel_counter[1]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \sin_ctrl:sel_counter[1]~1_combout\ = (\sin_ctrl:sel_counter[1]~q\ & (!\sin_ctrl:sel_counter[0]~2\)) # (!\sin_ctrl:sel_counter[1]~q\ & ((\sin_ctrl:sel_counter[0]~2\) # (GND)))
-- \sin_ctrl:sel_counter[1]~2\ = CARRY((!\sin_ctrl:sel_counter[0]~2\) # (!\sin_ctrl:sel_counter[1]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \sin_ctrl:sel_counter[1]~q\,
	datad => VCC,
	cin => \sin_ctrl:sel_counter[0]~2\,
	combout => \sin_ctrl:sel_counter[1]~1_combout\,
	cout => \sin_ctrl:sel_counter[1]~2\);

-- Location: FF_X81_Y40_N15
\sin_ctrl:sel_counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_bclk_s~clkctrl_outclk\,
	d => \sin_ctrl:sel_counter[1]~1_combout\,
	sclr => \ALT_INV_rst_i~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sin_ctrl:sel_counter[1]~q\);

-- Location: LCCOMB_X81_Y40_N16
\sin_ctrl:sel_counter[2]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \sin_ctrl:sel_counter[2]~1_combout\ = (\sin_ctrl:sel_counter[2]~q\ & (\sin_ctrl:sel_counter[1]~2\ $ (GND))) # (!\sin_ctrl:sel_counter[2]~q\ & (!\sin_ctrl:sel_counter[1]~2\ & VCC))
-- \sin_ctrl:sel_counter[2]~2\ = CARRY((\sin_ctrl:sel_counter[2]~q\ & !\sin_ctrl:sel_counter[1]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \sin_ctrl:sel_counter[2]~q\,
	datad => VCC,
	cin => \sin_ctrl:sel_counter[1]~2\,
	combout => \sin_ctrl:sel_counter[2]~1_combout\,
	cout => \sin_ctrl:sel_counter[2]~2\);

-- Location: FF_X81_Y40_N17
\sin_ctrl:sel_counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_bclk_s~clkctrl_outclk\,
	d => \sin_ctrl:sel_counter[2]~1_combout\,
	sclr => \ALT_INV_rst_i~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sin_ctrl:sel_counter[2]~q\);

-- Location: LCCOMB_X81_Y40_N18
\sin_ctrl:sel_counter[3]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \sin_ctrl:sel_counter[3]~1_combout\ = \sin_ctrl:sel_counter[2]~2\ $ (\sin_ctrl:sel_counter[3]~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \sin_ctrl:sel_counter[3]~q\,
	cin => \sin_ctrl:sel_counter[2]~2\,
	combout => \sin_ctrl:sel_counter[3]~1_combout\);

-- Location: FF_X81_Y40_N19
\sin_ctrl:sel_counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_bclk_s~clkctrl_outclk\,
	d => \sin_ctrl:sel_counter[3]~1_combout\,
	sclr => \ALT_INV_rst_i~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sin_ctrl:sel_counter[3]~q\);

-- Location: LCCOMB_X81_Y40_N4
\Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux0~0_combout\ = (\sin_ctrl:sel_counter[1]~q\ & (!\sin_ctrl:sel_counter[3]~q\ & (\sin_ctrl:sel_counter[0]~q\ $ (!\sin_ctrl:sel_counter[2]~q\)))) # (!\sin_ctrl:sel_counter[1]~q\ & (\sin_ctrl:sel_counter[2]~q\ & ((!\sin_ctrl:sel_counter[3]~q\) # 
-- (!\sin_ctrl:sel_counter[0]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000011010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sin_ctrl:sel_counter[1]~q\,
	datab => \sin_ctrl:sel_counter[0]~q\,
	datac => \sin_ctrl:sel_counter[2]~q\,
	datad => \sin_ctrl:sel_counter[3]~q\,
	combout => \Mux0~0_combout\);

ww_bclk_o <= \bclk_o~output_o\;

ww_lrck_o <= \lrck_o~output_o\;

ww_data_o <= \data_o~output_o\;
END structure;


