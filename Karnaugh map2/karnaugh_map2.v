module karnaugh_map2(
    input [4:1] x, // 4-bit input vector, bits indexed from 1 to 4 (x[4], x[3], x[2], x[1])
    output f       // Single-bit output based on the K-map simplified expression
);
    // Assigns the output 'f' based on the given boolean expression:
    // (NOT x[2] AND NOT x[4]) OR (NOT x[1] AND x[3]) OR (x[2] AND x[3] AND x[4])
    assign f = (~x[2] & ~x[4]) | (~x[1] & x[3]) | (x[2] & x[3] & x[4]);
endmodule