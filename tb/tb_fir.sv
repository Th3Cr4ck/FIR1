`timescale 1ns / 1ps

module tb_fir;

  localparam QI = 1;
  localparam QF = 14;
  localparam DATA_WIDTH = QI + QF;

  reg clk, rst_n;
  reg  signed [DATA_WIDTH-1:0] x_in;
  wire signed [DATA_WIDTH-1:0] y_out;

  // DUT
  fir #(
      .QI(QI),
      .QF(QF),
      .ORDER(2)
  ) dut (
      .clk  (clk),
      .rst_n(rst_n),
      .x_in (x_in),
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

    clk   = 0;
    rst_n = 0;
    x_in  = 0;

    #12;
    rst_n = 1;

    // estímulos decimales (dentro de rango [-2, 2))
    x_in = to_fixed(0.5);
    #10 x_in = to_fixed(-0.25);
    #10 x_in = to_fixed(0.75);
    #10 x_in = to_fixed(0.25);
    #10 x_in = to_fixed(-0.75);
    #10 x_in = to_fixed(0);

    #50;

    $finish;
  end

  // debug en consola
  always @(posedge clk) begin
    if (rst_n) begin
      $display("t=%0t | x=%f | y=%f",
               $time,
               to_real(x_in),
               to_real(y_out));
    end
  end

endmodule
