`timescale 10ns/1ps
`include "../src/ripple_carry.v"
// ------------------- Ripple Carry Adder Module Testbench -----------------------
module ripple_carry_tb();

parameter WIDTH = 32;

reg 		  clk;
reg [WIDTH-1:0] a, b;
reg 		  c_i;
wire 		  c_o;
wire [WIDTH-1:0] s;

ripple_carry
#(
				.WIDTH(32)
)
ripple_carry1
(				//Inputs
				.Number1_i(	a),
				.Number2_i(	b),
				.Carry_i(	c_i),
				//Outputs
				.Result_o(	s),
				.Carry_o(	c_o)
);
initial begin
	$dumpfile("ripple_carry.vcd");
	$dumpvars(0, ripple_carry_tb);
	
	#100 $finish;
end

initial begin
	a <= 32'hFFFF_FFFF;	b <= 32'b1;	c_i <= 1'b0;
	#10;
	a <= 32'hFFFF_FFFF;	b <= 32'b1;	c_i <= 1'b1;
	#10;
	a <= 32'b0;	b <= 32'b1;	c_i <= 1'b0;
	#10;             
	a <= 32'b1;	b <= 32'b1;	c_i <= 1'b0;
	#10;             
	a <= 32'b0;	b <= 32'b0;	c_i <= 1'b1;
	#10;             
	a <= 32'b1;	b <= 32'b0;	c_i <= 1'b1;
	#10;             
	a <= 32'b0;	b <= 32'b1;	c_i <= 1'b1;
	#10;             
	a <= 32'b1;	b <= 32'b1;	c_i <= 1'b1;
	#10;
end

endmodule
// -------------------------------- EOF ------------------------------------------