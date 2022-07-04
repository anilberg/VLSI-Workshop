`timescale 10ns/1ps
// -------------------- Full Adder Module Testbench ------------------------------
module full_adder_tb();

reg clk;
reg 	a, b, c_i;
wire 	s, c_o;

full_adder full_adder_1(
								.A_i(a),
								.B_i(b),
								.C_i(c_i),
								
								.S_o(s),
								.C_o(c_o)
);
initial begin
	$dumpfile("full_adder.vcd");
	$dumpvars(0, full_adder_tb);
	
	#100 $finish;
end

initial begin
	a <= 1'b0;	b <= 1'b0;	c_i <= 1'b0;
	#10;
	a <= 1'b1;	b <= 1'b0;	c_i <= 1'b0;
	#10;
	a <= 1'b0;	b <= 1'b1;	c_i <= 1'b0;
	#10;
	a <= 1'b1;	b <= 1'b1;	c_i <= 1'b0;
	#10;
	a <= 1'b0;	b <= 1'b0;	c_i <= 1'b1;
	#10;
	a <= 1'b1;	b <= 1'b0;	c_i <= 1'b1;
	#10;
	a <= 1'b0;	b <= 1'b1;	c_i <= 1'b1;
	#10;
	a <= 1'b1;	b <= 1'b1;	c_i <= 1'b1;
	#10;
end

endmodule
// -------------------------------- EOF ------------------------------------------