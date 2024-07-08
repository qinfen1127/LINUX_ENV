//======================================================================
// Copyright(c) 2020, Chengdu Sino Microelectronics Technology CO., LTD.
//                         All Right Reserved
//
// Created by     : hr_li
// Filename       : fpga_sdpram_sync.v
// Created On     : 2020-04-27
// Last Modified  : 2020-04-27
//
// Description: 
//
// Version        Modified by        Date           Description
// 1              hr_li              2020-04-27     original
//
//======================================================================

module fpga_sdpram_sync (/*autoarg*/
   // Outputs
   doutb,
   // Inputs
   clka, wr, addra, wea, dina, rd, rstb_n, addrb
   );

//--------------------------------------------------------------------------------------------
//  parameter define
//--------------------------------------------------------------------------------------------
parameter				ADDR_WIDTH	=	6			;
parameter				DATA_WIDTH	=	6			;
parameter				READ_LATEN  =   1           ;
parameter				BYTE_WIDTH	=	DATA_WIDTH  ;
parameter				WEA_SIZE	=	DATA_WIDTH/BYTE_WIDTH    ;
parameter				MEMORY_SIZE	=	2**ADDR_WIDTH*DATA_WIDTH ;

//--------------------------------------------------------------------------------------------
//  input & output
//--------------------------------------------------------------------------------------------
input                                clka                        ;
input                                wr                          ;
input  [ADDR_WIDTH-1:0]              addra                       ;
input  [WEA_SIZE  -1:0]              wea                         ;
input  [DATA_WIDTH-1:0]              dina   					 ;

input                                rd                          ;
input                                rstb_n                      ;
input  [ADDR_WIDTH-1:0]              addrb                       ;
output [DATA_WIDTH-1:0]              doutb                       ;

//--------------------------------------------------------------------------------------------
//  xpm_memory_sdpram instance
//--------------------------------------------------------------------------------------------
   xpm_memory_sdpram #(
      .ADDR_WIDTH_A            (ADDR_WIDTH          ), // DECIMAL
      .ADDR_WIDTH_B            (ADDR_WIDTH          ), // DECIMAL
      .AUTO_SLEEP_TIME         (0                   ), // DECIMAL
      .BYTE_WRITE_WIDTH_A      (BYTE_WIDTH          ), // DECIMAL
      .CLOCKING_MODE           ("common_clock"      ), // String
      .ECC_MODE                ("no_ecc"            ), // String
      .MEMORY_INIT_FILE        ("none"              ), // String
      .MEMORY_INIT_PARAM       ("0"                 ), // String
      .MEMORY_OPTIMIZATION     ("true"              ), // String
      .MEMORY_PRIMITIVE        ("auto"              ), // String
      .MEMORY_SIZE             (MEMORY_SIZE         ), // DECIMAL
      .MESSAGE_CONTROL         (0                   ), // DECIMAL
      .READ_DATA_WIDTH_B       (DATA_WIDTH          ), // DECIMAL
      .READ_LATENCY_B          (READ_LATEN          ), // DECIMAL
      .READ_RESET_VALUE_B      ("0"                 ), // String
      .USE_EMBEDDED_CONSTRAINT (0                   ), // DECIMAL
      .USE_MEM_INIT            (1                   ), // DECIMAL
      .WAKEUP_TIME             ("disable_sleep"     ), // String
      .WRITE_DATA_WIDTH_A      (DATA_WIDTH          ), // DECIMAL
      .WRITE_MODE_B            ("read_first"        )  // String
   )
   xpm_memory_sdpram_inst (
      .dbiterrb       (        ), // 1-bit output: Status signal to indicate double bit error occurrence
                                  // on the data output of port B.

      .doutb          (doutb   ), // READ_DATA_WIDTH_B-bit output: Data output for port B read operations.
      .sbiterrb       (        ), // 1-bit output: Status signal to indicate single bit error occurrence
                                  // on the data output of port B.

      .addra          (addra   ), // ADDR_WIDTH_A-bit input: Address for port A write operations.
      .addrb          (addrb   ), // ADDR_WIDTH_B-bit input: Address for port B read operations.
      .clka           (clka    ), // 1-bit input: Clock signal for port A. Also clocks port B when
                                  // parameter CLOCKING_MODE is "common_clock".

      .clkb           (        ), // 1-bit input: Clock signal for port B when parameter CLOCKING_MODE is
                                  // "independent_clock". Unused when parameter CLOCKING_MODE is
                                  // "common_clock".

      .dina           (dina    ), // WRITE_DATA_WIDTH_A-bit input: Data input for port A write operations.
      .ena            (wr      ), // 1-bit input: Memory enable signal for port A. Must be high on clock
                                  // cycles when write operations are initiated. Pipelined internally.

      .enb            (rd      ), // 1-bit input: Memory enable signal for port B. Must be high on clock
                                  // cycles when read operations are initiated. Pipelined internally.

      .injectdbiterra (1'b0    ), // 1-bit input: Controls double bit error injection on input data when
                                  // ECC enabled (Error injection capability is not available in
                                  // "decode_only" mode).

      .injectsbiterra (1'b0    ), // 1-bit input: Controls single bit error injection on input data when
                                  // ECC enabled (Error injection capability is not available in
                                  // "decode_only" mode).

      .regceb         (1'b1    ), // 1-bit input: Clock Enable for the last register stage on the output
                                  // data path.

      .rstb           (~rstb_n ), // 1-bit input: Reset signal for the final port B output register stage.
                                  // Synchronously resets output port doutb to the value specified by
                                  // parameter READ_RESET_VALUE_B.

      .sleep          (1'b0    ), // 1-bit input: sleep signal to enable the dynamic power saving feature.
      .wea            (wea     )  // WRITE_DATA_WIDTH_A-bit input: Write enable vector for port A input
                                  // data port dina. 1 bit wide when word-wide writes are used. In
                                  // byte-wide write configurations, each bit controls the writing one
                                  // byte of dina to address addra. For example, to synchronously write
                                  // only bits [15-8] of dina when WRITE_DATA_WIDTH_A is 32, wea would be
                                  // 4'b0010.

   );

endmodule

