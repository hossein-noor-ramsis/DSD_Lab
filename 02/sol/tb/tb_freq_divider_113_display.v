`timescale 1ns / 1ns

module tb_freq_divider_113_display;
  wire clk_ring;
  reg enable;
  reg preset;
  reg drst;
  wire rco_out;
  wire [7:0] duration;

  ring_oscillator #(
      .NUM_INVERTERS(3),
      .DELAY(107.5)
  ) ring_osc (
      .enable (1'b1),
      .osc_out(clk_ring)
  );

  freq_divider_113_display DUT (
      .CLK(clk_ring),
      .ENABLE(enable),
      .PRESET(preset),
      .DRST(drst), // display rst
      .RCO_OUT(rco_out),
      .DURATION(duration)
  );

  initial begin
    drst   = 1;
    enable = 1;  // Disable counter
    preset = 0;  // Load mode
    #5000;

    preset = 1;  // Load initial value 143
    #5000;

    enable = 0;

    #34475;
    drst = 0;

    #1000000;  // Run long enough

    drst = 1;
    #50000;
    $stop;
  end
endmodule
