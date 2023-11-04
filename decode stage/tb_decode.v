module testbench;

  reg [31:0] instruction;
  wire [6:0] opcode;
  wire [4:0] rd;
  wire [4:0] rs1;
  wire [4:0] rs2;
  wire [6:0] funct3;
  wire [6:0] funct7;
  wire [6:0] imm_type;
  wire [6:0] operation;

  // Instantiate the module
  riscv_instruction_decoder decoder (
    .instruction(instruction),
    .opcode(opcode),
    .rd(rd),
    .rs1(rs1),
    .rs2(rs2),
    .funct3(funct3),
    .funct7(funct7),
    .imm_type(imm_type),
    .operation(operation)
  );

  // Clock generation
  reg clk;
  always begin
    #5 clk = ~clk;
  end

  initial begin
    // Initialize clock
    clk = 0;

    // Manually specified R-type and I-type instructions
    // Example 1: ADD (R-Type)
    instruction = 32'h00030333;
    #10;
    $display("Instruction: %h, Operation: %h (ADD)", instruction, operation);

    // Example 2: SUB (R-Type)
    instruction = 32'h00120233;
    #10;
    $display("Instruction: %h, Operation: %h (SUB)", instruction, operation);

    // Example 3: XOR (R-Type)
    instruction = 32'h00222433;
    #10;
    $display("Instruction: %h, Operation: %h (XOR)", instruction, operation);

    // Example 4: SLL (R-Type)
    instruction = 32'h00323533;
    #10;
    $display("Instruction: %h, Operation: %h (SLL)", instruction, operation);

    // Example 5: ADDI (I-Type)
    instruction = 32'h00312013;
    #10;
    $display("Instruction: %h, Operation: %h (ADDI)", instruction, operation);

    // Example 6: SLTI (I-Type)
    instruction = 32'h00443113;
    #10;
    $display("Instruction: %h, Operation: %h (SLTI)", instruction, operation);

    // Example 7: XORI (I-Type)
    instruction = 32'h00572213;
    #10;
    $display("Instruction: %h, Operation: %h (XORI)", instruction, operation);

    // Example 8: SLLI (I-Type)
    instruction = 32'h00634313;
    #10;
    $display("Instruction: %h, Operation: %h (SLLI)", instruction, operation);

    // Example 9: ORI (I-Type)
    instruction = 32'h00715313;
    #10;
    $display("Instruction: %h, Operation: %h (ORI)", instruction, operation);

    // Example 10: ANDI (I-Type)
    instruction = 32'h00826413;
    #10;
    $display("Instruction: %h, Operation: %h (ANDI)", instruction, operation);

    // Finish simulation
    $finish;
  end

endmodule

