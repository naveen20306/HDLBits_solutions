module another_gate ( // Module implementing a gate with specific logic.
    input in1, // First input.
    input in2, // Second input.
    output out // Output based on the logical operation.
);
    assign out = in1 & (~in2); // Assigns the result of (in1 AND NOT in2) to 'out'.
    
endmodule // End of module.