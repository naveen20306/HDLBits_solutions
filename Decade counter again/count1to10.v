`timescale 1ns / 1ps
module count1to10(
    input clk,     // Clock signal for synchronous operation
    input reset,   // Synchronous active-high reset
    output [3:0] q // 4-bit output, representing the counter value
);
	
    // Declare a 4-bit register for the internal counter state.
    // It's initialized to 1, implying the counter starts from 1.
    reg [3:0] Q = 1; 
    
    // Always block sensitive to the positive edge of the clock
    always @(posedge clk) begin
        // If 'reset' is high OR the counter 'Q' reaches 10, then reset 'Q' to 1.
        // This creates a count-from-1 to 10 (1-10) sequence.
        if (reset | Q == 4'd10) begin
            Q <= 4'd1; // Reset or wrap-around to 1
        end
        // Otherwise, increment the counter 'Q' by 1
        else begin
            Q <= Q + 1; // Increment counter
        end
    end
    
    // Continuously assign the internal counter state 'Q' to the output 'q'
    assign q = Q;
    
endmodule