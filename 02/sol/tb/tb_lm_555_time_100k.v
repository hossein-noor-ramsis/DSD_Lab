`timescale 1us / 1us

module tb_lm_555_timer_100k;

  reg  clk;
  reg  reset;
  wire pulse;

  lm_555_timer #(
      .Resistor1(1),
      .Resistor2(100),
      .capacitor(10)
  ) DUT (
      .clk  (clk),
      .reset(reset),
      .pulse(pulse)
  );

  always begin
    #1 clk = ~clk;
  end

  initial begin
    clk   = 0;
    reset = 1;
    #5;
    reset = 0;
    #10000;
    $stop;
  end

endmodule
