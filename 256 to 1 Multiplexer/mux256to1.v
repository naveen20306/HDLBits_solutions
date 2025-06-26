module mux256to1( 
    input [255:0] in, // 256-bit wide input vector
    input [7:0] sel,  // 8-bit select input (0 to 255)
    output out        // Single-bit output
);
	
    // Assigns the output 'out' to the bit of 'in' selected by 'sel'
    assign out = in[sel];
    
endmodule