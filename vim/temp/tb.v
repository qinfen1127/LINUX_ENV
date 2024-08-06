//==========================================================================================================================
//  @File Name  :  tb.v
//  @File Type  :  verilog
//  @Author     :  Howard
//  @E-mail     :  qinfen1127@163.com
//  @Date       :  2024-07-03
//  @Function   :  
//==========================================================================================================================

//---------------------------------------------------------------------------------------------------------------------
// 1   testbench file header
//---------------------------------------------------------------------------------------------------------------------
  `timescale 1ns/1ps

  module tb ;

  endmodule

//---------------------------------------------------------------------------------------------------------------------
// 2   clock generate
//---------------------------------------------------------------------------------------------------------------------
  reg   clk_host_1p0g;
  always #0.5  clk_host_1p0g      =    ~clk_host_1p0g ;

//---------------------------------------------------------------------------------------------------------------------
// 3   monitor & time
//---------------------------------------------------------------------------------------------------------------------
  initial
    begin
      $timeformat(-9,3," ns",10);
      $monitor("%-t: ep_ltssm = %h | rp_ltssm = %h | speed = %3b | width = %3b",$time,ep_ltssm_state,rp_ltssm_state,ep_common[49:47],ep_common[46:44]);
    end

//---------------------------------------------------------------------------------------------------------------------
// 3   task define
//---------------------------------------------------------------------------------------------------------------------
  task STATE_INIT;
    begin
      misc_resetn = 0;
      ep_uc_rst_n = 0;
      rp_uc_rst_n = 0;
      #1;
      misc_resetn = 1;
      ep_uc_rst_n = 1;
      rp_uc_rst_n = 1;

      fork
        begin
          EP_APB_TRANS(18'h3_0068, 32'h1000_0000,1'b1);
          @(posedge ep_phy_uc_init_complete);
          repeat (20) @(posedge ep_clk);
          ep_phy_reset_n = 1;
          ep_phy_p00_reset_n = 1;
        end

        begin
          RP_APB_TRANS(18'h3_0068, 32'h1000_0000,1'b1);
          @(posedge rp_phy_uc_init_complete);
          repeat (20) @(posedge rp_clk);
          rp_phy_reset_n = 1;
          rp_phy_p00_reset_n = 1;
        end
      join
    end
  endtask

//---------------------------------------------------------------------------------------------------------------------
// 4   force
//---------------------------------------------------------------------------------------------------------------------
  initial
    begin
      force HOSTC_PCIE_TOP_tb.EP.u_pciecore.xcvr_avdd_h_ln_0 = 1;
      force HOSTC_PCIE_TOP_tb.RP.U_HOSTC_PCIE_TOP_XDX_CRG.uc_clk = clk_uc;
      #200000;
      $finish;
    end

//---------------------------------------------------------------------------------------------------------------------
// 5   connect
//---------------------------------------------------------------------------------------------------------------------
  always @(*)  ep_clk = HOSTC_PCIE_TOP_tb.EP.U_HOSTC_PCIE_TOP_XDX_CRG.clk_link0_core_apb_NOCC;
  always @(*)  rp_clk = HOSTC_PCIE_TOP_tb.RP.U_HOSTC_PCIE_TOP_XDX_CRG.clk_link0_core_apb_NOCC;

//---------------------------------------------------------------------------------------------------------------------
// 6   inout port
//---------------------------------------------------------------------------------------------------------------------
  reg  BP_HOST_CMN_REFCLK_P_reg, BP_HOST_CMN_REFCLK_M_reg;
  wire BP_HOST_CMN_REFCLK_P,     BP_HOST_CMN_REFCLK_M;
  always #0.5  BP_HOST_CMN_REFCLK_P_reg = ~BP_HOST_CMN_REFCLK_P_reg ;
  always #0.5  BP_HOST_CMN_REFCLK_M_reg = ~BP_HOST_CMN_REFCLK_M_reg ;
  
  assign       BP_HOST_CMN_REFCLK_P     = BP_HOST_CMN_REFCLK_P_reg  ;
  assign       BP_HOST_CMN_REFCLK_M     = BP_HOST_CMN_REFCLK_M_reg  ;

//---------------------------------------------------------------------------------------------------------------------
// 7   apb write & read
//---------------------------------------------------------------------------------------------------------------------
  task EP_APB_TRANS;
    input  [AWIDTH-1:0]        ep_paddr_in  ;
    input  [DWIDTH-1:0]        ep_pwdata_in ;
    input                      ep_pwrite_in ;

    begin
      @(posedge ep_clk);
      ep_phy_apb_paddr   <= ep_paddr_in  ;
      ep_phy_apb_pwdata  <= ep_pwdata_in ;
      ep_phy_apb_pwrite  <= ep_pwrite_in ;
      ep_phy_apb_psel    <= 1'b1         ;
      @(posedge ep_clk);
      ep_phy_apb_penable <= 1'b1         ;
      while(1)
        begin
          @(posedge ep_clk);
          if (ep_phy_apb_pready==1)
            begin
              if (ep_pwrite_in==1)
                $display("%-t: ep phy apb write address:%h , data: %h",$time,ep_paddr_in,ep_pwdata_in);
              else
                $display("%-t: ep phy apb read  address:%h,  data: %h",$time,ep_paddr_in,ep_phy_apb_prdata);
              ep_phy_apb_psel    <= 1'b0;
              ep_phy_apb_penable <= 1'b0;
              ep_phy_apb_paddr   <= 1'b0;
              ep_phy_apb_pwdata  <= 1'b0;
              ep_phy_apb_pwrite  <= 1'b0;
              break;
            end
        end
    end
  endtask
