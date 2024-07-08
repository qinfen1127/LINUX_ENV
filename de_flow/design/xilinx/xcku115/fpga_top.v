//======================================================================
// Copyright(c) 2020, Chengdu Sino Microelectronics Technology CO., LTD.
//                         All Right Reserved
//
// Created by     : hr_li
// Filename       : fpga_top.v
// Created On     : 2020-05-19
// Last Modified  : 2020-05-19
//
// Description: 
//
// Version        Modified by        Date           Description
// 1              hr_li              2020-05-19     original
//
//======================================================================

module fpga_top (/*autoarg*/
   // Outputs
   XTAL2, TDO, fpga_clk_out,fpga_rst_out,
   // Inouts
   SWDIOTMS, P1, P0,
   // Inputs
   nTRST, fpga_rst_in, fpga_clk_in, TDI, SWCLKTCK
   );

/*autoinput*/
// Beginning of automatic inputs (from unused autoinst inputs)
input			SWCLKTCK;		// To u_cmsdk_mcu of cmsdk_mcu.v
input			TDI;			// To u_cmsdk_mcu of cmsdk_mcu.v
input			fpga_clk_in;		// To u_fpga_clk_rst of fpga_clk_rst.v
input			fpga_rst_in;		// To u_fpga_clk_rst of fpga_clk_rst.v
input			nTRST;			// To u_cmsdk_mcu of cmsdk_mcu.v
// End of automatics

/*autooutput*/
// Beginning of automatic outputs (from unused autoinst outputs)
output			TDO;			// From u_cmsdk_mcu of cmsdk_mcu.v
output			XTAL2;			// From u_cmsdk_mcu of cmsdk_mcu.v
output			fpga_clk_out;		// From u_fpga_clk_rst of fpga_clk_rst.v
output			fpga_rst_out;		// From u_fpga_clk_rst of fpga_clk_rst.v

// End of automatics

/*autoinout*/
// Beginning of automatic inouts (from unused autoinst inouts)
inout [15:0]		P0;			// To/From u_cmsdk_mcu of cmsdk_mcu.v
inout [15:0]		P1;			// To/From u_cmsdk_mcu of cmsdk_mcu.v
inout			SWDIOTMS;		// To/From u_cmsdk_mcu of cmsdk_mcu.v
// End of automatics

/*autowire*/
// Beginning of automatic wires (for undeclared instantiated-module outputs)

// End of automatics


//--------------------------------------------------------------------------------------------
//  instance fpga_clk_rst
//--------------------------------------------------------------------------------------------
/*fpga_clk_rst auto_template "u_\([a-z]+[0-9]+\)" (
	.\(.*\)						(\1[]),
);*/
fpga_clk_rst  u_fpga_clk_rst (/*autoinst*/
			      // Outputs
			      .fpga_clk_out	(fpga_clk_out),	 // Templated
			      .fpga_rst_out	(fpga_rst_out),	 // Templated
			      // Inputs
			      .fpga_clk_in	(fpga_clk_in),	 // Templated
			      .fpga_rst_in	(fpga_rst_in));	 // Templated

//--------------------------------------------------------------------------------------------
//  instance cmsdk_mcu
//--------------------------------------------------------------------------------------------
/*cmsdk_mcu auto_template "u_\([a-z]+[0-9]+\)" (
	.XTAL1						(fpga_clk_out),
	.NRST						(fpga_rst_out),
	.\(.*\)						(\1[]),
);*/
cmsdk_mcu  u_cmsdk_mcu (/*autoinst*/
			// Outputs
			.XTAL2		(XTAL2),		 // Templated
			.TDO		(TDO),			 // Templated
			// Inouts
			.P0		(P0[15:0]),		 // Templated
			.P1		(P1[15:0]),		 // Templated
			.SWDIOTMS	(SWDIOTMS),		 // Templated
			// Inputs
			.XTAL1		(fpga_clk_out),		 // Templated
			.NRST		(fpga_rst_out),		 // Templated
			.nTRST		(nTRST),		 // Templated
			.TDI		(TDI),			 // Templated
			.SWCLKTCK	(SWCLKTCK));		 // Templated

endmodule

// Local Variables:
// verilog-library-directories:("/fhome/icdata/hr_li/Music/M0_test/design/xilinx/xcku115" "/fhome/icdata/hr_li/Music/M0_test/design/verilog/mcu_top")
// verilog-auto-inst-param-value:t
// verilog-auto-output-ignore-regexp:"^.*_nc.*\\|^.*pst.*"
// verilog-auto-input-ignore-regexp:"^.*nc.*\\|^.*pst.*"
// End:

