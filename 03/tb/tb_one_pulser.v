`timescale 1ns / 1ps

module tb_one_pulser;

  reg  clk;
  reg  rst;
  reg  clkPB;
  wire pulse;

  // DUT
  OnePulser uut (
      .clk  (clk),
      .rst  (rst),
      .clkPB(clkPB),
      .pulse(pulse)
  );

  // Clock generation (freq = 25MHz)
  always #20 clk = ~clk;

  initial begin
    // init
    clk   = 0;
    clkPB = 0;
    rst   = 1;

    // waveform dump
    $dumpfile("./one_pulser.vcd");
    $dumpvars(0, tb_one_pulser);

    // wait a bit
    #40;
    rst   = 0;

    // ---- single press (should generate ONE pulse) ----
    clkPB = 1;
    #100;  // hold for more than 1 clock edge
    clkPB = 0;

    #100;

    // ---- another press ----
    clkPB = 1;
    #100;
    clkPB = 0;

    #100;

    // ---- long press (still only one pulse) ----
    clkPB = 1;
    #300;
    clkPB = 0;

    #300;

    $stop;
  end

endmodule
