//==========================================================================================================================
//  @File Name  :  /home/haoran/.vim/temp/verilog_temp.v
//  @File Type  :  verilog
//  @Author     :  Howard
//  @E-mail     :  qinfen1127@163.com
//  @Date       :  2024-05-30
//  @Function   :  
//==========================================================================================================================

//---------------------------------------------------------------------------------------------------------------------
// APB4 Slave interface
//---------------------------------------------------------------------------------------------------------------------
module apb4_slave #(
  parameter ADDRWIDTH = 12
)(
  input  wire                    pclk      , // pclk
  input  wire                    presetn   , // reset

  input  wire                    psel      , // apb4 slave select
  input  wire [ADDRWIDTH-1:0]    paddr     , // apb4 address
  input  wire                    penable   , // apb4 enable
  input  wire                    pwrite    , // apb4 1-write  0-read
  input  wire [31:0]             pwdata    , // apb4 write data
  input  wire [3:0]              pstrb     , // apb4 write data byte enable

  output reg [31:0]              prdata    , // apb4 read data
  output reg                     pready    , // apb4 slave ready
  output wire                    pslverr     // apb4 slave error occurr
);

endmodule

//---------------------------------------------------------------------------------------------------------------------
// APB4 Master interface
//---------------------------------------------------------------------------------------------------------------------
module apb4_master #(
  parameter ADDRWIDTH = 12
)(
  input  wire                    pclk      , // pclk
  input  wire                    presetn   , // reset

  output reg                     psel      , // apb4 slave select
  output reg  [ADDRWIDTH-1:0]    paddr     , // apb4 address
  output reg                     penable   , // apb4 enable
  output reg                     pwrite    , // apb4 1-write  0-read
  output reg  [31:0]             pwdata    , // apb4 write data
  output reg  [3:0]              pstrb     , // apb4 write data byte enable

  input  wire[31:0]              prdata    , // apb4 read data
  input  wire                    pready    , // apb4 slave ready
  input  wire                    pslverr     // apb4 slave error occurr
);

endmodule
