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
// 	module		:	8-bit Carry Look Ahead Adder Module
// 	Description	: 	This is 8-bit CLA submodule
//
// 	Date			:	8 JUL 2022
// 	Version		:	1.0
// -------------------------------------------------------------------------------

`timescale 10ns/1ps
// -------------------------------------------------------------------------------
// --------------------- Carry Look Ahead Adder Module ---------------------------
module cla
(			//Inputs
			input 		A_i,
			input 		B_i,
			input			C_i,
			//Outputs
			output reg	P_o,		//Carry Propagate
			output reg	G_o,		//Carry Generate
			output reg	S_o,		//Sum
			output reg	C_o		//Carry Out
);

// ------------------------ Initializing Outputs ---------------------------------
initial begin
	P_o <= 1'b0;
	G_o <= 1'b0;
	S_o <= 1'b0;
	C_o <= 1'b0;
end

always @ * begin
	P_o <= A_i ^ B_i;
	G_o <= A_i & B_i;
	S_o <= P_o ^ C_i;
	C_o <= G_o | (P_o & C_i);
end


endmodule
// ------------------ Carry Look Ahead Adder Module End --------------------------

// -------------------------------------------------------------------------------
// ------------------------ 8-bit CLA Top Module  --------------------------------
module cla_8bit
(					//Inputs
					input 	[7:0] Number1_i,
					input 	[7:0] Number2_i,
					input 			Carry_i,
					//Outputs
					output  	[7:0] Result_o,
					output   	  	Propagate_o,
					output   	  	Generate_o,
					output  		  	Carry_o
);

// --------------------------------- Wires ---------------------------------------
wire p0, p1, p2, p3, p4, p5, p6;
wire g0, g1, g2, g3, g4, g5, g6;
wire c0, c1, c2, c3, c4, c5, c6;

// ------------------------------ Submodules -------------------------------------
cla cla0
(			//Inputs
			.A_i(Number1_i[0]),
			.B_i(Number2_i[0]),
			.C_i(Carry_i),
			//Outputs
			.S_o(Result_o[0]),
			.P_o(p0),
			.G_o(g0),
			.C_o(c0)
);

cla cla1
(			//Inputs
			.A_i(Number1_i[1]),
			.B_i(Number2_i[1]),
			.C_i(c0),
			//Outputs
			.S_o(Result_o[1]),
			.P_o(p1),
			.G_o(g1),
			.C_o(c1)
);

cla cla2
(			//Inputs
			.A_i(Number1_i[2]),
			.B_i(Number2_i[2]),
			.C_i(c1),
			//Outputs
			.S_o(Result_o[2]),
			.P_o(p2),
			.G_o(g2),
			.C_o(c2)
);

cla cla3
(			//Inputs
			.A_i(Number1_i[3]),
			.B_i(Number2_i[3]),
			.C_i(c2),
			//Outputs
			.S_o(Result_o[3]),
			.P_o(p3),
			.G_o(g3),
			.C_o(c3)
);

cla cla4
(			//Inputs
			.A_i(Number1_i[4]),
			.B_i(Number2_i[4]),
			.C_i(c3),
			//Outputs
			.S_o(Result_o[4]),
			.P_o(p4),
			.G_o(g4),
			.C_o(c4)
);

cla cla5
(			//Inputs
			.A_i(Number1_i[5]),
			.B_i(Number2_i[5]),
			.C_i(c4),
			//Outputs
			.S_o(Result_o[5]),
			.P_o(p5),
			.G_o(g5),
			.C_o(c5)
);

cla cla6
(			//Inputs
			.A_i(Number1_i[6]),
			.B_i(Number2_i[6]),
			.C_i(c5),
			//Outputs
			.S_o(Result_o[6]),
			.P_o(p6),
			.G_o(g6),
			.C_o(c6)
);

cla cla7
(			//Inputs
			.A_i(Number1_i[7]),
			.B_i(Number2_i[7]),
			.C_i(c6),
			//Outputs
			.S_o(Result_o[7]),
			.P_o(Propagate_o),
			.G_o(Generate_o),
			.C_o(Carry_o)
);

endmodule
// ---------------------- 8-bit CLA Top Module End  ------------------------------
// -------------------------------- EOF ------------------------------------------