module regfile(input logic clk,
					input logic we3,
					input logic [4:0] ra1, ra2,wa3, //reg add 1,2 , write addr
					input logic [31:0] wd3,
					output logic [31:0] rd1, rd2); // reg data 
					
	logic [31:0] rfile[31:0];
	
	always_ff @(posedge clk)
	if (we3) rfile[wa3] <=wd3; //if wr en is 1 then in wr addr 3 put the value wr data 3
	
	assign rd1 = (ra1 != 0) ? rfile[ra1] : 0; // if register is not x0 then give reg data as the data in location reg addr1
	assign rd2 = (ra2 !=0) ? rfile[ra2] : 0;
	
endmodule