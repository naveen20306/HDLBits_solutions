module vectorr( // Module that reverses the order of bits in an 8-bit vector.
    input [7:0] in, // 8-bit input vector (MSB: in[7], LSB: in[0]).
    output [7:0] out // 8-bit output vector (MSB: out[7], LSB: out[0]).
);
    assign out = {in[0],in[1],in[2],in[3],in[4],in[5],in[6],in[7]}; // Reverses the bit order: in[0] becomes out[7], in[1] becomes out[6], etc.

endmodule // End of module.