module mem (
input			clk, rst_n,
input	[7:0]	x,
output 	[39:0]	mem_out 
);

reg [7:0] mem [0:4];
reg [2:0] addr;

assign mem_out[7:0]		= mem[0];
assign mem_out[15:8]	= mem[1];
assign mem_out[23:16]	= mem[2];
assign mem_out[31:24]	= mem[3];
assign mem_out[39:32]	= mem[4];


always @(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		addr <= 0;
	end else begin
		mem[addr] <= x;	
		addr <= addr + 1;
	end
end

endmodule
