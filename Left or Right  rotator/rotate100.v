`timescale 1ns / 1ps
module rotate100(
    input clk,          // Clock signal for synchronous operations
    input load,         // Synchronous load enable (active high)
    input [1:0] ena,    // 2-bit enable for rotation direction (01 for right, 10 for left)
    input [99:0] data,  // 100-bit data input for loading
    output reg [99:0] q // 100-bit output register for the rotated data
); 
    
    // Always block sensitive to the positive edge of the clock
    always @(posedge clk) begin
        // If 'load' is active, synchronously load 'data' into 'q'
        if (load) begin
            q <= data; // Load parallel data
        end
        // Else (if not loading), perform rotation based on 'ena'
        else begin
            // Case statement to select rotation type
            case (ena)
                2'b01: q <= {q[0], q[99:1]}; // Rotate right: LSB moves to MSB, rest shift right
                2'b10: q <= {q[98:0], q[99]}; // Rotate left: MSB moves to LSB, rest shift left
                default: q <= q;             // Default case: hold current value (no rotation)
            endcase
        end
    end
    
endmodule