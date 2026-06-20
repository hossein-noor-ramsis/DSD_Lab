module SequenceDetector (

    input clk,
    input rst,
    input clkEn,

    input serIn,
    input Co,

    output reg SerOutValid,
    output SerOut,

    output reg inc_cnt,
    output reg rst_cnt
);

  parameter IDL = 3'd0;
  parameter Q1 = 3'd1;
  parameter Q2 = 3'd2;
  parameter Q3 = 3'd3;
  parameter TS = 3'd4;

  reg [2:0] state;
  reg [2:0] next_state;

  assign SerOut = serIn;


  always @(posedge clk) begin
    if (rst) state <= IDL;
    else if (clkEn) state <= next_state;
  end

  always @(*) begin

    next_state = state;

    case (state)

      IDL: begin
        if (serIn) next_state = Q1;
        else next_state = IDL;
      end

      Q1: begin
        if (serIn) next_state = Q2;
        else next_state = IDL;
      end

      Q2: begin
        if (serIn) next_state = Q2;
        else next_state = Q3;
      end

      Q3: begin
        if (serIn) next_state = Q1;
        else next_state = TS;
      end

      TS: begin
        if (Co) next_state = IDL;
        else next_state = TS;
      end

      default: next_state = IDL;

    endcase

  end

  always @(*) begin

    SerOutValid = 0;
    inc_cnt = 0;
    rst_cnt = 0;

    case (state)

      IDL: ;

      Q1: ;

      Q2: ;

      Q3: rst_cnt = clkEn;

      TS: begin
        SerOutValid = 1;
        inc_cnt = 1;
      end

    endcase

  end

endmodule
