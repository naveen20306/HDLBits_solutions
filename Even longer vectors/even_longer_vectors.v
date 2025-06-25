`timescale 1ns / 1ps
module even_longer_vectors( 
    input [99:0] in,            // 100-bit input vector
    output reg [98:0] out_both,    // 99-bit output vector for ANDing adjacent bits
    output reg [99:1] out_any,     // 99-bit output vector for ORing adjacent bits
    output reg [99:0] out_different // 100-bit output vector for XORing adjacent bits (with wrap-around)
);
	
    // Declare integer variables for loop iteration
    integer i,j; 
    // Always block that triggers on any change in inputs (combinational logic)
    always @(*) begin
        // Loop for 'out_both' and part of 'out_different'
        for (i = 0; i <= 98; i = i + 1) begin
            // out_both[i] is the AND of in[i] and in[i+1]
            out_both[i] = in[i] & in[i+1];
            // out_different[i] is the XOR of in[i] and in[i+1]
            out_different[i] = in[i] ^ in[i+1];
        end
        // The MSB of out_different wraps around, XORing in[99] with in[0]
        out_different[99] = in[99] ^ in[0];
        // Loop for 'out_any'
        for (j = 99; j >= 1; j = j - 1) begin
            // out_any[j] is the OR of in[j] and in[j-1]
            out_any[j] = in[j] | in[j-1];
        end
    end
    
endmodule