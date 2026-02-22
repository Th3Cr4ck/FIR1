module FIR1 (
input	clk, 
input	rst_n,
input	[7:0] i_x,
output	[7:0] o_y,
output	[39:0] mem_flat_out
);

wire [7:0] b0 = 1;
wire [7:0] b1 = 1;
wire [7:0] b2 = 1;

wire [7:0] m0, m1, m2;
wire [7:0] z1, z2;
wire [7:0] add1;

reg write_result_enable;

mult mult0 (
	.i_x(i_x),
	.i_y(b0),
	.o_z(m0)
);

zreg zreg1 (
	.clk(clk),
	.rst_n(rst_n),
	.x(i_x),
	.y(z1)
);

mult mult1 (
	.i_x(z1),
	.i_y(b1),
	.o_z(m1)
);

adder adder1 (
	.i_x(m0),
	.i_y(m1),
	.o_z(add1)
);


zreg zreg2 (
	.clk(clk),
	.rst_n(rst_n),
	.x(z1),
	.y(z2)
);

mult mult2 (
	.i_x(z2),
	.i_y(b2),
	.o_z(m2)
);

adder adder2 (
	.i_x(m2),
	.i_y(add1),
	.o_z(o_y)
);

mem result_mem (
	.clk(clk),
	.rst_n(rst_n),
	.x(o_y),
	.mem_out(mem_flat_out)
);

// Logica enable 
// Esperar la latencia para guardar los resultados en la memoria
// reg [1:0] cnt;
// always @(posedge clk or negedge rst_n) begin
// 	if (!rst_n) begin
// 		cnt <= 0;
// 		write_result_enable <= 0;
// 	end else begin
// 		cnt <= cnt + 1;
// 		if (cnt == 2)
// 			write_result_enable <= 1;
// 	end
// end

endmodule
