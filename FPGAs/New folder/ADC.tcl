# Copyright (C) 2018  Intel Corporation. All rights reserved.
# Your use of Intel Corporation's design tools, logic functions 
# and other software and tools, and its AMPP partner logic 
# functions, and any output files from any of the foregoing 
# (including device programming or simulation files), and any 
# associated documentation or information are expressly subject 
# to the terms and conditions of the Intel Program License 
# Subscription Agreement, the Intel Quartus Prime License Agreement,
# the Intel FPGA IP License Agreement, or other applicable license
# agreement, including, without limitation, that your use is for
# the sole purpose of programming logic devices manufactured by
# Intel and sold by Intel or its authorized distributors.  Please
# refer to the applicable agreement for further details.

# Quartus Prime: Generate Tcl File for Project
# File: ADC.tcl
# Generated on: Sat Dec 15 14:37:11 2018

# Load Quartus Prime Tcl Project package
package require ::quartus::project

set need_to_close_project 0
set make_assignments 1

# Check that the right project is open
if {[is_project_open]} {
	if {[string compare $quartus(project) "ADC"]} {
		puts "Project ADC is not open"
		set make_assignments 0
	}
} else {
	# Only open if not already open
	if {[project_exists ADC]} {
		project_open -revision ADC ADC
	} else {
		project_new -revision ADC ADC
	}
	set need_to_close_project 1
}

# Make assignments
if {$make_assignments} {
	set_global_assignment -name FAMILY "Cyclone IV E"
	set_global_assignment -name DEVICE AUTO
	set_global_assignment -name ORIGINAL_QUARTUS_VERSION 18.1.0
	set_global_assignment -name PROJECT_CREATION_TIME_DATE "14:28:08  DECEMBER 15, 2018"
	set_global_assignment -name LAST_QUARTUS_VERSION "18.1.0 Lite Edition"
	set_global_assignment -name PROJECT_OUTPUT_DIRECTORY output_files
	set_global_assignment -name VHDL_FILE ADC.vhd
	set_global_assignment -name PARTITION_NETLIST_TYPE SOURCE -section_id Top
	set_global_assignment -name PARTITION_FITTER_PRESERVATION_LEVEL PLACEMENT_AND_ROUTING -section_id Top
	set_global_assignment -name PARTITION_COLOR 16764057 -section_id Top
	set_instance_assignment -name PARTITION_HIERARCHY root_partition -to | -section_id Top

	# Including default assignments
	set_global_assignment -name TIMING_ANALYZER_MULTICORNER_ANALYSIS ON -family "Cyclone IV E"
	set_global_assignment -name TIMING_ANALYZER_REPORT_WORST_CASE_TIMING_PATHS ON -family "Cyclone IV E"
	set_global_assignment -name TIMING_ANALYZER_CCPP_TRADEOFF_TOLERANCE 0 -family "Cyclone IV E"
	set_global_assignment -name TDC_CCPP_TRADEOFF_TOLERANCE 0 -family "Cyclone IV E"
	set_global_assignment -name TIMING_ANALYZER_DO_CCPP_REMOVAL ON -family "Cyclone IV E"
	set_global_assignment -name DISABLE_LEGACY_TIMING_ANALYZER OFF -family "Cyclone IV E"
	set_global_assignment -name SYNTH_TIMING_DRIVEN_SYNTHESIS ON -family "Cyclone IV E"
	set_global_assignment -name SYNCHRONIZATION_REGISTER_CHAIN_LENGTH 2 -family "Cyclone IV E"
	set_global_assignment -name SYNTH_RESOURCE_AWARE_INFERENCE_FOR_BLOCK_RAM ON -family "Cyclone IV E"
	set_global_assignment -name OPTIMIZE_HOLD_TIMING "ALL PATHS" -family "Cyclone IV E"
	set_global_assignment -name OPTIMIZE_MULTI_CORNER_TIMING ON -family "Cyclone IV E"
	set_global_assignment -name AUTO_DELAY_CHAINS ON -family "Cyclone IV E"
	set_global_assignment -name CRC_ERROR_OPEN_DRAIN OFF -family "Cyclone IV E"
	set_global_assignment -name USE_CONFIGURATION_DEVICE OFF -family "Cyclone IV E"
	set_global_assignment -name ENABLE_OCT_DONE OFF -family "Cyclone IV E"

	# Commit assignments
	export_assignments

	# Close project
	if {$need_to_close_project} {
		project_close
	}
}
