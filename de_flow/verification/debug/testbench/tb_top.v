module tb_top ;


//--------------------------------------------------------------------------------
//  reg define
//--------------------------------------------------------------------------------
reg [5:0]		DBGCMD          ;
reg			    SWV             ;
reg				TRACECLK        ;
reg [3:0]		TRACEDATA       ;
reg [3:0] 		reset_sync_reg  ;

//--------------------------------------------------------------------------------
//  wire define
//--------------------------------------------------------------------------------

wire        XTAL1;   // crystal pin 1
wire        XTAL2;   // crystal pin 2
wire        NRST;    // active low reset

wire [15:0] P0;      // Port 0
wire [15:0] P1;      // Port 1
wire [3 :0] nxt_reset_sync;
//Debug tester signals
wire        nTRST;
wire        TDI;
wire        SWDIOTMS;
wire        SWCLKTCK;
wire        TDO;
wire		reset_n;
wire        PCLK;          // Clock for UART capture device
wire [5:0]  debug_command; // used to drive debug tester
wire        debug_running; // indicate debug test is running
wire        debug_err;     // indicate debug test has error

wire        debug_test_en; // To enable the debug tester connection to MCU GPIO P0
                             // This signal is controlled by software,
                             // Use "UartPutc((char) 0x1B)" to send ESCAPE code to start
                             // the command, use "UartPutc((char) 0x11)" to send debug test
                             // enable command, use "UartPutc((char) 0x12)" to send debug test
                             // disable command. Refer to tb_uart_capture.v file for detail

//--------------------------------------------------------------------------------
//  parameter define
//--------------------------------------------------------------------------------
parameter BE              = 0;   // Big or little endian
parameter BKPT            = 4;   // Number of breakpoint comparators
parameter DBG             = 1;   // Debug configuration
parameter NUMIRQ          = 32;  // NUM of IRQ
parameter SMUL            = 0;   // Multiplier configuration
parameter SYST            = 1;   // SysTick
parameter WIC             = 1;   // Wake-up interrupt controller support
parameter WICLINES        = 34;  // Supported WIC lines
parameter WPT             = 2;   // Number of DWT comparators

//--------------------------------------------------------------------------------
//  reset generation
//--------------------------------------------------------------------------------
assign nxt_reset_sync = {reset_sync_reg[2:0], 1'b1};

always @(posedge XTAL1 or negedge NRST)
begin
if (~NRST)
  reset_sync_reg <= 4'b000;
else
  reset_sync_reg <= nxt_reset_sync;
end

assign reset_n = reset_sync_reg[3];

//--------------------------------------------------------------------------------
//  generate fsdb wave file
//--------------------------------------------------------------------------------
initial begin
	$fsdbDumpfile("test.fsdb" ) ;
	$fsdbDumpvars(0,tb_top    ) ;
	$fsdbDumpMDA (0,tb_top    ) ;
end

// --------------------------------------------------------------------------------
// Source for clock and reset
// --------------------------------------------------------------------------------
cmsdk_clkreset u_cmsdk_clkreset(
.CLK  (XTAL1),
.NRST (NRST)
);

cmsdk_debug_tester 
#(/*autoinstparam*/
//		     // Parameters
//		     .CLKGATE_PRESENT	(CLKGATE_PRESENT),	 // Templated
//		     .BE				(BE),			 	 // Templated
//		     .ROM_MEMFILE		(ROM_MEMFILE),		 // Templated
//		     .ROM_ADDRWIDTH		(ROM_ADDRWIDTH),	 // Templated
//		     .ROM_MEMBASE		(ROM_MEMBASE),		 // Templated
//		     .ROM_MEMTOP		(ROM_MEMTOP),		 // Templated
//		     .RAM_ADDRWIDTH		(RAM_ADDRWIDTH),	 // Templated
//		     .RAM_MEMBASE		(RAM_MEMBASE),		 // Templated
//		     .RAM_MEMTOP		(RAM_MEMTOP),        // Templated
		     .ROM_MEMFILE		("../hex/image.hex") // Templated
)

u_cmsdk_debug_tester(
/*autoinst*/
		     // Outputs
		     .DBGRUNNING		(DBGRUNNING),	 	 // Templated
		     .DBGERROR			(DBGERROR),		 	 // Templated
		     .nTRST				(nTRST),		 	 // Templated
		     .SWCLKTCK			(SWCLKTCK),		 	 // Templated
		     .TDI				(TDI),			 	 // Templated
		     // Inouts
		     .SWDIOTMS			(SWDIOTMS),		 	 // Templated
		     // Inputs
		     .CLK				(XTAL1),			 // Templated
		     .PORESETn			(reset_n),		 	 // Templated
		     .DBGCMD			(DBGCMD[5:0]),		 // Templated
		     .TRACECLK			(TRACECLK),		     // Templated
		     .TRACEDATA			(TRACEDATA[3:0]),	 // Templated
		     .SWV				(SWV),			     // Templated
		     .TDO				(TDO));			     // Templated


cmsdk_mcu
 #(.BE               (BE),
   .BKPT             (BKPT),          // Number of breakpoint comparators
   .DBG              (DBG),           // Debug configuration
   .NUMIRQ           (NUMIRQ),        // NUMIRQ
   .SMUL             (SMUL),          // Multiplier configuration
   .SYST             (SYST),          // SysTick
   .WIC              (WIC),           // Wake-up interrupt controller support
   .WICLINES         (WICLINES),      // Supported WIC lines
   .WPT              (WPT)            // Number of DWT comparators
 )
 u_cmsdk_mcu (
	.XTAL1      (XTAL1),  // input
	.XTAL2      (XTAL2),  // output
	.NRST       (NRST),   // active low reset
	.P0         (P0),
	.P1         (P1),
	.nTRST      (nTRST),  // Not needed if serial-wire debug is used
	.TDI        (TDI),    // Not needed if serial-wire debug is used
	.TDO        (TDO),    // Not needed if serial-wire debug is used
	.SWDIOTMS   (SWDIOTMS),
	.SWCLKTCK   (SWCLKTCK)
);

//--------------------------------------------------------------------------------
//  generate fsdb wave file
//--------------------------------------------------------------------------------
initial begin
	STATE_INIT;
	#117990;
	DBGCMD = 6'b100000;
	#1000;
	DBGCMD = 6'b000000;
	#1000;
	DBGCMD = 6'b100001;
	#1000;
	DBGCMD = 6'b000000;
	#100000;
	$finish;
end

//--------------------------------------------------------------------------------
//  state_init task
//--------------------------------------------------------------------------------
task STATE_INIT;
	begin
		DBGCMD = 0 ;
		SWV = 0 ;
		TRACECLK = 0 ;
		TRACEDATA = 0 ;
	end
endtask

endmodule

