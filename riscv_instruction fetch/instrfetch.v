module InstructionFetch(
    input reg clk,            
    output reg [31:0] instruction 
);

    reg [31:0] pc_next;  

    ProgramCounter PC (
        .clk(clk),
        .pc_sel(2'b00),      
        .imm(32'h0),                 
        .pc_out(pc_next)     
    );


    ROM memory (
       .clk(clk),
       .address(pc_next),
       .data(instruction)
    );

endmodule
