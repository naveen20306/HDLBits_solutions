`timescale 1ns / 1ps
module Dff8 (
    input clk,       // Clock signal for synchronous operation
    input [7:0] d,   // 8-bit data input
    output reg [7:0] q // 8-bit output register, declared as 'reg'
);
    // This always block is sensitive to the positive edge of the clock.
    // It describes the behavior of an 8-bit D flip-flop.
    always @(posedge clk) begin
        // On each positive clock edge, the output 'q' is updated with the value of 'd'.
        // Non-blocking assignment '<=' is used for sequential logic.
        q <= d;
    end
    
endmodule