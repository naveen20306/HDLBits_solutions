module kmap2(
    input a,   // First input variable
    input b,   // Second input variable
    input c,   // Third input variable
    input d,   // Fourth input variable
    output out // Output based on the K-map simplified boolean expression
);
    // Assigns the output 'out' based on the given boolean expression
    assign out = (~a & ~d) | (~c & ~b) | (b & c & d) | (a & c & d);
endmodule