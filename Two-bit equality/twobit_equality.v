module twobit_equality(input [1:0] A, input [1:0] B, output z ); // Module to check if two 2-bit numbers are equal.
    assign z = &(~(A ^ B)); // Compares A and B bit by bit using XOR, inverts the result, then performs a reduction AND.
                               // If A and B are equal, A^B will be all zeros. ~(A^B) will be all ones. &(~(A^B)) will be 1.
                               // If A and B are not equal, A^B will have at least one one. ~(A^B) will have at least one zero. &(~(A^B)) will be 0.
endmodule // End of module.