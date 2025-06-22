module module_fadd ( // Module for a 32-bit full adder, built from 16-bit adders.
    input [31:0] a, // First 32-bit input operand.
    input [31:0] b, // Second 32-bit input operand.
    output [31:0] sum // 32-bit sum output.
);
    wire cout1,cout2; // Internal wires for carry-out signals between adders.
    add16 one( a[15:0], b[15:0],1'b0,sum[15:0],cout1); // Instantiates first 16-bit adder for lower bits, with initial carry-in 0.
    add16 two( a[31:16],b[31:16],cout1,sum[31:16],cout2); // Instantiates second 16-bit adder for upper bits, taking carry-out from first adder.
endmodule

module add1 ( input a, input b, input cin, output sum, output cout ); // Module for a 1-bit full adder.
	assign sum = a ^ b ^ cin; // Calculates the sum bit using XOR.
    assign cout = (a & b) | ((a ^ b) & cin); // Calculates the carry-out bit.
endmodule // End of module.