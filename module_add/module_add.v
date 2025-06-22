module module_add( // Module for a 32-bit adder using two 16-bit adders.
    input [31:0] a, // First 32-bit input operand.
    input [31:0] b, // Second 32-bit input operand.
    output [31:0] sum // 32-bit sum output.
);
    wire cout1,cout2; // Internal wires for carry-out signals.
    add16 low(a[15:0],b[15:0],1'b0,sum[15:0],cout1); // Instantiates a 16-bit adder for the lower half, with carry-in 0.
    add16 high(a[31:16],b[31:16],cout1,sum[31:16],cout2); // Instantiates a 16-bit adder for the upper half, with carry-in from the lower half.
endmodule // End of module.