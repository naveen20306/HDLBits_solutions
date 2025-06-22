module twogates( // Module implementing a two-stage logic gate circuit.
    input in1, // First input.
    input in2, // Second input.
    input in3, // Third input.
    output out // Final output.
);
	wire in4; // Internal wire for intermediate signal.
    
    assign in4 = ~(in1 ^ in2); // Computes XNOR of in1 and in2, assigns to in4.
    assign out = in3 ^ in4; // Computes XOR of in3 and in4, assigns to out.
    
endmodule // End of module.