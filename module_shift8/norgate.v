module norgate( // Module for a NOR gate.
    input a, // First input.
    input b, // Second input.
    output out ); // Output of the NOR gate.
    assign out = ~(a || b); // Assigns the logical NOR of 'a' and 'b' to 'out'.
endmodule // End of module.