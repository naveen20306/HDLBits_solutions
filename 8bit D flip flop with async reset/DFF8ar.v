`timescale 1ns / 1ps
module Dff8ar(
    input clk,          // Clock signal for synchronous updates
    input areset,       // Active high asynchronous reset input
    input [7:0] d,      // 8-bit data input
    output reg [7:0] q  // 8-bit output register, declared as 'reg'
);
    // Always block sensitive to the positive edge of the clock OR the positive edge of 'areset'
    always @(posedge clk or posedge areset) begin
        // If 'areset' is high, asynchronously reset 'q' to all zeros
        if (areset) begin
            q <= 8'b0; // Reset q to all zeros
        end
    	// Otherwise (if areset is not active), on the positive clock edge, update 'q' with 'd'
    	else begin
            q <= d; // Capture data 'd'
        end
    end

endmodule