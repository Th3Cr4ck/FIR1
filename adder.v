module adder (
input  [7:0] i_x,
input  [7:0] i_y,
output [7:0] o_z
);

assign o_z = i_x + i_y;

endmodule
