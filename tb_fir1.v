`timescale 1ns/1ps

module tb_fir1;

reg clk, rst_n;
reg	 [7:0] i_x;
wire [7:0] o_y;

// DUT
FIR1 dut (
    .clk   (clk),
    .rst_n (rst_n),
    .i_x   (i_x),
    .o_y   (o_y)
);

// CLOCK: 10 ns period
always #5 clk = ~clk;

initial begin
    // init
    clk  = 0;
    rst_n = 0;
    i_x  = 0;

    // reset
    #12;
    rst_n = 1;

    // estimulos
    // x[n]
    #10 i_x = 1;  
    #10 i_x = -6; 
    #10 i_x = 10;  
    #10 i_x = 2; 
    #10 i_x = -4;  
	
	#10
    $stop;
end

endmodule
