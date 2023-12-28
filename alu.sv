module alu (
  input logic [31:0] a,
  input logic [31:0] b,
  input logic [2:0] alucontrol,
  output logic [31:0] result,
  output logic zero);

  always_comb begin
    case (alucontrol)
      3'b000: result = a & b;         // AND
      3'b001: result = a | b;         // OR
      3'b010: result = a + b;         // ADD
      3'b110: result = a - b;         // SUB
      3'b111: result = (a < b) ? 1 : 0; // SLT (Set Less Than)
      default: result = 32'hxxxxxxxx; // Undefined
    endcase
  end
  
  assign zero = (result == 0) ? 1'b1 : 1'b0;

endmodule


