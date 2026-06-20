`timescale 1ns / 1ns

module tb_ring_oscillator;

  reg  enable;
  wire osc_out;

  ring_oscillator #(
      .NUM_INVERTERS(3),
      .DELAY        (20)
  ) DUT (
      .enable (enable),
      .osc_out(osc_out)
  );

  initial begin
    enable = 0;
    #100;
    enable = 1;
    #10000;
    $stop;
  end

endmodule
