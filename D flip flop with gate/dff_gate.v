`timescale 1ns / 1ps
module dff_gate(
    input clk,  // Clock signal
    input in,   // Input data
    output reg out // Output register, declared as 'reg'
);
    // Initial block to set the power-on reset state of 'out' to 0
    initial begin
        out = 0;
    end
    // Always block sensitive to the positive edge of the clock
    always @(posedge clk) begin
        // On each positive clock edge, 'out' is updated with the XOR of its current value and 'in'.
        // This creates a T-flip-flop like behavior if 'in' is seen as a toggle enable.
        out <= out ^ in;
    end

endmodule