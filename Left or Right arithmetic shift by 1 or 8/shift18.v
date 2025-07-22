`timescale 1ns / 1ps
module shift18(
    input clk,             // Clock signal for synchronous operations
    input load,            // Synchronous load enable (active high)
    input ena,             // Synchronous shift enable (active high)
    input [1:0] amount,    // 2-bit control for shift amount and direction
    input signed [63:0] data, // 64-bit signed data input for loading
    output reg signed [63:0] q // 64-bit signed output register for the shifted data
); 
    
    // Always block sensitive to the positive edge of the clock
    always @(posedge clk) begin
        // If 'load' is active, synchronously load 'data' into 'q'
        if (load) begin
            q <= data; // Load parallel data
        end
        // Else if 'ena' is active, perform shifting based on 'amount'
        else if (ena) begin
            // Case statement to select the shift operation
            case (amount)
                2'b00: q <= q << 1;  // Logical left shift by 1 bit
                2'b01: q <= q << 8;  // Logical left shift by 8 bits (byte shift)
                2'b10: q <= q >>> 1; // Arithmetic right shift by 1 bit
                2'b11: q <= q >>> 8; // Arithmetic right shift by 8 bits (byte shift)
                default: q <= 0;     // Default case: reset 'q' to 0 (should not be reached for 2-bit 'amount')
            endcase
        end
        // Else (if neither load nor ena is active), 'q' holds its current value (implied)
    end
            
endmodule