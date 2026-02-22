`timescale 1ns/1ps

module tb_fir1;

reg clk, rst_n;
reg	 [7:0] i_x;
wire [7:0] o_y;
wire [39:0] mem_flat_out;
wire [7:0] mem_out [0:4];

// DUT
FIR1 dut (
    .clk   (clk),
    .rst_n (rst_n),
    .i_x   (i_x),
    .o_y   (o_y),
	.mem_flat_out(mem_flat_out)
);

assign mem_out[0] = mem_flat_out[7:0];
assign mem_out[1] = mem_flat_out[15:8];
assign mem_out[2] = mem_flat_out[23:16];
assign mem_out[3] = mem_flat_out[31:24];
assign mem_out[4] = mem_flat_out[39:32];


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
    i_x = 1;  
    #10 i_x = -6; 
    #10 i_x = 10;  
    #10 i_x = 2; 
    #10 i_x = -4;  
	
	#10
    $stop;
end

endmodule
