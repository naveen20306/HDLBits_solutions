module kmap_mux(
	input c,        // First input variable
	input d,        // Second input variable
	output [3:0] mux_in // 4-bit output vector representing inputs to a multiplexer
);
	// Assigns mux_in[0]: if 'c' is true, output 1, else output 'd'
	assign mux_in[0] = c ? 1 : d;           
	// Assigns mux_in[1]: always 0
	assign mux_in[1] = 0;                   
	// Assigns mux_in[2]: if 'd' is true, output 0, else output 1
	assign mux_in[2] = d ? 0 : 1;           
	// Assigns mux_in[3]: if 'c' is true, output 'd', else output 0
	assign mux_in[3] = c ? d : 0;           
	
endmodule