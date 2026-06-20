module Counter (
    input clk,
    input rst,
    input clkEn,
    input inc_cnt,
    input rst_cnt,

    output reg [3:0] count_out,
    output reg Co
);

  always @(posedge clk) begin
    if (rst_cnt || rst) count_out <= 4'd3;

    else if (clkEn && inc_cnt) {Co, count_out} <= count_out + 1'b1;
  end

endmodule
