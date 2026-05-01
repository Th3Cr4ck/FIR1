module zreg #(
    parameter DATA_WIDTH = 8
) (
    input            clk,
    input            rst_n,
    input      [DATA_WIDTH-1:0] x,
    output reg [DATA_WIDTH-1:0] y
);

  always @(posedge clk or negedge rst_n)
    if (!rst_n) y <= 0;
    else y <= x;

endmodule
