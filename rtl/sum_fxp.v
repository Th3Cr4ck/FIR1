module sum_fxp #(
    parameter A_QI = 1,
    parameter A_QF = 7,
    parameter B_QI = A_QI,
    parameter B_QF = A_QF
) (
    input signed [A_QI+A_QF-1:0] a,  // Rango estándar
    input signed [B_QI+B_QF-1:0] b,
    output signed [((A_QI > B_QI ? A_QI+1 : B_QI+1) + (A_QF > B_QF ? A_QF : B_QF))-1:0] sum
);

  // Bits totales
  localparam A_BITS = A_QI + A_QF;
  localparam B_BITS = B_QI + B_QF;
  localparam SUM_QI = (A_QI > B_QI ? A_QI + 1 : B_QI + 1);
  localparam SUM_QF = (A_QF > B_QF ? A_QF : B_QF);
  localparam SUM_BITS = SUM_QI + SUM_QF;

  // Diferencias
  localparam SHIFT_A_QI = SUM_QI - A_QI;
  localparam SHIFT_A_QF = SUM_QF - A_QF;
  localparam SHIFT_B_QI = SUM_QI - B_QI;
  localparam SHIFT_B_QF = SUM_QF - B_QF;

  // Extensión de signo y alineamiento
  wire signed [SUM_BITS-1:0] a_aligned, b_aligned;

  // Alinear Q de A
  assign a_aligned = {{(SHIFT_A_QI) {a[A_BITS-1]}}, a, {(SHIFT_A_QF) {1'b0}}};

  // Alinear Q de B
  assign b_aligned = {{(SHIFT_B_QI) {b[B_BITS-1]}}, b, {(SHIFT_B_QF) {1'b0}}};

  // Suma
  assign sum = a_aligned + b_aligned;

endmodule

