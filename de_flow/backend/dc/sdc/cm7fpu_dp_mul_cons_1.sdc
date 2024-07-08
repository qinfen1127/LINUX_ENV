###################################################################

# Created by write_sdc on Mon Mar 23 13:59:40 2020

###################################################################
set sdc_version 1.4

set_operating_conditions u055lscee12bpl_108c125_wc -library                    \
u055lscee12bpl_108c125_wc
set_wire_load_mode enclosed
set_wire_load_model -name wl10 -library u055lscee12bpr_120c25_tc
set_max_transition 1.5 [current_design]
set_max_fanout 10 [current_design]
set_max_area 0
set_load -pin_load 0.41 [get_ports mul_stall_f1_o]
set_load -pin_load 0.41 [get_ports mul_stall_f2_o]
set_load -pin_load 0.41 [get_ports {mac_f_man_lo_f2_o[52]}]
set_load -pin_load 0.41 [get_ports {mac_f_man_lo_f2_o[51]}]
set_load -pin_load 0.41 [get_ports {mac_f_man_lo_f2_o[50]}]
set_load -pin_load 0.41 [get_ports {mac_f_man_lo_f2_o[49]}]
set_load -pin_load 0.41 [get_ports {mac_f_man_lo_f2_o[48]}]
set_load -pin_load 0.41 [get_ports {mac_f_man_lo_f2_o[47]}]
set_load -pin_load 0.41 [get_ports {mac_f_man_lo_f2_o[46]}]
set_load -pin_load 0.41 [get_ports {mac_f_man_lo_f2_o[45]}]
set_load -pin_load 0.41 [get_ports {mac_f_man_lo_f2_o[44]}]
set_load -pin_load 0.41 [get_ports {mac_f_man_lo_f2_o[43]}]
set_load -pin_load 0.41 [get_ports {mac_f_man_lo_f2_o[42]}]
set_load -pin_load 0.41 [get_ports {mac_f_man_lo_f2_o[41]}]
set_load -pin_load 0.41 [get_ports {mac_f_man_lo_f2_o[40]}]
set_load -pin_load 0.41 [get_ports {mac_f_man_lo_f2_o[39]}]
set_load -pin_load 0.41 [get_ports {mac_f_man_lo_f2_o[38]}]
set_load -pin_load 0.41 [get_ports {mac_f_man_lo_f2_o[37]}]
set_load -pin_load 0.41 [get_ports {mac_f_man_lo_f2_o[36]}]
set_load -pin_load 0.41 [get_ports {mac_f_man_lo_f2_o[35]}]
set_load -pin_load 0.41 [get_ports {mac_f_man_lo_f2_o[34]}]
set_load -pin_load 0.41 [get_ports {mac_f_man_lo_f2_o[33]}]
set_load -pin_load 0.41 [get_ports {mac_f_man_lo_f2_o[32]}]
set_load -pin_load 0.41 [get_ports {mac_f_man_lo_f2_o[31]}]
set_load -pin_load 0.41 [get_ports {mac_f_man_lo_f2_o[30]}]
set_load -pin_load 0.41 [get_ports {mac_f_man_lo_f2_o[29]}]
set_load -pin_load 0.41 [get_ports {mac_f_man_lo_f2_o[28]}]
set_load -pin_load 0.41 [get_ports {mac_f_man_lo_f2_o[27]}]
set_load -pin_load 0.41 [get_ports {mac_f_man_lo_f2_o[26]}]
set_load -pin_load 0.41 [get_ports {mac_f_man_lo_f2_o[25]}]
set_load -pin_load 0.41 [get_ports {mac_f_man_lo_f2_o[24]}]
set_load -pin_load 0.41 [get_ports {mac_f_man_lo_f2_o[23]}]
set_load -pin_load 0.41 [get_ports {mac_f_man_lo_f2_o[22]}]
set_load -pin_load 0.41 [get_ports {mac_f_man_lo_f2_o[21]}]
set_load -pin_load 0.41 [get_ports {mac_f_man_lo_f2_o[20]}]
set_load -pin_load 0.41 [get_ports {mac_f_man_lo_f2_o[19]}]
set_load -pin_load 0.41 [get_ports {mac_f_man_lo_f2_o[18]}]
set_load -pin_load 0.41 [get_ports {mac_f_man_lo_f2_o[17]}]
set_load -pin_load 0.41 [get_ports {mac_f_man_lo_f2_o[16]}]
set_load -pin_load 0.41 [get_ports {mac_f_man_lo_f2_o[15]}]
set_load -pin_load 0.41 [get_ports {mac_f_man_lo_f2_o[14]}]
set_load -pin_load 0.41 [get_ports {mac_f_man_lo_f2_o[13]}]
set_load -pin_load 0.41 [get_ports {mac_f_man_lo_f2_o[12]}]
set_load -pin_load 0.41 [get_ports {mac_f_man_lo_f2_o[11]}]
set_load -pin_load 0.41 [get_ports {mac_f_man_lo_f2_o[10]}]
set_load -pin_load 0.41 [get_ports {mac_f_man_lo_f2_o[9]}]
set_load -pin_load 0.41 [get_ports {mac_f_man_lo_f2_o[8]}]
set_load -pin_load 0.41 [get_ports {mac_f_man_lo_f2_o[7]}]
set_load -pin_load 0.41 [get_ports {mac_f_man_lo_f2_o[6]}]
set_load -pin_load 0.41 [get_ports {mac_f_man_lo_f2_o[5]}]
set_load -pin_load 0.41 [get_ports {mac_f_man_lo_f2_o[4]}]
set_load -pin_load 0.41 [get_ports {mac_f_man_lo_f2_o[3]}]
set_load -pin_load 0.41 [get_ports {mac_f_man_lo_f2_o[2]}]
set_load -pin_load 0.41 [get_ports {mac_f_man_lo_f2_o[1]}]
set_load -pin_load 0.41 [get_ports {mac_f_man_lo_f2_o[0]}]
set_load -pin_load 0.41 [get_ports mac_f_man_sbit_f2_o]
set_load -pin_load 0.41 [get_ports excep_ioc_f1_o]
set_load -pin_load 0.41 [get_ports {man_fin_f2_o[52]}]
set_load -pin_load 0.41 [get_ports {man_fin_f2_o[51]}]
set_load -pin_load 0.41 [get_ports {man_fin_f2_o[50]}]
set_load -pin_load 0.41 [get_ports {man_fin_f2_o[49]}]
set_load -pin_load 0.41 [get_ports {man_fin_f2_o[48]}]
set_load -pin_load 0.41 [get_ports {man_fin_f2_o[47]}]
set_load -pin_load 0.41 [get_ports {man_fin_f2_o[46]}]
set_load -pin_load 0.41 [get_ports {man_fin_f2_o[45]}]
set_load -pin_load 0.41 [get_ports {man_fin_f2_o[44]}]
set_load -pin_load 0.41 [get_ports {man_fin_f2_o[43]}]
set_load -pin_load 0.41 [get_ports {man_fin_f2_o[42]}]
set_load -pin_load 0.41 [get_ports {man_fin_f2_o[41]}]
set_load -pin_load 0.41 [get_ports {man_fin_f2_o[40]}]
set_load -pin_load 0.41 [get_ports {man_fin_f2_o[39]}]
set_load -pin_load 0.41 [get_ports {man_fin_f2_o[38]}]
set_load -pin_load 0.41 [get_ports {man_fin_f2_o[37]}]
set_load -pin_load 0.41 [get_ports {man_fin_f2_o[36]}]
set_load -pin_load 0.41 [get_ports {man_fin_f2_o[35]}]
set_load -pin_load 0.41 [get_ports {man_fin_f2_o[34]}]
set_load -pin_load 0.41 [get_ports {man_fin_f2_o[33]}]
set_load -pin_load 0.41 [get_ports {man_fin_f2_o[32]}]
set_load -pin_load 0.41 [get_ports {man_fin_f2_o[31]}]
set_load -pin_load 0.41 [get_ports {man_fin_f2_o[30]}]
set_load -pin_load 0.41 [get_ports {man_fin_f2_o[29]}]
set_load -pin_load 0.41 [get_ports {man_fin_f2_o[28]}]
set_load -pin_load 0.41 [get_ports {man_fin_f2_o[27]}]
set_load -pin_load 0.41 [get_ports {man_fin_f2_o[26]}]
set_load -pin_load 0.41 [get_ports {man_fin_f2_o[25]}]
set_load -pin_load 0.41 [get_ports {man_fin_f2_o[24]}]
set_load -pin_load 0.41 [get_ports {man_fin_f2_o[23]}]
set_load -pin_load 0.41 [get_ports {man_fin_f2_o[22]}]
set_load -pin_load 0.41 [get_ports {man_fin_f2_o[21]}]
set_load -pin_load 0.41 [get_ports {man_fin_f2_o[20]}]
set_load -pin_load 0.41 [get_ports {man_fin_f2_o[19]}]
set_load -pin_load 0.41 [get_ports {man_fin_f2_o[18]}]
set_load -pin_load 0.41 [get_ports {man_fin_f2_o[17]}]
set_load -pin_load 0.41 [get_ports {man_fin_f2_o[16]}]
set_load -pin_load 0.41 [get_ports {man_fin_f2_o[15]}]
set_load -pin_load 0.41 [get_ports {man_fin_f2_o[14]}]
set_load -pin_load 0.41 [get_ports {man_fin_f2_o[13]}]
set_load -pin_load 0.41 [get_ports {man_fin_f2_o[12]}]
set_load -pin_load 0.41 [get_ports {man_fin_f2_o[11]}]
set_load -pin_load 0.41 [get_ports {man_fin_f2_o[10]}]
set_load -pin_load 0.41 [get_ports {man_fin_f2_o[9]}]
set_load -pin_load 0.41 [get_ports {man_fin_f2_o[8]}]
set_load -pin_load 0.41 [get_ports {man_fin_f2_o[7]}]
set_load -pin_load 0.41 [get_ports {man_fin_f2_o[6]}]
set_load -pin_load 0.41 [get_ports {man_fin_f2_o[5]}]
set_load -pin_load 0.41 [get_ports {man_fin_f2_o[4]}]
set_load -pin_load 0.41 [get_ports {man_fin_f2_o[3]}]
set_load -pin_load 0.41 [get_ports {man_fin_f2_o[2]}]
set_load -pin_load 0.41 [get_ports {man_fin_f2_o[1]}]
set_load -pin_load 0.41 [get_ports {man_fin_f2_o[0]}]
set_load -pin_load 0.41 [get_ports {exp_fin_f2_o[12]}]
set_load -pin_load 0.41 [get_ports {exp_fin_f2_o[11]}]
set_load -pin_load 0.41 [get_ports {exp_fin_f2_o[10]}]
set_load -pin_load 0.41 [get_ports {exp_fin_f2_o[9]}]
set_load -pin_load 0.41 [get_ports {exp_fin_f2_o[8]}]
set_load -pin_load 0.41 [get_ports {exp_fin_f2_o[7]}]
set_load -pin_load 0.41 [get_ports {exp_fin_f2_o[6]}]
set_load -pin_load 0.41 [get_ports {exp_fin_f2_o[5]}]
set_load -pin_load 0.41 [get_ports {exp_fin_f2_o[4]}]
set_load -pin_load 0.41 [get_ports {exp_fin_f2_o[3]}]
set_load -pin_load 0.41 [get_ports {exp_fin_f2_o[2]}]
set_load -pin_load 0.41 [get_ports {exp_fin_f2_o[1]}]
set_load -pin_load 0.41 [get_ports {exp_fin_f2_o[0]}]
set_load -pin_load 0.41 [get_ports sign_fin_f2_o]
set_load -pin_load 0.41 [get_ports {man_xbits_fin_f2_o[2]}]
set_load -pin_load 0.41 [get_ports {man_xbits_fin_f2_o[1]}]
set_load -pin_load 0.41 [get_ports {man_xbits_fin_f2_o[0]}]
set_load -pin_load 0.41 [get_ports is_inf_fin_f2_o]
set_load -pin_load 0.41 [get_ports is_nan_fin_f2_o]
set_load -pin_load 0.41 [get_ports is_zero_fin_f2_o]
create_clock [get_ports clk]  -period 2  -waveform {0 1}
set_clock_latency -max 3  [get_clocks clk]
set_clock_latency -min 0  [get_clocks clk]
set_clock_uncertainty -setup 0.8  [get_clocks clk]
set_clock_uncertainty -hold 0.3  [get_clocks clk]
set_clock_gating_check -rise -setup 0.3 [get_clocks clk]
set_clock_gating_check -fall -setup 0.3 [get_clocks clk]
set_clock_gating_check -rise -hold 0.2 [get_clocks clk]
set_clock_gating_check -fall -hold 0.2 [get_clocks clk]
set_clock_transition -min -fall 0.01 [get_clocks clk]
set_clock_transition -min -rise 0.01 [get_clocks clk]
set_clock_transition -max -fall 0.2 [get_clocks clk]
set_clock_transition -max -rise 0.2 [get_clocks clk]
set_input_transition -max 0.6  [get_ports clk]
set_input_transition -min 0.6  [get_ports clk]
set_input_transition -max 0.6  [get_ports reset_n]
set_input_transition -min 0.6  [get_ports reset_n]
set_input_transition -max 0.6  [get_ports {data0_man_f1_i[52]}]
set_input_transition -min 0.6  [get_ports {data0_man_f1_i[52]}]
set_input_transition -max 0.6  [get_ports {data0_man_f1_i[51]}]
set_input_transition -min 0.6  [get_ports {data0_man_f1_i[51]}]
set_input_transition -max 0.6  [get_ports {data0_man_f1_i[50]}]
set_input_transition -min 0.6  [get_ports {data0_man_f1_i[50]}]
set_input_transition -max 0.6  [get_ports {data0_man_f1_i[49]}]
set_input_transition -min 0.6  [get_ports {data0_man_f1_i[49]}]
set_input_transition -max 0.6  [get_ports {data0_man_f1_i[48]}]
set_input_transition -min 0.6  [get_ports {data0_man_f1_i[48]}]
set_input_transition -max 0.6  [get_ports {data0_man_f1_i[47]}]
set_input_transition -min 0.6  [get_ports {data0_man_f1_i[47]}]
set_input_transition -max 0.6  [get_ports {data0_man_f1_i[46]}]
set_input_transition -min 0.6  [get_ports {data0_man_f1_i[46]}]
set_input_transition -max 0.6  [get_ports {data0_man_f1_i[45]}]
set_input_transition -min 0.6  [get_ports {data0_man_f1_i[45]}]
set_input_transition -max 0.6  [get_ports {data0_man_f1_i[44]}]
set_input_transition -min 0.6  [get_ports {data0_man_f1_i[44]}]
set_input_transition -max 0.6  [get_ports {data0_man_f1_i[43]}]
set_input_transition -min 0.6  [get_ports {data0_man_f1_i[43]}]
set_input_transition -max 0.6  [get_ports {data0_man_f1_i[42]}]
set_input_transition -min 0.6  [get_ports {data0_man_f1_i[42]}]
set_input_transition -max 0.6  [get_ports {data0_man_f1_i[41]}]
set_input_transition -min 0.6  [get_ports {data0_man_f1_i[41]}]
set_input_transition -max 0.6  [get_ports {data0_man_f1_i[40]}]
set_input_transition -min 0.6  [get_ports {data0_man_f1_i[40]}]
set_input_transition -max 0.6  [get_ports {data0_man_f1_i[39]}]
set_input_transition -min 0.6  [get_ports {data0_man_f1_i[39]}]
set_input_transition -max 0.6  [get_ports {data0_man_f1_i[38]}]
set_input_transition -min 0.6  [get_ports {data0_man_f1_i[38]}]
set_input_transition -max 0.6  [get_ports {data0_man_f1_i[37]}]
set_input_transition -min 0.6  [get_ports {data0_man_f1_i[37]}]
set_input_transition -max 0.6  [get_ports {data0_man_f1_i[36]}]
set_input_transition -min 0.6  [get_ports {data0_man_f1_i[36]}]
set_input_transition -max 0.6  [get_ports {data0_man_f1_i[35]}]
set_input_transition -min 0.6  [get_ports {data0_man_f1_i[35]}]
set_input_transition -max 0.6  [get_ports {data0_man_f1_i[34]}]
set_input_transition -min 0.6  [get_ports {data0_man_f1_i[34]}]
set_input_transition -max 0.6  [get_ports {data0_man_f1_i[33]}]
set_input_transition -min 0.6  [get_ports {data0_man_f1_i[33]}]
set_input_transition -max 0.6  [get_ports {data0_man_f1_i[32]}]
set_input_transition -min 0.6  [get_ports {data0_man_f1_i[32]}]
set_input_transition -max 0.6  [get_ports {data0_man_f1_i[31]}]
set_input_transition -min 0.6  [get_ports {data0_man_f1_i[31]}]
set_input_transition -max 0.6  [get_ports {data0_man_f1_i[30]}]
set_input_transition -min 0.6  [get_ports {data0_man_f1_i[30]}]
set_input_transition -max 0.6  [get_ports {data0_man_f1_i[29]}]
set_input_transition -min 0.6  [get_ports {data0_man_f1_i[29]}]
set_input_transition -max 0.6  [get_ports {data0_man_f1_i[28]}]
set_input_transition -min 0.6  [get_ports {data0_man_f1_i[28]}]
set_input_transition -max 0.6  [get_ports {data0_man_f1_i[27]}]
set_input_transition -min 0.6  [get_ports {data0_man_f1_i[27]}]
set_input_transition -max 0.6  [get_ports {data0_man_f1_i[26]}]
set_input_transition -min 0.6  [get_ports {data0_man_f1_i[26]}]
set_input_transition -max 0.6  [get_ports {data0_man_f1_i[25]}]
set_input_transition -min 0.6  [get_ports {data0_man_f1_i[25]}]
set_input_transition -max 0.6  [get_ports {data0_man_f1_i[24]}]
set_input_transition -min 0.6  [get_ports {data0_man_f1_i[24]}]
set_input_transition -max 0.6  [get_ports {data0_man_f1_i[23]}]
set_input_transition -min 0.6  [get_ports {data0_man_f1_i[23]}]
set_input_transition -max 0.6  [get_ports {data0_man_f1_i[22]}]
set_input_transition -min 0.6  [get_ports {data0_man_f1_i[22]}]
set_input_transition -max 0.6  [get_ports {data0_man_f1_i[21]}]
set_input_transition -min 0.6  [get_ports {data0_man_f1_i[21]}]
set_input_transition -max 0.6  [get_ports {data0_man_f1_i[20]}]
set_input_transition -min 0.6  [get_ports {data0_man_f1_i[20]}]
set_input_transition -max 0.6  [get_ports {data0_man_f1_i[19]}]
set_input_transition -min 0.6  [get_ports {data0_man_f1_i[19]}]
set_input_transition -max 0.6  [get_ports {data0_man_f1_i[18]}]
set_input_transition -min 0.6  [get_ports {data0_man_f1_i[18]}]
set_input_transition -max 0.6  [get_ports {data0_man_f1_i[17]}]
set_input_transition -min 0.6  [get_ports {data0_man_f1_i[17]}]
set_input_transition -max 0.6  [get_ports {data0_man_f1_i[16]}]
set_input_transition -min 0.6  [get_ports {data0_man_f1_i[16]}]
set_input_transition -max 0.6  [get_ports {data0_man_f1_i[15]}]
set_input_transition -min 0.6  [get_ports {data0_man_f1_i[15]}]
set_input_transition -max 0.6  [get_ports {data0_man_f1_i[14]}]
set_input_transition -min 0.6  [get_ports {data0_man_f1_i[14]}]
set_input_transition -max 0.6  [get_ports {data0_man_f1_i[13]}]
set_input_transition -min 0.6  [get_ports {data0_man_f1_i[13]}]
set_input_transition -max 0.6  [get_ports {data0_man_f1_i[12]}]
set_input_transition -min 0.6  [get_ports {data0_man_f1_i[12]}]
set_input_transition -max 0.6  [get_ports {data0_man_f1_i[11]}]
set_input_transition -min 0.6  [get_ports {data0_man_f1_i[11]}]
set_input_transition -max 0.6  [get_ports {data0_man_f1_i[10]}]
set_input_transition -min 0.6  [get_ports {data0_man_f1_i[10]}]
set_input_transition -max 0.6  [get_ports {data0_man_f1_i[9]}]
set_input_transition -min 0.6  [get_ports {data0_man_f1_i[9]}]
set_input_transition -max 0.6  [get_ports {data0_man_f1_i[8]}]
set_input_transition -min 0.6  [get_ports {data0_man_f1_i[8]}]
set_input_transition -max 0.6  [get_ports {data0_man_f1_i[7]}]
set_input_transition -min 0.6  [get_ports {data0_man_f1_i[7]}]
set_input_transition -max 0.6  [get_ports {data0_man_f1_i[6]}]
set_input_transition -min 0.6  [get_ports {data0_man_f1_i[6]}]
set_input_transition -max 0.6  [get_ports {data0_man_f1_i[5]}]
set_input_transition -min 0.6  [get_ports {data0_man_f1_i[5]}]
set_input_transition -max 0.6  [get_ports {data0_man_f1_i[4]}]
set_input_transition -min 0.6  [get_ports {data0_man_f1_i[4]}]
set_input_transition -max 0.6  [get_ports {data0_man_f1_i[3]}]
set_input_transition -min 0.6  [get_ports {data0_man_f1_i[3]}]
set_input_transition -max 0.6  [get_ports {data0_man_f1_i[2]}]
set_input_transition -min 0.6  [get_ports {data0_man_f1_i[2]}]
set_input_transition -max 0.6  [get_ports {data0_man_f1_i[1]}]
set_input_transition -min 0.6  [get_ports {data0_man_f1_i[1]}]
set_input_transition -max 0.6  [get_ports {data0_man_f1_i[0]}]
set_input_transition -min 0.6  [get_ports {data0_man_f1_i[0]}]
set_input_transition -max 0.6  [get_ports {data0_exp_f1_i[12]}]
set_input_transition -min 0.6  [get_ports {data0_exp_f1_i[12]}]
set_input_transition -max 0.6  [get_ports {data0_exp_f1_i[11]}]
set_input_transition -min 0.6  [get_ports {data0_exp_f1_i[11]}]
set_input_transition -max 0.6  [get_ports {data0_exp_f1_i[10]}]
set_input_transition -min 0.6  [get_ports {data0_exp_f1_i[10]}]
set_input_transition -max 0.6  [get_ports {data0_exp_f1_i[9]}]
set_input_transition -min 0.6  [get_ports {data0_exp_f1_i[9]}]
set_input_transition -max 0.6  [get_ports {data0_exp_f1_i[8]}]
set_input_transition -min 0.6  [get_ports {data0_exp_f1_i[8]}]
set_input_transition -max 0.6  [get_ports {data0_exp_f1_i[7]}]
set_input_transition -min 0.6  [get_ports {data0_exp_f1_i[7]}]
set_input_transition -max 0.6  [get_ports {data0_exp_f1_i[6]}]
set_input_transition -min 0.6  [get_ports {data0_exp_f1_i[6]}]
set_input_transition -max 0.6  [get_ports {data0_exp_f1_i[5]}]
set_input_transition -min 0.6  [get_ports {data0_exp_f1_i[5]}]
set_input_transition -max 0.6  [get_ports {data0_exp_f1_i[4]}]
set_input_transition -min 0.6  [get_ports {data0_exp_f1_i[4]}]
set_input_transition -max 0.6  [get_ports {data0_exp_f1_i[3]}]
set_input_transition -min 0.6  [get_ports {data0_exp_f1_i[3]}]
set_input_transition -max 0.6  [get_ports {data0_exp_f1_i[2]}]
set_input_transition -min 0.6  [get_ports {data0_exp_f1_i[2]}]
set_input_transition -max 0.6  [get_ports {data0_exp_f1_i[1]}]
set_input_transition -min 0.6  [get_ports {data0_exp_f1_i[1]}]
set_input_transition -max 0.6  [get_ports {data0_exp_f1_i[0]}]
set_input_transition -min 0.6  [get_ports {data0_exp_f1_i[0]}]
set_input_transition -max 0.6  [get_ports data0_sign_f1_i]
set_input_transition -min 0.6  [get_ports data0_sign_f1_i]
set_input_transition -max 0.6  [get_ports data0_is_inf_f1_i]
set_input_transition -min 0.6  [get_ports data0_is_inf_f1_i]
set_input_transition -max 0.6  [get_ports data0_is_nan_f1_i]
set_input_transition -min 0.6  [get_ports data0_is_nan_f1_i]
set_input_transition -max 0.6  [get_ports data0_is_zero_f1_i]
set_input_transition -min 0.6  [get_ports data0_is_zero_f1_i]
set_input_transition -max 0.6  [get_ports {data1_man_f1_i[52]}]
set_input_transition -min 0.6  [get_ports {data1_man_f1_i[52]}]
set_input_transition -max 0.6  [get_ports {data1_man_f1_i[51]}]
set_input_transition -min 0.6  [get_ports {data1_man_f1_i[51]}]
set_input_transition -max 0.6  [get_ports {data1_man_f1_i[50]}]
set_input_transition -min 0.6  [get_ports {data1_man_f1_i[50]}]
set_input_transition -max 0.6  [get_ports {data1_man_f1_i[49]}]
set_input_transition -min 0.6  [get_ports {data1_man_f1_i[49]}]
set_input_transition -max 0.6  [get_ports {data1_man_f1_i[48]}]
set_input_transition -min 0.6  [get_ports {data1_man_f1_i[48]}]
set_input_transition -max 0.6  [get_ports {data1_man_f1_i[47]}]
set_input_transition -min 0.6  [get_ports {data1_man_f1_i[47]}]
set_input_transition -max 0.6  [get_ports {data1_man_f1_i[46]}]
set_input_transition -min 0.6  [get_ports {data1_man_f1_i[46]}]
set_input_transition -max 0.6  [get_ports {data1_man_f1_i[45]}]
set_input_transition -min 0.6  [get_ports {data1_man_f1_i[45]}]
set_input_transition -max 0.6  [get_ports {data1_man_f1_i[44]}]
set_input_transition -min 0.6  [get_ports {data1_man_f1_i[44]}]
set_input_transition -max 0.6  [get_ports {data1_man_f1_i[43]}]
set_input_transition -min 0.6  [get_ports {data1_man_f1_i[43]}]
set_input_transition -max 0.6  [get_ports {data1_man_f1_i[42]}]
set_input_transition -min 0.6  [get_ports {data1_man_f1_i[42]}]
set_input_transition -max 0.6  [get_ports {data1_man_f1_i[41]}]
set_input_transition -min 0.6  [get_ports {data1_man_f1_i[41]}]
set_input_transition -max 0.6  [get_ports {data1_man_f1_i[40]}]
set_input_transition -min 0.6  [get_ports {data1_man_f1_i[40]}]
set_input_transition -max 0.6  [get_ports {data1_man_f1_i[39]}]
set_input_transition -min 0.6  [get_ports {data1_man_f1_i[39]}]
set_input_transition -max 0.6  [get_ports {data1_man_f1_i[38]}]
set_input_transition -min 0.6  [get_ports {data1_man_f1_i[38]}]
set_input_transition -max 0.6  [get_ports {data1_man_f1_i[37]}]
set_input_transition -min 0.6  [get_ports {data1_man_f1_i[37]}]
set_input_transition -max 0.6  [get_ports {data1_man_f1_i[36]}]
set_input_transition -min 0.6  [get_ports {data1_man_f1_i[36]}]
set_input_transition -max 0.6  [get_ports {data1_man_f1_i[35]}]
set_input_transition -min 0.6  [get_ports {data1_man_f1_i[35]}]
set_input_transition -max 0.6  [get_ports {data1_man_f1_i[34]}]
set_input_transition -min 0.6  [get_ports {data1_man_f1_i[34]}]
set_input_transition -max 0.6  [get_ports {data1_man_f1_i[33]}]
set_input_transition -min 0.6  [get_ports {data1_man_f1_i[33]}]
set_input_transition -max 0.6  [get_ports {data1_man_f1_i[32]}]
set_input_transition -min 0.6  [get_ports {data1_man_f1_i[32]}]
set_input_transition -max 0.6  [get_ports {data1_man_f1_i[31]}]
set_input_transition -min 0.6  [get_ports {data1_man_f1_i[31]}]
set_input_transition -max 0.6  [get_ports {data1_man_f1_i[30]}]
set_input_transition -min 0.6  [get_ports {data1_man_f1_i[30]}]
set_input_transition -max 0.6  [get_ports {data1_man_f1_i[29]}]
set_input_transition -min 0.6  [get_ports {data1_man_f1_i[29]}]
set_input_transition -max 0.6  [get_ports {data1_man_f1_i[28]}]
set_input_transition -min 0.6  [get_ports {data1_man_f1_i[28]}]
set_input_transition -max 0.6  [get_ports {data1_man_f1_i[27]}]
set_input_transition -min 0.6  [get_ports {data1_man_f1_i[27]}]
set_input_transition -max 0.6  [get_ports {data1_man_f1_i[26]}]
set_input_transition -min 0.6  [get_ports {data1_man_f1_i[26]}]
set_input_transition -max 0.6  [get_ports {data1_man_f1_i[25]}]
set_input_transition -min 0.6  [get_ports {data1_man_f1_i[25]}]
set_input_transition -max 0.6  [get_ports {data1_man_f1_i[24]}]
set_input_transition -min 0.6  [get_ports {data1_man_f1_i[24]}]
set_input_transition -max 0.6  [get_ports {data1_man_f1_i[23]}]
set_input_transition -min 0.6  [get_ports {data1_man_f1_i[23]}]
set_input_transition -max 0.6  [get_ports {data1_man_f1_i[22]}]
set_input_transition -min 0.6  [get_ports {data1_man_f1_i[22]}]
set_input_transition -max 0.6  [get_ports {data1_man_f1_i[21]}]
set_input_transition -min 0.6  [get_ports {data1_man_f1_i[21]}]
set_input_transition -max 0.6  [get_ports {data1_man_f1_i[20]}]
set_input_transition -min 0.6  [get_ports {data1_man_f1_i[20]}]
set_input_transition -max 0.6  [get_ports {data1_man_f1_i[19]}]
set_input_transition -min 0.6  [get_ports {data1_man_f1_i[19]}]
set_input_transition -max 0.6  [get_ports {data1_man_f1_i[18]}]
set_input_transition -min 0.6  [get_ports {data1_man_f1_i[18]}]
set_input_transition -max 0.6  [get_ports {data1_man_f1_i[17]}]
set_input_transition -min 0.6  [get_ports {data1_man_f1_i[17]}]
set_input_transition -max 0.6  [get_ports {data1_man_f1_i[16]}]
set_input_transition -min 0.6  [get_ports {data1_man_f1_i[16]}]
set_input_transition -max 0.6  [get_ports {data1_man_f1_i[15]}]
set_input_transition -min 0.6  [get_ports {data1_man_f1_i[15]}]
set_input_transition -max 0.6  [get_ports {data1_man_f1_i[14]}]
set_input_transition -min 0.6  [get_ports {data1_man_f1_i[14]}]
set_input_transition -max 0.6  [get_ports {data1_man_f1_i[13]}]
set_input_transition -min 0.6  [get_ports {data1_man_f1_i[13]}]
set_input_transition -max 0.6  [get_ports {data1_man_f1_i[12]}]
set_input_transition -min 0.6  [get_ports {data1_man_f1_i[12]}]
set_input_transition -max 0.6  [get_ports {data1_man_f1_i[11]}]
set_input_transition -min 0.6  [get_ports {data1_man_f1_i[11]}]
set_input_transition -max 0.6  [get_ports {data1_man_f1_i[10]}]
set_input_transition -min 0.6  [get_ports {data1_man_f1_i[10]}]
set_input_transition -max 0.6  [get_ports {data1_man_f1_i[9]}]
set_input_transition -min 0.6  [get_ports {data1_man_f1_i[9]}]
set_input_transition -max 0.6  [get_ports {data1_man_f1_i[8]}]
set_input_transition -min 0.6  [get_ports {data1_man_f1_i[8]}]
set_input_transition -max 0.6  [get_ports {data1_man_f1_i[7]}]
set_input_transition -min 0.6  [get_ports {data1_man_f1_i[7]}]
set_input_transition -max 0.6  [get_ports {data1_man_f1_i[6]}]
set_input_transition -min 0.6  [get_ports {data1_man_f1_i[6]}]
set_input_transition -max 0.6  [get_ports {data1_man_f1_i[5]}]
set_input_transition -min 0.6  [get_ports {data1_man_f1_i[5]}]
set_input_transition -max 0.6  [get_ports {data1_man_f1_i[4]}]
set_input_transition -min 0.6  [get_ports {data1_man_f1_i[4]}]
set_input_transition -max 0.6  [get_ports {data1_man_f1_i[3]}]
set_input_transition -min 0.6  [get_ports {data1_man_f1_i[3]}]
set_input_transition -max 0.6  [get_ports {data1_man_f1_i[2]}]
set_input_transition -min 0.6  [get_ports {data1_man_f1_i[2]}]
set_input_transition -max 0.6  [get_ports {data1_man_f1_i[1]}]
set_input_transition -min 0.6  [get_ports {data1_man_f1_i[1]}]
set_input_transition -max 0.6  [get_ports {data1_man_f1_i[0]}]
set_input_transition -min 0.6  [get_ports {data1_man_f1_i[0]}]
set_input_transition -max 0.6  [get_ports {data1_exp_f1_i[12]}]
set_input_transition -min 0.6  [get_ports {data1_exp_f1_i[12]}]
set_input_transition -max 0.6  [get_ports {data1_exp_f1_i[11]}]
set_input_transition -min 0.6  [get_ports {data1_exp_f1_i[11]}]
set_input_transition -max 0.6  [get_ports {data1_exp_f1_i[10]}]
set_input_transition -min 0.6  [get_ports {data1_exp_f1_i[10]}]
set_input_transition -max 0.6  [get_ports {data1_exp_f1_i[9]}]
set_input_transition -min 0.6  [get_ports {data1_exp_f1_i[9]}]
set_input_transition -max 0.6  [get_ports {data1_exp_f1_i[8]}]
set_input_transition -min 0.6  [get_ports {data1_exp_f1_i[8]}]
set_input_transition -max 0.6  [get_ports {data1_exp_f1_i[7]}]
set_input_transition -min 0.6  [get_ports {data1_exp_f1_i[7]}]
set_input_transition -max 0.6  [get_ports {data1_exp_f1_i[6]}]
set_input_transition -min 0.6  [get_ports {data1_exp_f1_i[6]}]
set_input_transition -max 0.6  [get_ports {data1_exp_f1_i[5]}]
set_input_transition -min 0.6  [get_ports {data1_exp_f1_i[5]}]
set_input_transition -max 0.6  [get_ports {data1_exp_f1_i[4]}]
set_input_transition -min 0.6  [get_ports {data1_exp_f1_i[4]}]
set_input_transition -max 0.6  [get_ports {data1_exp_f1_i[3]}]
set_input_transition -min 0.6  [get_ports {data1_exp_f1_i[3]}]
set_input_transition -max 0.6  [get_ports {data1_exp_f1_i[2]}]
set_input_transition -min 0.6  [get_ports {data1_exp_f1_i[2]}]
set_input_transition -max 0.6  [get_ports {data1_exp_f1_i[1]}]
set_input_transition -min 0.6  [get_ports {data1_exp_f1_i[1]}]
set_input_transition -max 0.6  [get_ports {data1_exp_f1_i[0]}]
set_input_transition -min 0.6  [get_ports {data1_exp_f1_i[0]}]
set_input_transition -max 0.6  [get_ports data1_sign_f1_i]
set_input_transition -min 0.6  [get_ports data1_sign_f1_i]
set_input_transition -max 0.6  [get_ports data1_is_inf_f1_i]
set_input_transition -min 0.6  [get_ports data1_is_inf_f1_i]
set_input_transition -max 0.6  [get_ports data1_is_nan_f1_i]
set_input_transition -min 0.6  [get_ports data1_is_nan_f1_i]
set_input_transition -max 0.6  [get_ports data1_is_zero_f1_i]
set_input_transition -min 0.6  [get_ports data1_is_zero_f1_i]
set_input_transition -max 0.6  [get_ports kill_f1_i]
set_input_transition -min 0.6  [get_ports kill_f1_i]
set_input_transition -max 0.6  [get_ports kill_f2_i]
set_input_transition -min 0.6  [get_ports kill_f2_i]
set_input_transition -max 0.6  [get_ports stall_f1_i]
set_input_transition -min 0.6  [get_ports stall_f1_i]
set_input_transition -max 0.6  [get_ports stall_f2_i]
set_input_transition -min 0.6  [get_ports stall_f2_i]
set_input_transition -max 0.6  [get_ports op_val_f1_i]
set_input_transition -min 0.6  [get_ports op_val_f1_i]
set_input_transition -max 0.6  [get_ports op_is_dp_f1_i]
set_input_transition -min 0.6  [get_ports op_is_dp_f1_i]
set_input_transition -max 0.6  [get_ports op_is_mul_f1_i]
set_input_transition -min 0.6  [get_ports op_is_mul_f1_i]
set_input_transition -max 0.6  [get_ports op_is_mac_f1_i]
set_input_transition -min 0.6  [get_ports op_is_mac_f1_i]
set_input_transition -max 0.6  [get_ports op_is_dp_f2_i]
set_input_transition -min 0.6  [get_ports op_is_dp_f2_i]
set_clock_gating_check -rise -setup 0.3 [get_cells                             \
clk_gate_state_f2_reg/main_gate]
set_clock_gating_check -fall -setup 0.3 [get_cells                             \
clk_gate_state_f2_reg/main_gate]
set_clock_gating_check -rise -hold 0.2 [get_cells                              \
clk_gate_state_f2_reg/main_gate]
set_clock_gating_check -fall -hold 0.2 [get_cells                              \
clk_gate_state_f2_reg/main_gate]
set_clock_gating_check -rise -setup 0.3 [get_cells                             \
clk_gate_man_ctz_clamp_f2_reg/main_gate]
set_clock_gating_check -fall -setup 0.3 [get_cells                             \
clk_gate_man_ctz_clamp_f2_reg/main_gate]
set_clock_gating_check -rise -hold 0.2 [get_cells                              \
clk_gate_man_ctz_clamp_f2_reg/main_gate]
set_clock_gating_check -fall -hold 0.2 [get_cells                              \
clk_gate_man_ctz_clamp_f2_reg/main_gate]
set_clock_gating_check -rise -setup 0.3 [get_cells                             \
clk_gate_is_inf_fin_f2_reg/main_gate]
set_clock_gating_check -fall -setup 0.3 [get_cells                             \
clk_gate_is_inf_fin_f2_reg/main_gate]
set_clock_gating_check -rise -hold 0.2 [get_cells                              \
clk_gate_is_inf_fin_f2_reg/main_gate]
set_clock_gating_check -fall -hold 0.2 [get_cells                              \
clk_gate_is_inf_fin_f2_reg/main_gate]
set_clock_gating_check -rise -setup 0.3 [get_cells                             \
clk_gate_man_sbit_dp_f2_reg/main_gate]
set_clock_gating_check -fall -setup 0.3 [get_cells                             \
clk_gate_man_sbit_dp_f2_reg/main_gate]
set_clock_gating_check -rise -hold 0.2 [get_cells                              \
clk_gate_man_sbit_dp_f2_reg/main_gate]
set_clock_gating_check -fall -hold 0.2 [get_cells                              \
clk_gate_man_sbit_dp_f2_reg/main_gate]
set_clock_gating_check -rise -setup 0.3 [get_cells                             \
clk_gate_man_f2_reg_2/main_gate]
set_clock_gating_check -fall -setup 0.3 [get_cells                             \
clk_gate_man_f2_reg_2/main_gate]
set_clock_gating_check -rise -hold 0.2 [get_cells                              \
clk_gate_man_f2_reg_2/main_gate]
set_clock_gating_check -fall -hold 0.2 [get_cells                              \
clk_gate_man_f2_reg_2/main_gate]
set_clock_gating_check -rise -setup 0.3 [get_cells                             \
clk_gate_man_f2_reg_1/main_gate]
set_clock_gating_check -fall -setup 0.3 [get_cells                             \
clk_gate_man_f2_reg_1/main_gate]
set_clock_gating_check -rise -hold 0.2 [get_cells                              \
clk_gate_man_f2_reg_1/main_gate]
set_clock_gating_check -fall -hold 0.2 [get_cells                              \
clk_gate_man_f2_reg_1/main_gate]
set_clock_gating_check -rise -setup 0.3 [get_cells                             \
clk_gate_man_f2_reg_0/main_gate]
set_clock_gating_check -fall -setup 0.3 [get_cells                             \
clk_gate_man_f2_reg_0/main_gate]
set_clock_gating_check -rise -hold 0.2 [get_cells                              \
clk_gate_man_f2_reg_0/main_gate]
set_clock_gating_check -fall -hold 0.2 [get_cells                              \
clk_gate_man_f2_reg_0/main_gate]
set_clock_gating_check -rise -setup 0.3 [get_cells                             \
clk_gate_man_part_sum_f2_reg_0/main_gate]
set_clock_gating_check -fall -setup 0.3 [get_cells                             \
clk_gate_man_part_sum_f2_reg_0/main_gate]
set_clock_gating_check -rise -hold 0.2 [get_cells                              \
clk_gate_man_part_sum_f2_reg_0/main_gate]
set_clock_gating_check -fall -hold 0.2 [get_cells                              \
clk_gate_man_part_sum_f2_reg_0/main_gate]
set_clock_gating_check -rise -setup 0.3 [get_cells                             \
clk_gate_man_f2_reg/main_gate]
set_clock_gating_check -fall -setup 0.3 [get_cells                             \
clk_gate_man_f2_reg/main_gate]
set_clock_gating_check -rise -hold 0.2 [get_cells clk_gate_man_f2_reg/main_gate]
set_clock_gating_check -fall -hold 0.2 [get_cells clk_gate_man_f2_reg/main_gate]
set_clock_gating_check -rise -setup 0.3 [get_cells                             \
clk_gate_man_part_sum_f2_reg/main_gate]
set_clock_gating_check -fall -setup 0.3 [get_cells                             \
clk_gate_man_part_sum_f2_reg/main_gate]
set_clock_gating_check -rise -hold 0.2 [get_cells                              \
clk_gate_man_part_sum_f2_reg/main_gate]
set_clock_gating_check -fall -hold 0.2 [get_cells                              \
clk_gate_man_part_sum_f2_reg/main_gate]
set_clock_gating_check -rise -setup 0.3 [get_cells                             \
clk_gate_man_part_carry_f2_reg_0/main_gate]
set_clock_gating_check -fall -setup 0.3 [get_cells                             \
clk_gate_man_part_carry_f2_reg_0/main_gate]
set_clock_gating_check -rise -hold 0.2 [get_cells                              \
clk_gate_man_part_carry_f2_reg_0/main_gate]
set_clock_gating_check -fall -hold 0.2 [get_cells                              \
clk_gate_man_part_carry_f2_reg_0/main_gate]
set_clock_gating_check -rise -setup 0.3 [get_cells                             \
clk_gate_man_part_carry_f2_reg/main_gate]
set_clock_gating_check -fall -setup 0.3 [get_cells                             \
clk_gate_man_part_carry_f2_reg/main_gate]
set_clock_gating_check -rise -hold 0.2 [get_cells                              \
clk_gate_man_part_carry_f2_reg/main_gate]
set_clock_gating_check -fall -hold 0.2 [get_cells                              \
clk_gate_man_part_carry_f2_reg/main_gate]
