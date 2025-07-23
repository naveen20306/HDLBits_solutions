`timescale 1ns / 1ps
module lfsr32(
    input clk,            // Clock signal for synchronous operation
    input reset,          // Active-high synchronous reset
    output reg [31:0] q    // 32-bit output register for the LFSR state
); 
    // Always block sensitive to the positive edge of the clock
    always @(posedge clk) begin
        // If 'reset' is high, synchronously reset the LFSR to 32'h1 (all zeros except LSB)
        if (reset) begin
            q <= 32'h1; // Reset state
        end
        // Otherwise, perform the LFSR shift and feedback operations
        else begin
            // This structure combines direct feedback assignments with slice shifts.
            // It appears to be a specific type of Galois LFSR.
            // Let's break down each non-blocking assignment:

            // 1. Feedback for MSB (q[31]): XOR of 0 and q[0]. Effectively, q[31] gets q[0].
            q[31] <= 1'b0 ^ q[0]; 
            
            // 2. Feedback for q[21]: XOR of q[22] and q[0].
            q[21] <= q[22] ^ q[0];
            
            // 3. Feedback for q[1]: XOR of q[2] and q[0].
            q[1] <= q[2] ^ q[0];
            
            // 4. Feedback for q[0]: XOR of q[1] and q[0].
            q[0] <= q[1] ^ q[0];

            // 5. Slice shift for bits 2 to 20: Each bit q[i] gets the value from q[i+1].
            // This effectively shifts bits q[3]...q[21] down to q[2]...q[20].
            q[20:2] <= q[21:3]; 
            
            // 6. Slice shift for bits 22 to 30: Each bit q[i] gets the value from q[i+1].
            // This effectively shifts bits q[23]...q[31] down to q[22]...q[30].
            q[30:22] <= q[31:23];
            
            // Note on order of assignments: In an always block with non-blocking assignments (`<=`),
            // all right-hand sides are evaluated simultaneously based on the values *before* the clock edge,
            // and then all assignments are applied simultaneously at the clock edge.
            // This means the 'q[0]' on the right side of `q[31] <= 1'b0^q[0];` is the value of q[0]
            // *before* the update `q[0] <= q[1]^q[0];` takes effect.
            // This specific LFSR configuration involves multiple taps and potentially overlapping slice assignments.
            // It's a complex Galois LFSR structure, likely corresponding to a specific primitive polynomial for a maximal-length sequence.
        end
    end
endmodule