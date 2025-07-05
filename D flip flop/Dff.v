`timescale 1ns / 1ps

module Dff(
    input clk,    // Clock signal for sequential update
    input d,      // Data input to the flip-flop
    output reg q  // Output of the flip-flop, declared as 'reg'
);
    
    // Initial block to set the power-on reset state of 'q' to 0
    initial begin
        q = 0;
    end
    
    // Always block sensitive to the positive edge of the clock
    // This describes the sequential behavior of a D flip-flop
    always @(posedge clk) begin
        // On the positive edge of 'clk', 'q' updates with the value of 'd'
        q <= d;
    end

endmodule