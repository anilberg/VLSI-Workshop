// -------------------------------------------------------------------------------
//		Copyright 2022 Anil Berk
//
//		Licensed under the Apache License, Version 2.0 (the "License");
//   	you may not use this file except in compliance with the License.
//   	You may obtain a copy of the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
//   	Unless required by applicable law or agreed to in writing, software
//   	distributed under the License is distributed on an "AS IS" BASIS,
//   	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//   	See the License for the specific language governing permissions and
//   	limitations under the License.
//
// 	author		: 	@anilberg
//		project		:	VLSI Wokshop - Adders
// 	module		:	Carry Skip Adder Module
// 	Description	:	
//
// 	Date			:	9 JUL 2022
// 	Version		:	1.0
// -------------------------------------------------------------------------------

`timescale 10ns/1ps
// -------------------------------------------------------------------------------
// ----------------------- Carry Skip Adder Module -------------------------------
module csa_submodule
(			//Inputs
			input 	A_i,
			input 	B_i,
			input		C_i,
			//Outputs
			output 	S_o,	//Sum
			output 	C_o	//Carry Out
);

// ------------------------ Propagate and Signal ---------------------------------
wire P_w;

assign P_w = A_i ^ B_i;

// ------------------------ Initializing Outputs ---------------------------------
assign S_o = P_w ^ C_i;
assign C_o = (A_i & B_i) | (P_w & C_i);

endmodule
// ------------------------ CS Adder Submodule End -------------------------------

// -------------------------------------------------------------------------------
// --------------------------- CS Adder Module  ----------------------------------
module cs_adder
#(
					parameter WIDTH = 32
)
(					//Inputs
					input 	[WIDTH-1:0] Number1_i,
					input 	[WIDTH-1:0] Number2_i,
					input 					Carry_i,
					//Outputs
					output  	[WIDTH-1:0] Result_o,
					output  		  			Carry_o
);

//To keep carry outs for each CLA module
wire [WIDTH-2:0] c_o;

// ---------------------------- Submodules  --------------------------------------
generate
	genvar j;
	
	for (j = 0; j < WIDTH; j = j + 1) begin	:csa
		//First CS Adder Block
		if (j == 0) begin
			csa_submodule csa
			(			//Inputs
						.A_i(Number1_i[j]),
						.B_i(Number2_i[j]),
						.C_i(Carry_i),
						//Outputs
						.S_o(Result_o[j]),	//Sum
						.C_o(c_o[j])			//Carry Out
			);
		//Last CS Adder Block
		end else if (j == WIDTH - 1) begin
			csa_submodule csa
			(			//Inputs
						.A_i(Number1_i[j]),
						.B_i(Number2_i[j]),
						.C_i(c_o[j-1]),
						//Outputs
						.S_o(Result_o[j]),	//Sum
						.C_o(Carry_o)			//Carry Out
			);
		//Generate Other CS Adder Blocks
		end else begin
			csa_submodule csa
			(			//Inputs
						.A_i(Number1_i[j]),
						.B_i(Number2_i[j]),
						.C_i(c_o[j-1]),
						//Outputs
						.S_o(Result_o[j]),	//Sum
						.C_o(c_o[j])			//Carry Out
			);
		end
	end
endgenerate

endmodule
// ------------------------- CS Adder Module End  --------------------------------
// -------------------------------- EOF ------------------------------------------