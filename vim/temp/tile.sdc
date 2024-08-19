#----------------------------------------------------------------------------------------------------------------------
#  1   set dont touch network
#----------------------------------------------------------------------------------------------------------------------
set_dont_touch_network -no_propagate [get_pins  u_pciecore/u_phy_core_atb_0]
set_dont_touch_network -no_propagate [get_ports BP_HOST_TX_P_LN_*]

#----------------------------------------------------------------------------------------------------------------------
#  2   set variable
#----------------------------------------------------------------------------------------------------------------------
set  hier_host_pcie_top    ""
set  period_100            10.0
set  hier_host_pcie_top    "U_HOST_PCIE/"
set  hier_clk_rst          ${hier_host_pcie_top}u_pciecore
set  sdc_version           1.7
set  LIB_TIME_SCALE        1.0
set  LIB_CAP_SCALE         1.0
set  TOOL_TIME_SCALE       1.0
set  REG2REG_RANGE         [expr 0.5 * $LIB_TIME_SCALE]
set  TAP_PERIOD            [expr $period_100 * $TOOL_TIME_SCALE * $LIB_TIME_SCALE]

#----------------------------------------------------------------------------------------------------------------------
#  3   set max fanout for input
#----------------------------------------------------------------------------------------------------------------------
set  $MAX_FANOUT  20
set_max_fanout  $MAX_FANOUT [current_design]

#----------------------------------------------------------------------------------------------------------------------
#  4   set max transition/capacitance
#----------------------------------------------------------------------------------------------------------------------
set MAX_TRANS   [expr (0.3 * $LIB_TIME_SCALE)]
set MAX_CAP     [expr (0.2 * $LIB_CAP_SCALE)]]
set_max_transition  $MAX_TRANS [current_design]
set_max_capacitance $MAX_CAP   [current_design]

#----------------------------------------------------------------------------------------------------------------------
#  5   echo context
#----------------------------------------------------------------------------------------------------------------------
set my_var  "Hello, World!"
echo "Constraints for all generic ports"
echo $my_var
echo "Hello, $my_var !"

#----------------------------------------------------------------------------------------------------------------------
#  6   create clock/generated clock
#----------------------------------------------------------------------------------------------------------------------
for {set lane 0} {$lane < $NUM_LANES} {incr lane} {
  create_clock -name FULLRT_LN${lane}_PIPE -period $fullrt_clk_pipe_period  [get_pins $hier_pciecore/u_phy/u_mp_pma/xcvr_pllclk_fullrt_ln_${lane}]
  create_generated_clock -name gclk_FULLRT_DIV_P0_PIPE_LN${lane}  -divide_by 2 -add -master_clock [get_clocks FULLRT_LN${lane}_PIPE] \
    -source [get_pins $hier_pciecore/u_phy/u_phy_clkrst/u_pma_fullrt_ln_${lane_index}] \
    [get_pins $hier_pciecore/u_phy/u_phy_clkrst/u_pma_fullrt_div_p_0/u_fullrt_prog_clk_div/clock_div_reg/Q]]
}

#----------------------------------------------------------------------------------------------------------------------
#  7   stop clock
#----------------------------------------------------------------------------------------------------------------------
for {set pipe_index 1} {$pipe_index <16} {incr pipe_index} {
  set_sense -clocks [get_clocks FULLRT_LN*_PIPE] -stop_propagation \
    [get_pins $hier_pciecore/u_phy/u_phy_clkrst/u_phy_port_datart_clk_mux_p_${pipe_index}/$fullrt_clock_mux_name/Z]
}


