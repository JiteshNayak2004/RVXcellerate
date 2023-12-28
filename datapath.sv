module datapath(input logic clk,reset,
					 input logic [1:0] memtoreg,
					 input logic 		 pcsrc, alusrc,
					 input logic regwrite, jump,
					 input logic [1:0] immsrc,
					 input logic [2:0] alucontrol,
					 output logic 		 zero,
					 output logic [31:0] pc,
					 input logic [31:0] instr,
					 output logic [31:0] aluresult, writedata,
					 input logic [31:0] readdata);
					 
				
  logic [4:0] writereg;
  logic [31:0] pcnext, pcplus4, pcbranch;
  logic [31:0] immnext;
  logic [31:0] A,B;
  logic [31:0] result;
  
  //pc logic
  
  fflop #(32) pcreg(clk, reset, pcnext, pc);
  adder pc_add_4(pc, 32'd4, pc_4);
  adder pc_for_branch(pc, immext, pc_branch);
  mux2 #(32) pcmux(pc_4, pc_branch, pcsrc, pc_next);
  
  // register file
  regfile rf(clk, regwrite, instr[19:15], instr[24:20],
				 instr[11:7], result, A, writedata);
  immext imm1(instr[31:7], immsrc, immext);

 // ALU logic 
  mux2 #(32) srcbmux(writedata, immext, alusrc, srcb);
  alu        a1(a, b, alucontrol, aluresult, zero);
  mux3 #(32) resmux(aluresult, readdata, pcplus4, memtoreg, result);
endmodule 
  