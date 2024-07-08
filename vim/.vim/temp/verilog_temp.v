//==========================================================================================================================
//  @File Name  :  /home/haoran/.vim/temp/verilog_temp.v
//  @File Type  :  verilog
//  @Author     :  Howard
//  @E-mail     :  qinfen1127@163.com
//  @Date       :  2024-05-30
//  @Function   :  
//==========================================================================================================================

module verilog_temp #(//parameter define
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

  input  wire [3:0]              ecorevnum , // Engineering-change-order revision bits

  output wire [31:0]             prdata    , // apb4 read data
  output wire                    pready    , // apb4 slave ready
  output wire                    pslverr     // apb4 slave error occurr
);

//---------------------------------------------------------------------------------------------------------------------
// local parameter define
//---------------------------------------------------------------------------------------------------------------------
  localparam  ARM_CMSDK_APB4_EG_SLAVE_PID4 = 32'h00000004; // 0xFD0 : PID 4
  localparam  ARM_CMSDK_APB4_EG_SLAVE_PID5 = 32'h00000000; // 0xFD4 : PID 5
  localparam  ARM_CMSDK_APB4_EG_SLAVE_PID6 = 32'h00000000; // 0xFD8 : PID 6
  localparam  ARM_CMSDK_APB4_EG_SLAVE_PID7 = 32'h00000000; // 0xFDC : PID 7
  localparam  ARM_CMSDK_APB4_EG_SLAVE_PID0 = 32'h00000019; // 0xFE0 : PID 0 APB4 Example slave part number[7:0]
  localparam  ARM_CMSDK_APB4_EG_SLAVE_PID1 = 32'h000000B8; // 0xFE4 : PID 1 [7:4] jep106_id_3_0. [3:0] part number [11:8]
  localparam  ARM_CMSDK_APB4_EG_SLAVE_PID2 = 32'h0000001B; // 0xFE8 : PID 2 [7:4] revision, [3] jedec_used. [2:0] jep106_id_6_4
  localparam  ARM_CMSDK_APB4_EG_SLAVE_PID3 = 32'h00000000; // 0xFEC : PID 3
  localparam  ARM_CMSDK_APB4_EG_SLAVE_CID0 = 32'h0000000D; // 0xFF0 : CID 0
  localparam  ARM_CMSDK_APB4_EG_SLAVE_CID1 = 32'h000000F0; // 0xFF4 : CID 1 PrimeCell class
  localparam  ARM_CMSDK_APB4_EG_SLAVE_CID2 = 32'h00000005; // 0xFF8 : CID 2
  localparam  ARM_CMSDK_APB4_EG_SLAVE_CID3 = 32'h000000B1; // 0xFFC : CID 3

//---------------------------------------------------------------------------------------------------------------------
// internal define
//---------------------------------------------------------------------------------------------------------------------
  reg    [31:0]            data0;
  reg    [31:0]            data1;
  reg    [31:0]            data2;
  reg    [31:0]            data3;

  wire   [3:0]             wr_sel;

//---------------------------------------------------------------------------------------------------------------------
// write select logic
//---------------------------------------------------------------------------------------------------------------------
  assign wr_sel[0] = ((addr[(ADDRWIDTH-1):2]==10'b0000000000)&(write_en)) ? 1'b1: 1'b0;
  assign wr_sel[1] = ((addr[(ADDRWIDTH-1):2]==10'b0000000001)&(write_en)) ? 1'b1: 1'b0;
  assign wr_sel[2] = ((addr[(ADDRWIDTH-1):2]==10'b0000000010)&(write_en)) ? 1'b1: 1'b0;
  assign wr_sel[3] = ((addr[(ADDRWIDTH-1):2]==10'b0000000011)&(write_en)) ? 1'b1: 1'b0;
//---------------------------------------------------------------------------------------------------------------------
// data0 register write operation
//---------------------------------------------------------------------------------------------------------------------
  always @(posedge pclk or negedge presetn)
    begin
    if (~presetn)
      begin
        data0 <= {32{1'b0}}; // Reset data 0 to 0x00000000
      end
    else if (wr_sel[0])
      begin
        if (byte_strobe[0])
           data0[ 7: 0] <= wdata[ 7: 0];
        if (byte_strobe[1])
           data0[15: 8] <= wdata[15: 8];
        if (byte_strobe[2])
           data0[23:16] <= wdata[23:16];
        if (byte_strobe[3])
           data0[31:24] <= wdata[31:24];
      end
    end





















//---------------------------------------------------------------------------------------------------------------------
// module logic end
//---------------------------------------------------------------------------------------------------------------------





endmodule

