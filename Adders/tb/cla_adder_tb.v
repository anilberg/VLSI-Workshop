`timescale 10ns/1ps
`include "../src/cla_adder.v"
// -------------------- Carry Look Ahead Module Testbench ------------------------
module cla_adder_tb();

parameter WIDTH_PARAM = 32;

reg 	[WIDTH_PARAM-1:0] a, b;
reg 			c_i;
wire  [WIDTH_PARAM-1:0] s;
wire 			p, g, c_o;

cla_adder
#(
			.WIDTH(WIDTH_PARAM)
)
cla_adder1
(			//Inputs
			.Number1_i(		a),
			.Number2_i(		b),
			.Carry_i(		c_i),
			//Outputs
			//.Propagate_o(	p),
			//.Generate_o(	g),
			.Result_o(		s),
			.Carry_o(		c_o)
);
initial begin
	$dumpfile("cla_adder.vcd");
	$dumpvars(0, cla_adder_tb);
	
	#100 $finish;
end

initial begin
/*
	a <= 8'b0;	b <= 8'b0;	c_i <= 1'b0;
	#10;             
	a <= 8'b1;	b <= 8'b0;	c_i <= 1'b0;
	#10;             
	a <= 8'b0;	b <= 8'b1;	c_i <= 1'b0;
	#10;             
	a <= 8'b1;	b <= 8'b1;	c_i <= 1'b0;
	#10;             
	a <= 8'b0;	b <= 8'b0;	c_i <= 1'b1;
	#10;             
	a <= 8'b1;	b <= 8'b0;	c_i <= 1'b1;
	#10;             
	a <= 8'b0;	b <= 8'b1;	c_i <= 1'b1;
	#10;             
	a <= 8'b1;	b <= 8'b1;	c_i <= 1'b1;
	#10;*/
	
	a <= 16'd15;		b <= 16'd25;		c_i <= 1'b0;
	#10;                                         
	a <= 16'd986;		b <= 16'd3476;		c_i <= 1'b1;
	#10;                                          
	a <= 16'd4345;		b <= 16'd567;		c_i <= 1'b0;
	#10;                                         
	a <= 16'd454;		b <= 16'd134;		c_i <= 1'b1;
	#10;                      
	a <= 16'd537;		b <= 16'd7956;		c_i <= 1'b0;
	#10;                                           
	a <= 16'd3013;		b <= 16'd597;		c_i <= 1'b1;
	#10;                                           
	a <= 16'd7896;		b <= 16'd52;		c_i <= 1'b0;
	#10;                                           
	a <= 16'd3167;		b <= 16'd13467;	c_i <= 1'b1;
	#10;
end

endmodule
// -------------------------------- EOF ------------------------------------------