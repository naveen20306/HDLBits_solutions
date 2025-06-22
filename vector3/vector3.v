module vector3 ( // Module demonstrating vector concatenation and splitting.
    input [4:0] a, b, c, d, e, f, // Six 5-bit input vectors.
    output [7:0] w, x, y, z ); // Four 8-bit output vectors.
    
    wire [31:0] combined; // Declare a 32-bit internal wire.
    assign combined = {a,b,c,d,e,f,2'b11}; // Concatenates inputs and two literal bits into 'combined'.
    assign w = combined[31:24]; // Assigns highest byte of 'combined' to 'w'.
    assign x = combined[23:16]; // Assigns second highest byte to 'x'.
    assign y = combined[15:8]; // Assigns third highest byte to 'y'.
    assign z = combined[7:0]; // Assigns lowest byte to 'z'.

endmodule // End of module.