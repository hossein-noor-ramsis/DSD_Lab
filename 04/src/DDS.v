module DDS (
    input clk,
    input rst,

    input clk_en,

    output [7:0] sine
);
  reg [7:0] phase_acc;

  wire signbit;
  wire phasepos;

  wire [5:0] addr;
  wire [5:0] rom_addr;
  wire [7:0] rom_data;

  wire all_zero;

  assign signbit  = phase_acc[7];
  assign phasepos = phase_acc[6];
  assign addr     = phase_acc[5:0];

  // For 2nd and 4th quadrants, reverse the address
  assign rom_addr = phasepos ? (~addr) : addr;

  // Detect peak values (when addr=0 and phasepos=1)
  assign all_zero = (addr == 6'b000000);

  always @(posedge clk or posedge rst) begin
    if (rst) phase_acc <= 0;
    else if (clk_en) phase_acc <= phase_acc + 1'b1;
  end

  sine_rom ROM (
      .addr(rom_addr),
      .data(rom_data)
  );

  // Magnitude: 0 to 127 = |sin|
  wire [7:0] magnitude;
  assign magnitude = (phasepos && all_zero) ? 8'd127 : {1'b0, rom_data[6:0]};

  // Output: 0 to 255 centered at 128
  // signbit=0: positive half (128 to 255)
  // signbit=1: negative half (0 to 128)
  assign sine = signbit ? (8'd128 - magnitude) : (8'd128 + magnitude);

endmodule

// we have saved the frit quart of the sin wave in the rom
// we read the rom up to down for the firs quart and down to top for the second
// rom_adr = adr for bottom to up and the rom_adr = ~adr for the up to bottom
// at the end we reverse the sign of the wave each T/2 duration of phase_acc which counts to 255 and in half of numbers the MSB is 0 in other half it is 1
