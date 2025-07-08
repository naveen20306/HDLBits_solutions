`timescale 1ns / 1ps
module edgedetect(
    input clk,            // Clock signal for synchronous operation
    input [7:0] in,       // 8-bit input data
    output reg [7:0] pedge // 8-bit output, indicating a positive edge for each bit of 'in'
);

    // Internal register to store the previous state of the input 'in'
    reg [7:0] prev;
    
    // Initial block to set the power-on reset state of outputs and internal registers to 0
    initial begin
        pedge = 0;
        prev = 0;
    end
    
    // Always block sensitive to the positive edge of the clock
    always @(posedge clk) begin
        // Calculate 'pedge': A positive edge is detected when 'prev' was 0 and 'in' is 1.
        // This calculation happens based on the values before the current clock edge.
        pedge <= (~prev) & in;
        // Update 'prev' to the current 'in' for the next clock cycle's calculation.
        prev <= in;
    end
        
endmodule