module accumulator (
  input clk,
  input rst_n,
  input [7:0] in_data,
  output [7:0] out_data
);

  reg [7:0] acc;

  always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
      acc <= 0;
    else
      acc <= acc + in_data;
  end

  assign out_data = acc;

endmodule
