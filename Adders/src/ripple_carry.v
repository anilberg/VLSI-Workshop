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
// 	module		:	Ripple Carry Adder Module
// 	Description	: 	
//
// 	Date			:	8 JUL 2022
// 	Version		:	1.1
// -------------------------------------------------------------------------------

`timescale 10ns/1ps
// -------------------------------------------------------------------------------
// ------------------------- Full Adder Module -----------------------------------
module full_adder
(					//Inputs
					input 		A_i,
					input 		B_i,
					input			C_i,
					//Outputs
					output	S_o,
					output	C_o
);

// --------------------------- Define Outputs ------------------------------------
assign S_o = A_i ^ B_i ^ C_i;
assign C_o = ((A_i ^ B_i) & C_i) | (A_i & B_i);

endmodule
// ----------------------- Full Adder Module End ---------------------------------

// -------------------------------------------------------------------------------
// ----------------------- Ripple Carry Adder Module -----------------------------
module ripple_carry
#(
					parameter WIDTH = 32
)
(					//Inputs
					input 	[WIDTH-1:0] Number1_i,
					input 	[WIDTH-1:0] Number2_i,
					input					 	Carry_i,
					//Outputs
					output 	[WIDTH-1:0] Result_o,
					output 			 		Carry_o
);

//To keep carry outs for each FA module
wire [WIDTH-2:0] c_o;

//First Full Adder Block
full_adder fa0
(				//Inputs
				.A_i(Number1_i[0]),
				.B_i(Number2_i[0]),
				.C_i(Carry_i),
				//Outputs
				.S_o(Result_o[0]),
				.C_o(c_o[0])
);

//Last Full Adder Block
full_adder fa_last
(				//Inputs
				.A_i(Number1_i[WIDTH-1]),
				.B_i(Number2_i[WIDTH-1]),
				.C_i(c_o[WIDTH-2]),
				//Outputs
				.S_o(Result_o[WIDTH-1]),
				.C_o(Carry_o)
);

//Generate Other Full Adder Blocks
generate
	genvar j;

	for (j = 1; j < WIDTH - 1; j = j + 1) begin :fa
		full_adder fa
		(				//Inputs
						.A_i(Number1_i[j]),
						.B_i(Number2_i[j]),
						.C_i(c_o[j-1]),
						//Outputs
						.S_o(Result_o[j]),
						.C_o(c_o[j])
		);
	end
endgenerate

endmodule
// --------------------- Ripple Carry Adder Module End ---------------------------
// -------------------------------- EOF ------------------------------------------