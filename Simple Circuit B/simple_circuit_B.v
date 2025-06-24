module simple_circuit_B ( input x, input y, output z ); // Module implementing a simple XNOR gate.
    assign z = ~(x ^ y); // Assigns the XNOR of 'x' and 'y' to 'z'.
endmodule // End of module.