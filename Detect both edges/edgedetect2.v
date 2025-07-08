`timescale 1ns / 1ps

module edgedetect2(
    input clk,             // Clock signal for synchronous operation
    input [7:0] in,        // 8-bit input data
    output reg [7:0] anyedge // 8-bit output, indicating any edge (positive or negative) for each bit of 'in'
);
    // Internal register to store the previous state of the input 'in'
    reg [7:0] prev;
    // Initial block to set the power-on reset state of outputs and internal registers to 0
    initial begin
        anyedge = 0;
        prev = 0;
    end
    // Always block sensitive to the positive edge of the clock
    always @(posedge clk) begin
        // Calculate 'anyedge': An edge (positive or negative) is detected when 'prev' is different from 'in'.
        // XORing 'prev' and 'in' achieves this.
        anyedge <= prev ^ in;
        // Update 'prev' to the current 'in' for the next clock cycle's calculation.
        prev <= in;
    end
end