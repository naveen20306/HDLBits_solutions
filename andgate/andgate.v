module andgate( // Module for an AND gate.
    input a, // First input.
    input b, // Second input.
    output out ); // Output of the AND gate.
assign out = a & b; // Assigns the logical AND of 'a' and 'b' to 'out'.
endmodule // End of module.