`timescale 1ns / 1ps
module Shift_reg_4bit(
    input clk,          // Clock signal for synchronous operations
    input areset,       // Asynchronous active-high reset
    input load,         // Synchronous load enable
    input ena,          // Synchronous shift enable
    input [3:0] data,   // 4-bit data input for loading
    output reg [3:0] q  // 4-bit output register for the shift register
); 
	
    // Always block sensitive to the positive edge of the clock or the positive edge of 'areset'
    always @(posedge clk or posedge areset) begin
        // Asynchronous reset takes highest precedence
        if (areset) begin
            q <= 4'b0; // Reset 'q' to all zeros
        end
        // Else if 'load' is active, synchronously load 'data' into 'q'
        else if (load) begin
            q <= data; // Load parallel data
        end
        // Else if 'ena' is active, synchronously shift right
        else if (ena) begin
            q <= {1'b0, q[3:1]}; // Shift right by one position, with '0' shifted into MSB
        end
        // Else (if no control signals are active), 'q' holds its current value
    end
endmodule