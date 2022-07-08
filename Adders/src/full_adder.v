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
//		project		:	VLSI Wokshop
// 	module		:	Full Adder Module
// 	Description	: 	
//
// 	Date			:	4 JUL 2022
// 	Version		:	1.0
// -------------------------------------------------------------------------------

`timescale 10ns/1ps
// -------------------------------------------------------------------------------
// -------------------------- Full Adder Module ----------------------------------
module full_adder
(					//Inputs
					input 		A_i,
					input 		B_i,
					input			C_i,
					//Outputs
					output reg	S_o,
					output reg	C_o
);

// ------------------------ Initializing Outputs ---------------------------------
initial begin
	S_o <= 1'b0;
	C_o <= 1'b0;
end

// --------------------------- Define Outputs ------------------------------------
always @ * begin
	S_o	<= A_i ^ B_i ^ C_i;
	C_o	<= ((A_i ^ B_i) & C_i) | (A_i & B_i);
end

endmodule
// ----------------------- Full Adder Module End ---------------------------------
// -------------------------------- EOF ------------------------------------------