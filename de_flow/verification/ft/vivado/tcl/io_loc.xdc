#---------------------------------------------------------------------------
#  clock configure
#---------------------------------------------------------------------------
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets clk_in1_IBUF_inst/O]

#---------------------------------------------------------------------------
#  clk & rstn loc
#---------------------------------------------------------------------------
set_property PACKAGE_PIN AR18 			[get_ports fpga_clk_in]
set_property IOSTANDARD LVCMOS25 		[get_ports fpga_clk_in]
set_property PACKAGE_PIN BA22 			[get_ports fpga_rst_in]
set_property IOSTANDARD LVCMOS25 		[get_ports fpga_rst_in]

#---------------------------------------------------------------------------
#  JTAG & SW loc
#---------------------------------------------------------------------------
set_property PACKAGE_PIN AH29 			[get_ports SWCLKTCK]
set_property IOSTANDARD LVCMOS18 		[get_ports SWCLKTCK]
set_property PACKAGE_PIN AG29 			[get_ports SWDIOTMS]
set_property IOSTANDARD LVCMOS18 		[get_ports SWDIOTMS]
set_property PACKAGE_PIN AF35 			[get_ports TDI]
set_property IOSTANDARD LVCMOS18 		[get_ports TDI]
set_property PACKAGE_PIN AC35 			[get_ports TDO]
set_property IOSTANDARD LVCMOS18 		[get_ports TDO]


