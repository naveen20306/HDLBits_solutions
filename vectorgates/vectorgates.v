module vectorgates( // Module demonstrating vector bitwise and logical operations.
    input [2:0] a, // First 3-bit input vector.
    input [2:0] b, // Second 3-bit input vector.
    output [2:0] out_or_bitwise, // 3-bit output for bitwise OR.
    output out_or_logical, // 1-bit output for logical OR.
    output [5:0] out_not // 6-bit output for concatenated NOT operations.
);
	assign out_or_bitwise = a | b; // Performs bitwise OR between corresponding bits of 'a' and 'b'.
    assign out_or_logical = a || b; // Performs logical OR on vectors 'a' and 'b' (result is 1 if either vector is non-zero).
    assign out_not = {~b, ~a}; // Concatenates the bitwise NOT of 'b' and 'a'.
endmodule // End of module.