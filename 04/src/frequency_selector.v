module frequency_selector (
    input clk,
    input rst,
    input init,
    input [4:0] PI,
    output reg clk_en
);

  reg [8:0] counter;
  reg [8:0] reload;
  reg init_d;

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      reload  <= 9'd0;
      counter <= 9'd0;
      clk_en  <= 1'b0;
      init_d  <= 1'b0;
    end else begin
      // Default value
      clk_en <= 1'b0;

      // Check rising edge of init
      if (init && !init_d) begin  // init just first cycle
        reload  <= {PI, 4'b1111};
        counter <= {PI, 4'b1111};
      end else if (!init) begin
        if (counter == 0) begin  // reload and pulse of clk_en
          counter <= reload;
          clk_en  <= 1'b1;  // One cycle enable pulse
        end else begin
          counter <= counter - 1'b1;  // o.w counter-- until it is 0
        end
      end

      // Update init_d at the END (non-blocking assignment)
      init_d <= init;
    end
  end

endmodule
