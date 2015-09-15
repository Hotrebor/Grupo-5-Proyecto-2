`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Johnny Barboza fallas
// 
// Create Date:    22:45:21 09/07/2015 
// Design Name: 
// Module Name:    Registro_dato 
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
module Registro_dato(clk, enable_rx, reset, datoin, datosal);
	input enable_rx, clk, reset;
	input [7:0] datoin;
	output reg [7:0] datosal;
	reg [7:0] datosalpiv;
	reg [1:0] num;
	always @(posedge clk)
	begin
		if (reset)
			datosal = 8'b0;
		else if (enable_rx)
				 begin
					datosalpiv = datoin;
					num=2'b0;
				end
		if (num == 2'b0 & datosalpiv != datoin)
			begin
				datosal = datoin;
				num =2'b1;
			end
	end
endmodule
