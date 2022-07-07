`timescale 10ns/1ps
// -------------------- Full Adder Module Testbench ------------------------------
module ripple_carry_adder_tb();

parameter WIDTH = 32;

reg 		  clk;
reg [WIDTH-1:0] a, b;
reg 		  c_i;
wire 		  c_o;
wire [WIDTH-1:0] s;

ripple_carry_adder #(
								.WIDTH(32)
)
ripple_carry_adder1
(
								.Number1_i(a),
								.Number2_i(b),
								.Carry_i(c_i),
								
								.Result_o(s),
								.Carry_o(c_o)
);
initial begin
	$dumpfile("ripple_carry_adder.vcd");
	$dumpvars(0, ripple_carry_adder_tb);
	
	#100 $finish;
end

initial begin
	a <= 32'd4294967295;	b <= 32'b1;	c_i <= 1'b0;
	#10;
	a <= 32'd4294967295;	b <= 32'b1;	c_i <= 1'b1;
	#10;
	a <= 64'b0;	b <= 64'b1;	c_i <= 1'b0;
	#10;
	a <= 64'b1;	b <= 64'b1;	c_i <= 1'b0;
	#10;
	a <= 64'b0;	b <= 64'b0;	c_i <= 1'b1;
	#10;
	a <= 64'b1;	b <= 64'b0;	c_i <= 1'b1;
	#10;
	a <= 64'b0;	b <= 64'b1;	c_i <= 1'b1;
	#10;
	a <= 64'b1;	b <= 64'b1;	c_i <= 1'b1;
	#10;
end

endmodule
// -------------------------------- EOF ------------------------------------------