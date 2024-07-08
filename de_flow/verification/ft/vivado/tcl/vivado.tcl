#-----------------------------------------------------------------------------------
#  author   : hr_li
#  data     : 2020/3/1
#  function : run vivado tcl script
#-----------------------------------------------------------------------------------

#-----------------------------------------------------------------------------------
#  echo vivado start time & set top design
#-----------------------------------------------------------------------------------
set            top_file       fpga_top
set            fmat_time      [clock format [clock seconds] -format {%D %T}]
puts           stdout         "vivado start : $fmat_time"

#-----------------------------------------------------------------------------------
#  read verilog file
#-----------------------------------------------------------------------------------
source		   ../tcl/rtl.tcl
read_verilog   $FILELIST

#-----------------------------------------------------------------------------------
#  auto detect xpm ip
#-----------------------------------------------------------------------------------
auto_detect_xpm

#-----------------------------------------------------------------------------------
#  read xdc file
#-----------------------------------------------------------------------------------
read_xdc       ../xdc/fpga_location.xdc

#-----------------------------------------------------------------------------------
#  synth design
#-----------------------------------------------------------------------------------
puts		   stdout		  $INC_PATH
synth_design -top $top_file -part xcku115-flvd1924-1-c -flatten rebuilt \
-directive AlternateRoutability -include_dirs $INC_PATH

#-----------------------------------------------------------------------------------
#  place design
#-----------------------------------------------------------------------------------
place_design -directive ExtraNetDelay_high


#phys_opt_design -directive Explore

#-----------------------------------------------------------------------------------
#  route design
#-----------------------------------------------------------------------------------
route_design -directive Explore



write_bitstream -force ../output/$top_file.bit





## STEP#2: run synthesis, report utilization and timing estimates, write checkpoint design
##
#synth_design -top $top -part xcku115-flvd1924-1-c -flatten rebuilt \
#-directive AlternateRoutability \
#-verilog_define HWD32F_FPGA
##link_design -top $top -part xcku115-flvd1924-1-c
#report_timing_summary -file $outputDir/post_synth_timing_summary.rpt
#report_power -file $outputDir/post_synth_power.rpt
#write_checkpoint -force $outputDir/post_syn
#set syn_end_time [clock seconds]
#set format_syn_end_time [clock format $syn_end_time -format {%D %T}]
#puts stdout $format_syn_end_time
## STEP#3: run placement and logic optimzation, report utilization and timing estimates, write checkpoint design
##
## -directive <arg> - (Optional) Direct the mode of optimization with specific
## design objectives. Only one directive can be specified for a single
## opt_design command, and values are case-sensitive. Supported values
## include:
##
##  *  Explore - Run multiple passes of optimization to improve results.
##
##  *  ExploreArea - Run multiple passes of optimization, with an emphasis on
##     reducing area.
##
##  *  ExploreWithRemap - Similar to ExploreArea but adds the remap
##     optimization to compress logic levels.
##
##  *  ExploreSequentialArea - Run multiple passes of optimization, with an
##     emphasis on reducing registers and related combinational logic.
##
##  *  AddRemap - Run the default optimization, and include LUT remapping to
##     reduce logic levels.
##
##  *  NoBramPowerOpt - Runs opt_design without the default BRAM power
##     optimization.
##
##  *  RuntimeOptimized - Run the fewest iterations, trading optimization
##     results for faster runtime.
##
##  *  Default - Run the default optimization.
##opt_design -directive Explore
##Arguments:
##
##  -directive <arg> - (Optional) Direct placement to achieve specific design
##  objectives. Only one directive can be specified for a single place_design
##  command, and values are case-sensitive. Supported values include:
##
##   *  Explore - Increased placer effort in detail placement and
##      post-placement optimization .
##
##   *  EarlyBlockPlacement - Timing-driven placement of RAM and DSP blocks.
##      The RAM and DSP block locations are finalized early in the placement
##      process and are used as anchors to place the remaining logic.
##
##   *  WLDrivenBlockPlacement - Wire length-driven placement of RAM and DSP
##      blocks. Override timing-driven placement by directing the Vivado placer
##      to minimize the distance of connections to and from blocks.
##
##   *  ExtraNetDelay_high - Increases estimated delay of high fanout and
##      long-distance nets. Three levels of pessimism are supported: high,
##      medium, and low. ExtraNetDelay_high applies the highest level of
##      pessimism.
##
##   *  ExtraNetDelay_low - Increases estimated delay of high fanout and
##      long-distance nets. Three levels of pessimism are supported: high,
##      medium, and low. ExtraNetDelay_low applies the lowest level of
##      pessimism.
##
##   *  AltSpreadLogic_high - Spreads logic throughout the device to avoid
##      creating congested regions. Three levels are supported: high, medium,
##      and low. AltSpreadLogic_high achieves the highest level of spreading.
##
##   *  AltSpreadLogic_medium - Spreads logic throughout the device to avoid
##      creating congested regions. Three levels are supported: high, medium,
##      and low. AltSpreadLogic_medium achieves a medium level of spreading
##      compared to low and high.
##
##   *  AltSpreadLogic_low - Spreads logic throughout the device to avoid
##      creating congested regions. Three levels are supported: high, medium,
##      and low. AltSpreadLogic_low achieves the lowest level of spreading.
##
##   *  ExtraPostPlacementOpt - Increased placer effort in post-placement
##      optimization.
##
##   *  ExtraTimingOpt - Use an alternate algorithm for timing-driven placement
##      with greater effort for timing.
##
##   *  SSI_SpreadLogic_high - Distribute logic across SLRs.
##      SSI_SpreadLogic_high achieves the highest level of distribution.
##
##   *  SSI_SpreadLogic_low - Distribute logic across SLRs. SSI_SpreadLogic_low
##      achieves a minimum level of logic distribution, while reducing
##      placement runtime.
##
##   *  SSI_SpreadSLLs - Partition across SLRs and allocate extra area for
##      regions of higher connectivity.
##
##   *  SSI_BalanceSLLs - Partition across SLRs while attempting to balance
##      SLLs between SLRs.
##
##   *  SSI_BalanceSLRs - Partition across SLRs to balance number of cells
##      between SLRs.
##
##   *  SSI_HighUtilSLRs - Direct the placer to attempt to place logic closer
##      together in each SLR.
##
##   *  RuntimeOptimized - Run fewest iterations, trade higher design
##      performance for faster runtime.
##
##   *  Quick - Absolute, fastest runtime, non-timing-driven, performs the
##      minimum required placement for a legal design.
##
##   *  Default - Run place_design with default settings.
#place_design -directive ExtraNetDelay_high
#phys_opt_design -directive Explore
#phys_opt_design -directive AggressiveExplore
#write_checkpoint -force $outputDir/post_place
#report_timing_summary -file $outputDir/post_place_timing_summary.rpt
#set place_end_time [clock seconds]
#set format_place_end_time [clock format $place_end_time -format {%D %T}]
#puts stdout $format_place_end_time
##
## STEP#4: run router, report actual utilization and timing, write checkpoint design, run drc, write verilog and xdc out
##
## -directive <arg> - (Optional) Direct routing to achieve specific design
##  objectives. Only one directive can be specified for a single route_design
##  command, and values are case-sensitive. Supported values are:
##   *  Explore - Causes the Vivado router to explore different critical path
##      routes based on timing, after an initial route .
##   *  NoTimingRelaxation - Prevents the router from relaxing timing to
##      complete routing. If the router has difficulty meeting timing, it will
##      run longer to try to meet the original timing constraints.
##   *  MoreGlobalIterations - Uses detailed timing analysis throughout all
##      stages instead of just the final stages, and will run more global
##      iterations even when timing improves only slightly.
##   *  HigherDelayCost - Adjusts the router`s internal cost functions to
##      emphasize delay over iterations, allowing a trade-off of runtime for
##      better performance.
##   *  AdvancedSkewModeling - Uses more accurate skew modeling throughout all
##      routing stages which may improve design performance on higher-skew
##      clock networks.
##   *  AlternateCLBRouting - (UltraScale only) Chooses alternate routing
##      algorithms that require extra runtime but may help resolve routing
##      congestion.
##   *  RuntimeOptimized - Run fewest iterations, trade higher design
##      performance for faster runtime.
##   *  Quick - Absolute fastest runtime, non-timing-driven, performs the
##      minimum required routing for a legal design.
##   *  Default - Run route_design with default settings.
#route_design -directive Explore
#phys_opt_design -directive Explore
#report_timing_summary -file $outputDir/post_route_timing_summary_beforeinc.rpt
#set route_end_time [clock seconds]
#set format_route_end_time [clock format $route_end_time -format {%D %T}]
#puts stdout $format_route_end_time
##for{set i 0}{$i<=5}{incr i}{
#place_design -post_place_opt
#route_design
#report_timing_summary -file $outputDir/post_route_timing_summary.rpt
#write_checkpoint -force $outputDir/post_route
##}
#
#report_timing -sort_by group -max_paths 100 -file $outputDir/post_route_timing.rpt
##report_timing -sort_by group -max_paths 100 -path_type summary -file $outputDir/post_route_timing.rpt
#report_clock_utilization -file $outputDir/clock_util.rpt
#report_utilization -hierarchical -file $outputDir/post_route_util.rpt
#report_power -file $outputDir/post_route_power.rpt
#report_drc -file $outputDir/post_imp_drc.rpt
#
#report_clock_networks -file $outputDir/post_clk_networks.rpt
#report_clock_utilization -file $outputDir/post_clk_utilization.rpt
#report_clocks -file $outputDir/post_clks.rpt
#report_compile_order -file $outputDir/post_compile_order.rpt
#report_io -file $outputDir/post_io.rpt
#report_environment -file $outputDir/post_env.rpt
#report_ip_status -file $outputDir/post_ip_sta.rpt
#report_ram_utilization -file $outputDir/post_ram.rpt
#report_high_fanout_nets -max_nets 500 -file $outputDir/post_high_fanout.rpt
#report_qor_assessment -file $outputDir/post_qor_ass.rpt
#report_qor_suggestion -file $outputDir/post_qor_sug.rpt
##report_pipeline_analysis -file $outputDir/post_pipeline_ana.rpt
#report_param -file $outputDir/post_param.rpt
#report_carry_chains -file $outputDir/post_carry_chains.rpt
#
#write_verilog -force $outputDir/mcu_impl_netlist.v
#write_xdc -no_fixed_only -force $outputDir/mcu_impl.xdc
##
## STEP#5: generate a bitstream
## 
#
#
#set par_star_time [clock seconds]
#set format_par_star_time [clock format $par_star_time -format {%D %T}]
#append format_par_star_time "test"
#puts stdout $format_par_star_time
#set edf_file [string replace $format_par_star_time 2 2 "_"]
#set edf_file [string replace $edf_file 5 5 "_"]
#set edf_file [string replace $edf_file 10 10 "_"]
#set edf_file [string replace $edf_file 13 13 "_"]
#set edf_file [string replace $edf_file 16 16 "_"]
#puts stdout $format_par_star_time
#puts stdout $edf_file
#
#write_bitstream -force $outputDir/$top.bit
#write_debug_probes $outputDir/$edf_file.ltx
#set par_end_time [clock seconds]
#set format_par_end_time [clock format $par_end_time -format {%D %T}]
#append format_par_end_time "par_end_time"
#puts stdout $format_par_end_time
#
