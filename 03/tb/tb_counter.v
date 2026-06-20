`timescale 1ns / 1ps

module tb_counter;

  reg clk;
  reg rst;
  reg clkEn;
  reg inc_cnt;
  reg rst_cnt;

  wire [3:0] count_out;
  wire Co;

  // DUT instantiation
  Counter uut (
      .clk(clk),
      .rst(rst),
      .clkEn(clkEn),
      .inc_cnt(inc_cnt),
      .rst_cnt(rst_cnt),
      .count_out(count_out),
      .Co(Co)
  );

  // Clock generation (freq = 25MHz)S
  always #20 clk = ~clk;

  initial begin
    // init
    clk = 0;
    rst = 0;
    clkEn = 0;
    inc_cnt = 0;
    rst_cnt = 0;

    // waveform dump
    $dumpfile("./counter.vcd");
    $dumpvars(0, tb_counter);

    // reset
    #40;
    rst = 1;
    #40;
    rst = 0;

    // enable counting
    clkEn = 1;
    inc_cnt = 1;

    // run counter
    #2000;

    // test rst_cnt
    rst_cnt = 1;
    #40;
    rst_cnt = 0;

    // stop
    inc_cnt = 0;
    clkEn   = 0;

    #80;

    $stop;
  end

endmodule
