module fir #(
    parameter QI = 1,
    parameter QF = 14,
    parameter ORDER = 3
) (
    input clk,
    input rst_n,
    input signed [(QI+QF-1):0] x_in,
    output signed [(QI+QF-1):0] y_out
);

  localparam DATA_WIDTH = QI + QF;
  localparam PROD_WIDTH = DATA_WIDTH * 2;

  // Bits extra para acumulación (por si ORDER > 1)
  localparam ACC_EXTRA = $clog2(ORDER);
  localparam ACC_WIDTH = PROD_WIDTH + ACC_EXTRA;  // Ancho del acumulador

  // Coeficientes
  wire signed [(DATA_WIDTH-1):0] coeff[0:(ORDER-1)];

  genvar i;
  generate
    for (i = 0; i < ORDER; i = i + 1) begin : gen_coeff
      assign coeff[i] = i <<< QF;
    end
  endgenerate

  // Señales
  wire signed [(DATA_WIDTH-1):0] x_delay[0:(ORDER-1)];
  wire signed [(PROD_WIDTH-1):0] mult_out[0:(ORDER-1)];
  wire signed [(ACC_WIDTH-1):0] sum_full[0:(ORDER-1)];
  wire signed [(DATA_WIDTH-1):0] sum_adj[0:(ORDER-1)];  // Para versión truncada

  // Registro de x secuencial
  reg signed [DATA_WIDTH-1:0] x_secuential;
  always @(posedge clk or negedge rst_n)
    if (!rst_n) x_secuential <= 0;
    else x_secuential <= x_in;

  // Primer valor
  assign x_delay[0] = x_secuential;

  // Taps del filtro
  generate
    for (i = 0; i < ORDER; i = i + 1) begin : g_fir_tap

      // Registro de retardo, exceptuando i=0
      if (i > 0) begin
        zreg #(
            .DATA_WIDTH(DATA_WIDTH)
        ) register (
            .clk(clk),
            .rst_n(rst_n),
            .x(x_delay[i-1]),
            .y(x_delay[i])
        );
      end

      // Multiplicador
      mult_fxp #(
          .A_QI(QI),
          .A_QF(QF)
      ) mult (
          .a(x_delay[i]),
          .b(coeff[i]),
          .mult(mult_out[i])
      );

      // Sumador con alta precisión
      if (i == 0) begin
        // Primer tap: extender producto a ACC_WIDTH
        assign sum_full[i] = {{(ACC_WIDTH - PROD_WIDTH) {mult_out[i][PROD_WIDTH-1]}}, mult_out[i]};
      end else begin
        // Sumas completas sin truncar
        assign sum_full[i] = sum_full[i-1] + 
                                     {{(ACC_WIDTH-PROD_WIDTH){mult_out[i][PROD_WIDTH-1]}}, 
                                      mult_out[i]};
      end

    end
  endgenerate

  // Redondear y truncar al final (solo una vez)
  localparam signed [ACC_WIDTH-1:0] ROUND_BIAS = 1 <<< (QF - 1);  // La mitad del valor de LSB
  wire signed [DATA_WIDTH-1:0] y_out_temp;

  assign y_out_temp = (sum_full[ORDER-1] + ROUND_BIAS) >>> QF;
  assign y_out = y_out_temp;

endmodule


