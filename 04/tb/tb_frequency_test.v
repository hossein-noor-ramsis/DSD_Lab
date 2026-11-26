`timescale 1ns / 1ns

module tb_frequency_test;

  reg clk;
  reg rst;
  reg init;
  reg [4:0] PI;
  reg [2:0] func;
  wire clk_en;
  wire [7:0] wave;

  frequency_selector FREQ (
      .clk(clk),
      .rst(rst),
      .init(init),
      .PI(PI),
      .clk_en(clk_en)
  );

  waveform_generator WAVE (
      .clk(clk),
      .clk_en(clk_en),
      .rst(rst),
      .func(func),
      .wave(wave)
  );

  always #10 clk = ~clk;  // 50 MHz

  initial begin
    $display("========================================================");
    $display("Frequency Selector Test - 3 Different Frequencies");
    $display("========================================================");

    clk  = 0;
    rst  = 1;
    init = 1;
    PI   = 5'd10;
    func = 3'b100;

    #200;
    rst = 0;
    #100;
    init = 0;
    #1000;

    $display("\n--- PI=10 (Low Frequency) ---");
    #5000000;

    $display("\n--- PI=5 (Medium Frequency) ---");
    init = 1;
    PI   = 5'd5;
    #200;
    init = 0;
    #5000000;

    $display("\n--- PI=3 (High Frequency) ---");
    init = 1;
    PI   = 5'd3;
    #200;
    init = 0;
    #5000000;

    $stop;
  end

  // Print on every clock edge for debugging
  always @(posedge clk_en) begin
    $display("t=%0t | PI=%d | clk_en=%b | wave=%d", $time, PI, clk_en, wave);
  end

endmodule
