module frequency_selector (
    input            clk,
    input            rst,
    input            init,

    input      [4:0] PI,
    
    output reg       out_clk
);
  reg [8:0] counter;
  reg [8:0] reload;
  reg       init_d;  // Add init detection

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      reload  <= 9'd0;
      counter <= 9'd0;
      out_clk <= 1'b0;
      init_d  <= 1'b0;
    end else begin
      init_d <= init;  // Store previous init value

      if (init && !init_d) begin  // Rising edge of init
        reload  <= {PI, 4'b1111};
        counter <= {PI, 4'b1111};
        out_clk <= 1'b0;
      end else if (!init) begin
        if (counter == 0) begin
          counter <= reload;
          out_clk <= ~out_clk;
        end else begin
          counter <= counter - 1'b1;
        end
      end
    end
  end
endmodule
