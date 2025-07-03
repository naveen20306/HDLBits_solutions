module karnaugh_map1(
    input [4:1] x, // 4-bit input vector, bits indexed from 1 to 4 (x[4], x[3], x[2], x[1])
    output f       // Single-bit output based on the K-map simplified expression
);
    // Assigns the output 'f' based on the given boolean expression:
    // (x[3] AND NOT x[1]) OR (x[1] AND x[2] AND x[4])
    assign f = (x[3] & ~x[1]) | (x[1] & x[2] & x[4]);
endmodule