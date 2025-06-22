module reduction ( // Module to calculate the parity of an 8-bit input.
    input [7:0] in, // 8-bit input vector.
    output parity // Output for the parity (XOR sum of all bits).
); 
	assign parity = ^in; // Assigns the result of reduction XOR on 'in' to 'parity'.
endmodule // End of module.