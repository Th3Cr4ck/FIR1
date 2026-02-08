module adder (
input [1:0] i_x,
input [1:0] i_y,
output [2:0] o_z
);

assign o_z = i_x + i_y;

endmodule
