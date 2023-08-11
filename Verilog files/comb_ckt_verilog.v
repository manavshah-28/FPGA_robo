// Copyright (C) 2022  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and any partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details, at
// https://fpgasoftware.intel.com/eula.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 21.1.1 Build 850 06/23/2022 SJ Lite Edition"
// CREATED		"Fri Sep 23 22:26:23 2022"

module comb_ckt_verilog(
	D1,
	D2,
	D3,
	D4,
	D5,
	D6,
	D7,
	D0,
	out
);


input wire	D1;
input wire	D2;
input wire	D3;
input wire	D4;
input wire	D5;
input wire	D6;
input wire	D7;
input wire	D0;
output wire	out;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_18;

assign	SYNTHESIZED_WIRE_15 = 1;
assign	SYNTHESIZED_WIRE_16 = 0;



assign	SYNTHESIZED_WIRE_2 = D7 | D5 | D4 | D6;

assign	SYNTHESIZED_WIRE_17 = D7 | D3 | D2 | D6;

assign	SYNTHESIZED_WIRE_18 = D7 | D3 | D1 | D5;


Mux_2_to_1	b2v_inst3(
	.in1(SYNTHESIZED_WIRE_0),
	.in0(SYNTHESIZED_WIRE_1),
	.s0(SYNTHESIZED_WIRE_2),
	.y(out));


Mux_4_to_1	b2v_inst4(
	.I3(SYNTHESIZED_WIRE_15),
	.I2(SYNTHESIZED_WIRE_16),
	.I1(SYNTHESIZED_WIRE_16),
	.I0(SYNTHESIZED_WIRE_15),
	.S1(SYNTHESIZED_WIRE_17),
	.S0(SYNTHESIZED_WIRE_18),
	.out(SYNTHESIZED_WIRE_0));


Mux_4_to_1	b2v_inst5(
	.I3(SYNTHESIZED_WIRE_15),
	.I2(SYNTHESIZED_WIRE_15),
	.I1(SYNTHESIZED_WIRE_16),
	.I0(SYNTHESIZED_WIRE_16),
	.S1(SYNTHESIZED_WIRE_17),
	.S0(SYNTHESIZED_WIRE_18),
	.out(SYNTHESIZED_WIRE_1));




endmodule
