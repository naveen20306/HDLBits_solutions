`timescale 1ns / 1ps
module Dff16e(
    input clk,          // Clock signal
    input resetn,       // Active-low synchronous reset
    input [1:0] byteena,  // 2-bit byte enable for selective writes
    input [15:0] d,       // 16-bit data input
    output reg [15:0] q   // 16-bit output register
);
    // Initial block to set the power-on reset state of 'q' to 0
    initial begin
        q = 0;
    end
    // Always block sensitive to the positive edge of the clock
    always @(posedge clk) begin
        // Check for active-low synchronous reset
        if (~resetn) begin 
            q <= 16'b0; // Reset 'q' to all zeros if resetn is low
        end
        // If not in reset, check byte enables for writing
        else begin
            // If byteena[1] is high, update the upper byte of 'q'
            if (byteena[1]) begin
            	q[15:8] <= d[15:8];
        	end
        	// If byteena[0] is high, update the lower byte of 'q'
        	if (byteena[0]) begin
                q[7:0] <= d[7:0];
            end
        end
    end
            

endmodule