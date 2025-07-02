module kmap1(
    input a,   // First input variable
    input b,   // Second input variable
    input c,   // Third input variable
    output out // Output based on the K-map simplification (OR logic)
);
	// Assigns the output 'out' to the logical OR of inputs 'a', 'b', and 'c'
    assign out = a | b | c;
endmodule