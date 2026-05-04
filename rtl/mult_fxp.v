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
