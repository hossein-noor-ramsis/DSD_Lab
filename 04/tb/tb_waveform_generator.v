`timescale 1ns / 1ns

module tb_waveform_generator;  // 1

  reg clk;
  reg rst;
  reg [2:0] func;
  wire [7:0] wave;

  waveform_generator DUT (
      .clk(clk),
      .rst(rst),
      .clk_en(1'b1),
      .func(func),
      .wave(wave)
  );

  always #10 clk = ~clk;  // 50 MHz

  initial begin
    $display("========================================================");
    $display("Waveform Generator Test - All 6 Waveforms");
    $display("========================================================");

    clk  = 0;
    rst  = 1;
    func = 3'b000;

    #100;
    rst  = 0;

    func = 3'b000;
    #50000;  // Reciprocal
    func = 3'b001;
    #50000;  // Square
    func = 3'b010;
    #50000;  // Triangle
    func = 3'b100;
    #50000;  // Sine
    func = 3'b101;
    #50000;  // Full-wave rectified
    func = 3'b110;
    #50000;  // Half-wave rectified

    $stop;
  end

  always @(posedge clk) begin
    if ($time % 1000 == 0) $display("t=%0t | func=%b | wave=%d", $time, func, wave);
  end

endmodule
