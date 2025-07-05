`timescale 1ns / 1ps
module mux_dff2(
    input clk, // Clock signal for synchronous operations
    input w,   // Data input W
    input R,   // Data input R
    input E,   // Enable signal for data input W
    input L,   // Load/select signal for R (higher precedence)
    output reg Q // Output register of the D flip-flop with multiple multiplexed inputs
);
    // Initial block to set the power-on reset state of 'Q' to 0
    initial begin
        Q = 0;
    end
    
    // Always block sensitive to the positive edge of the clock
    always @(posedge clk) begin
        // On the positive clock edge, 'Q' is updated based on a nested multiplexing logic:
        // If 'L' is high, 'R' is loaded into Q.
        // Else (if 'L' is low), if 'E' is high, 'w' is loaded into Q.
        // Else (if 'L' is low and 'E' is low), 'Q' retains its current value (hold state).
        Q <= L ? R : (E ? w : Q);
    end
end