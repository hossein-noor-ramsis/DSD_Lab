`timescale 1us / 100ns

module tb_lm_555_timer_1k;
  reg  clk;
  reg  reset;
  wire pulse;

  lm_555_timer #(
      .Resistor1(1),
      .Resistor2(1),
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
    #1000;
    $stop;
  end

endmodule
