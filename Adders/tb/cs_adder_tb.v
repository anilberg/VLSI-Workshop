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
	
	/*
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
	*/
	
	a <= 32'd15;		b <= 32'd25;		c_i <= 1'b0;
	#10;                                      
	a <= 32'd986;		b <= 32'd3476;		c_i <= 1'b1;
	#10;                                       
	a <= 32'd4345;		b <= 32'd567;		c_i <= 1'b0;
	#10;                                      
	a <= 32'd454;		b <= 32'd134;		c_i <= 1'b1;
	#10;                             
	a <= 32'd537;		b <= 32'd7956;		c_i <= 1'b0;
	#10;                                        
	a <= 32'd3013;		b <= 32'd597;		c_i <= 1'b1;
	#10;                                        
	a <= 32'd7896;		b <= 32'd52;		c_i <= 1'b0;
	#10;                                        
	a <= 32'd3167;		b <= 32'd13467;	c_i <= 1'b1;
	#10;
end

endmodule
// -------------------------------- EOF ------------------------------------------