`timescale 10ns/1ps
`include "../src/cla_8bit.v"
// -------------------- Full Adder Module Testbench ------------------------------
module cla_8bit_tb();

reg 	[7:0] a, b;
reg 			c_i;
wire  [7:0] s;
wire 			p, g, c_o;

cla_8bit cla_8bit1
(						//Inputs
						.Number1_i(		a),
						.Number2_i(		b),
						.Carry_i(		c_i),
						//Outputs
						.Propagate_o(	p),
						.Generate_o(	g),
						.Result_o(		s),
						.Carry_o(		c_o)
);
initial begin
	$dumpfile("cla_8bit.vcd");
	$dumpvars(0, cla_8bit_tb);
	
	#100 $finish;
end

initial begin
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
	#10;
end

endmodule
// -------------------------------- EOF ------------------------------------------