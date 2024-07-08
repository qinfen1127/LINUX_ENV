
#   --================================CSMT CO. LTD.=============================--
#   Information contained in this Confidential and Proprietary work has been
#                            obtained by CSMT CO LTD 
#   This Software may be used only as authorized by a licensing agreement from
#                                  CSMT Limited
#
#                   COPYRIGHT (C) 2010-2018CSMT DESIGN Limited
#                              ALL RIGHTS RESERVED
#
#   The entire notice above must be displayed on all authorized CSMT copies.
#       Copies may be made only to the extended consent by a licensing
#                          agreement from CSMT Limited.
#
#   ------------------------------------------------------------------------------
#   Project and Control Information
#   ------------------------------------------------------------------------------
#   File Name    : dc_variable.tcl
#   Version      : 0.1
#   Date         : 2018/11/22
#   Author       : Peter
#   Features     : Define other Variables for Synthesis Template
#   Changes      : 
#   ------------------------------------------------------------------------------

#  add buf cell inside module
set  compile_no_new_cells_at_top_level false

#control parameter inside
set  hdlin_auto_save_templates true

#give every module instan diffirent name inside netlist
set  uniquify_naming_style %s%d

#use assign instead of tri
set  verilogout_no_tri "true"

set  write_name_nets_same_as_ports true
set  hdlin_enable_vpp "true"
set  compile_preserve_subdesign_interfaces "true"
#delete the unloaded signals
set  compile_delete_unloaded_sequential_cells "false"
set  power_preserve_rtl_hier_names "true"
set  hdlin_use_carry_in "true"
set  hdlin_check_user_parallel_case false
set  hdlin_presto_net_name_prefix "NSYN"
set  timing_input_port_default_clock false
#set current work path
define_design_lib WORK -path ./work
#wire load mode selection
set auto_wire_load_selection false
#enable multicycle path
set timing_enable_multiple_clocks_per_reg true
set verilogout_equation false
#ungroup can flatten designware ip
set compile_ultra_ungroup_dw true
#stop when eccount a error
set sh_continue_on_error false

#  set display number
set collection_result_display_limit 100000
