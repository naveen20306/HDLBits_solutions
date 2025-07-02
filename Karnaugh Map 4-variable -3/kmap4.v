module kmap4(
    input a,   // First input variable
    input b,   // Second input variable
    input c,   // Third input variable
    input d,   // Fourth input variable
    output out // Output based on the K-map (XOR logic)
);
    // Assigns the output 'out' to the logical XOR of all four inputs
    assign out = a ^ b ^ c ^ d;
endmodule