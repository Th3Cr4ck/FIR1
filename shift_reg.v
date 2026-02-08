module shift_reg (
input clk,
input rst_n,
input i_x,
output reg [1:0] o_z
);

integer i;

always @(posedge clk or negedge rst_n) begin
	if (!rst_n) 
		o_z <= 2'b0;
	else begin
		o_z[0] <= i_x;
		for (i=1; i<2; i=i+1) begin
			o_z[i] <= o_z[i-1];
		end
	end
end

endmodule
