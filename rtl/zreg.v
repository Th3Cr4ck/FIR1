module zreg (
input		      clk, rst_n,
input		[7:0] x,
output reg	[7:0] y
);

always @(posedge clk or negedge rst_n)
	if (!rst_n) 
		y <= 0;
	else 
		y <= x;

endmodule
