
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
#   File Name    : compile.tcl
#   Version      : 0.1
#   Date         : 2018/11/22
#   Author       : Peter
#   Features     : Synthesis Template
#   Changes      : 
#   ------------------------------------------------------------------------------
#set_host_options -max_cores 16 

source -e ../scr/synopsys_dc.setup
source -e ../scr/dc_variable.tcl
source -e ../scr/user_define.tcl

if {$DONT_USE == "enable"} {
    set_dont_use ${DONT_USE_CELL}
}

if {$INSERT_CG == "true"} {
  if {$INSERT_DFT == "false"} {
    set_clock_gating_style -min ${CG_MIN_BITWIDTH} -max_fanout ${CG_MAX_FANOUT} \
                           -sequential_cell ${CG_SEQ_CELL} \
                           -positive_edge_logic ${CG_POS_CELL_LIST} \
                           -negative_edge_logic ${CG_NEG_CELL_LIST} \
                           -setup ${CG_SETUP_VALUE} -hold ${CG_HOLD_VALUE}
  } elseif {$INSERT_DFT == "true"} {
    set_clock_gating_style -min ${CG_MIN_BITWIDTH} -max_fanout ${CG_MAX_FANOUT} \
                           -sequential_cell ${CG_SEQ_CELL} \
                           -positive_edge_logic ${CG_POS_CELL_LIST} \
                           -negative_edge_logic ${CG_NEG_CELL_LIST} \
                           -control_point ${CG_CONTROL_POINT} \
                           -control_signal ${CG_CONTROL_SIGNAL} \
                           -setup ${CG_SETUP_VALUE} -hold ${CG_HOLD_VALUE}
  }
}

set_svf ${NETLIST_PATH}${top}${VER}.svf
analyze -format verilog ${RTL_INCLUDE}
elaborate $top
current_design $top
uniquify
link

source -e -v ${SCRIPT_PATH}timing.tcl

if {$SOURCE_OTHER_CONS == "enable"} {
    source -e -v $OTHER_CONS_FILE
}

if {$DONT_TOUCH == "enable"} {
    set_dont_touch ${DONT_TOUCH_CELL}
}

if {$PAD_IO_EXIST == "true"} {
    set_dont_touch $PAD_IO
}

set_clock_gating_check -setup ${CG_SETUP_CHECK} -hold ${CG_HOLD_CHECK} [all_clocks]
#if {$GenClkCellList != ""} {
    #set_clock_gating_check -setup ${CG_SETUP_CHECK} -hold ${CG_HOLD_CHECK} $GenClkCellList
#}

if {$INSERT_CG == "true"} {
    insert_clock_gating -global
}
report_clock_gating -hier > ${REPORT_PATH}${top}_icg.rpt

if {$UNGROUP_LARGE_MODULE == "enable"} {
    foreach ungroup_module $UNGROUP_MODULES {
        current_design $ungroup_module
        link
        ungroup -all -flatten
    }
    current_design $top
    link

    if {$INSERT_CG == "true"} {
        insert_clock_gating -global
    }
    report_clock_gating -hier >> ${REPORT_PATH}${top}_icg.rpt
}

propagate_constraints -gate_clock

uniquify
current_design ${top}

check_design > ${REPORT_PATH}${top}_check_design.rpt
check_timing > ${REPORT_PATH}${top}_check_timing.rpt
report_port -verbose >> ${REPORT_PATH}${top}_check_timing.rpt

set_fix_multiple_port_nets -feedthroughs -outputs -buffer_constant

set_critical_range 5 [current_design]
#set_operand_isolation_style
#set_max_dynamic_power 0
#set_max_leakage_power 0

if {$INSERT_DFT == "false"} {
    compile_ultra -no_autoungroup -no_boundary_optimization
} elseif {$INSERT_DFT == "true"} {
    compile_ultra -scan -no_autoungroup -no_boundary_optimization
}

change_names -rules verilog -hierarchy
write -format ddc -hierarchy -output ${DDC_PATH}${top}_noscan${VER}.ddc
write -format verilog -hierarchy -output ${NETLIST_PATH}${top}_noscan${VER}.v
write_sdf -v 2.1 ${SDF_PATH}${top}${VER}_net_noscan_2.1.sdf
#write_sdf -v 1.0 ${SDF_PATH}${top}${VER}_net_noscan_1.0.sdf
write_sdc -version 1.4 ${SDC_PATH}${top}_cons${VER}.sdc

check_design > ${REPORT_PATH}${top}_check_design_postcomp.rpt
report_area > ${REPORT_PATH}${top}_area.rpt
  redirect [file join ${REPORT_PATH} ${top}_problemCells.rpt] {
    echo "Info : unmapped cells"
    get_cells "*" -filter "@is_unmapped == true"
    echo ""
    echo "Info : black_box cells"
    get_cells "*" -filter "@is_black_box == true"
    echo ""
  }
report_reference -hier >> ${REPORT_PATH}${top}_area.rpt
report_constraint -all > ${REPORT_PATH}${top}_all_vio.rpt
report_constraint -all -verbose >> ${REPORT_PATH}${top}_all_vio.rpt
report_clock_gating -gating_elements >> ${REPORT_PATH}${top}_icg.rpt
report_timing -loops -max_paths 100 > ${REPORT_PATH}${top}_loops.rpt

