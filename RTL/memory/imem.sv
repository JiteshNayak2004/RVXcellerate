module imem(
	input logic [5:0] a,
	output logic [31:0] rd
);

	logic [31:0] RAM[63:0];
	
	initial begin
	RAM[0] = 32'h00500213; //addi x5,x0,5
	RAM[1] = 32'h00c00193;  //addi x3 x0 12
	RAM[2] = 32'h00310233;  //add x4 x2 x3
	RAM[3] = 32'h04402823 ; //sw x4 80 x0



	
	
	for (int i = 3; i<64; i++) begin
		RAM[i] =32'h000000000;
		end
	end
	
	assign rd = RAM[a];
endmodule

		