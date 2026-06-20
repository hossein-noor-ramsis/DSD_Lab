module Mux2To1 (
    input in0,
    input in1,
    input sel,
    output reg out
);
  always @(*) begin
    case (sel)
      1'b0: out = in0;
      1'b1: out = in1;
      default: out = 1'd0;
    endcase
  end
endmodule
