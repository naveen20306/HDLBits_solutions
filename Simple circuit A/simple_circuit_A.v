module simple_circuit_A(input x, input y, output z); // Module implementing a simple logic circuit.
    assign z = (x ^ y) & x; // Assigns the result of ((XOR of x and y) AND x) to 'z'.
endmodule // End of module.