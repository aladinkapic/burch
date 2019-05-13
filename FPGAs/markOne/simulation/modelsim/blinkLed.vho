-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 18.1.0 Build 625 09/12/2018 SJ Lite Edition"

-- DATE "01/27/2019 11:17:32"

-- 
-- Device: Altera EP4CE22F17C6 Package FBGA256
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
-- ~ALTERA_ASDO_DATA1~	=>  Location: PIN_C1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_FLASH_nCE_nCSO~	=>  Location: PIN_D2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DCLK~	=>  Location: PIN_H1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DATA0~	=>  Location: PIN_H2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCEO~	=>  Location: PIN_F16,	 I/O Standard: 2.5 V,	 Current Strength: 8mA


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

ENTITY 	blinkLed IS
    PORT (
	clk_50mhz : IN std_logic;
	reset_btn : IN std_logic;
	green_led : OUT std_logic
	);
END blinkLed;

-- Design Ports Information
-- green_led	=>  Location: PIN_A15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset_btn	=>  Location: PIN_T8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk_50mhz	=>  Location: PIN_R8,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF blinkLed IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk_50mhz : std_logic;
SIGNAL ww_reset_btn : std_logic;
SIGNAL ww_green_led : std_logic;
SIGNAL \reset_btn~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk_50mhz~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \green_led~output_o\ : std_logic;
SIGNAL \clk_50mhz~input_o\ : std_logic;
SIGNAL \clk_50mhz~inputclkctrl_outclk\ : std_logic;
SIGNAL \scaler[0]~25_combout\ : std_logic;
SIGNAL \reset_btn~input_o\ : std_logic;
SIGNAL \reset_btn~inputclkctrl_outclk\ : std_logic;
SIGNAL \scaler[0]~26\ : std_logic;
SIGNAL \scaler[1]~27_combout\ : std_logic;
SIGNAL \scaler[1]~28\ : std_logic;
SIGNAL \scaler[2]~29_combout\ : std_logic;
SIGNAL \scaler[2]~30\ : std_logic;
SIGNAL \scaler[3]~31_combout\ : std_logic;
SIGNAL \scaler[3]~32\ : std_logic;
SIGNAL \scaler[4]~33_combout\ : std_logic;
SIGNAL \scaler[4]~34\ : std_logic;
SIGNAL \scaler[5]~35_combout\ : std_logic;
SIGNAL \scaler[5]~36\ : std_logic;
SIGNAL \scaler[6]~37_combout\ : std_logic;
SIGNAL \scaler[6]~38\ : std_logic;
SIGNAL \scaler[7]~39_combout\ : std_logic;
SIGNAL \scaler[7]~40\ : std_logic;
SIGNAL \scaler[8]~41_combout\ : std_logic;
SIGNAL \scaler[8]~42\ : std_logic;
SIGNAL \scaler[9]~43_combout\ : std_logic;
SIGNAL \scaler[9]~44\ : std_logic;
SIGNAL \scaler[10]~45_combout\ : std_logic;
SIGNAL \scaler[10]~46\ : std_logic;
SIGNAL \scaler[11]~47_combout\ : std_logic;
SIGNAL \scaler[11]~48\ : std_logic;
SIGNAL \scaler[12]~49_combout\ : std_logic;
SIGNAL \scaler[12]~50\ : std_logic;
SIGNAL \scaler[13]~51_combout\ : std_logic;
SIGNAL \scaler[13]~52\ : std_logic;
SIGNAL \scaler[14]~53_combout\ : std_logic;
SIGNAL \scaler[14]~54\ : std_logic;
SIGNAL \scaler[15]~55_combout\ : std_logic;
SIGNAL \scaler[15]~56\ : std_logic;
SIGNAL \scaler[16]~57_combout\ : std_logic;
SIGNAL \scaler[16]~58\ : std_logic;
SIGNAL \scaler[17]~59_combout\ : std_logic;
SIGNAL \scaler[17]~60\ : std_logic;
SIGNAL \scaler[18]~61_combout\ : std_logic;
SIGNAL \scaler[18]~62\ : std_logic;
SIGNAL \scaler[19]~63_combout\ : std_logic;
SIGNAL \scaler[19]~64\ : std_logic;
SIGNAL \scaler[20]~65_combout\ : std_logic;
SIGNAL \scaler[20]~66\ : std_logic;
SIGNAL \scaler[21]~67_combout\ : std_logic;
SIGNAL \scaler[21]~68\ : std_logic;
SIGNAL \scaler[22]~69_combout\ : std_logic;
SIGNAL \scaler[22]~70\ : std_logic;
SIGNAL \scaler[23]~71_combout\ : std_logic;
SIGNAL \scaler[23]~72\ : std_logic;
SIGNAL \scaler[24]~73_combout\ : std_logic;
SIGNAL \LessThan0~0_combout\ : std_logic;
SIGNAL \LessThan0~1_combout\ : std_logic;
SIGNAL \LessThan0~2_combout\ : std_logic;
SIGNAL \LessThan0~3_combout\ : std_logic;
SIGNAL \LessThan0~4_combout\ : std_logic;
SIGNAL \LessThan0~5_combout\ : std_logic;
SIGNAL \clk_1hz~q\ : std_logic;
SIGNAL \LED~0_combout\ : std_logic;
SIGNAL \LED~q\ : std_logic;
SIGNAL scaler : std_logic_vector(24 DOWNTO 0);

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_clk_50mhz <= clk_50mhz;
ww_reset_btn <= reset_btn;
green_led <= ww_green_led;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\reset_btn~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \reset_btn~input_o\);

\clk_50mhz~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk_50mhz~input_o\);
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X38_Y34_N16
\green_led~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \LED~q\,
	devoe => ww_devoe,
	o => \green_led~output_o\);

-- Location: IOIBUF_X27_Y0_N22
\clk_50mhz~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk_50mhz,
	o => \clk_50mhz~input_o\);

-- Location: CLKCTRL_G18
\clk_50mhz~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk_50mhz~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk_50mhz~inputclkctrl_outclk\);

-- Location: LCCOMB_X39_Y33_N8
\scaler[0]~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \scaler[0]~25_combout\ = scaler(0) $ (VCC)
-- \scaler[0]~26\ = CARRY(scaler(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => scaler(0),
	datad => VCC,
	combout => \scaler[0]~25_combout\,
	cout => \scaler[0]~26\);

-- Location: IOIBUF_X27_Y0_N15
\reset_btn~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset_btn,
	o => \reset_btn~input_o\);

-- Location: CLKCTRL_G19
\reset_btn~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \reset_btn~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \reset_btn~inputclkctrl_outclk\);

-- Location: FF_X39_Y33_N9
\scaler[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50mhz~inputclkctrl_outclk\,
	d => \scaler[0]~25_combout\,
	clrn => \reset_btn~inputclkctrl_outclk\,
	sclr => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => scaler(0));

-- Location: LCCOMB_X39_Y33_N10
\scaler[1]~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \scaler[1]~27_combout\ = (scaler(1) & (!\scaler[0]~26\)) # (!scaler(1) & ((\scaler[0]~26\) # (GND)))
-- \scaler[1]~28\ = CARRY((!\scaler[0]~26\) # (!scaler(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => scaler(1),
	datad => VCC,
	cin => \scaler[0]~26\,
	combout => \scaler[1]~27_combout\,
	cout => \scaler[1]~28\);

-- Location: FF_X39_Y33_N11
\scaler[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50mhz~inputclkctrl_outclk\,
	d => \scaler[1]~27_combout\,
	clrn => \reset_btn~inputclkctrl_outclk\,
	sclr => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => scaler(1));

-- Location: LCCOMB_X39_Y33_N12
\scaler[2]~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \scaler[2]~29_combout\ = (scaler(2) & (\scaler[1]~28\ $ (GND))) # (!scaler(2) & (!\scaler[1]~28\ & VCC))
-- \scaler[2]~30\ = CARRY((scaler(2) & !\scaler[1]~28\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => scaler(2),
	datad => VCC,
	cin => \scaler[1]~28\,
	combout => \scaler[2]~29_combout\,
	cout => \scaler[2]~30\);

-- Location: FF_X39_Y33_N13
\scaler[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50mhz~inputclkctrl_outclk\,
	d => \scaler[2]~29_combout\,
	clrn => \reset_btn~inputclkctrl_outclk\,
	sclr => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => scaler(2));

-- Location: LCCOMB_X39_Y33_N14
\scaler[3]~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \scaler[3]~31_combout\ = (scaler(3) & (!\scaler[2]~30\)) # (!scaler(3) & ((\scaler[2]~30\) # (GND)))
-- \scaler[3]~32\ = CARRY((!\scaler[2]~30\) # (!scaler(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => scaler(3),
	datad => VCC,
	cin => \scaler[2]~30\,
	combout => \scaler[3]~31_combout\,
	cout => \scaler[3]~32\);

-- Location: FF_X39_Y33_N15
\scaler[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50mhz~inputclkctrl_outclk\,
	d => \scaler[3]~31_combout\,
	clrn => \reset_btn~inputclkctrl_outclk\,
	sclr => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => scaler(3));

-- Location: LCCOMB_X39_Y33_N16
\scaler[4]~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \scaler[4]~33_combout\ = (scaler(4) & (\scaler[3]~32\ $ (GND))) # (!scaler(4) & (!\scaler[3]~32\ & VCC))
-- \scaler[4]~34\ = CARRY((scaler(4) & !\scaler[3]~32\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => scaler(4),
	datad => VCC,
	cin => \scaler[3]~32\,
	combout => \scaler[4]~33_combout\,
	cout => \scaler[4]~34\);

-- Location: FF_X39_Y33_N17
\scaler[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50mhz~inputclkctrl_outclk\,
	d => \scaler[4]~33_combout\,
	clrn => \reset_btn~inputclkctrl_outclk\,
	sclr => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => scaler(4));

-- Location: LCCOMB_X39_Y33_N18
\scaler[5]~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \scaler[5]~35_combout\ = (scaler(5) & (!\scaler[4]~34\)) # (!scaler(5) & ((\scaler[4]~34\) # (GND)))
-- \scaler[5]~36\ = CARRY((!\scaler[4]~34\) # (!scaler(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => scaler(5),
	datad => VCC,
	cin => \scaler[4]~34\,
	combout => \scaler[5]~35_combout\,
	cout => \scaler[5]~36\);

-- Location: FF_X39_Y33_N19
\scaler[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50mhz~inputclkctrl_outclk\,
	d => \scaler[5]~35_combout\,
	clrn => \reset_btn~inputclkctrl_outclk\,
	sclr => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => scaler(5));

-- Location: LCCOMB_X39_Y33_N20
\scaler[6]~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \scaler[6]~37_combout\ = (scaler(6) & (\scaler[5]~36\ $ (GND))) # (!scaler(6) & (!\scaler[5]~36\ & VCC))
-- \scaler[6]~38\ = CARRY((scaler(6) & !\scaler[5]~36\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => scaler(6),
	datad => VCC,
	cin => \scaler[5]~36\,
	combout => \scaler[6]~37_combout\,
	cout => \scaler[6]~38\);

-- Location: FF_X39_Y33_N21
\scaler[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50mhz~inputclkctrl_outclk\,
	d => \scaler[6]~37_combout\,
	clrn => \reset_btn~inputclkctrl_outclk\,
	sclr => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => scaler(6));

-- Location: LCCOMB_X39_Y33_N22
\scaler[7]~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \scaler[7]~39_combout\ = (scaler(7) & (!\scaler[6]~38\)) # (!scaler(7) & ((\scaler[6]~38\) # (GND)))
-- \scaler[7]~40\ = CARRY((!\scaler[6]~38\) # (!scaler(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => scaler(7),
	datad => VCC,
	cin => \scaler[6]~38\,
	combout => \scaler[7]~39_combout\,
	cout => \scaler[7]~40\);

-- Location: FF_X39_Y33_N23
\scaler[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50mhz~inputclkctrl_outclk\,
	d => \scaler[7]~39_combout\,
	clrn => \reset_btn~inputclkctrl_outclk\,
	sclr => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => scaler(7));

-- Location: LCCOMB_X39_Y33_N24
\scaler[8]~41\ : cycloneive_lcell_comb
-- Equation(s):
-- \scaler[8]~41_combout\ = (scaler(8) & (\scaler[7]~40\ $ (GND))) # (!scaler(8) & (!\scaler[7]~40\ & VCC))
-- \scaler[8]~42\ = CARRY((scaler(8) & !\scaler[7]~40\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => scaler(8),
	datad => VCC,
	cin => \scaler[7]~40\,
	combout => \scaler[8]~41_combout\,
	cout => \scaler[8]~42\);

-- Location: FF_X39_Y33_N25
\scaler[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50mhz~inputclkctrl_outclk\,
	d => \scaler[8]~41_combout\,
	clrn => \reset_btn~inputclkctrl_outclk\,
	sclr => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => scaler(8));

-- Location: LCCOMB_X39_Y33_N26
\scaler[9]~43\ : cycloneive_lcell_comb
-- Equation(s):
-- \scaler[9]~43_combout\ = (scaler(9) & (!\scaler[8]~42\)) # (!scaler(9) & ((\scaler[8]~42\) # (GND)))
-- \scaler[9]~44\ = CARRY((!\scaler[8]~42\) # (!scaler(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => scaler(9),
	datad => VCC,
	cin => \scaler[8]~42\,
	combout => \scaler[9]~43_combout\,
	cout => \scaler[9]~44\);

-- Location: FF_X39_Y33_N27
\scaler[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50mhz~inputclkctrl_outclk\,
	d => \scaler[9]~43_combout\,
	clrn => \reset_btn~inputclkctrl_outclk\,
	sclr => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => scaler(9));

-- Location: LCCOMB_X39_Y33_N28
\scaler[10]~45\ : cycloneive_lcell_comb
-- Equation(s):
-- \scaler[10]~45_combout\ = (scaler(10) & (\scaler[9]~44\ $ (GND))) # (!scaler(10) & (!\scaler[9]~44\ & VCC))
-- \scaler[10]~46\ = CARRY((scaler(10) & !\scaler[9]~44\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => scaler(10),
	datad => VCC,
	cin => \scaler[9]~44\,
	combout => \scaler[10]~45_combout\,
	cout => \scaler[10]~46\);

-- Location: FF_X39_Y33_N29
\scaler[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50mhz~inputclkctrl_outclk\,
	d => \scaler[10]~45_combout\,
	clrn => \reset_btn~inputclkctrl_outclk\,
	sclr => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => scaler(10));

-- Location: LCCOMB_X39_Y33_N30
\scaler[11]~47\ : cycloneive_lcell_comb
-- Equation(s):
-- \scaler[11]~47_combout\ = (scaler(11) & (!\scaler[10]~46\)) # (!scaler(11) & ((\scaler[10]~46\) # (GND)))
-- \scaler[11]~48\ = CARRY((!\scaler[10]~46\) # (!scaler(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => scaler(11),
	datad => VCC,
	cin => \scaler[10]~46\,
	combout => \scaler[11]~47_combout\,
	cout => \scaler[11]~48\);

-- Location: FF_X39_Y33_N31
\scaler[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50mhz~inputclkctrl_outclk\,
	d => \scaler[11]~47_combout\,
	clrn => \reset_btn~inputclkctrl_outclk\,
	sclr => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => scaler(11));

-- Location: LCCOMB_X39_Y32_N0
\scaler[12]~49\ : cycloneive_lcell_comb
-- Equation(s):
-- \scaler[12]~49_combout\ = (scaler(12) & (\scaler[11]~48\ $ (GND))) # (!scaler(12) & (!\scaler[11]~48\ & VCC))
-- \scaler[12]~50\ = CARRY((scaler(12) & !\scaler[11]~48\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => scaler(12),
	datad => VCC,
	cin => \scaler[11]~48\,
	combout => \scaler[12]~49_combout\,
	cout => \scaler[12]~50\);

-- Location: FF_X39_Y32_N1
\scaler[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50mhz~inputclkctrl_outclk\,
	d => \scaler[12]~49_combout\,
	clrn => \reset_btn~inputclkctrl_outclk\,
	sclr => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => scaler(12));

-- Location: LCCOMB_X39_Y32_N2
\scaler[13]~51\ : cycloneive_lcell_comb
-- Equation(s):
-- \scaler[13]~51_combout\ = (scaler(13) & (!\scaler[12]~50\)) # (!scaler(13) & ((\scaler[12]~50\) # (GND)))
-- \scaler[13]~52\ = CARRY((!\scaler[12]~50\) # (!scaler(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => scaler(13),
	datad => VCC,
	cin => \scaler[12]~50\,
	combout => \scaler[13]~51_combout\,
	cout => \scaler[13]~52\);

-- Location: FF_X39_Y32_N3
\scaler[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50mhz~inputclkctrl_outclk\,
	d => \scaler[13]~51_combout\,
	clrn => \reset_btn~inputclkctrl_outclk\,
	sclr => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => scaler(13));

-- Location: LCCOMB_X39_Y32_N4
\scaler[14]~53\ : cycloneive_lcell_comb
-- Equation(s):
-- \scaler[14]~53_combout\ = (scaler(14) & (\scaler[13]~52\ $ (GND))) # (!scaler(14) & (!\scaler[13]~52\ & VCC))
-- \scaler[14]~54\ = CARRY((scaler(14) & !\scaler[13]~52\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => scaler(14),
	datad => VCC,
	cin => \scaler[13]~52\,
	combout => \scaler[14]~53_combout\,
	cout => \scaler[14]~54\);

-- Location: FF_X39_Y32_N5
\scaler[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50mhz~inputclkctrl_outclk\,
	d => \scaler[14]~53_combout\,
	clrn => \reset_btn~inputclkctrl_outclk\,
	sclr => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => scaler(14));

-- Location: LCCOMB_X39_Y32_N6
\scaler[15]~55\ : cycloneive_lcell_comb
-- Equation(s):
-- \scaler[15]~55_combout\ = (scaler(15) & (!\scaler[14]~54\)) # (!scaler(15) & ((\scaler[14]~54\) # (GND)))
-- \scaler[15]~56\ = CARRY((!\scaler[14]~54\) # (!scaler(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => scaler(15),
	datad => VCC,
	cin => \scaler[14]~54\,
	combout => \scaler[15]~55_combout\,
	cout => \scaler[15]~56\);

-- Location: FF_X39_Y32_N7
\scaler[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50mhz~inputclkctrl_outclk\,
	d => \scaler[15]~55_combout\,
	clrn => \reset_btn~inputclkctrl_outclk\,
	sclr => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => scaler(15));

-- Location: LCCOMB_X39_Y32_N8
\scaler[16]~57\ : cycloneive_lcell_comb
-- Equation(s):
-- \scaler[16]~57_combout\ = (scaler(16) & (\scaler[15]~56\ $ (GND))) # (!scaler(16) & (!\scaler[15]~56\ & VCC))
-- \scaler[16]~58\ = CARRY((scaler(16) & !\scaler[15]~56\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => scaler(16),
	datad => VCC,
	cin => \scaler[15]~56\,
	combout => \scaler[16]~57_combout\,
	cout => \scaler[16]~58\);

-- Location: FF_X39_Y32_N9
\scaler[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50mhz~inputclkctrl_outclk\,
	d => \scaler[16]~57_combout\,
	clrn => \reset_btn~inputclkctrl_outclk\,
	sclr => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => scaler(16));

-- Location: LCCOMB_X39_Y32_N10
\scaler[17]~59\ : cycloneive_lcell_comb
-- Equation(s):
-- \scaler[17]~59_combout\ = (scaler(17) & (!\scaler[16]~58\)) # (!scaler(17) & ((\scaler[16]~58\) # (GND)))
-- \scaler[17]~60\ = CARRY((!\scaler[16]~58\) # (!scaler(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => scaler(17),
	datad => VCC,
	cin => \scaler[16]~58\,
	combout => \scaler[17]~59_combout\,
	cout => \scaler[17]~60\);

-- Location: FF_X39_Y32_N11
\scaler[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50mhz~inputclkctrl_outclk\,
	d => \scaler[17]~59_combout\,
	clrn => \reset_btn~inputclkctrl_outclk\,
	sclr => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => scaler(17));

-- Location: LCCOMB_X39_Y32_N12
\scaler[18]~61\ : cycloneive_lcell_comb
-- Equation(s):
-- \scaler[18]~61_combout\ = (scaler(18) & (\scaler[17]~60\ $ (GND))) # (!scaler(18) & (!\scaler[17]~60\ & VCC))
-- \scaler[18]~62\ = CARRY((scaler(18) & !\scaler[17]~60\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => scaler(18),
	datad => VCC,
	cin => \scaler[17]~60\,
	combout => \scaler[18]~61_combout\,
	cout => \scaler[18]~62\);

-- Location: FF_X39_Y32_N13
\scaler[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50mhz~inputclkctrl_outclk\,
	d => \scaler[18]~61_combout\,
	clrn => \reset_btn~inputclkctrl_outclk\,
	sclr => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => scaler(18));

-- Location: LCCOMB_X39_Y32_N14
\scaler[19]~63\ : cycloneive_lcell_comb
-- Equation(s):
-- \scaler[19]~63_combout\ = (scaler(19) & (!\scaler[18]~62\)) # (!scaler(19) & ((\scaler[18]~62\) # (GND)))
-- \scaler[19]~64\ = CARRY((!\scaler[18]~62\) # (!scaler(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => scaler(19),
	datad => VCC,
	cin => \scaler[18]~62\,
	combout => \scaler[19]~63_combout\,
	cout => \scaler[19]~64\);

-- Location: FF_X39_Y32_N15
\scaler[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50mhz~inputclkctrl_outclk\,
	d => \scaler[19]~63_combout\,
	clrn => \reset_btn~inputclkctrl_outclk\,
	sclr => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => scaler(19));

-- Location: LCCOMB_X39_Y32_N16
\scaler[20]~65\ : cycloneive_lcell_comb
-- Equation(s):
-- \scaler[20]~65_combout\ = (scaler(20) & (\scaler[19]~64\ $ (GND))) # (!scaler(20) & (!\scaler[19]~64\ & VCC))
-- \scaler[20]~66\ = CARRY((scaler(20) & !\scaler[19]~64\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => scaler(20),
	datad => VCC,
	cin => \scaler[19]~64\,
	combout => \scaler[20]~65_combout\,
	cout => \scaler[20]~66\);

-- Location: FF_X39_Y32_N17
\scaler[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50mhz~inputclkctrl_outclk\,
	d => \scaler[20]~65_combout\,
	clrn => \reset_btn~inputclkctrl_outclk\,
	sclr => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => scaler(20));

-- Location: LCCOMB_X39_Y32_N18
\scaler[21]~67\ : cycloneive_lcell_comb
-- Equation(s):
-- \scaler[21]~67_combout\ = (scaler(21) & (!\scaler[20]~66\)) # (!scaler(21) & ((\scaler[20]~66\) # (GND)))
-- \scaler[21]~68\ = CARRY((!\scaler[20]~66\) # (!scaler(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => scaler(21),
	datad => VCC,
	cin => \scaler[20]~66\,
	combout => \scaler[21]~67_combout\,
	cout => \scaler[21]~68\);

-- Location: FF_X39_Y32_N19
\scaler[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50mhz~inputclkctrl_outclk\,
	d => \scaler[21]~67_combout\,
	clrn => \reset_btn~inputclkctrl_outclk\,
	sclr => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => scaler(21));

-- Location: LCCOMB_X39_Y32_N20
\scaler[22]~69\ : cycloneive_lcell_comb
-- Equation(s):
-- \scaler[22]~69_combout\ = (scaler(22) & (\scaler[21]~68\ $ (GND))) # (!scaler(22) & (!\scaler[21]~68\ & VCC))
-- \scaler[22]~70\ = CARRY((scaler(22) & !\scaler[21]~68\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => scaler(22),
	datad => VCC,
	cin => \scaler[21]~68\,
	combout => \scaler[22]~69_combout\,
	cout => \scaler[22]~70\);

-- Location: FF_X39_Y32_N21
\scaler[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50mhz~inputclkctrl_outclk\,
	d => \scaler[22]~69_combout\,
	clrn => \reset_btn~inputclkctrl_outclk\,
	sclr => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => scaler(22));

-- Location: LCCOMB_X39_Y32_N22
\scaler[23]~71\ : cycloneive_lcell_comb
-- Equation(s):
-- \scaler[23]~71_combout\ = (scaler(23) & (!\scaler[22]~70\)) # (!scaler(23) & ((\scaler[22]~70\) # (GND)))
-- \scaler[23]~72\ = CARRY((!\scaler[22]~70\) # (!scaler(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => scaler(23),
	datad => VCC,
	cin => \scaler[22]~70\,
	combout => \scaler[23]~71_combout\,
	cout => \scaler[23]~72\);

-- Location: FF_X39_Y32_N23
\scaler[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50mhz~inputclkctrl_outclk\,
	d => \scaler[23]~71_combout\,
	clrn => \reset_btn~inputclkctrl_outclk\,
	sclr => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => scaler(23));

-- Location: LCCOMB_X39_Y32_N24
\scaler[24]~73\ : cycloneive_lcell_comb
-- Equation(s):
-- \scaler[24]~73_combout\ = \scaler[23]~72\ $ (!scaler(24))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => scaler(24),
	cin => \scaler[23]~72\,
	combout => \scaler[24]~73_combout\);

-- Location: FF_X39_Y32_N25
\scaler[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50mhz~inputclkctrl_outclk\,
	d => \scaler[24]~73_combout\,
	clrn => \reset_btn~inputclkctrl_outclk\,
	sclr => \LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => scaler(24));

-- Location: LCCOMB_X39_Y32_N30
\LessThan0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~0_combout\ = (!scaler(23) & (!scaler(22) & ((!scaler(21)) # (!scaler(20)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => scaler(23),
	datab => scaler(20),
	datac => scaler(21),
	datad => scaler(22),
	combout => \LessThan0~0_combout\);

-- Location: LCCOMB_X39_Y32_N28
\LessThan0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~1_combout\ = (scaler(18)) # ((scaler(22)) # ((scaler(23)) # (scaler(17))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => scaler(18),
	datab => scaler(22),
	datac => scaler(23),
	datad => scaler(17),
	combout => \LessThan0~1_combout\);

-- Location: LCCOMB_X39_Y33_N4
\LessThan0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~2_combout\ = (((!scaler(9) & !scaler(8))) # (!scaler(10))) # (!scaler(11))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => scaler(9),
	datab => scaler(8),
	datac => scaler(11),
	datad => scaler(10),
	combout => \LessThan0~2_combout\);

-- Location: LCCOMB_X39_Y33_N0
\LessThan0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~3_combout\ = (scaler(15)) # ((scaler(13) & ((scaler(12)) # (!\LessThan0~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => scaler(15),
	datab => scaler(12),
	datac => \LessThan0~2_combout\,
	datad => scaler(13),
	combout => \LessThan0~3_combout\);

-- Location: LCCOMB_X39_Y33_N2
\LessThan0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~4_combout\ = (!\LessThan0~1_combout\ & (((!scaler(14) & !\LessThan0~3_combout\)) # (!scaler(16))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => scaler(14),
	datab => scaler(16),
	datac => \LessThan0~1_combout\,
	datad => \LessThan0~3_combout\,
	combout => \LessThan0~4_combout\);

-- Location: LCCOMB_X39_Y33_N6
\LessThan0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~5_combout\ = (scaler(24) & (!\LessThan0~0_combout\ & ((scaler(19)) # (!\LessThan0~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => scaler(19),
	datab => scaler(24),
	datac => \LessThan0~0_combout\,
	datad => \LessThan0~4_combout\,
	combout => \LessThan0~5_combout\);

-- Location: FF_X39_Y33_N7
clk_1hz : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50mhz~inputclkctrl_outclk\,
	d => \LessThan0~5_combout\,
	clrn => \reset_btn~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clk_1hz~q\);

-- Location: LCCOMB_X38_Y33_N0
\LED~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LED~0_combout\ = !\LED~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \LED~q\,
	combout => \LED~0_combout\);

-- Location: FF_X38_Y33_N1
LED : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_1hz~q\,
	d => \LED~0_combout\,
	clrn => \reset_btn~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \LED~q\);

ww_green_led <= \green_led~output_o\;
END structure;


