`timescale 1ns / 1ps
module edgecapture(
    input clk,            // Clock signal for synchronous operation
    input reset,          // Active-high synchronous reset
    input [31:0] in,      // 32-bit input data
    output reg [31:0] out // 32-bit output register, which latches falling edges
);
    // Internal register to store the previous value of the input 'in'
    reg [31:0] temp;
    // Always block sensitive to the positive edge of the clock
    always @(posedge clk) begin
        // If 'reset' is high, synchronously reset 'out' to all zeros
        if (reset) begin
            out <= 32'b0;
        end
    	// Otherwise, update 'out' based on falling edge detection
    	else begin
            // 'out' gets updated to include bits where 'temp' was 1 AND 'in' is now 0.
            // This creates a "sticky" falling edge detector: once a bit in 'out' goes high, it stays high
            // until a reset.
            out <= out | (temp & (~in));
        end
        // Update 'temp' with the current input 'in' for the next clock cycle's comparison
        temp <= in;
    end
end