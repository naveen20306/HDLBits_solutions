module gates100( // Module demonstrating reduction operators on a 100-bit input.
    input [99:0] in, // 100-bit input vector.
    output out_and, // Output of reduction AND.
    output out_or, // Output of reduction OR.
    output out_xor // Output of reduction XOR.
);
	assign out_and = &in; // Performs a bitwise AND operation across all bits of 'in'.
    assign out_or = |in; // Performs a bitwise OR operation across all bits of 'in'.
    assign out_xor = ^in; // Performs a bitwise XOR operation across all bits of 'in'.
endmodule // End of module.