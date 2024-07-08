//--------------------------------------------------------------------------------
// testname.v
//--------------------------------------------------------------------------------

module testname_tb ;


//--------------------------------------------------------------------------------
//  parameter define
//--------------------------------------------------------------------------------
parameter       	DWIDTH	 =	  32 ;
parameter       	AWIDTH	 =  	10 ;

//--------------------------------------------------------------------------------
//  reg & wire define
//--------------------------------------------------------------------------------
/*autoinput*/

/*autooutput*/

/*autoinout*/

//--------------------------------------------------------------------------------
//  generate fsdb wave file
//--------------------------------------------------------------------------------
initial begin
	$fsdbDumpfile("test.fsdb" ) ;
	$fsdbDumpvars(0,testname_tb  ) ;
	$fsdbDumpMDA (0,testname_tb  ) ;
end

//--------------------------------------------------------------------------------
//  generate fsdb wave file
//--------------------------------------------------------------------------------
testname  #(
/*autoinstparam_value*/)
u_testname(
/*autoinst*/
);

//--------------------------------------------------------------------------------
//  clock define
//--------------------------------------------------------------------------------
always #1 clk1_define = ~clk1_define ;
always #2 clk2_define = ~clk2_define ;
always #5 clk3_define = ~clk3_define ;

//--------------------------------------------------------------------------------
//  initial function
//--------------------------------------------------------------------------------
initial
begin
	STATE_INIT;
	#10000;
	$finish;
end

//--------------------------------------------------------------------------------
//  apb write & read
//--------------------------------------------------------------------------------
/*
APB_TRANS(32'h0000_0000,32'h0000_0000,1'b1);
task APB_TRANS;
	input	[AWIDTH-1:0]	paddr_in  ;
	input	[DWIDTH-1:0]	pwdata_in ;
	input			pwrite_in ;
	
	begin
		@(posedge clk);
		paddr   = paddr_in   ;
		pwdata  = pwdata_in  ;
		pwrite  = pwrite_in  ;
		psel    = 1'b1       ;
		@(posedge clk);
		penable = 1'b1       ;
		@(posedge clk);
		psel    = 1'b0       ;
		penable = 1'b0       ;
	end
endtask
*/
//--------------------------------------------------------------------------------
//  state_init task
//--------------------------------------------------------------------------------
task STATE_INIT;
	begin
input_define
		repeat (2) @(posedge clk1_define);  rst1_define = 1;
		repeat (2) @(posedge clk2_define);  rst2_define = 1;
		repeat (2) @(posedge clk3_define);  rst3_define = 1;
	end
endtask

endmodule

// Local Variables:
// verilog-library-directories:("filepth")
// verilog-auto-inst-param-value:t
// verilog-auto-output-ignore-regexp:"^.*_ncxxxx.*\\|^.*pstxxxxx.*"
// verilog-auto-input-ignore-regexp:"^.*ncxxxxx.*\\|^.*pstxxxx.*"
// End:

