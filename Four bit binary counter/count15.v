`timescale 1ns / 1ps
module count15 (
    input clk,            // Clock signal for synchronous operation
    input reset,          // Synchronous active-high reset
    output reg [3:0] q    // 4-bit output register, representing the counter value
);
	
    // Always block sensitive to the positive edge of the clock
    always @(posedge clk) begin
        // If 'reset' is high, synchronously reset the counter 'q' to 0
        if (reset) begin
            q <= 4'b0;
        end
        // Otherwise, increment the counter 'q' by 1
        else 
            q <= q + 1; // The counter will naturally wrap around from 15 to 0 (for a 4-bit register)
    end
    
endmodule