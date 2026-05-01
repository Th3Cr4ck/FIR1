module mult_fxp #(
    parameter A_QI = 1,
    parameter A_QF = 7,
    parameter B_QI = A_QI,
    parameter B_QF = A_QF
) (
    input signed [A_QI+A_QF-1:0] a,
    input signed [B_QI+B_QF-1:0] b,
    output signed [A_QI+B_QI+A_QF+B_QF-1:0] mult
);

    assign mult = a * b;

endmodule

`timescale 1ns / 1ps

module tb_mult_fxp;

  localparam A_QI = 1;
  localparam A_QF = 7;
  localparam B_QI = 2;
  localparam B_QF = 6;

  reg signed [(A_QI-1):-A_QF] a;
  reg signed [(B_QI-1):-B_QF] b;
  wire signed [(A_QI+B_QI-1):-(A_QF+B_QF)] mult;

  mult_fxp #(
      .A_QI(A_QI),
      .A_QF(A_QF),
      .B_QI(B_QI),
      .B_QF(B_QF)
  ) DUT (
      .a(a),
      .b(b),
      .mult(mult)
  );

  initial begin
    a = 8'b0000_0001;
    b = 8'b0000_0001;

    #1;
    $display("a = %8b, b = %8b", a, b);
    $display("mult = a * b = %16b", mult);

    $finish;
  end

endmodule
