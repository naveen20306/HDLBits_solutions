module wire_decl( // Module demonstrating wire declarations.
    input a, // First input.
    input b, // Second input.
    input c, // Third input.
    input d, // Fourth input.
    output out, // Primary output.
    output out_n // Inverted output.
);
    
    wire wire1,wire2,wire3; // Declare internal wires.
    
    assign wire1 = a & b; // AND 'a' and 'b' into wire1.
    assign wire2 = c & d; // AND 'c' and 'd' into wire2.
    assign wire3 = wire1 | wire2; // OR wire1 and wire2 into wire3.
    assign out = wire3; // Assign wire3 to primary output.
    assign out_n = ~wire3; // Assign inverted wire3 to inverted output.
    
endmodule // End of module.