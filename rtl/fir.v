module fir #(
    parameter DATA_WIDTH = 8,
    parameter ORDER = 3
) (
    input   clk,
    input   rst_n,
    input   [(DATA_WIDTH-1):0] x_in,
    output  [(DATA_WIDTH-1):0] y_out
);

  // Coeficientes
  wire [(DATA_WIDTH-1):0] coeff[0:(ORDER-1)];
  genvar i;
  generate
    for (i = 0; i < ORDER; i = i + 1) begin : gen_coeff
      assign coeff[i] = {DATA_WIDTH{1'd1}};
    end
  endgenerate

  wire [(DATA_WIDTH-1):0] x_delay      [0:(ORDER-1)];
  wire [(DATA_WIDTH-1):0] mult_out     [0:(ORDER-1)];
  wire [(DATA_WIDTH-1):0] sum          [0:(ORDER-1)];
  wire [(DATA_WIDTH-1):0] prev_sum     [0:(ORDER-1)];

  reg  [7:0] x_secuential;

  always @(posedge clk or negedge rst_n)
    if (!rst_n) x_secuential <= 0;
    else x_secuential <= x_in;

  // Primer valor
  assign x_delay[0] = x_secuential;

  // Taps del filtro
  generate
    for (i = 0; i < ORDER; i = i + 1) begin : g_fir_tap

      // Registro de retardo, exceptuando i=0
      if (i > 0)
        zreg z0 (
            .clk(clk),
            .rst_n(rst_n),
            .x(x_delay[i-1]),
            .y(x_delay[i])
        );

      // Multiplicador
      mult m0 (
          .i_x(x_delay[i]),
          .i_y(coeff[i]),
          .o_z(mult_out[i])
      );

      // Sumador - evitando acceso a sum[-1]
      if (i == 0)
        adder a0 (
            .i_x(mult_out[i]),
            .i_y({DATA_WIDTH{1'b0}}),         // Cero explícito
            .o_z(sum[i])
        );
      else
        adder a0 (
            .i_x(mult_out[i]),
            .i_y(sum[i-1]),
            .o_z(sum[i])
        );
    end

  endgenerate

  assign y_out = sum[ORDER-1];

endmodule
