module more_logicgates( // Module demonstrating various 2-input logic gates.
    input a, b, // Two single-bit inputs.
    output out_and, // Output of AND gate.
    output out_or, // Output of OR gate.
    output out_xor, // Output of XOR gate.
    output out_nand, // Output of NAND gate.
    output out_nor, // Output of NOR gate.
    output out_xnor, // Output of XNOR gate.
    output out_anotb // Output of A AND (NOT B) gate.
);

    assign out_and = a & b; // Logical AND operation.
    assign out_or = a | b; // Logical OR operation.
    assign out_xor = a ^ b; // Logical XOR operation.
    assign out_nand = ~(a & b); // Logical NAND operation.
    assign out_nor = ~(a | b); // Logical NOR operation.
    assign out_xnor = ~(a ^ b); // Logical XNOR operation.
    assign out_anotb = a & ~b; // Logical AND of 'a' and NOT 'b'.
    
endmodule // End of module.