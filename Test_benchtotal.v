`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:Roberto Chaves García, Johnny Barboza Fallas
//
// Create Date:   23:30:42 09/07/2015
// Design Name:   Circuito_total
// Module Name:   C:/Users/ROBERTO/Dropbox/Universidad/II semestre 2015/Lab de digitales/Proyectos/Proyecto_2/Test_Proyecto_2.v
// Project Name:  Proyecto_2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Circuito_total
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test_Proyecto_2;

	// Inputs
	reg clk;
	reg reset;
	reg ps2d;
	reg ps2c;
	reg rx_en;

	// Outputs
	wire ledtb;
	wire ledprv;
	wire ext1;
	wire boc1;
	wire boc2;
	wire int_fe;
	wire [3:0] AN;
	wire [6:0] CN;

	// Instantiate the Unit Under Test (UUT)
	Circuito_total uut (
		.clk(clk), 
		.reset(reset), 
		.ps2d(ps2d), 
		.ps2c(ps2c), 
		.rx_en(rx_en), 
		.ledtb(ledtb), 
		.ledprv(ledprv), 
		.ext1(ext1), 
		.boc1(boc1), 
		.boc2(boc2), 
		.int_fe(int_fe), 
		.AN(AN), 
		.CN(CN)
	);

integer i,j;
reg [10:0] temporal;//{1,8'H,2b'00}
reg [10:0] Mem [0:24];//Datos guardados en un archivo txt
reg enable_ps2c;// habilitador del clk del ps2
	
	
	
	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		ps2d = 0;
		ps2c = 1;
		rx_en = 1;
		enable_ps2c=0;
		$readmemb("entradas.txt",Mem);
	repeat(5) @(posedge clk)
		reset=0;
	end
	
	
	initial begin
		@(negedge reset)// cuando el reset se hace 0
			for(j=0;j<25;j=j+1)
				begin
				temporal=Mem[j];
				repeat(5)@(posedge clk)// se espera 5 clks
				enable_ps2c=1;//habilita el CLK del ps2c
				for (i=0;i<11;i=i+1)
					begin
						@(negedge ps2c)
						ps2d=temporal[i];
					end
				ps2d=1;//para representar bien el ps2c
				enable_ps2c=0;		
				end
				$stop;
		end
initial begin 
	@(posedge enable_ps2c)
	while(enable_ps2c)
	#500 ps2c=~ps2c;
	end

		


	initial forever begin 
		#5 clk= ~clk;
		end
        
		// Add stimulus here


      
endmodule
