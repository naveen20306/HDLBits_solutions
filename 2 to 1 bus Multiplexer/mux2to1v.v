module mux2to1v( 
    input [99:0] a, b, // 100-bit wide data inputs
    input sel,        // Single-bit select input
    output [99:0] out // 100-bit wide output
);
    // Assign 'out' based on the 'sel' signal (ternary operator for a 2-to-1 vector multiplexer)
    assign out = (sel) ? b : a;
endmodule