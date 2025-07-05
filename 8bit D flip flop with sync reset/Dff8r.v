`timescale 1ns / 1ps
module Dff8r(
    input clk,        // Clock signal
    input reset,      // Synchronous reset input (active high)
    input [7:0] d,    // 8-bit data input
    output reg [7:0] q // 8-bit output register, declared as 'reg'
);
    // Always block sensitive to the positive edge of the clock
    always @(posedge clk) begin
        // If 'reset' is high, asynchronously reset 'q' to 0
        if (reset) begin
            q <= 8'b0; // Reset q to all zeros
        end
        // Otherwise, if reset is not active, update 'q' with 'd'
        else begin
            q <= d; // Capture data 'd'
        end
    end
    
endmodule