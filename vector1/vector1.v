module vector1( // Module to split a 16-bit vector.
    input wire [15:0] in, // 16-bit input vector.
    output wire [7:0] out_hi, // 8-bit output for the higher bits.
    output wire [7:0] out_lo ); // 8-bit output for the lower bits.
    assign out_hi = in[15:8]; // Assigns the upper 8 bits of 'in' to 'out_hi'.
    assign out_lo = in[7:0]; // Assigns the lower 8 bits of 'in' to 'out_lo'.
endmodule // End of module.