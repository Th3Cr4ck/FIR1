module fir #(
    parameter QI   = 1,
    parameter QF   = 14,
    parameter TAPS = 4
) (
    input clk,
    input rst_n,
    input signed [(QI+QF-1):0] coeffs[TAPS-1:0],
    input signed [(QI+QF-1):0] x_in,
    output reg signed [(QI+QF-1):0] y_out
);

  localparam DATA_WIDTH = QI + QF;
  localparam PROD_WIDTH = DATA_WIDTH * 2;

  // Bits extra para acumulación
  localparam ACC_EXTRA = $clog2(TAPS);
  localparam ACC_WIDTH = PROD_WIDTH + ACC_EXTRA;  // Ancho del acumulador

  // Registers
  reg signed [DATA_WIDTH-1:0] x_registers[TAPS-1:0];
  wire signed [ACC_WIDTH-1:0] sum[TAPS-1:0];

  integer k;
  always @(posedge clk or negedge rst_n)
    if (!rst_n) begin
      for (k = 0; k < TAPS; k = k + 1) begin
        x_registers[k] <= 0;
      end
      y_out <= 0;

    end else begin
      for (k = 1; k < TAPS; k = k + 1) begin
        x_registers[k] <= x_registers[k-1];
      end
      x_registers[0] <= x_in;
      y_out <= sum[TAPS-1][(2*QF)-:DATA_WIDTH];
    end


  // Operaciones de cada tap
  wire signed [PROD_WIDTH-1:0] mult_results[TAPS-1:0];

  genvar i;
  generate
    for (i = 1; i < TAPS; i = i + 1) begin : gen_tap
      assign mult_results[i] = x_registers[i] * coeffs[i];
      assign sum[i] = sum[i-1] + mult_results[i];
    end
  endgenerate

  assign mult_results[0] = x_registers[0] * coeffs[0];
  assign sum[0] = mult_results[0];

endmodule
