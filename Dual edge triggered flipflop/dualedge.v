`timescale 1ns / 1ps
module dualedge(
    input clk,  // Clock signal
    input d,    // Data input
    input rst,  // Asynchronous reset input (active high)
    output q    // Output of the dual-edge triggered flip-flop
);
    // Internal registers to store values captured on positive and negative edges
    reg q1; // Stores value captured on positive edge of clk
    reg q0; // Stores value captured on negative edge of clk
    
    // Always block for positive edge triggered D-flip-flop with asynchronous reset
    always @(posedge clk or posedge rst) begin // Reset is asynchronous, so it needs to be in sensitivity list
        if (rst) begin
            q1 <= 1'b0; // Asynchronously reset q1 to 0
        end
        else begin
            q1 <= d; // On positive clock edge, q1 captures d
        end
    end
    
    // Always block for negative edge triggered D-flip-flop with asynchronous reset
    always @(negedge clk or posedge rst) begin // Reset is asynchronous, so it needs to be in sensitivity list
        if (rst) begin
            q0 <= 1'b0; // Asynchronously reset q0 to 0
        end
        else begin
            q0 <= d; // On negative clock edge, q0 captures d
        end
    end
    
    // Assign the final output 'q' based on the current clock level
    // If clk is high, output q1; if clk is low, output q0.
    assign q = clk ? q1 : q0;

endmodule