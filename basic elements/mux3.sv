module mux3 #(parameter w = 8)
				(input logic [w-1:0] a0,a1,a2,
				input logic [1:0] s,
				output logic [w-1:0] y);
				
	assign y = s[1] ? a2: (s[0] ? a1 : a0);			
	
endmodule