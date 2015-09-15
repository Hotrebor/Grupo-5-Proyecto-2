`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Roberto Chaves García, Johnny Barboza Fallas
// 
// Create Date:    11:47:04 09/01/2015 
// Design Name: 
// Module Name:    Circuito_total 
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
module Circuito_total(clk,reset,ps2d,ps2c,rx_en,ledtb, ledprv, ext1, boc1, boc2, int_fe,AN,CN);
//asignacion de entradas y salidas//
	input wire clk, reset;
	input wire ps2d, ps2c, rx_en;
	output  ledtb, ledprv, ext1, boc1, boc2, int_fe;
	output [3:0] AN;
	output [6:0]CN;
	
	wire rx_done_tick,rx;
	wire [7:0] dout, dsal2, dsal;
	wire enable;
	wire [7:0] bus_validacion;
	wire habife, habiglp,habias, habiha, habihm;
	assign rx= ~ rx_done_tick;
	
	
	Teclado entrada_teclado (
    .clk(clk), 
    .reset(reset), 
    .ps2d(ps2d), 
    .ps2c(ps2c), 
    .rx_en(rx_en), 
    .rx_done_tick(rx_done_tick), 
    .dout(dout)
    );
	 
	 
	FFSMF0 detector_F0 (
    .clk(clk), 
    .dato(dsal), 
    .reset(reset), 
    .enable(enable)
    );
	  
	Registro_dato Registro (
		 .clk(clk), 
		 .enable_rx(rx_done_tick),
		 .reset(reset),
		 .datoin(dout), 
		 .datosal(dsal)
		 );
	

	
	 Bandera_validacion Validacion_letra_guardada (
    .clk(clk), 
    .dato(dsal), 
    .reset(reset), 
    .enable(bus_validacion),
	 .bandera(enable)
    );

	 Decodificador_teclado Deco_datos_val(
    .clk(clk), 
    .enable(bus_validacion[7:3]), 
    .habiha(habiha), 
    .habihm(habihm)
    );

	 
	Unidad_Circuito Proyecto_1 (
    .clk(clk), 
    .reset(reset), 
    .humoa(habiha), 
    .glp(bus_validacion[2]), 
    .humom(habihm), 
    .fe(bus_validacion[1]), 
    .apagsis(bus_validacion[0]), 
    .ledtb(ledtb), 
    .ledprv(ledprv), 
    .ext1(ext1), 
    .boc1(boc1), 
    .boc2(boc2), 
    .int_fe(int_fe), 
    .AN(AN), 
    .CN(CN)
    );



	
	
	

endmodule
