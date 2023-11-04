module ROM(
    input wire [3:0] address,  // 4-bit address input
    output wire [31:0] data   // 32-bit data output
);

    reg [31:0] rom_data [0:15]; // 16 words of 32-bit data

    initial begin
        // Initialize the ROM data here
        rom_data[0] = 32'h01234567;
        rom_data[1] = 32'h89ABCDEF;
        rom_data[2] = 32'h123A1234;
    end

    always @(posedge address) begin
        data <= rom_data[address];
    end

endmodule

