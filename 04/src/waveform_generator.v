module waveform_generator (
    input clk,
    input rst,

    input clk_en,

    input [2:0] func,

    output reg [7:0] wave
);
  wire [7:0] sine_wave;

  DDS dds (
      .clk(clk),
      .rst(rst),
      .clk_en(clk_en),
      .sine(sine_wave)
  );

  reg [8:0] counter;

  always @(posedge clk or posedge rst) begin
    if (rst) counter <= 0;
    else if (clk_en) counter <= counter + 1'b1;
  end

  wire [7:0] square_wave;
  wire [7:0] triangle_wave;
  wire [7:0] reciprocal_wave;
  wire [7:0] full_wave;
  wire [7:0] half_wave;

  // Square wave: MSB of counter determines high/low
  assign square_wave = counter[8] ? 8'd255 : 8'd0;

  // Triangle wave: count up then down
  assign triangle_wave = counter[8] ? (~counter) : counter;

  // Reciprocal: starts at max and decreases
  assign reciprocal_wave = (counter == 0) ? 8'd255 : (8'd255 / -counter);  // 1/(-x)

  // Full-wave rectified: absolute value, centered at 128
  assign full_wave = (sine_wave >= 128) ? (sine_wave) : (-sine_wave);

  // Half-wave rectified: positive half only, centered at 128
  assign half_wave = (sine_wave >= 128) ? (sine_wave) : 8'd128;

  always @(*) begin
    case (func)
      3'b000:  wave = reciprocal_wave;
      3'b001:  wave = square_wave;
      3'b010:  wave = triangle_wave;
      3'b100:  wave = sine_wave;
      3'b101:  wave = full_wave;
      3'b110:  wave = half_wave;
      default: wave = 8'd128;
    endcase
  end

endmodule
