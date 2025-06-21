module Wire( input in, output out ); // Declares a module named 'Wire' with one input 'in' and one output 'out'.
    assign out = in; // Continuously assigns the value of 'in' to 'out'. This effectively creates a direct connection, like a wire.
endmodule