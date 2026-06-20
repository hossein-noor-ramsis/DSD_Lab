module sine_rom (
    input [5:0] addr,
    
    output reg [7:0] data
);

  reg [7:0] mem[0:63];

  initial $readmemb("sine.mem", mem);

  always @(*) data = mem[addr];

endmodule
