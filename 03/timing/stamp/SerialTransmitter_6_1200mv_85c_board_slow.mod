/*
 Copyright (C) 2020  Intel Corporation. All rights reserved.
 Your use of Intel Corporation's design tools, logic functions 
 and other software and tools, and any partner logic 
 functions, and any output files from any of the foregoing 
 (including device programming or simulation files), and any 
 associated documentation or information are expressly subject 
 to the terms and conditions of the Intel Program License 
 Subscription Agreement, the Intel Quartus Prime License Agreement,
 the Intel FPGA IP License Agreement, or other applicable license
 agreement, including, without limitation, that your use is for
 the sole purpose of programming logic devices manufactured by
 Intel and sold by Intel or its authorized distributors.  Please
 refer to the applicable agreement for further details, at
 https://fpgasoftware.intel.com/eula.
*/
MODEL
/*MODEL HEADER*/
/*
 This file contains Slow Corner delays for the design using part EP4CE6E22C6
 with speed grade 6, core voltage 1.2V, and temperature 85 Celsius

*/
MODEL_VERSION "1.0";
DESIGN "SerialTransmitter";
DATE "06/04/2026 23:08:26";
PROGRAM "Quartus Prime";



INPUT clkPB;
INPUT rst;
INPUT clk;
INPUT serIn;
OUTPUT SerOut;
OUTPUT SerOutValid;
OUTPUT Seg[0];
OUTPUT Seg[1];
OUTPUT Seg[2];
OUTPUT Seg[3];
OUTPUT Seg[4];
OUTPUT Seg[5];
OUTPUT Seg[6];
OUTPUT count_out[0];
OUTPUT count_out[1];
OUTPUT count_out[2];
OUTPUT count_out[3];

/*Arc definitions start here*/
pos_clkPB__clk__setup:		SETUP (POSEDGE) clkPB clk ;
pos_rst__clk__setup:		SETUP (POSEDGE) rst clk ;
pos_serIn__clk__setup:		SETUP (POSEDGE) serIn clk ;
pos_clkPB__clk__hold:		HOLD (POSEDGE) clkPB clk ;
pos_rst__clk__hold:		HOLD (POSEDGE) rst clk ;
pos_serIn__clk__hold:		HOLD (POSEDGE) serIn clk ;
pos_clk__Seg[0]__delay:		DELAY (POSEDGE) clk Seg[0] ;
pos_clk__Seg[1]__delay:		DELAY (POSEDGE) clk Seg[1] ;
pos_clk__Seg[2]__delay:		DELAY (POSEDGE) clk Seg[2] ;
pos_clk__Seg[3]__delay:		DELAY (POSEDGE) clk Seg[3] ;
pos_clk__Seg[4]__delay:		DELAY (POSEDGE) clk Seg[4] ;
pos_clk__Seg[5]__delay:		DELAY (POSEDGE) clk Seg[5] ;
pos_clk__Seg[6]__delay:		DELAY (POSEDGE) clk Seg[6] ;
pos_clk__SerOut__delay:		DELAY (POSEDGE) clk SerOut ;
pos_clk__SerOutValid__delay:		DELAY (POSEDGE) clk SerOutValid ;
pos_clk__count_out[0]__delay:		DELAY (POSEDGE) clk count_out[0] ;
pos_clk__count_out[1]__delay:		DELAY (POSEDGE) clk count_out[1] ;
pos_clk__count_out[2]__delay:		DELAY (POSEDGE) clk count_out[2] ;
pos_clk__count_out[3]__delay:		DELAY (POSEDGE) clk count_out[3] ;
___7.138__delay:		DELAY  7.138 ;

ENDMODEL
