module SerialTransmitter (

    input clk,
    input rst,

    input clkPB,
    input serIn,

    output SerOut,
    output SerOutValid,

    output [6:0] Seg,

    output [3:0] count_out
);

  wire clkEn;

  wire Co;
  wire inc_cnt;
  wire rst_cnt;

  wire FullSerOut;

  OnePulser U1 (
      .clk  (clk),
      .rst  (rst),
      .clkPB(clkPB),
      .pulse(clkEn)
  );

  Counter U2 (
      .clk  (clk),
      .rst  (rst),
      .clkEn(clkEn),

      .inc_cnt(inc_cnt),
      .rst_cnt(rst_cnt),

      .count_out(count_out),
      .Co(Co)
  );

  SequenceDetector U3 (
      .clk  (clk),
      .rst  (rst),
      .clkEn(clkEn),

      .serIn(serIn),
      .Co(Co),

      .SerOutValid(SerOutValid),
      .SerOut(FullSerOut),

      .inc_cnt(inc_cnt),
      .rst_cnt(rst_cnt)
  );

  SSD U4 (
      .in (count_out),
      .Seg(Seg)
  );

  Mux2To1 U5 (
      .in0(1'b0),
      .in1(FullSerOut),
      .sel(SerOutValid),
      .out(SerOut)
  );

endmodule
