module datapath_tb;

reg clk;
reg reset;
reg [1:0] memtoreg;
reg pcsrc;
reg alusrc;
reg regwrite;
reg [1:0] immsrc;
reg [2:0] alucontrol;
reg [31:0] instr;
reg [31:0] readdata;

wire [31:0] pc;
wire [31:0] aluresult;
wire [31:0] writedata;
wire zero;

datapath dut(clk, reset, memtoreg, pcsrc, alusrc, regwrite, immsrc, alucontrol, zero, pc, instr, aluresult, writedata, readdata);

initial begin
	clk = 0;
	reset = 1;
	#(100);
	reset = 0;
end

always begin
	#5 clk = ~clk;
end

initial begin
	// Test case 1: add instruction
	memtoreg = 0;
	pcsrc = 0;
	alusrc = 0;
	regwrite = 1;
	immsrc = 0;
	alucontrol = 0;
	instr = 32'h00038000;
	readdata = 10;

	#(100);

	if (pc != 32'h00000004) begin
		$error("PC value is not correct");
	end

	if (aluresult != 20) begin
		$error("ALU result is not correct");
	end

	if (writedata != 20) begin
		$error("Write data is not correct");
	end

	// Test case 2: branch instruction
	memtoreg = 0;
	pcsrc = 1;
	alusrc = 0;
	regwrite = 0;
	immsrc = 1;
	alucontrol = 6;
	instr = 32'h00010000;
	readdata = 10;

	#(100);

	if (pc != 32'h00000008) begin
		$error("PC value is not correct");
	end
end

endmodule

