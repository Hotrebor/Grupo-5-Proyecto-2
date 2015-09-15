`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Roberto Chaves García
// 
// Create Date:    14:52:30 08/28/2015 
// Design Name: 
// Module Name:    Bandera_validacion 
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
module Bandera_validacion(clk, dato, reset, enable, bandera);
	input clk, reset, bandera;
	input [7:0] dato;
	output[7:0] enable;
	/*significado de cada letra conrespecto a la funcion   
				
							H41=8'h3c, 
							H40=8'h3b,
							H31=8'h35, 
							H30=8'h33,
							H21=8'h2c, 
							H20=8'h34,
							H11=8'h2d, 
							H10=8'h2b, 
							
							
							GLP1=8'h15, 
							GLP0=8'h1c, 
							
							FE1=8'h1d, 
							FE0=8'h1b, 
							
							OFF1=8'h76,
							OFF0=8'h5a;*/ 
							
	reg [7:0] enable1=8'b0;
	always @(posedge clk, posedge reset)
	begin
		if (reset)
			enable1<=8'b0;
		else if (bandera)
			begin
						if (dato == 8'h3c)
								enable1[7] <=1;
								else if (dato == 8'h3b)
										enable1[7] <=0;
										else if (dato == 8'h35)
												enable1[6] <=1;
												else if (dato == 8'h33)
														enable1[6] <=0;
														else if (dato == 8'h2c)
																enable1[5] <=1;
																else if (dato == 8'h34)
																		enable1[5] <=0;
																		else if (dato == 8'h2d)
																				enable1[4] <=1;
																				else if (dato == 8'h2b)
																						enable1[4] <=0;
																						else if (dato== 8'h24)
																								enable1[3] <=1;
																								else if (dato== 8'h23)
																										enable1[3] <=0;
																										else if (dato== 8'h15)
																												enable1[2] <=1;
																												else if (dato== 8'h1c)
																														enable1[2] <=0;
																														else if (dato== 8'h1d)
																																enable1[1] <=1;
																																else if (dato== 8'h1b)
																																		enable1[1] <=0;
																																		else if (dato== 8'h76)
																																				enable1[0] <=1;
																																				else if (dato== 8'h5a)
																																						enable1[0] <=0;
			end									
		end
	
	assign enable = enable1;

endmodule
