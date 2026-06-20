`timescale 1ns / 1ns

module ring_oscillator #(
    parameter NUM_INVERTERS = 3,     // Must be odd
    parameter DELAY         = 107.5  // Delay per inverter in ns
) (
    input  enable,
    output osc_out
);

  wire [NUM_INVERTERS-1:0] net;

  // First inverter: input from last inverter
  not #DELAY (net[0], net[NUM_INVERTERS-1]);

  // Rest of the chain
  genvar i;
  generate
    for (i = 1; i < NUM_INVERTERS; i = i + 1) begin
      not #DELAY (net[i], net[i-1]);
    end
  endgenerate

  // Output gated by enable
  assign osc_out = enable ? net[NUM_INVERTERS-1] : 1'b0;

  initial begin
    force net[0] = 1'b0;
    #(DELAY * NUM_INVERTERS);
    release net[0];
  end
endmodule
