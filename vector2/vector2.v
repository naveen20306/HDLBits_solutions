module vector2( // Module to reorder bytes in a 32-bit vector.
    input [31:0] in, // 32-bit input vector.
    output [31:0] out // 32-bit output vector.
);

    assign out[31:24] = in[7:0]; // Moves the lowest byte of 'in' to the highest byte of 'out'.
    assign out[23:16] = in[15:8]; // Moves the second lowest byte of 'in' to the second highest byte of 'out'.
    assign out[15:8] = in[23:16]; // Moves the third lowest byte of 'in' to the third highest byte of 'out'.
    assign out[7:0] = in[31:24]; // Moves the highest byte of 'in' to the lowest byte of 'out'.

endmodule // End of module.