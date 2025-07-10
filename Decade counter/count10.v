`timescale 1ns / 1ps
module count10(
    input clk,            // Clock signal for synchronous operation
    input reset,          // Synchronous active-high reset
    output reg [3:0] q    // 4-bit output register, representing the counter value
);
    // Always block sensitive to the positive edge of the clock
    always @(posedge clk) begin
        // If 'reset' is high OR the counter 'q' reaches 9, then reset 'q' to 0.
        // This creates a synchronous reset and a count-to-10 (0-9) sequence.
        if (reset | q == 4'd9) begin
            q <= 4'b0; // Reset counter to 0
        end
        // Otherwise, increment the counter 'q' by 1
        else begin
            q <= q + 1; // Increment counter
        end
    end
end