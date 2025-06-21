module xnorgate( // Module for an XNOR gate.
    input a, // First input.
    input b, // Second input.
    output out ); // Output of the XNOR gate.
    assign out = ~(a ^ b); // Assigns the logical XNOR of 'a' and 'b' to 'out'.
endmodule // End of module.