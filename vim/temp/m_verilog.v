//==========================================================================================================================
//  @File Name  :  m_verilog.v
//  @File Type  :  verilog
//  @Author     :  Howard
//  @E-mail     :  qinfen1127@163.com
//  @Date       :  2024-05-30
//  @Function   :  verilog temp code
//==========================================================================================================================

//---------------------------------------------------------------------------------------------------------------------
// 1  module_start format
//---------------------------------------------------------------------------------------------------------------------
module m_verilog #(
  parameter   ADDRWIDTH = 12                 //parameter define
 ,parameter   DATAWIDTH = 12                 //parameter define
 ,localparam  SELFWIDTH = 12                 //parameter define
)(
  input  wire                    pclk      , // pclk
  input  wire                    presetn   , // reset

  input  wire                    psel      , // apb4 slave select
  input  wire [ADDRWIDTH-1:0]    paddr     , // apb4 address
  input  wire                    penable   , // apb4 enable
  input  wire                    pwrite    , // apb4 1-write  0-read
  input  wire [31:0]             pwdata    , // apb4 write data
  input  wire [3:0]              pstrb     , // apb4 write data byte enable

  output wire [31:0]             prdata    , // apb4 read data
  output reg                     pready    , // apb4 slave ready
  output reg                     pslverr     // apb4 slave error occurr
);

//---------------------------------------------------------------------------------------------------------------------
// 2  parameter & localparam define
//---------------------------------------------------------------------------------------------------------------------
  parameter   MY_SELF_DEFINE               = 32'h00000004; // 0xFD0 : PID 4
  parameter   TIMER_WD                     = 24          ;
  localparam  ARM_CMSDK_APB4_EG_SLAVE_PID4 = 32'h00000004; // 0xFD0 : PID 4

//---------------------------------------------------------------------------------------------------------------------
// 3  reg & wire define
//---------------------------------------------------------------------------------------------------------------------
  reg    [31:0]            data0;
  reg    [31:0]            data1;
  reg    [31:0]            data2;
  reg    [31:0]            data3;

  wire   [3:0]             wr_sel;
  reg    [DATAWIDTH-1:0]   number;

//---------------------------------------------------------------------------------------------------------------------
// 4  assign logic
//---------------------------------------------------------------------------------------------------------------------
  assign wr_sel[0] = ((addr[(ADDRWIDTH-1):2] == 10'b0000000000) & (write_en)) ? 1'b1: 1'b0;

//---------------------------------------------------------------------------------------------------------------------
// 5  always logic
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
// 6  always combine logic
//---------------------------------------------------------------------------------------------------------------------
  reg  [TIMER_WD-1:0]  timer_counter, n_timer_counter;
  always @(*)
    begin
      n_timer_counter = timer_counter;
      if (!enable)
        begin
          n_timer_counter = timer_counter;
        end
      else if (timer_event & (|timer_counter))
        begin
          n_timer_counter = timer_counter - {{TIMER_WD-1{1'b0}},1'b1};
        end
    end

//---------------------------------------------------------------------------------------------------------------------
// 7  generate logic
//---------------------------------------------------------------------------------------------------------------------
  generate 
    if (p_data_width < p_int_width)
      begin : gen_data_padding
        assign data_padded = {{(p_int_width-p_data_width){1'b0}},data_in};
      end
    else
      begin : gen_data_no_padding
        assign data_padded = data_in;
      end
  endgenerate

endmodule

