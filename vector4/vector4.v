module vector4 ( // Module for sign extension.
    input [7:0] in, // 8-bit input vector.
    output [31:0] out // 32-bit output vector.
);
    assign out = { {24{in[7]}}, in }; // Extends the 8-bit input 'in' to 32 bits by replicating its MSB (in[7]) 24 times.

endmodule // End of module.