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
// 	module		:	Ripple Carry Adder Module
// 	Description	: 	
//
// 	Date			:	7 JUL 2022
// 	Version		:	1.0
// -------------------------------------------------------------------------------

`timescale 10ns/1ps
// ------------------------------- Includes --------------------------------------
`include "../src/full_adder.v"

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

// --------------------------------- Wires ---------------------------------------
wire c1,  c2,  c3,  c4,  c5,  c6,  c7,  c8,
	  c9,	 c10, c11, c12, c13, c14, c15, c16,
	  c17, c18, c19, c20, c21, c22, c23, c24,
	  c25, c26, c27, c28, c29, c30, c31;

// ------------------------------- Submodules ------------------------------------
full_adder full_adder0
(						//Inputs
						.A_i(Number1_i[0]),
						.B_i(Number2_i[0]),
						.C_i(Carry_i),
						//Outputs
						.S_o(Result_o[0]),
						.C_o(c1)
);

full_adder full_adder1
(						//Inputs
						.A_i(Number1_i[1]),
						.B_i(Number2_i[1]),
						.C_i(c1),
						//Outputs
						.S_o(Result_o[1]),
						.C_o(c2)
);

full_adder full_adder2
(						//Inputs
						.A_i(Number1_i[2]),
						.B_i(Number2_i[2]),
						.C_i(c2),
						//Outputs
						.S_o(Result_o[2]),
						.C_o(c3)
);

full_adder full_adder3
(						//Inputs
						.A_i(Number1_i[3]),
						.B_i(Number2_i[3]),
						.C_i(c3),
						//Outputs
						.S_o(Result_o[3]),
						.C_o(c4)
);

full_adder full_adder4
(						//Inputs
						.A_i(Number1_i[4]),
						.B_i(Number2_i[4]),
						.C_i(c4),
						//Outputs
						.S_o(Result_o[4]),
						.C_o(c5)
);

full_adder full_adder5
(						//Inputs
						.A_i(Number1_i[5]),
						.B_i(Number2_i[5]),
						.C_i(c5),
						//Outputs
						.S_o(Result_o[5]),
						.C_o(c6)
);

full_adder full_adder6
(						//Inputs
						.A_i(Number1_i[6]),
						.B_i(Number2_i[6]),
						.C_i(c6),
						//Outputs
						.S_o(Result_o[6]),
						.C_o(c7)
);

full_adder full_adder7
(						//Inputs
						.A_i(Number1_i[7]),
						.B_i(Number2_i[7]),
						.C_i(c7),
						//Outputs
						.S_o(Result_o[7]),
						.C_o(c8)
);

full_adder full_adder8
(						//Inputs
						.A_i(Number1_i[8]),
						.B_i(Number2_i[8]),
						.C_i(c8),
						//Outputs
						.S_o(Result_o[8]),
						.C_o(c9)
);

full_adder full_adder9
(						//Inputs
						.A_i(Number1_i[9]),
						.B_i(Number2_i[9]),
						.C_i(c9),
						//Outputs
						.S_o(Result_o[9]),
						.C_o(c10)
);

full_adder full_adder10
(						//Inputs
						.A_i(Number1_i[10]),
						.B_i(Number2_i[10]),
						.C_i(c10),
						//Outputs
						.S_o(Result_o[10]),
						.C_o(c11)
);

full_adder full_adder11
(						//Inputs
						.A_i(Number1_i[11]),
						.B_i(Number2_i[11]),
						.C_i(c11),
						//Outputs
						.S_o(Result_o[11]),
						.C_o(c12)
);

full_adder full_adder12
(						//Inputs
						.A_i(Number1_i[12]),
						.B_i(Number2_i[12]),
						.C_i(c12),
						//Outputs
						.S_o(Result_o[12]),
						.C_o(c13)
);

full_adder full_adder13
(						//Inputs
						.A_i(Number1_i[13]),
						.B_i(Number2_i[13]),
						.C_i(c13),
						//Outputs
						.S_o(Result_o[13]),
						.C_o(c14)
);

full_adder full_adder14
(						//Inputs
						.A_i(Number1_i[14]),
						.B_i(Number2_i[14]),
						.C_i(c14),
						//Outputs
						.S_o(Result_o[14]),
						.C_o(c15)
);

full_adder full_adder15
(						//Inputs
						.A_i(Number1_i[15]),
						.B_i(Number2_i[15]),
						.C_i(c15),
						//Outputs
						.S_o(Result_o[15]),
						.C_o(c16)
);

full_adder full_adder16
(						//Inputs
						.A_i(Number1_i[16]),
						.B_i(Number2_i[16]),
						.C_i(c16),
						//Outputs
						.S_o(Result_o[16]),
						.C_o(c17)
);

full_adder full_adder17
(						//Inputs
						.A_i(Number1_i[17]),
						.B_i(Number2_i[17]),
						.C_i(c17),
						//Outputs
						.S_o(Result_o[17]),
						.C_o(c18)
);

full_adder full_adder18
(						//Inputs
						.A_i(Number1_i[18]),
						.B_i(Number2_i[18]),
						.C_i(c18),
						//Outputs
						.S_o(Result_o[18]),
						.C_o(c19)
);

full_adder full_adder19
(						//Inputs
						.A_i(Number1_i[19]),
						.B_i(Number2_i[19]),
						.C_i(c19),
						//Outputs
						.S_o(Result_o[19]),
						.C_o(c20)
);

full_adder full_adder20
(						//Inputs
						.A_i(Number1_i[20]),
						.B_i(Number2_i[20]),
						.C_i(c20),
						//Outputs
						.S_o(Result_o[20]),
						.C_o(c21)
);

full_adder full_adder21
(						//Inputs
						.A_i(Number1_i[21]),
						.B_i(Number2_i[21]),
						.C_i(c21),
						//Outputs
						.S_o(Result_o[21]),
						.C_o(c22)
);

full_adder full_adder22
(						//Inputs
						.A_i(Number1_i[22]),
						.B_i(Number2_i[22]),
						.C_i(c22),
						//Outputs
						.S_o(Result_o[22]),
						.C_o(c23)
);

full_adder full_adder23
(						//Inputs
						.A_i(Number1_i[23]),
						.B_i(Number2_i[23]),
						.C_i(c23),
						//Outputs
						.S_o(Result_o[23]),
						.C_o(c24)
);

full_adder full_adder24
(						//Inputs
						.A_i(Number1_i[24]),
						.B_i(Number2_i[24]),
						.C_i(c24),
						//Outputs
						.S_o(Result_o[24]),
						.C_o(c25)
);

full_adder full_adder25
(						//Inputs
						.A_i(Number1_i[25]),
						.B_i(Number2_i[25]),
						.C_i(c25),
						//Outputs
						.S_o(Result_o[25]),
						.C_o(c26)
);

full_adder full_adder26
(						//Inputs
						.A_i(Number1_i[26]),
						.B_i(Number2_i[26]),
						.C_i(c26),
						//Outputs
						.S_o(Result_o[26]),
						.C_o(c27)
);

full_adder full_adder27
(						//Inputs
						.A_i(Number1_i[27]),
						.B_i(Number2_i[27]),
						.C_i(c27),
						//Outputs
						.S_o(Result_o[27]),
						.C_o(c28)
);

full_adder full_adder28
(						//Inputs
						.A_i(Number1_i[28]),
						.B_i(Number2_i[28]),
						.C_i(c28),
						//Outputs
						.S_o(Result_o[28]),
						.C_o(c29)
);

full_adder full_adder29
(						//Inputs
						.A_i(Number1_i[29]),
						.B_i(Number2_i[29]),
						.C_i(c29),
						//Outputs
						.S_o(Result_o[29]),
						.C_o(c30)
);

full_adder full_adder30
(						//Inputs
						.A_i(Number1_i[30]),
						.B_i(Number2_i[30]),
						.C_i(c30),
						//Outputs
						.S_o(Result_o[30]),
						.C_o(c31)
);

full_adder full_adder31
(						//Inputs
						.A_i(Number1_i[31]),
						.B_i(Number2_i[31]),
						.C_i(c31),
						//Outputs
						.S_o(Result_o[31]),
						.C_o(Carry_o)
);

endmodule
// --------------------- Ripple Carry Adder Module End ---------------------------
// -------------------------------- EOF ------------------------------------------