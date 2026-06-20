module function_generator_top (
    input clk,
    input rst,
    input init,

    input [4:0] PI,
    input [2:0] func,
    input [1:0] ampsel,
    
    output [7:0] wave_out
);

  wire div_clk;
  wire [7:0] raw_wave;

  frequency_selector FREQ (
      .clk(clk),
      .rst(rst),
      .init(init),
      .PI(PI),
      .out_clk(div_clk)
  );

  waveform_generator WAVE (
      .clk (div_clk),
      .rst (rst),
      .func(func),
      .wave(raw_wave)
  );

  amplitude_selector AMP (
      .in_wave (raw_wave),
      .ampsel  (ampsel),
      .out_wave(wave_out)
  );

endmodule
