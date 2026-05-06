module fir #(
    parameter QI = 1,
    parameter QF = 14,
    parameter ORDER = 3
) (
    input clk,
    input rst_n,
    input signed [(QI+QF-1):0] x_in,
    output reg signed [(QI+QF-1):0] y_out
);

  localparam DATA_WIDTH = QI + QF;
  localparam PROD_WIDTH = DATA_WIDTH * 2;
  localparam TAPS = ORDER + 1;

  // Bits extra para acumulación
  localparam ACC_EXTRA = $clog2(TAPS);
  localparam ACC_WIDTH = PROD_WIDTH + ACC_EXTRA;  // Ancho del acumulador

  // Coeficientes
  wire signed [(DATA_WIDTH-1):0] coeff[TAPS-1:0];

  genvar i;
  generate
    for (i = 0; i < TAPS; i = i + 1) begin : gen_coeff
      assign coeff[i] = 1 <<< (QF-1); //0.5
    end
  endgenerate


  // Registers
  reg signed [DATA_WIDTH-1:0] x_registers[TAPS-1:0];
  wire signed [ACC_WIDTH-1:0] sum[TAPS-1:0];

  integer k;
  always @(posedge clk or negedge rst_n)
    if (!rst_n) begin
      for (k = 0; k < TAPS; k = k + 1) begin
        x_registers[k]   <= 0;
      end
      y_out <= 0;

    end else begin
      for (k = 1; k < TAPS; k = k + 1) begin
        x_registers[k]   <= x_registers[k-1];
      end
      x_registers[0] <= x_in;
      y_out <= sum[TAPS-1][(2*QF) -: DATA_WIDTH];
    end


  // Operaciones de cada tap
  wire signed [PROD_WIDTH-1:0] mult_results[TAPS-1:0];

  generate
    for (i = 1; i < TAPS; i = i + 1) begin : gen_tap
      assign mult_results[i] = x_registers[i] * coeff[i];
      assign sum[i] = sum[i-1] + mult_results[i];
    end

  endgenerate

  assign mult_results[0] = x_registers[0] * coeff[0];
  assign sum[0] = mult_results[0];
  // assign tap_results_full[0] = mult_results[0];

endmodule

// sum_fxp #(
//   .A_QI(2 * QI),
//   .A_QF(2 * QF),
//   .B_QI(QI),
//   .B_QF(QF)
// ) sum (
//   .a  (mult_results[i]),
//   .b  (tap_registers[i-1]),
//   .sum(tap_results_full[i])
// );

