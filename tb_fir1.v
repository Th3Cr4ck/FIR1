`timescale 1ns/1ps

module tb_fir1;

reg clk;
reg rst_n;
reg i_x;
wire [2:0] o_y;

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

    // estímulos
    // x[n] = 1, 0, 1, 1, 0
    #10 i_x = 1;  // n=0
    #10 i_x = 0;  // n=1
    #10 i_x = 1;  // n=2
    #10 i_x = 1;  // n=3
    #10 i_x = 0;  // n=4

    #30;
    $stop;
end

endmodule
