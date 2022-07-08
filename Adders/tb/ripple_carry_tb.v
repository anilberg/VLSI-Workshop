`timescale 10ns/1ps
`include "../src/ripple_carry.v"
// ------------------- Ripple Carry Adder Module Testbench -----------------------
module ripple_carry_tb();

parameter WIDTH_PARAM = 64;

reg 	[WIDTH_PARAM-1:0] a, b;
reg 		  					c_i;
wire 		  					c_o;
wire 	[WIDTH_PARAM-1:0] s;

ripple_carry
#(
				.WIDTH(WIDTH_PARAM)
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
/*
	a <= 4'b0000;	b <= 4'b0000;	c_i <= 1'b0;
	#10;
	a <= 4'b0001;	b <= 4'b0001;	c_i <= 1'b1;
	#10;
	a <= 4'b0010;	b <= 4'b0010;	c_i <= 1'b0;
	#10; 
	a <= 4'b0011;	b <= 4'b0011;	c_i <= 1'b0;
	#10;
	a <= 4'b0100;	b <= 4'b0100;	c_i <= 1'b1;
	#10;
	a <= 4'b0101;	b <= 4'b0101;	c_i <= 1'b1;
	#10;
	a <= 4'b0110;	b <= 4'b0110;	c_i <= 1'b1;
	#10;
	a <= 4'b0111;	b <= 4'b0111;	c_i <= 1'b1;
	#10;
*/
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

/*
	a <= 32'hFFFF_FFFF;	b <= 32'h0000_0001;	c_i <= 1'b0;
	#10;                                               
	a <= 32'hFFFF_FFFF;	b <= 32'h0000_0001;	c_i <= 1'b1;
	#10;                                               
	a <= 32'h0000_0000;	b <= 32'h0000_0001;	c_i <= 1'b0;
	#10;                                               
	a <= 32'h0000_0000;	b <= 32'h0000_0001;	c_i <= 1'b0;
	#10;                                               
	a <= 32'h0000_0000;	b <= 32'h0000_0001;	c_i <= 1'b1;
	#10;                                               
	a <= 32'h0000_0000;	b <= 32'h0000_0001;	c_i <= 1'b1;
	#10;                                               
	a <= 32'h0000_0000;	b <= 32'h0000_0001;	c_i <= 1'b1;
	#10;                                               
	a <= 32'h0000_0000;	b <= 32'h0000_0001;	c_i <= 1'b1;
	#10;
	*/
end

endmodule
// -------------------------------- EOF ------------------------------------------