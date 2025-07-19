`timescale 1ns / 1ps
module sec_and_min(
        input clk,   // Clock signal
        input rst,   // Synchronous active-high reset
        input ena,   // Enable signal for the counter
        input [3:0] endpt, // 4-bit endpoint (maximum count value before rolling over)
        output reg [3:0] q // 4-bit output register, representing the counter value
);
        
        // Always block sensitive to the positive edge of the clock
        always @(posedge clk) begin
            // If 'rst' is high, synchronously reset the counter 'q' to 0
            if (rst) begin
                q <= 4'b0;
            end
            // Else if 'ena' is high, enable the counting logic
            else if (ena) begin
                    // If 'q' reaches 'endpt', wrap around to 0
                    if (q == endpt) begin
                        q <= 4'b0;
                    end
                    // Otherwise, increment the counter 'q' by 1
                    else begin
                        q <= q + 1;
                    end
            end
            // If 'ena' is low, 'q' holds its current value
            // Note: If rst is asynchronous, it should be in the sensitivity list.
            // Since it's synchronous here, it only affects q on posedge clk.
        end
endmodule