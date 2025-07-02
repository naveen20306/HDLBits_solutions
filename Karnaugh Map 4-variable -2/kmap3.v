module kmap3(
    input a,   // First input variable
    input b,   // Second input variable
    input c,   // Third input variable
    input d,   // Fourth input variable (unused in this simplified expression)
    output out // Output based on the K-map simplified boolean expression
);
    // Assigns the output 'out' based on the given boolean expression
    // This expression simplifies to a OR (c AND NOT b)
    assign out = a | (c & ~b);
endmodule