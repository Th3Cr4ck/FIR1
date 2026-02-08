module FIR1 (
input	clk, 
input	rst_n,
input	i_x,
output	[2:0] o_y
);

wire [1:0] m0;
wire [1:0] m1;
wire [1:0] r1;

shift_reg shift_reg1 (
	.clk(clk),
	.rst_n(rst_n),
	.i_x(i_x),
	.o_z(r1)
);

mult mult1 (
	.i_x(r1[1]),
	.i_y(1),
	.o_z(m1)
);

mult mult0 (
	.i_x(i_x),
	.i_y(1),
	.o_z(m0)
);

adder adder1 (
	.i_x(m0),
	.i_y(m1),
	.o_z(o_y)
);

endmodule
