`timescale 1ns / 1ps
module bcdcount (
    input clk,   // Clock signal for synchronous operation
    input reset, // Synchronous active-high reset
    input ena,   // Enable signal for the BCD counter
    output reg [3:0] q // 4-bit output, representing the BCD digit (0-9)
);
            
    // Always block sensitive to the positive edge of the clock
    always @(posedge clk) begin
        // If 'reset' is high, synchronously reset the BCD counter 'q' to 0
        if (reset) begin
            q <= 4'b0;
        end
        // Else if 'ena' is high, enable the counting logic
        else if (ena) begin
            // If 'q' reaches 9, wrap around to 0 (BCD counter: 0-9)
            if (q == 4'd9) begin
                q <= 4'b0;
            end
            // Otherwise, increment the counter 'q' by 1
            else begin
                q <= q + 1;
            end
        end
        // If ena is low, the counter holds its current value (implied by no assignment when ena is low and not in reset)
    end
            
endmodule
        
module count1to1000 (
    input clk,       // Clock signal for the overall counter
    input reset,     // Reset signal for the overall counter
    output OneHertz, // Output pulse that is high when the counter reaches 999 (or 1000, depending on interpretation)
    output [2:0] c_enable // Enable signals for the individual BCD counters: [0] for ones, [1] for tens, [2] for hundreds
); 
    // Wires to connect the outputs of the individual BCD counters
    wire [3:0] ones;     // BCD counter for the units digit
    wire [3:0] tens;     // BCD counter for the tens digit
    wire [3:0] hundreds; // BCD counter for the hundreds digit

    // Instantiate the units BCD counter
    // It is always enabled (c_enable[0]=1'b1), meaning it increments on every clock cycle.
    bcdcount counter0 (clk, reset, c_enable[0], ones);
    // Instantiate the tens BCD counter
    // It increments when the 'ones' counter rolls over from 9 to 0.
    bcdcount counter1 (clk, reset, c_enable[1], tens);
    // Instantiate the hundreds BCD counter
    // It increments when both 'ones' and 'tens' counters roll over from 9 to 0.
    bcdcount counter2 (clk, reset, c_enable[2], hundreds);
            
    // The units counter is always enabled to count on every clock cycle
    assign c_enable[0] = 1'b1;
    // The tens counter is enabled when the 'ones' counter reaches 9 (indicating an imminent rollover)
    assign c_enable[1] = (ones == 4'd9);
    // The hundreds counter is enabled when both 'ones' and 'tens' counters reach 9
    assign c_enable[2] = (ones == 4'd9) && (tens == 4'd9);
            
    // 'OneHertz' signal is asserted when the counter reaches 999 (i.e., when all BCD digits are 9)
    // Assuming a 1 KHz input clock and this module is meant to generate a 1Hz pulse (which would be at 1000 counts)
    // The current logic makes OneHertz high when the count is 999. If it should be high for one cycle when count becomes 1000 (after 999),
    // then the logic for c_enable[2] might need to be shifted, or an extra 'thousand' digit or a pulse generation might be needed.
    // Given the name 'count1to1000' and 'OneHertz', it probably implies a total count of 1000 states (0 to 999, or 1 to 1000).
    // If input clk is 1KHz (1ms period), then 1000 counts will take 1 second.
    // This 'OneHertz' output is a pulse at the very end of the 999th state before rolling over.
    assign OneHertz = (ones == 4'd9) && (tens == 4'd9) && (hundreds == 4'd9);
            
endmodule