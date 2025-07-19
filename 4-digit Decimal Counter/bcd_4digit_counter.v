`timescale 1ns / 1ps
module bcd(
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
        // If 'ena' is low, 'q' holds its current value
    end
endmodule

module bcd_4digit_counter(
    input clk,          // Clock signal for the overall counter
    input reset,        // Synchronous active-high reset for the entire counter
    output [3:1] ena,   // Output enable signals for cascading: ena[1] for tens, ena[2] for hundreds, ena[3] for thousands
    output [15:0] q     // 16-bit BCD output, representing the four digits (q[3:0] is ones, q[7:4] is tens, etc.)
);
	
    // Wires to hold the individual 4-bit BCD digit outputs from each 'bcd' module instance
    wire [3:0] ones, tens, hundreds, thousands;
    
    // Assign the outputs of the individual BCD counters to specific slices of the combined 16-bit output 'q'
    assign q[3:0]    = ones;     // Least significant digit (units)
    assign q[7:4]    = tens;     // Tens digit
    assign q[11:8]   = hundreds; // Hundreds digit
    assign q[15:12]  = thousands; // Most significant digit (thousands)
    
    // Logic for cascade enables:
    // ena[1] (tens enable) is high when the 'ones' digit is 9, indicating it's about to roll over.
    assign ena[1] = (ones == 4'd9);
    // ena[2] (hundreds enable) is high when both 'ones' and 'tens' digits are 9.
    assign ena[2] = ena[1] && (tens == 4'd9);
    // ena[3] (thousands enable) is high when 'ones', 'tens', and 'hundreds' digits are all 9.
    assign ena[3] = ena[2] && (hundreds == 4'd9);
    
    // Instantiate the four 'bcd' counter modules:
    // The 'ones' counter is always enabled to count on every clock cycle.
    bcd one(clk, reset, 1'b1, ones);
    // The 'tens' counter is enabled by 'ena[1]'.
    bcd ten(clk, reset, ena[1], tens);
    // The 'hundreds' counter is enabled by 'ena[2]'.
    bcd hundered(clk, reset, ena[2], hundreds);
    // The 'thousands' counter is enabled by 'ena[3]'.
    bcd thousand(clk, reset, ena[3], thousands);
    
endmodule