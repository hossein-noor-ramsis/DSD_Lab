`timescale 1ns / 1ps

module tb_serial_transmitter_post;

  reg clk;
  reg rst;
  reg clkPB;
  reg serIn;

  wire [6:0] Seg;
  wire SerOut;
  wire SerOutValid;
  wire [3:0] count_out;

  SerialTransmitter DUT (
      .clk  (clk),
      .rst  (rst),
      .clkPB(clkPB),
      .serIn(serIn),

      .SerOut(SerOut),
      .SerOutValid(SerOutValid),
      .Seg(Seg),
      .count_out(count_out)
  );

  // Clock generation (freq = 25MHz)
  always #20 clk = ~clk;

  task press_button;
    begin
      clkPB = 1;
      #100;
      clkPB = 0;
      #100;
    end
  endtask

  task send_bit;
    input bit_value;
    begin
      serIn = bit_value;
      #40;
      press_button;
    end
  endtask

  task print_7seg;
    input [6:0] disp;

    reg a, b, c, d, e, f, g;

    begin
      a = ~disp[0];
      b = ~disp[1];
      c = ~disp[2];
      d = ~disp[3];
      e = ~disp[4];
      f = ~disp[5];
      g = ~disp[6];

      $display("\n     %s\n    %s%s%s\n    %s%s%s", a ? "_" : " ", f ? "|" : " ", g ? "_" : " ",
               b ? "|" : " ", e ? "|" : " ", d ? "_" : " ", c ? "|" : " ");

    end

  endtask

  initial begin

    clk   = 0;
    rst   = 1;
    clkPB = 0;
    serIn = 0;

    #200;

    rst = 0;

    // Detection #1


    send_bit(1);
    print_7seg(Seg);
    send_bit(1);
    print_7seg(Seg);
    send_bit(0);
    print_7seg(Seg);
    send_bit(0);
    print_7seg(Seg);

    send_bit(1);
    print_7seg(Seg);
    send_bit(1);
    print_7seg(Seg);
    send_bit(1);
    print_7seg(Seg);
    send_bit(1);
    print_7seg(Seg);
    send_bit(1);
    print_7seg(Seg);
    send_bit(1);
    print_7seg(Seg);
    send_bit(1);
    print_7seg(Seg);
    send_bit(1);
    print_7seg(Seg);
    send_bit(1);
    print_7seg(Seg);
    send_bit(1);
    print_7seg(Seg);
    send_bit(1);
    print_7seg(Seg);
    send_bit(1);
    print_7seg(Seg);
    send_bit(1);
    print_7seg(Seg);
    send_bit(1);
    print_7seg(Seg);

    // Detection #2

    send_bit(1);
    print_7seg(Seg);
    send_bit(1);
    print_7seg(Seg);
    send_bit(0);
    print_7seg(Seg);
    send_bit(0);
    print_7seg(Seg);

    send_bit(0);
    print_7seg(Seg);
    send_bit(1);
    print_7seg(Seg);
    send_bit(0);
    print_7seg(Seg);
    send_bit(1);
    print_7seg(Seg);
    send_bit(0);
    print_7seg(Seg);
    send_bit(1);
    print_7seg(Seg);
    send_bit(0);
    print_7seg(Seg);
    send_bit(1);
    print_7seg(Seg);
    send_bit(0);
    print_7seg(Seg);
    send_bit(1);
    print_7seg(Seg);
    send_bit(0);
    print_7seg(Seg);
    send_bit(1);
    print_7seg(Seg);
    send_bit(0);
    print_7seg(Seg);
    send_bit(1);
    print_7seg(Seg);

    // some clkPB
    send_bit(1);
    print_7seg(Seg);
    send_bit(1);
    print_7seg(Seg);
    send_bit(1);
    print_7seg(Seg);
    send_bit(1);
    print_7seg(Seg);
    send_bit(1);
    print_7seg(Seg);


    #1000;

    $stop;

  end

endmodule
