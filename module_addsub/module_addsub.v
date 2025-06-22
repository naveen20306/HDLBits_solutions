module module_addsub( // Module for a 32-bit adder/subtractor.
    input [31:0] a, // First 32-bit input operand.
    input [31:0] b, // Second 32-bit input operand.
    input sub, // Control signal: 0 for add, 1 for subtract.
    output [31:0] sum // 32-bit sum/difference output.
);
	wire cout1,cout2; // Internal wires for carry-out signals.
    
    add16 one(a[15:0],{16{sub}} ^ b[15:0], sub, sum[15:0], cout1); // Adds/subtracts lower 16 bits. XORing 'b' with 'sub' inverts 'b' for subtraction. 'sub' also acts as carry-in.
    add16 two(a[31:16],{16{sub}} ^ b[31:16], cout1, sum[31:16], cout2); // Adds/subtracts upper 16 bits, using carry-out from lower half.
endmodule // End of module.