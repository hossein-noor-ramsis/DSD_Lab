module sine_rom (
    input [5:0] addr,
    
    output reg [7:0] data
);

  reg [7:0] mem[0:63];

  initial $readmemb("E:/Archive/Simister 4/DSD Lab/04/tb/sine.mem", mem);

  always @(*) data = mem[addr];

endmodule
