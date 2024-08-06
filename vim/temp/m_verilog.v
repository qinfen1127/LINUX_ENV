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
  parameter   ADDRWIDTH    = 12                                                            , // parameter define
  parameter   DATAWIDTH    = 12                                                            , // parameter define
  localparam  SELFWIDTH    = 12                                                            , // parameter define
  parameter   p_data_width = 32'd32                                                        , // parameter define
  parameter   p_num_par    = (p_data_width+32'd7)/32'd8                                    , // parameter define
  parameter   p_int_width  = p_num_par*32'd8                                               , // parameter define
  parameter   p_fault_inj  = 1'b1                                                          , // parameter define
  parameter   M_IF_COUNT   = 3                                                             , // parameter define
  localparam  M_IF_WIDTH   = (M_IF_COUNT < 2) ? 1 : $clog2(M_IF_COUNT)                       // parameter define
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

/*autoinput*/

/*autooutput*/

/*autoinout*/

/*autowire*/

/*autoreg*/

endmodule

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
// 4  assign logic1
//---------------------------------------------------------------------------------------------------------------------
  assign wr_sel[0] = ((addr[(ADDRWIDTH-1):2] == 10'b0000000000) & (write_en)) ? 1'b1: 1'b0;

//---------------------------------------------------------------------------------------------------------------------
// 5  assign logic2
//---------------------------------------------------------------------------------------------------------------------
  assign  expencted_lane_no_reversed_int = ( tx_lane_no_active_count_reg == 3'b100) ? 9'd5 :        // comment1
                                           ( tx_lane_no_active_count_reg == 3'b101) ? 9'd4 :        // comment2
                                           ( tx_lane_no_active_count_reg == 3'b110) ? 9'd3 :        // comment3
                                           ( tx_lane_no_active_count_reg == 3'b111) ? 9'd2 :        // comment4
                                           ( tx_lane_no_active_count_reg == 3'b001) ? 9'd1 : 9'd0 ; // comment6

//---------------------------------------------------------------------------------------------------------------------
// 6  assign logic3
//---------------------------------------------------------------------------------------------------------------------
  assign  pipe_rx_status_core_clk = {
            l15_pipe_rx_status_core_clk,
            l14_pipe_rx_status_core_clk,
            l13_pipe_rx_status_core_clk,
            l12_pipe_rx_status_core_clk,
            l11_pipe_rx_status_core_clk,
            l10_pipe_rx_status_core_clk,
            l09_pipe_rx_status_core_clk,
            l08_pipe_rx_status_core_clk,
            l07_pipe_rx_status_core_clk,
            l06_pipe_rx_status_core_clk,
            l05_pipe_rx_status_core_clk,
            l04_pipe_rx_status_core_clk,
            l03_pipe_rx_status_core_clk,
            l02_pipe_rx_status_core_clk,
            l01_pipe_rx_status_core_clk,
            l00_pipe_rx_status_core_clk,
                         };

//---------------------------------------------------------------------------------------------------------------------
// 6  assign logic4
//---------------------------------------------------------------------------------------------------------------------
  assign  pipe_rx_status_core_clk = {
            l00_pipe_rx_status_core_clk,
            l01_pipe_rx_status_core_clk,
            l02_pipe_rx_status_core_clk,
            l03_pipe_rx_status_core_clk,
            l04_pipe_rx_status_core_clk,
            l05_pipe_rx_status_core_clk,
            l06_pipe_rx_status_core_clk,
            l07_pipe_rx_status_core_clk,
            l08_pipe_rx_status_core_clk,
            l09_pipe_rx_status_core_clk,
            l10_pipe_rx_status_core_clk,
            l11_pipe_rx_status_core_clk,
            l12_pipe_rx_status_core_clk,
            l13_pipe_rx_status_core_clk,
            l14_pipe_rx_status_core_clk,
            l15_pipe_rx_status_core_clk,
                         };

//---------------------------------------------------------------------------------------------------------------------
// 6  assign logic5
//---------------------------------------------------------------------------------------------------------------------
  wire  [31:0]  data_file  [0:63] ;

  assign data_file[0]     = 32'h0000_0000;
  assign data_file[1]     = 32'h0000_0000;
  assign data_file[2]     = 32'h0000_0000;
  assign data_file[3]     = 32'h0000_0000;
  assign data_file[4]     = 32'h0000_0000;
  assign data_file[5]     = 32'h0000_0000;
  assign data_file[6]     = 32'h0000_0000;
  assign data_file[7]     = 32'h0000_0000;
  assign data_file[8]     = 32'h0000_0000;
  assign data_file[9]     = 32'h0000_0000;
  assign data_file[10]    = 32'h0000_0000;
  assign data_file[11]    = 32'h0000_0000;
  assign data_file[12]    = 32'h0000_0000;
  assign data_file[13]    = 32'h0000_0000;
  assign data_file[14]    = 32'h0000_0000;
  assign data_file[15]    = 32'h0000_0000;
  assign data_file[16]    = 32'h0000_0000;
  assign data_file[17]    = 32'h0000_0000;
  assign data_file[18]    = 32'h0000_0000;
  assign data_file[19]    = 32'h0000_0000;
  assign data_file[20]    = 32'h0000_0000;
  assign data_file[21]    = 32'h0000_0000;
  assign data_file[22]    = 32'h0000_0000;
  assign data_file[23]    = 32'h0000_0000;
  assign data_file[24]    = 32'h0000_0000;
  assign data_file[25]    = 32'h0000_0000;
  assign data_file[26]    = 32'h0000_0000;
  assign data_file[27]    = 32'h0000_0000;
  assign data_file[28]    = 32'h0000_0000;
  assign data_file[29]    = 32'h0000_0000;
  assign data_file[30]    = 32'h0000_0000;
  assign data_file[31]    = 32'h0000_0000;
  assign data_file[32]    = 32'h0000_0000;
  assign data_file[33]    = 32'h0000_0000;
  assign data_file[34]    = 32'h0000_0000;
  assign data_file[35]    = 32'h0000_0000;
  assign data_file[36]    = 32'h0000_0000;
  assign data_file[37]    = 32'h0000_0000;
  assign data_file[38]    = 32'h0000_0000;
  assign data_file[39]    = 32'h0000_0000;
  assign data_file[40]    = 32'h0000_0000;
  assign data_file[41]    = 32'h0000_0000;
  assign data_file[42]    = 32'h0000_0000;
  assign data_file[43]    = 32'h0000_0000;
  assign data_file[44]    = 32'h0000_0000;
  assign data_file[45]    = 32'h0000_0000;
  assign data_file[46]    = 32'h0000_0000;
  assign data_file[47]    = 32'h0000_0000;
  assign data_file[48]    = 32'h0000_0000;
  assign data_file[49]    = 32'h0000_0000;
  assign data_file[50]    = 32'h0000_0000;
  assign data_file[51]    = 32'h0000_0000;
  assign data_file[52]    = 32'h0000_0000;
  assign data_file[53]    = 32'h0000_0000;
  assign data_file[54]    = 32'h0000_0000;
  assign data_file[55]    = 32'h0000_0000;
  assign data_file[56]    = 32'h0000_0000;
  assign data_file[57]    = 32'h0000_0000;
  assign data_file[58]    = 32'h0000_0000;
  assign data_file[59]    = 32'h0000_0000;
  assign data_file[60]    = 32'h0000_0000;
  assign data_file[61]    = 32'h0000_0000;
  assign data_file[62]    = 32'h0000_0000;
  assign data_file[63]    = 32'h0000_0000;

//---------------------------------------------------------------------------------------------------------------------
// 6  assign logic6
//---------------------------------------------------------------------------------------------------------------------
  assign tx_link12_wr_en =    (tx_l00_afifo_wr_en && lane2link_cfg[(  0*4) +:4] ==4'd12)        // 3:0
                           || (tx_l01_afifo_wr_en && lane2link_cfg[(  1*4) +:4] ==4'd12)        // 7:4
                           || (tx_l02_afifo_wr_en && lane2link_cfg[(  2*4) +:4] ==4'd12)        //11:8
                           || (tx_l03_afifo_wr_en && lane2link_cfg[(  3*4) +:4] ==4'd12)        //15:12
                           || (tx_l04_afifo_wr_en && lane2link_cfg[(  4*4) +:4] ==4'd12)        //19:16
                           || (tx_l05_afifo_wr_en && lane2link_cfg[(  5*4) +:4] ==4'd12)        //23:20
                           || (tx_l06_afifo_wr_en && lane2link_cfg[(  6*4) +:4] ==4'd12)        //27:24
                           || (tx_l07_afifo_wr_en && lane2link_cfg[(  7*4) +:4] ==4'd12)        //31:28
                           || (tx_l08_afifo_wr_en && lane2link_cfg[(  8*4) +:4] ==4'd12)        //35:32
                           || (tx_l09_afifo_wr_en && lane2link_cfg[(  9*4) +:4] ==4'd12)        //39:36
                           || (tx_l10_afifo_wr_en && lane2link_cfg[( 10*4) +:4] ==4'd12)        //43:40
                           || (tx_l11_afifo_wr_en && lane2link_cfg[( 11*4) +:4] ==4'd12)        //47:44
                           || (tx_l12_afifo_wr_en && lane2link_cfg[( 12*4) +:4] ==4'd12)        //51:48
                           || (tx_l13_afifo_wr_en && lane2link_cfg[( 13*4) +:4] ==4'd12)        //55:52
                           || (tx_l14_afifo_wr_en && lane2link_cfg[( 14*4) +:4] ==4'd12)        //59:56
                           || (tx_l15_afifo_wr_en && lane2link_cfg[( 15*4) +:4] ==4'd12);       //63:60

//---------------------------------------------------------------------------------------------------------------------
// 6  always combine logic1
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
// 7  always combine logic2
//---------------------------------------------------------------------------------------------------------------------
  parameter  W = 10;
  parameter  tieoff_value = {W{1'b0}};
  reg  [(W*16)-1:0]  out_data_i;
  always @(*)
    begin
      case (strap_lcnt)
        3'd4:
          begin
            out_data_i[(W*1-1):0]  = in_data[(W*1-1):0];
            out_data_i[(W*2-1):W]  = in_data[(W*1-1):0];
          end
        3'd3:
          begin
            out_data_i[(W*1-1):0]  = in_data[(W*2-1):W];
            out_data_i[(W*2-1):W]  = in_data[(W*1-1):0];
          end
        3'd2:
          begin
            out_data_i[(W*1-1):0]  = in_data[(W*3-1):2*W];
            out_data_i[(W*2-1):W]  = in_data[(W*1-1):0];
          end
        default:
          begin
            out_data_i[(W*1-1):0]  = tieoff_value[W-1:0];
            out_data_i[(W*2-1):W]  = tieoff_value[W*1-1:0];
          end
      endcase
    end

//---------------------------------------------------------------------------------------------------------------------
// 7  always combine logic3
//---------------------------------------------------------------------------------------------------------------------
  always @(*)
    begin
      case (strap_lcnt)
        3'd4:    avail_index = `AXI_WIDTH'd0;
        3'd3:    avail_index = `AXI_WIDTH'd1;
        3'd2:    avail_index = `AXI_WIDTH'd2;
        default: avail_index = `AXI_WIDTH'd3;
      endcase
    end

//---------------------------------------------------------------------------------------------------------------------
// 7  always combine logic4
//---------------------------------------------------------------------------------------------------------------------
  always @(*)
    begin
      case (strap_lcnt)
        4'd4:    avail_index = `AXI_WIDTH'd0;
        4'd3:    avail_index = `AXI_WIDTH'd1;
        4'd2:    avail_index = `AXI_WIDTH'd2;
        4'd5,
        4'd6,
        4'd7,
        4'd8,
        4'd9:    avail_index = `AXI_WIDTH'd10;
        default: avail_index = `AXI_WIDTH'd3;
      endcase
    end

//---------------------------------------------------------------------------------------------------------------------
// 7  always combine logic5
//---------------------------------------------------------------------------------------------------------------------
  always @(*)
    begin
      casex (strap_lcnt)
        `AXI_WIDTH'bxxxxxxxxxxxxxxxxxxxx0:    avail_index = `AXI_WIDTH'd0;
        `AXI_WIDTH'bxxxxxxxxxxxxxxxxxxx01:    avail_index = `AXI_WIDTH'd1;
        `AXI_WIDTH'bxxxxxxxxxxxxxxxxxx011:    avail_index = `AXI_WIDTH'd2;
        `AXI_WIDTH'bxxxxxxxxxxxxxxxxx0111:    avail_index = `AXI_WIDTH'd3;
        `AXI_WIDTH'bxxxxxxxxxxxxxxxx01111:    avail_index = `AXI_WIDTH'd4;
        `AXI_WIDTH'bxxxxxxxxxxxxxxx011111:    avail_index = `AXI_WIDTH'd5;
        `AXI_WIDTH'bxxxxxxxxxxxxxx0111111:    avail_index = `AXI_WIDTH'd6;
        `AXI_WIDTH'bxxxxxxxxxxxxx01111111:    avail_index = `AXI_WIDTH'd7;
        `AXI_WIDTH'bxxxxxxxxxxxx011111111:    avail_index = `AXI_WIDTH'd8;
        `AXI_WIDTH'bxxxxxxxxxxx0111111111:    avail_index = `AXI_WIDTH'd9;
        `AXI_WIDTH'bxxxxxxxxxx01111111111:    avail_index = `AXI_WIDTH'd10;
        `AXI_WIDTH'bxxxxxxxxx011111111111:    avail_index = `AXI_WIDTH'd11;
        `AXI_WIDTH'bxxxxxxxx0111111111111:    avail_index = `AXI_WIDTH'd12;
        `AXI_WIDTH'bxxxxxxx01111111111111:    avail_index = `AXI_WIDTH'd13;
        `AXI_WIDTH'bxxxxxx011111111111111:    avail_index = `AXI_WIDTH'd14;
        `AXI_WIDTH'bxxxxx0111111111111111:    avail_index = `AXI_WIDTH'd15;
        `AXI_WIDTH'bxxxx01111111111111111:    avail_index = `AXI_WIDTH'd16;
        `AXI_WIDTH'bxxx011111111111111111:    avail_index = `AXI_WIDTH'd17;
        default:                              avail_index = `AXI_WIDTH'd0;
      endcase
    end

//---------------------------------------------------------------------------------------------------------------------
// 7  always combine logic6
//---------------------------------------------------------------------------------------------------------------------
  parameter  KMAX_NUM_TLPS_PER_CLK = 8;
  integer i0,i1,i2,i3;
  reg [31:0] received_crc[0:KMAX_NUM_TLPS_PER_CLK-1];
  always @(*)
    begin
      for (i0=0; i0<KMAX_NUM_TLPS_PER_CLK; i0=i0+1)
        received_crc[i0] = {32{1'd0}};

      for (i1=0; i1<KMAX_NUM_TLPS_PER_CLK; i1=i1+1)
        begin
          for (i2=0; i2<32; i2=i2+1)
            if (in_end_ptr[i1] == i2)
              begin
                for (i3=0; i3<32; i3=i3+1)
                  received_crc[i1][i3] = in_data_reg2[i2*32 + i3];
              end
        end
    end

//---------------------------------------------------------------------------------------------------------------------
// 7  always sequence logic1
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
// 7  always sequence logic2
//---------------------------------------------------------------------------------------------------------------------
  reg   signal_d1;
  reg   signal_d2;
  reg   signal_d3;
  always @(posedge clk or negedge rstn)
    begin
      if (~rstn)
        begin
          signal_d1 <= 1'b0;
          signal_d2 <= 1'b0;
          signal_d3 <= 1'b0;
        end
      else
        begin
          signal_d1 <= signal_in;
          signal_d2 <= signal_d1;
          signal_d3 <= signal_d2;
        end
    end
  assign  signal_rise = !signal_d3 &  signal_d2 ;
  assign  signal_fall =  signal_d3 & !signal_d2 ;
  assign  signal_edge =  signal_d3 ^  signal_d2 ;

//---------------------------------------------------------------------------------------------------------------------
// 7  always sequence logic3
//---------------------------------------------------------------------------------------------------------------------
  always @(posedge clk or negedge rstn)
    begin
      if (~rstn)
          signal_d1 <= 1'b0;
      else
          signal_d1 <= signal_in;
    end

  assign  signal_rise = !signal_d1 &  signal_in ;
  assign  signal_fall =  signal_d1 & !signal_in ;
  assign  signal_edge =  signal_d1 ^  signal_in ;

//---------------------------------------------------------------------------------------------------------------------
// 8  generate logic1
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

//---------------------------------------------------------------------------------------------------------------------
// 9  generate logic2
//---------------------------------------------------------------------------------------------------------------------
  genvar  n;
  generate
    for (n=0; n < p_num_par ; n=n+1)
      begin
        assign parity_even[n] = (^data_padded[n*8+7:n*8]);
      end
  endgenerate

//---------------------------------------------------------------------------------------------------------------------
// 9  generate logic3
//---------------------------------------------------------------------------------------------------------------------
module gray_to_binary #(
  parameter   PTR  = 6                       // parameter define
)(
  input  wire [PTR:0]            gray_value   , // pclk
  output wire [PTR:0]            binary_value , // apb4 read data
);

  assign binary_value[PTR] = gray_value[PTR];

  generate
    genvar i;
    for (i=0; i<PTR; i=i+1)
      begin
        assign  binary_value[i] = binary_value[i+1] ^ gray_value[i];
      end
  endgenerate

endmodule


//---------------------------------------------------------------------------------------------------------------------
// 9  generate logic4
//---------------------------------------------------------------------------------------------------------------------
  generate
    genvar i;
    for (i=0; i<PTR; i=i+1)
      begin: switch_port_inst
        switch_port u_switch_port (
          .a ( in1[i]  ) , 
          .b ( in2[i]  ) , 
          .c ( out1[i] ) , 
          .d ( out2[i] )   
        );
      end
  endgenerate

//---------------------------------------------------------------------------------------------------------------------
// 10 ifdef condition
//---------------------------------------------------------------------------------------------------------------------
`ifdef DBCXL__FPGA_MODE
  localparam FC_IDLE = 4'b0000;
`else
  localparam FC_IDLE = 4'b0001;
`endif

//---------------------------------------------------------------------------------------------------------------------
// 11 ifndef condition
//---------------------------------------------------------------------------------------------------------------------
`ifndef DBCXL__FPGA_MODE
  localparam FC_IDLE = 4'b0000;
`else
  localparam FC_IDLE = 4'b0001;
`endif

//---------------------------------------------------------------------------------------------------------------------
// 12 module example1
//---------------------------------------------------------------------------------------------------------------------
  dbCXL__hls_flr_status_ctrl #(/*autoinstparam*/
    .KMAX_NUM_PFS ( 12 ) ,
    .KMAX_NUM_VFS ( 13 ) ,
    .KMUX_NUM_ALL ( 14 ) 
  )
  flr_status_ctrl (/*autoinst*/
    .pclk                 ( PCLK            ) , 
    .presetn              ( PRESETn         ) , 

    // Register interface
    .addr                 ( reg_addr        ) , 
    .read_en              ( reg_read_en     ) , 
    .write_en             ( reg_write_en    ) , 
    .byte_strobe          ( reg_byte_strobe ) , 
    .wdata                ( reg_wdata       ) , 
    .ecorevnum            ( ECOREVNUM       ) , 
    .rdata                ( reg_rdata       )
  );

//---------------------------------------------------------------------------------------------------------------------
// 12 module example2
//---------------------------------------------------------------------------------------------------------------------
  pipe_fifo  #(/*autoinstparam*/
    .WIDTH ( 1 + 256 + 32 )  // direct look each wire width for fifo
  )
  u_pipe_fifo (/*autoinst*/
    .clk     ( clk     ) ,
    .rst_n   ( rst_n   ) ,
    .rx_vld  ( rx_vld  ) ,
    .rx_data ({axi_wlast, axi_wdata, axi_wstrb}) ,
    .full    ( full    ) ,
    .tx_data ({axi_wlast_s0, axi_wdata_s0, axi_wstrb_s0}) ,
    .empty   ( empty   ) ,
    .tx_vld  ( tx_vld  )
  );

