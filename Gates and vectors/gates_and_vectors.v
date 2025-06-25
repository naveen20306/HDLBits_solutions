module gates_and_vectors( 
    input [3:0] in,            // 4-bit input vector
    output reg [2:0] out_both,    // 3-bit output vector for ANDing adjacent bits
    output reg [3:1] out_any,     // 3-bit output vector for ORing adjacent bits
    output reg [3:0] out_different // 4-bit output vector for XORing adjacent bits (with wrap-around for MSB)
);
	// Declare integer variables for loop iteration
	integer i, j; 
    // Always block that triggers on any change in inputs (combinational logic)
    always @(*) begin
        // Loop from bit 0 to 2 for 'out_both' and 'out_different'
        for (i = 0; i <= 2; i = i + 1) begin
            // out_both[i] is the AND of in[i] and in[i+1]
            out_both[i] = in[i] & in[i+1];
            // out_different[i] is the XOR of in[i] and in[i+1]
            out_different[i] = in[i] ^ in[i+1];
        end
        // The MSB of out_different wraps around, XORing in[3] with in[0]
        out_different[3] = in[3] ^ in[0];
        // Loop from bit 3 down to 1 for 'out_any'
        for (j = 3; j >= 1; j = j - 1) begin
            // out_any[j] is the OR of in[j] and in[j-1]
            out_any[j] = in[j] | in[j-1];
        end
    end    
endmodule