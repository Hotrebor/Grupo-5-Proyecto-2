`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Johnny Barboza Fallas
// 
// Create Date:    23:22:23 08/24/2015 
// Design Name: 
// Module Name:    FFSMF0 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module FFSMF0(clk, dato, reset, enable);
	input clk, reset;
	input [7:0]dato;
	output reg enable;
	localparam [1:0] detectf0=2'b0, pasof0=2'b1, hold=2'b10;
	localparam [7:0] datof0 = 8'hF0;
	reg [1:0] estado_actual, estadopx;
	always@(posedge clk)
		if (reset)
			enable = 1'b0;
		else if (dato == datof0)
			enable = 1'b1;
		else
			enable = 1'b0;
		
endmodule
