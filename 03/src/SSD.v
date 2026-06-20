module SSD (
    input [3:0] in,
    output reg [6:0] Seg
);

  always @(*) begin
    case (in)

      4'h0: Seg = 7'b1000000;
      4'h1: Seg = 7'b1111001;
      4'h2: Seg = 7'b0100100;
      4'h3: Seg = 7'b0110000;
      4'h4: Seg = 7'b0011001;
      4'h5: Seg = 7'b0010110;
      4'h6: Seg = 7'b0000010;
      4'h7: Seg = 7'b1111000;
      4'h8: Seg = 7'b0000000;
      4'h9: Seg = 7'b0010000;
      4'hA: Seg = 7'b0001000;
      4'hB: Seg = 7'b0000011;
      4'hC: Seg = 7'b1000110;
      4'hD: Seg = 7'b0100001;
      4'hE: Seg = 7'b0000110;
      4'hF: Seg = 7'b0001110;

    endcase
  end

endmodule

// Seg = g f e d c b a
