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
  always #0.5  clk_host_1p0g      =    ~clk_host_1p0g ;

//---------------------------------------------------------------------------------------------------------------------
// 3   monitor & time
//---------------------------------------------------------------------------------------------------------------------
  initial
    begin
      $timeformat(-9,3," ns",10);
      $monitor("%-t: ep_ltssm = %h | rp_ltssm = %h | speed = %3b | width = %3b",$time,ep_ltssm_state,rp_ltssm_state,ep_common[49:47],ep_common[46:44]);
    end


