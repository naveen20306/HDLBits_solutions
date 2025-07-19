`timescale 1ns / 1ps
module slow_decade_counter(
    input clk,       // Clock signal for synchronous operation
    input slowena,   // Enable signal for the counter. When high, counter increments.
    input reset,     // Synchronous active-high reset
    output reg [3:0] q // 4-bit output register, representing the decade counter value
);
    // Always block sensitive to the positive edge of the clock
    always @(posedge clk) begin
        // If 'reset' is high, synchronously reset the counter 'q' to 0
        if (reset) begin
            q <= 4'b0;
        end
        // Else if 'slowena' is high, enable the counting logic
        else if (slowena) begin
            // If 'q' reaches 9, wrap around to 0 (decade counter: 0-9)
            if (q == 4'd9) begin
                q <= 4'b0;
            end
            // Otherwise, increment the counter 'q' by 1
            else begin
                q <= q + 1;
            end
        end
        // If slowena is low, the counter holds its current value (implied by no assignment when slowena is low and not in reset)
    end
        
endmodule