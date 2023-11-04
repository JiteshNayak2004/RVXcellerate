module riscv_instruction_decoder (
    input [31:0] instruction,
    output reg [6:0] opcode,
    output reg [4:0] rd,
    output reg [4:0] rs1,
    output reg [4:0] rs2,
    output reg [6:0] funct3,
    output reg [6:0] funct7,
    output reg [6:0] imm_type,
    output reg [6:0] operation
);

always @* begin
    opcode = instruction[6:0];
    rd = instruction[11:7];
    funct3 = instruction[14:12];
    rs1 = instruction[19:15];
    rs2 = instruction[24:20];
    funct7 = instruction[31:25];
    
    case(opcode)
        7'h33: begin
            // R-type instruction
            imm_type = 7'h00;  // Not applicable for R-type
            case(funct3)
                3'h0: begin
                    case(funct7)
                        7'h00: operation = 7'h33;  // ADD
                        7'h01: operation = 7'h37;  // MUL
                        7'h20: operation = 7'h3B;  // SUB
                        7'h21: operation = 7'h3F;  // SRA
                        7'h24: operation = 7'h27;  // XOR
                        7'h25: operation = 7'h2B;  // OR
                        7'h26: operation = 7'h2F;  // AND
                        default: operation = 7'h00; // Unknown
                    endcase
                end
                3'h1: begin
                    case(funct7)
                        7'h00: operation = 7'h13;  // SLL
                        7'h01: operation = 7'h1B;  // MULH
                        default: operation = 7'h00; // Unknown
                    endcase
                end
                3'h2: operation = 7'h03;  // SLT
                3'h4: operation = 7'h17;  // XOR
                3'h5: begin
                    case(funct7)
                        7'h00: operation = 7'h07;  // SRL
                        7'h20: operation = 7'h0F;  // SRA
                        default: operation = 7'h00; // Unknown
                    endcase
                end
                3'h6: operation = 7'h1F;  // OR
                3'h7: operation = 7'h23;  // AND
                default: operation = 7'h00; // Unknown
            endcase
        end
        
        7'h13: begin
            // I-type instruction
            case(funct3)
                3'h0: begin
                    imm_type = 7'h01;  // ADDI, SLLI, etc.
                    case(funct7)
                        7'h00: operation = 7'h13;  // ADDI
                        7'h01: operation = 7'h15;  // SLLI
                        default: operation = 7'h00; // Unknown
                    endcase
                end
                3'h1: begin
                    case(funct7)
                        7'h00: operation = 7'h1B;  // SLTI
                        default: operation = 7'h00; // Unknown
                    endcase
                end
                3'h2: begin
                    case(funct7)
                        7'h00: operation = 7'h03;  // SLTIU
                        default: operation = 7'h00; // Unknown
                    endcase
                end
                3'h4: begin
                    case(funct7)
                        7'h00: operation = 7'h13;  // XORI
                        default: operation = 7'h00; // Unknown
                    endcase
                end
                3'h5: begin
                    case(funct7)
                        7'h00: operation = 7'h07;  // SRLI
                        7'h20: operation = 7'h0F;  // SRAI
                        default: operation = 7'h00; // Unknown
                    endcase
                end
                3'h6: begin
                    case(funct7)
                        7'h00: operation = 7'h1F;  // ORI
                        default: operation = 7'h00; // Unknown
                    endcase
                end
                3'h7: begin
                    case(funct7)
                        7'h00: operation = 7'h23;  // ANDI
                        default: operation = 7'h00; // Unknown
                    endcase
                end
                default: operation = 7'h00; // Unknown
            endcase
        end
        
        7'h6F: begin
            // J-type instruction (JAL)
            imm_type = 7'h02;
            operation = 7'h6F;  // JAL
        end
        
        default: begin
            // Unknown or unsupported opcode
            imm_type = 7'h00;
            operation = 7'h00; // Unknown
        end
    endcase
end

endmodule

