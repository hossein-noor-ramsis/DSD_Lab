module OnePulser (
    input clk,
    rst,
    clkPB,
    output reg pulse
);
  parameter A = 2'd0;
  parameter B = 2'd1;
  parameter C = 2'd2;

  reg [1:0] ps, ns;
  always @(posedge clk, posedge rst) begin
    if (rst) ps <= 0;
    else ps <= ns;
  end

  always @(ps, clkPB) begin
    case (ps)
      A: ns = clkPB ? B : A;
      B: ns = C;
      C: ns = clkPB ? C : A;
    endcase
  end

  always @(ps, clkPB) begin
    case (ps)
      A: pulse = 0;
      B: pulse = 1;
      C: pulse = 0;
    endcase
  end
endmodule
