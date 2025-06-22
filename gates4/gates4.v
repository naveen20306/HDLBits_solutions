module gates4( // Module demonstrating reduction operators.
    input [3:0] in, // 4-bit input vector.
    output out_and, // Output for reduction AND.
    output out_or, // Output for reduction OR.
    output out_xor // Output for reduction XOR.
);
	assign out_and = &in; // Performs a reduction AND on all bits of 'in'.
	assign out_or = |in; // Performs a reduction OR on all bits of 'in'.
	assign out_xor = ^in; // Performs a reduction XOR on all bits of 'in'.

endmodule // End of module.