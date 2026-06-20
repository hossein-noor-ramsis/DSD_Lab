`timescale 1ns / 1ps

module tb_sequence_detector;

  reg  clk;
  reg  rst;
  reg  clkEn;
  reg  serIn;
  reg  Co;

  wire SerOutValid;
  wire SerOut;
  wire inc_cnt;
  wire rst_cnt;

  // DUT
  SequenceDetector uut (
      .clk(clk),
      .rst(rst),
      .clkEn(clkEn),
      .serIn(serIn),
      .Co(Co),
      .SerOutValid(SerOutValid),
      .SerOut(SerOut),
      .inc_cnt(inc_cnt),
      .rst_cnt(rst_cnt)
  );

  // Clock generation (freq = 25MHz)
  always #20 clk = ~clk;

  initial begin
    // init
    clk = 0;
    rst = 0;
    clkEn = 0;
    serIn = 0;
    Co = 0;

    // waveform dump
    $dumpfile("./sequence_detector.vcd");
    $dumpvars(0, tb_sequence_detector);

    // ---- RESET ----
    #40;
    rst = 1;
    #40;
    rst   = 0;

    // enable FSM
    clkEn = 1;

    // =========================
    // Test pattern stream
    // =========================

    // Try to move through S0 -> S1 -> S2
    serIn = 1;
    #40;
    serIn = 1;
    #40;

    // stay in S2
    serIn = 1;
    #40;

    // move to S3
    serIn = 0;
    #40;

    // go to TX
    serIn = 0;
    #40;

    // now in TX, simulate Co = 0 first
    Co = 0;
    #100;

    // trigger counter done → should return to S0
    Co = 1;
    #40;
    Co = 0;
    #40;

    // another sequence attempt
    serIn = 1;
    #40;
    serIn = 0;
    #40;
    serIn = 1;
    #40;
    serIn = 0;
    #40;
    serIn = 1;
    #40;
    serIn = 0;
    
    #100;

    $stop;
  end

endmodule
