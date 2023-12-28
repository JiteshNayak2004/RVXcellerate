module immext(input logic [31:7] instr,
					input logic [1:0] immsrc,
					output logic [31:0] immext);
					

	always_comb
		case(immsrc)
		
		2'b00: immext = {{21{instr[31]}},instr[30:20]}; // I-type
		//explanation : immediate value in isa is 12 bits and is at index
		//values 31-20 , so we need to convert 12 bits to 32
		
		
		2'b01: immext = {{21{instr[31]}}, instr[30:25], instr[11:7]}; // S-type
		//immediate value is stored from 31-25 and 11-7 which needs to be extended.
		
		2'b10: immext = {{20{instr[31]}}, instr[7], instr[30:25], instr[11:8], 1'b0}; //B-type
		// immediate value is 12 bits long but 1 binary 0 is added at the end and sign is extended by 20 bits
		
		2'b11: immext = {{12{instr[31]}}, instr[19:12], instr[20], instr[30:21], 1'b0}; // jal
		//imm value is 20 bits long which is extended to 32 bits
		
		default: immext = 32'bx;
	endcase
	
endmodule