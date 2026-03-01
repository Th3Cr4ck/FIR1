module FIR1 (
    input clk,
    input rst_n,
    input [7:0] i_x,
    output [7:0] o_y
);

  wire [7:0] coeff[0:2];
  assign coeff[0] = 8'd1;
  assign coeff[1] = 8'd1;
  assign coeff[2] = 8'd1;

  wire [7:0] x_delay[0:2];
  wire [7:0] mult_out[0:2];
  wire [7:0] sum[0:2];
  wire [7:0] prev_sum[0:2];

  reg [7:0] i_x_sec;

  always @(posedge clk or negedge rst_n)
    if (!rst_n) i_x_sec <= 0;
    else i_x_sec <= i_x;

  // Primer valor
  assign x_delay[0] = i_x_sec;

  genvar i;
  generate
    for (i = 0; i < 3; i = i + 1) begin : g_fir_tap

      if (i > 0) begin
        zreg z0 (
            .clk(clk),
            .rst_n(rst_n),
            .x(x_delay[i-1]),
            .y(x_delay[i])
        );
      end

      mult m0 (
          .i_x(x_delay[i]),
          .i_y(coeff[i]),
          .o_z(mult_out[i])
      );

      assign prev_sum[i] = i > 0 ? sum[i-1] : 0;

      adder a0 (
          .i_x(mult_out[i]),
          .i_y(prev_sum[i]),
          .o_z(sum[i])
      );

    end
  endgenerate

  assign o_y = sum[2];


endmodule
