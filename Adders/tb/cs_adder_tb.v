`timescale 10ns/1ps
`include "../src/cs_adder.v"
// -------------------- Carry Skip Adder Module Testbench ------------------------
module cs_adder_tb();

parameter WIDTH_PARAM = 32;

reg 	[WIDTH_PARAM-1:0] a, b;
reg 			c_i;
wire  [WIDTH_PARAM-1:0] s;
wire 			p, c_o;

cs_adder
#(
			.WIDTH(WIDTH_PARAM)
)
cs_adder1
(			//Inputs
			.Number1_i(		a),
			.Number2_i(		b),
			.Carry_i(		c_i),
			//Outputs
			.Result_o(		s),
			.Carry_o(		c_o)
);
initial begin
	$dumpfile("cs_adder.vcd");
	$dumpvars(0, cs_adder_tb);
	
	#100 $finish;
end

initial begin
	a <= 32'h9805_0EAA;	b <= 32'hE8E7_F6EA;	c_i <= 1'b0;
	#10;                                               
	a <= 32'h0DAB_5C93;	b <= 32'hCD41_F8D6;	c_i <= 1'b1;
	#10;                                               
	a <= 32'h1C86_CC9A;	b <= 32'hC926_4861;	c_i <= 1'b0;
	#10;                                               
	a <= 32'h9D6B_27C9;	b <= 32'hEE5_86C70;	c_i <= 1'b0;
	#10;                                               
	a <= 32'h515D_B61C;	b <= 32'hA7A5_38C1;	c_i <= 1'b1;
	#10;                                               
	a <= 32'h2CB8_5EE3;	b <= 32'hF4EE_199D;	c_i <= 1'b1;
	#10;                                               
	a <= 32'hFFFF_FFFF;	b <= 32'h0000_0000;	c_i <= 1'b1;
	#10;                                               
	a <= 32'hFFFF_FFFF;	b <= 32'h0000_0001;	c_i <= 1'b1;
	#10;
end

endmodule
// -------------------------------- EOF ------------------------------------------
