//======================================================================
// Copyright(c) 2024, Fighting for freedom & Always going on
//                         All Right Reserved
//
// Created by     : haoran.li
// Filename       : qinfen_apb3_slave_reg.v
// Created On     : 2024-05-27
// Last Modified  : 2024-05-27
//
// Description: 
//
// Version        Modified by        Date           Description
// 1              haoran.li          2024-05-27     original
//
//======================================================================

module qinfen_apb3_slave_reg  #(
    parameter ADDRWIDTH = 12
) ( // IO declaration
    input  wire                   pclk,       // clock
    input  wire                   presetn,    // reset

    // Register interface
    input  wire [ADDRWIDTH-1:0]   addr,
    input  wire                   read_en,
    input  wire                   write_en,
    input  wire [31:0]            wdata,
    input  wire [3:0]             ecorevnum,
    output reg  [31:0]            rdata
);

//--------------------------------------------------------------------------------------------
//  localparam define
//--------------------------------------------------------------------------------------------
    localparam  ARM_CMSDK_APB3_EG_SLAVE_PID4 = 32'h00000004; // 0xFD0 : PID 4
    localparam  ARM_CMSDK_APB3_EG_SLAVE_PID5 = 32'h00000000; // 0xFD4 : PID 5
    localparam  ARM_CMSDK_APB3_EG_SLAVE_PID6 = 32'h00000000; // 0xFD8 : PID 6
    localparam  ARM_CMSDK_APB3_EG_SLAVE_PID7 = 32'h00000000; // 0xFDC : PID 7
    localparam  ARM_CMSDK_APB3_EG_SLAVE_PID0 = 32'h00000018; // 0xFE0 : PID 0 APB3 Example slave part number[7:0]
    localparam  ARM_CMSDK_APB3_EG_SLAVE_PID1 = 32'h000000B8; // 0xFE4 : PID 1 [7:4] jep106_id_3_0. [3:0] part number [11:8]
    localparam  ARM_CMSDK_APB3_EG_SLAVE_PID2 = 32'h0000001B; // 0xFE8 : PID 2 [7:4] revision, [3] jedec_used. [2:0] jep106_id_6_4
    localparam  ARM_CMSDK_APB3_EG_SLAVE_PID3 = 32'h00000000; // 0xFEC : PID 3
    localparam  ARM_CMSDK_APB3_EG_SLAVE_CID0 = 32'h0000000D; // 0xFF0 : CID 0
    localparam  ARM_CMSDK_APB3_EG_SLAVE_CID1 = 32'h000000F0; // 0xFF4 : CID 1 PrimeCell class
    localparam  ARM_CMSDK_APB3_EG_SLAVE_CID2 = 32'h00000005; // 0xFF8 : CID 2
    localparam  ARM_CMSDK_APB3_EG_SLAVE_CID3 = 32'h000000B1; // 0xFFC : CID 3

//--------------------------------------------------------------------------------------------
//  wire define
//--------------------------------------------------------------------------------------------
    wire   [3:0]             wr_sel;

//--------------------------------------------------------------------------------------------
//  reg define
//--------------------------------------------------------------------------------------------
    reg    [31:0]            data0;
    reg    [31:0]            data1;
    reg    [31:0]            data2;
    reg    [31:0]            data3;

//--------------------------------------------------------------------------------------------
//  write operation
//--------------------------------------------------------------------------------------------
    assign wr_sel[0] = ((addr[(ADDRWIDTH-1):2]==10'b0000000000)&(write_en)) ? 1'b1: 1'b0;
    assign wr_sel[1] = ((addr[(ADDRWIDTH-1):2]==10'b0000000001)&(write_en)) ? 1'b1: 1'b0;
    assign wr_sel[2] = ((addr[(ADDRWIDTH-1):2]==10'b0000000010)&(write_en)) ? 1'b1: 1'b0;
    assign wr_sel[3] = ((addr[(ADDRWIDTH-1):2]==10'b0000000011)&(write_en)) ? 1'b1: 1'b0;

    //Data register: data0
    always @(posedge pclk or negedge presetn)
      begin
      if (~presetn)
        begin
          data0 <= {32{1'b0}}; // Reset data 0 to 0x00000000
        end
      else if (wr_sel[0])
        begin
          data0[31:0] <= wdata[31:0];
        end
      end


    //Data register: data1
    always @(posedge pclk or negedge presetn)
      begin
      if (~presetn)
        begin
          data1 <= {32{1'b0}}; // Reset data 1 to 0x00000000
        end
      else if (wr_sel[1])
        begin
          data1[31:0] <= wdata[31:0];
        end
      end


    //Data register: data2
    always @(posedge pclk or negedge presetn)
      begin
      if (~presetn)
        begin
          data2 <= {32{1'b0}}; // Reset data 2 to 0x00000000
        end
      else if (wr_sel[2])
        begin
          data2[31:0] <= wdata[31:0];
        end
      end


    //Data register: data3
    always @(posedge pclk or negedge presetn)
      begin
      if (~presetn)
        begin
          data3 <= {32{1'b0}}; // Reset data 3 to 0x00000000
        end
      else if (wr_sel[3])
        begin
          data3[31:0] <= wdata[31:0];
        end
      end



//--------------------------------------------------------------------------------------------
//  read operation
//--------------------------------------------------------------------------------------------
    always @ (*)
      begin
        case (read_en)
          1'b1:
            begin
              if (addr[11:4] == 8'h00)
                begin
                  case(addr[3:2])
                    2'b00  : rdata =  data0;
                    2'b01  : rdata =  data1;
                    2'b10  : rdata =  data2;
                    2'b11  : rdata =  data3;
                    default: rdata = {32{1'b0}};
                  endcase
                end
              else if (addr[11:6] == 6'h3F)
                begin
                  case(addr[5:2])
                    4'b0100: rdata = ARM_CMSDK_APB3_EG_SLAVE_PID4; // 0xFD0 : PID 4
                    4'b0101: rdata = ARM_CMSDK_APB3_EG_SLAVE_PID5; // 0xFD4 : PID 5
                    4'b0110: rdata = ARM_CMSDK_APB3_EG_SLAVE_PID6; // 0xFD8 : PID 6
                    4'b0111: rdata = ARM_CMSDK_APB3_EG_SLAVE_PID7; // 0xFDC : PID 7
                    4'b1000: rdata = ARM_CMSDK_APB3_EG_SLAVE_PID0; // 0xFE0 : PID 0 APB Example slave part number[7:0]
                    4'b1001: rdata = ARM_CMSDK_APB3_EG_SLAVE_PID1; // 0xFE4 : PID 1 [7:4] jep106_id_3_0. [3:0] part number [11:8]
                    4'b1010: rdata = ARM_CMSDK_APB3_EG_SLAVE_PID2; // 0xFE8 : PID 2 [7:4] revision, [3] jedec_used. [2:0] jep106_id_6_4
                    4'b1011: rdata ={ARM_CMSDK_APB3_EG_SLAVE_PID3[31:8], ecorevnum[3:0], 4'h0};
                                                    // 0xFEC : PID 3 [7:4] ECO rev number, [3:0]  modification number
                    4'b1100: rdata = ARM_CMSDK_APB3_EG_SLAVE_CID0; // 0xFF0 : CID 0
                    4'b1101: rdata = ARM_CMSDK_APB3_EG_SLAVE_CID1; // 0xFF4 : CID 1 PrimeCell class
                    4'b1110: rdata = ARM_CMSDK_APB3_EG_SLAVE_CID2; // 0xFF8 : CID 2
                    4'b1111: rdata = ARM_CMSDK_APB3_EG_SLAVE_CID3; // 0xFFC : CID 3
                    4'b0000, 4'b0001,4'b0010,4'b0011:
                             rdata = {32'h00000000}; // NEW_RTL_STYLE
                    default: rdata =  {32{1'b0}};  // x propogation
                  endcase
                end
              else 
                begin
                  rdata = {32'h00000000}; // default
                end
            end
          default:
            begin
              rdata =  {32{1'b0}};
            end
        endcase
      end


endmodule

// Local Variables:
// verilog-library-directories:("filepath")
// verilog-auto-inst-param-value:t
// verilog-auto-output-ignore-regexp:"^.*_nc.*\\|^.*pst.*"
// verilog-auto-input-ignore-regexp:"^.*nc.*\\|^.*pst.*"
// End:

