`timescale 1ns / 1ps
module Dlatch (
    input d,   // Data input
    input ena, // Enable signal for the latch (active high)
    output reg q // Output of the D-latch, declared as 'reg'
);
    // Always block sensitive to changes in the 'ena' signal.
    // This describes the behavior of a D-latch.
    always @(ena or d) begin // Latch should be sensitive to both ena and d for correct behavior.
                              // When ena is high, q should continuously follow d.
                              // When ena is low, q should hold its last value.
                              // Original code: always@(ena) only captures changes when ena changes, not d when ena is already high.
        if (ena) begin
            q <= d; // If enable is high, latch is transparent and 'q' follows 'd'
        end
        // else q holds its value (implied by reg and no assignment when ena is low)
    end
endmodule