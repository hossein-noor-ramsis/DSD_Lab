`timescale 1ns / 1ps

module tb_function_generator;

  reg clk;
  reg rst;

  reg init;
  reg [4:0] PI;

  reg [2:0] func;
  reg [1:0] ampsel;

  wire [7:0] wave_out;

  function_generator_top DUT (
      .clk(clk),
      .rst(rst),
      .init(init),
      .PI(PI),
      .func(func),
      .ampsel(ampsel),
      .wave_out(wave_out)
  );

  always #10 clk = ~clk;

  initial begin

    $display("========================================================");
    $display("time\tfunc\tampsel\tPI\twave_out");
    $display("========================================================");

    clk = 0;
    rst = 1;
    init = 1;

    PI = 5'd10;
    ampsel = 2'b00;
    func = 3'b000;

    #100;

    rst  = 0;
    init = 0;

    func = 3'b000;  // reciprocal
    #50000;

    func = 3'b001;  // square
    #50000;

    func = 3'b010;  // triangle
    #50000;

    func = 3'b100;  // sine
    #50000;

    func = 3'b101;  // full-wave
    #50000;

    func = 3'b110;  // half-wave
    #50000;

    ampsel = 2'b01;
    func   = 3'b100;
    #50000;

    ampsel = 2'b10;
    #50000;

    ampsel = 2'b11;
    #50000;

    init = 1;
    PI   = 5'd3;
    #40;
    init = 0;

    #50000;

    $stop;

  end

  always begin
    #100;

    $display("%0t\t%b\t%b\t%d\t%d", $time, func, ampsel, PI, wave_out);
  end

endmodule
