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
// 	module		:	8-bit Carry Look Ahead Adder Module
// 	Description	: 	This is 8-bit CLA submodule
//
// 	Date			:	8 JUL 2022
// 	Version		:	1.1
// -------------------------------------------------------------------------------

`timescale 10ns/1ps
// -------------------------------------------------------------------------------
// --------------------- Carry Look Ahead Adder Module ---------------------------
module cla_submodule
(			//Inputs
			input 	A_i,
			input 	B_i,
			input		C_i,
			//Outputs
			output 	S_o,	//Sum
			output 	C_o	//Carry Out
);

// ------------------- Propagate and Generate Signals ----------------------------
wire P_w, G_w;

assign P_w = A_i ^ B_i;
assign G_w = A_i & B_i;

// ------------------------ Initializing Outputs ---------------------------------
assign S_o = P_w ^ C_i;
assign C_o = G_w | (P_w & C_i);

endmodule
// ------------------------- CLA Submodule End -----------------------------------

// -------------------------------------------------------------------------------
// ---------------------------- CLA Module  --------------------------------------
module cla_adder
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
wire [WIDTH-2:0] p_o, g_o, s_o, c_o;

// ---------------------------- Submodules  --------------------------------------
//First CLA Adder Block
cla_submodule cla0
(				//Inputs
				.A_i(Number1_i[0]),
				.B_i(Number2_i[0]),
				.C_i(Carry_i),
				//Outputs
				.S_o(Result_o[0]),	//Sum
				.C_o(c_o[0])			//Carry Out
);

//Last CLA Adder Block
cla_submodule cla_last
(				//Inputs
				.A_i(Number1_i[WIDTH-1]),
				.B_i(Number2_i[WIDTH-1]),
				.C_i(c_o[WIDTH-2]),
				//Outputs
				.S_o(Result_o[WIDTH-1]),	//Sum
				.C_o(Carry_o)					//Carry Out
);

//Generate Other CLA Adder Blocks
generate
	genvar j;
	
	for (j = 1; j < WIDTH - 1; j = j + 1) begin :cla
		cla_submodule cla_last
		(		//Inputs
				.A_i(Number1_i[j]),
				.B_i(Number2_i[j]),
				.C_i(c_o[j-1]),
				//Outputs
				.S_o(Result_o[j]),	//Sum
				.C_o(c_o[j])			//Carry Out
		);

	end
endgenerate

endmodule
// ------------------------- CLA Adder Module End  -------------------------------
// -------------------------------- EOF ------------------------------------------