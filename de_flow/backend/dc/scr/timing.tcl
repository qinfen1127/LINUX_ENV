
#   --================================CSMT CO. LTD.=============================--
#   Information contained in this Confidential and Proprietary work has been
#                            obtained by CSMT CO LTD 
#   This Software may be used only as authorized by a licensing agreement from
#                                  CSMT Limited
#
#                   COPYRIGHT (C) 2010-2018 CSMT DESIGN Limited
#                              ALL RIGHTS RESERVED
#
#   The entire notice above must be displayed on all authorized CSMT copies.
#       Copies may be made only to the extended consent by a licensing
#                          agreement from CSMT Limited.
#
#   ------------------------------------------------------------------------------
#   Project and Control Information
#   ------------------------------------------------------------------------------
#   File Name    : timing.tcl
#   Version      : 0.1
#   Date         : 2018/11/22
#   Author       : Peter
#   Features     : Timing Script for Synthesis Template
#   Changes      : 
#   ------------------------------------------------------------------------------

#--------------------------------
# specify clock period
#--------------------------------
set OSC_PERIOD1 2  ;#Osc Clk 216MHz,Need Modify(+30%)
set OSC_PERIOD2 43.5  ;#Osc Clk 16MHz, Need Modify(+30%)

#--------------------------------
# Design Rule
#--------------------------------
#set_operating_conditions u055lscee12bpr_120c25_tc -library u055lscee12bpr_120c25_tc;# Need Modify
#set_operating_conditions u055lscee12bpr_108c125_wc -library u055lscee12bpr_108c125_wc;# Need Modify
#set_operating_conditions u055lscee12bpl_120c25_tc -library u055lscee12bpl_120c25_tc;# Need Modify
set_operating_conditions u055lscee12bpl_108c125_wc -library u055lscee12bpl_108c125_wc;# Need Modify
#set_operating_conditions u055lscee12bbr_120c25_tc -library u055lscee12bbr_120c25_tc;# Need Modify
#set_operating_conditions u055lscee12bbr_108c125_wc -library u055lscee12bbr_108c125_wc;# Need Modify
#set_operating_conditions u055lscee12bbl_120c25_tc -library u055lscee12bbl_120c25_tc;# Need Modify
#set_operating_conditions u055lscee12bbl_108c125_wc -library u055lscee12bbl_108c125_wc;# Need Modify

set_max_transition 1.5 $top
set_max_fanout 10 [current_design]
set_wire_load_model -name wl10;# Need Modify
set_wire_load_mode enclosed
set_max_area 0
set_max_dynamic_power 0

#--------------------------------
# Set Input and Output Constraint
#--------------------------------

#set PAD_INPUT {XIN_PAD ATPGSE_PAD CMS0_PAD CMS1_PAD} ;# Need Modify
#set PAD_OUTPUT { XOUT_PAD } ;# Need Modify
#set PAD_INOUT {RESUP_PAD GPIO0_PAD GPIO1_PAD GPIO2_PAD SCCCLK_PAD GPIO5_PAD SCCRST_PAD GPIO6_PAD 
          #SCCSIO_PAD SPIMTX_PAD SPIMCLK_PAD GPIO4_PAD GPIO3_PAD GPIO8_PAD GPIO7_PAD UARTRX_PAD 
          #UARTTX_PAD SPIMFRM_PAD SPIMRX_PAD } ;# Need Modify

#set_load 18.0 -max [all_outputs]
#set_load 10.0 -min [all_outputs]
#set_load 18.0 -max [get_ports $PAD_INOUT]
#set_load 10.0 -min [get_ports $PAD_INOUT]
#set PAD_INPUT [remove_from_collection [all_inputs] [get_ports Clk32K ClkSys]] ;# Need Modify

#set_max_fanout 5.0 [get_ports $PAD_INPUT]
#set_min_fanout 1.0 [get_ports $PAD_INPUT]
#set_max_capacitance 1 [get_ports $PAD_INPUT]
#set_min_capacitance 0.01 [get_ports $PAD_INPUT]
#set_max_transition 20.0 [get_ports $PAD_OUTPUT]
#set_fanout_load 10.0 [get_ports $PAD_OUTPUT]

#set_input_transition 1.5 -max [get_ports $PAD_INPUT]
#set_input_transition 0.01 -min [get_ports $PAD_INPUT]
#set_input_transition 1.5 -max [get_ports $PAD_INOUT]
#set_input_transition 0.01 -min [get_ports $PAD_INOUT]
#set_input_delay 10 -max -clock [get_clocks IO_CLK] [get_ports $INPUT_LIST] -add
#set_input_delay 2 -min -clock [get_clocks IO_CLK] [get_ports $INPUT_LIST] -add

set_input_transition 0.6 [all_inputs]
set_load 0.41 [all_outputs]


#--------------------------------
# set case
#--------------------------------


#--------------------------------
# set clock
#--------------------------------
#set ClkNameList [list] ;# Need Modify
#set GenClkCellList [list] ;# Need Modify

#set ClkName clkhsi ;# Need Modify
#set ClkNameList [concat $ClkNameList $ClkName]
#create_clock [get_port ClkSc] -name $ClkName -period $OSC_PERIOD3
#set_clock_uncertainty 0.8 -setup [get_clocks $ClkName]
#set_clock_uncertainty 0.4 -hold [get_clocks $ClkName]
#set_clock_latency 3.0 [get_clocks $ClkName]
#set_dont_touch_network [get_clocks $ClkName]
#set_clock_transition [expr $OSC_PERIOD3*0.05] -max [get_clocks $ClkName]
#set_clock_transition [expr $OSC_PERIOD3*0.01] -min [get_clocks $ClkName]

set CLK_NAME clk ;# Need Modify
create_clock [get_ports clk] -name $CLK_NAME -period $OSC_PERIOD1
set_clock_uncertainty 0.8 -setup [get_clocks $CLK_NAME]
set_clock_uncertainty 0.3 -hold [get_clocks $CLK_NAME]
set_clock_latency 3.0 -max [get_clocks $CLK_NAME]
set_clock_latency 0.0 -min [get_clocks $CLK_NAME]
set_dont_touch_network [get_clocks $CLK_NAME]
set_clock_transition 0.2 -max [get_clocks $CLK_NAME]
set_clock_transition 0.01 -min [get_clocks $CLK_NAME]

#set CLK_NAME CLKEFC ;# Need Modify
#create_clock [get_ports efc_hclk] -name $CLK_NAME -period $OSC_PERIOD1
#set_clock_uncertainty 0.8 -setup [get_clocks $CLK_NAME]
#set_clock_uncertainty 0.3 -hold [get_clocks $CLK_NAME]
#set_clock_latency 3.0 -max [get_clocks $CLK_NAME]
#set_clock_latency 0.0 -min [get_clocks $CLK_NAME]
#set_dont_touch_network [get_clocks $CLK_NAME]
#set_clock_transition 0.2 -max [get_clocks $CLK_NAME]
#set_clock_transition 0.01 -min [get_clocks $CLK_NAME]
#
#set CLK_NAME CLKHSI ;# Need Modify
#create_clock [get_ports efc_clkhsi] -name $CLK_NAME -period $OSC_PERIOD2
#set_clock_uncertainty 0.8 -setup [get_clocks $CLK_NAME]
#set_clock_uncertainty 0.3 -hold [get_clocks $CLK_NAME]
#set_clock_latency 3.0 -max [get_clocks $CLK_NAME]
#set_clock_latency 0.0 -min [get_clocks $CLK_NAME]
#set_dont_touch_network [get_clocks $CLK_NAME]
#set_clock_transition 0.2 -max [get_clocks $CLK_NAME]
#set_clock_transition 0.01 -min [get_clocks $CLK_NAME]


# TBC generated clock
#----------------------
## Definition Clock of TBC16KHz, Which is a Generated Clock, Its Master Clock is Clk32KHZ.
#set CLK_NAME TBC16KHz
#create_generated_clock [get_pins uDFF16KHz/IQN] -name $CLK_NAME -source [get_port Clk32K] -divide_by 2 -master_clock [get_clocks CLK32K] -invert -add
#set_clock_uncertainty 0.8 -setup [get_clocks $CLK_NAME]
#set_clock_uncertainty 0.5 -hold [get_clocks $CLK_NAME]
#set_clock_latency 3.0 -max [get_clocks $CLK_NAME]
#set_clock_latency 0.0 -min [get_clocks $CLK_NAME]
#set_dont_touch_network [get_clocks $CLK_NAME]
#set_clock_transition 1.0 -max [get_clocks $CLK_NAME] 
#set_clock_transition 0.01 -min [get_clocks $CLK_NAME]

#------------------------------
# false path (Need Modify)
#------------------------------
#set_clock_groups -asynchronous -group [get_clocks CLKSYS] ;# Need Modify
#set_clock_groups -asynchronous -group [get_clocks CLKEFC] ;# Need Modify
#set_clock_groups -asynchronous -group [get_clocks CLKHSI] ;# Need Modify

#set_false_path -from [get_clocks CLKSYS] -to [remove_from_collection [all_clocks] [get_clocks {CLKSYS}]]
#set_false_path -from [get_clocks CLKEFC] -to [remove_from_collection [all_clocks] [get_clocks {CLKEFC}]]
#set_false_path -from [get_clocks CLKHSI] -to [remove_from_collection [all_clocks] [get_clocks {CLKHSI}]]

#---------------------------------
# ideal network (Need Modify)
#---------------------------------
#set_ideal_network -no_pro [get_nets -of [get_pins uHWD32F769/uOSC/OSC20M]]
#set_ideal_network -no_pro [get_nets -of [get_pins uHWD32F769/uCgu/uCguGck/u49/Y]] ;#ClkDiv1
#set_ideal_network -no_pro [get_nets -of [get_pins uHWD32F769/uCgu/uCguGck/u48/Y]] ;#ClkDiv2
#set_ideal_network -no_pro [get_nets -of [get_pins uHWD32F769/uRcu/RstnOsc_reg/Q]]
#set_ideal_network -no_pro [get_nets -of [get_pins uHWD32F769/uRcu/RstnGlb_reg/Q]]

#set_ideal_network -no_pro [get_nets -of [get_ports ClkSc]]
#set_ideal_network -no_pro [get_nets -of [get_ports ResetnTop]]

#-----------------------------------
# io constraint (Need Modify)
#-----------------------------------

#set OSC_INPUT {Tm_Pad ClkScd_Pad ScdRst_Pad Sio_Pad}
#set OSC_OUTPUT {ClkScd_Pad ScdRst_Pad Sio_Pad}

#set_input_delay 33 -max -clock ClkSc [get_ports $OSC_INPUT]
#set_input_delay 2 -min -clock ClkSc [get_ports $OSC_INPUT]
#set_output_delay 33 -max -clock ClkSc [get_ports $OSC_OUTPUT]
#set_output_delay 2 -min -clock ClkSc [get_ports $OSC_OUTPUT]


#-----------------------------------
# IP Constraint
#-----------------------------------


