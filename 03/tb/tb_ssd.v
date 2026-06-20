`timescale 1ns / 1ps

module tb_ssd;

  reg  [3:0] in;
  wire [6:0] Seg;

  // DUT
  SSD uut (
      .in (in),
      .Seg(Seg)
  );

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
    $dumpfile("./ssd.vcd");
    $dumpvars(0, tb_ssd);

    // Test all hex values
    in = 4'h0;
    #5;
    print_7seg(Seg);

    #10;
    in = 4'h1;
    #5;
    print_7seg(Seg);

    #10;
    in = 4'h2;
    #5;
    print_7seg(Seg);

    #10;
    in = 4'h3;
    #5;
    print_7seg(Seg);

    #10;
    in = 4'h4;
    #5;
    print_7seg(Seg);

    #10;
    in = 4'h5;
    #5;
    print_7seg(Seg);

    #10;
    in = 4'h6;
    #5;
    print_7seg(Seg);

    #10;
    in = 4'h7;
    #5;
    print_7seg(Seg);

    #10;
    in = 4'h8;
    #5;
    print_7seg(Seg);

    #10;
    in = 4'h9;
    #5;
    print_7seg(Seg);

    #10;

    in = 4'hA;
    #5;
    print_7seg(Seg);

    #10;
    in = 4'hB;
    #5;
    print_7seg(Seg);

    #10;
    in = 4'hC;
    #5;
    print_7seg(Seg);

    #10;
    in = 4'hD;
    #5;
    print_7seg(Seg);

    #10;
    in = 4'hE;
    #5;
    print_7seg(Seg);

    #10;
    in = 4'hF;
    #5;
    print_7seg(Seg);

    #10;

    #20;
    $stop;
  end

endmodule
