`timescale 1ns / 1ps
module lfsr3(
	input [2:0] SW,      // Input for loading the LFSR, acts as the seed (R)
	input [1:0] KEY,     // Control inputs: KEY[1] is 'load' enable, KEY[0] is 'clk'
	output reg [2:0] LEDR // Output register for the LFSR state (Q)
); 
    // Always block sensitive to the positive edge of KEY[0] (which is the clock)
    always @(posedge KEY[0]) begin
        // If KEY[1] (load enable) is high, load the LFSR with the SW input
        if (KEY[1]) begin
            LEDR <= SW; // Load parallel data from SW
        end
        // Else (if load enable is low), perform the LFSR shift and feedback operation
        else begin
            // LFSR feedback for a 3-bit Galois LFSR (primitive polynomial x^3 + x^2 + 1)
            // LEDR[2] (MSB) gets LEDR[2] XOR LEDR[1] (feedback from tap at LEDR[1])
            LEDR[2] <= LEDR[2] ^ LEDR[1];
            // LEDR[1] gets the old value of LEDR[0] (shift)
            LEDR[1] <= LEDR[0];
            // LEDR[0] gets the old value of LEDR[2] (shift, closing the loop with MSB)
            LEDR[0] <= LEDR[2];
        end
    end
            

endmodule