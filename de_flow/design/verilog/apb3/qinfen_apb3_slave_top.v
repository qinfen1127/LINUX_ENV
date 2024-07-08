//======================================================================
// Copyright(c) 2024, Fighting for freedom & Always going on
//                         All Right Reserved
//
// Created by     : haoran.li
// Filename       : qinfen_apb3_slave_top.v
// Created On     : 2024-05-27
// Last Modified  : 2024-05-27
//
// Description: 
//
// Version        Modified by        Date           Description
// 1              haoran.li          2024-05-27     original
//
//======================================================================

module qinfen_apb3_slave_top   #(
    parameter ADDRWIDTH = 12
) ( // IO declaration
    input  wire                    pclk,     // pclk
    input  wire                    presetn,  // reset

    // apb interface inputs
    input  wire                    psel,
    input  wire  [ADDRWIDTH-1:0]   paddr,
    input  wire                    penable,
    input  wire                    pwrite,
    input  wire  [31:0]            pwdata,

    // Engineering-change-order revision bits
    input  wire  [3:0]             ecorevnum,

    // apb interface outputs
    output wire  [31:0]            prdata,
    output wire                    pready,
    output wire                    pslverr
);

//--------------------------------------------------------------------------------------------
//  wire/reg define
//--------------------------------------------------------------------------------------------
    wire  [ADDRWIDTH-1:0]    addr;
    wire                     read_en;
    wire                     write_en;
    wire  [31:0]             wdata;
    wire  [31:0]             rdata;

//--------------------------------------------------------------------------------------------
//  instance qinfen_apb3_slave_interface
//--------------------------------------------------------------------------------------------
/*testname auto_template "u_\([a-z]+[0-9]+\)" (
    .\(.*\)                     (\1[]),
);*/
qinfen_apb3_slave_interface  #(/*autoinstparam*/
             // Parameters
             .ADDRWIDTH                    ( ADDRWIDTH            )  ) 
             u_qinfen_apb3_slave_interface ( /*autoinst*/
             // Outputs
             .prdata                       ( prdata[31:0]         )  , 
             .pready                       ( pready               )  , 
             .pslverr                      ( pslverr              )  , 
             .addr                         ( addr[ADDRWIDTH-1:0]  )  , 
             .read_en                      ( read_en              )  , 
             .write_en                     ( write_en             )  , 
             .byte_strobe                  ( byte_strobe[3:0]     )  , 
             .wdata                        ( wdata[31:0]          )  , 
             // Inpu
             .pclk                         ( pclk                 )  , 
             .presetn                      ( presetn              )  , 
             .psel                         ( psel                 )  , 
             .paddr                        ( paddr[ADDRWIDTH-1:0] )  , 
             .penable                      ( penable              )  , 
             .pwrite                       ( pwrite               )  , 
             .pwdata                       ( pwdata[31:0]         )  , 
             .pstrb                        ( pstrb[3:0]           )  , 
             .rdata                        ( rdata[31:0]          )  ) ;

//--------------------------------------------------------------------------------------------
//  instance qinfen_apb3_slave_reg
//--------------------------------------------------------------------------------------------
/*testname auto_template "u_\([a-z]+[0-9]+\)" (
    .\(.*\)                 (\1[]),
);*/
qinfen_apb3_slave_reg  #(/*autoinstparam*/
       // Parameters
       .ADDRWIDTH              ( ADDRWIDTH           ) 
                                                     ) u_qinfen_apb3_slave_reg ( /*autoinst*/
       // Outputs
       .rdata                  ( rdata[31:0]         ) ,
       // Inputs
       .pclk                   ( pclk                ) ,
       .presetn                ( presetn             ) ,
       .addr                   ( addr[ADDRWIDTH-1:0] ) ,
       .read_en                ( read_en             ) ,
       .write_en               ( write_en            ) ,
       .wdata                  ( wdata[31:0]         ) ,
       .ecorevnum              ( ecorevnum[3:0]      ) 
);

endmodule

// Local Variables:
// verilog-library-directories:("")
// verilog-auto-inst-param-value:t
// verilog-auto-output-ignore-regexp:"^.*_nc.*\\|^.*pst.*"
// verilog-auto-input-ignore-regexp:"^.*nc.*\\|^.*pst.*"
// End:

