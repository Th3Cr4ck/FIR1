`timescale 1ns / 1ps

module tb_fir;

  parameter QI = 1;
  parameter QF = 14;
  parameter DATA_WIDTH = QI + QF;
  parameter TAPS = 4;

  reg clk, rst_n;
  reg signed  [DATA_WIDTH-1:0] coeffs[TAPS-1:0];
  reg signed  [DATA_WIDTH-1:0] x_in;
  wire signed [DATA_WIDTH-1:0] y_out;

  // DUT
  fir #(
      .QI  (QI),
      .QF  (QF),
      .TAPS(TAPS)
  ) dut (
      .clk(clk),
      .rst_n(rst_n),
      .coeffs(coeffs),
      .x_in(x_in),
      .y_out(y_out)
  );

  // CLOCK: 10 ns period
  always #5 clk = ~clk;

  // real -> fixed (Q format)
  function signed [DATA_WIDTH-1:0] to_fixed;
    input real val;
    begin
      to_fixed = $rtoi(val * (1 << QF));
    end
  endfunction

  // fixed -> real (para debug)
  function real to_real;
    input signed [DATA_WIDTH-1:0] val;
    begin
      to_real = val / real'(1 << QF);
    end
  endfunction

  initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, tb_fir);
  end

  integer i;
  initial begin
    $readmemh("../config/coeffs.hex", coeffs);

    for (i = 0; i < TAPS; i = i + 1) $display("coeff[%0d]=%0d", i, coeffs[i]);
  end

  integer fd;
  initial begin
    fd = $fopen("../simulation/results.txt");
    if (fd == 0)
      $display("ERROR: No se pudo abrir el archivo para escribir los resultados de salida");
  end

  initial begin

    clk   = 0;
    rst_n = 0;
    x_in  = 0;

    #12;
    rst_n = 1;

    // estímulos decimales (dentro de rango [-1, 1))
    x_in  = to_fixed(0.5);
    #10 x_in = to_fixed(-0.25);
    #10 x_in = to_fixed(0.75);
    #10 x_in = to_fixed(0.25);
    #10 x_in = to_fixed(-0.75);
    #10 x_in = to_fixed(0);

    #200;

    $fclose(fd);
    $finish;
  end

  always @(posedge clk) begin
    if (rst_n) begin
      #1; // Dejar que se actalice y_out y luego escribirlo
      $display("t=%0t | x=%f | y=%f", $time, to_real(x_in), to_real(y_out));
      $fdisplay(fd, "%f", to_real(y_out));
    end
  end

endmodule
