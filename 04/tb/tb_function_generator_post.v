`timescale 1ns / 1ns

module tb_function_generator_post;  // 4
  reg clk;
  reg rst;
  reg init;

  reg [4:0] PI;
  reg [2:0] func;
  reg [1:0] ampsel;

  wire [7:0] wave_out;

  function_generator_top_post DUT (
      .clk(clk),
      .rst(rst),
      .init(init),
      .PI(PI),
      .func(func),
      .ampsel(ampsel),
      .wave_out(wave_out)
  );

  always #10 clk = ~clk;  // 50 MHz

  initial begin
    $display("========================================================");
    $display("Complete Function Generator Test");
    $display("========================================================");

    clk = 0;
    rst = 1;
    init = 1;
    PI = 5'd10;
    ampsel = 2'b00;
    func = 3'b000;

    #200;
    rst = 0;
    #100;
    init = 0;
    #1000;

    // Test all waveforms at PI=10
    $display("\n--- PI=10, All Waveforms ---");

    $display("Reciprocal:");
    func = 3'b000;
    #5000000;

    $display("Square:");
    func = 3'b001;
    #5000000;

    $display("Triangle:");
    func = 3'b010;
    #5000000;

    $display("Sine:");
    func = 3'b100;
    #5000000;

    $display("Full-wave:");
    func = 3'b101;
    #5000000;

    $display("Half-wave:");
    func = 3'b110;
    #5000000;

    // Test amplitudes with sine wave
    $display("\n--- Amplitude Test (PI=10, Sine) ---");
    func   = 3'b100;

    ampsel = 2'b00;
    #5000000;

    ampsel = 2'b01;
    #5000000;

    ampsel = 2'b10;
    #5000000;

    ampsel = 2'b11;
    #5000000;

    // Test different frequency
    $display("\n--- PI=3, Sine Wave ---");
    init = 1;
    PI = 5'd3;
    ampsel = 2'b00;
    #200;
    init = 0;
    #5000000;

    $stop;
  end

  always @(posedge clk) begin
    if ($time % 1000 == 0)
      $display("t=%0t | func=%b | ampsel=%b | PI=%d | wave=%d", $time, func, ampsel, PI, wave_out);
  end

endmodule
