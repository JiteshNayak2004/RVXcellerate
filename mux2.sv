module mux2 #(parameter W= 8)
				(input logic [W-1:0] a0,a1,
				input logic          s,
				output logic [W-1:0] y);
				
			
	assign y = s ? a1 : a0;
	
endmodule
