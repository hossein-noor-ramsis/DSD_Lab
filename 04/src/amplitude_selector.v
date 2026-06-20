module amplitude_selector (
    input [7:0] in_wave,
    input [1:0] ampsel,

    output reg [7:0] out_wave
);

  always @(*) begin

    case (ampsel)
      2'b00: out_wave = in_wave;
      2'b01: out_wave = in_wave >> 1;
      2'b10: out_wave = in_wave >> 2;
      2'b11: out_wave = in_wave >> 3;
    endcase

  end

endmodule
