//======================================================================
// Copyright(c) 2024, Fighting for freedom & Always going on
//                         All Right Reserved
//
// Created by     : haoran.li
// Filename       : qinfen_apb3_slave_interface.v
// Created On     : 2024-05-27
// Last Modified  : 2024-05-27
//
// Description: 
//
// Version        Modified by        Date           Description
// 1              haoran.li          2024-05-27     original
//
//======================================================================

module qinfen_apb3_slave_interface #(
    parameter ADDRWIDTH = 12
) ( // IO declaration

    input  wire                    pclk,     // pclk
    input  wire                    presetn,  // reset

    // apb interface inputs
    input  wire                    psel,
    input  wire [ADDRWIDTH-1:0]    paddr,
    input  wire                    penable,
    input  wire                    pwrite,
    input  wire [31:0]             pwdata,
    input  wire [3:0]              pstrb,

    // apb interface outputs
    output wire [31:0]             prdata,
    output wire                    pready,
    output wire                    pslverr,

    //Register interface
    output wire [ADDRWIDTH-1:0]    addr,
    output wire                    read_en,
    output wire                    write_en,
    output wire [3:0]              byte_strobe,
    output wire [31:0]             wdata,
    input  wire [31:0]             rdata
);

//--------------------------------------------------------------------------------------------
//  APB tie value
//--------------------------------------------------------------------------------------------
    assign  pready  = 1'b1; //always ready. Can be customized to support waitstate if required.
    assign  pslverr = 1'b0; //alwyas OKAY. Can be customized to support error response if required.

//--------------------------------------------------------------------------------------------
//  register read and write signal
//--------------------------------------------------------------------------------------------
    assign  addr        = paddr;
    assign  read_en     = psel & (~pwrite);           // assert for whole apb read transfer
    assign  write_en    = psel & (~penable) & pwrite; // assert for 1st cycle of write transfer
    assign  byte_strobe = pstrb;
    assign  wdata       = pwdata;
    assign  prdata      = rdata;


endmodule

// Local Variables:
// verilog-library-directories:("filepath")
// verilog-auto-inst-param-value:t
// verilog-auto-output-ignore-regexp:"^.*_nc.*\\|^.*pst.*"
// verilog-auto-input-ignore-regexp:"^.*nc.*\\|^.*pst.*"
// End:

