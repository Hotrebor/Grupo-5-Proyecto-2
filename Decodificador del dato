`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Johnny Barboza Fallas , Roberto Chaves Garcia
// 
// Create Date:    19:05:36 08/31/2015 
// Design Name: 
// Module Name:    Decodificador_teclado 
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
module Decodificador_teclado(clk, enable, habiha, habihm);
	input [4:0] enable;
	input clk;
	output reg habiha, habihm;
	always @(posedge clk)
		begin
			if (enable[4]==1)begin
					habiha = 1;
					habihm = 0;
				end
			else if (enable[0]|enable[1]|enable[2]|enable[3])begin
					habiha = 0;
					habihm = 1;
				end
			else 
				begin
					habiha = 0;
					habihm = 0;
				end
		end
endmodule
