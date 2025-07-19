`timescale 1ns / 1ps
module count1to12(
	input clk,     // Clock signal for synchronous operation
	input enable,  // Counter enable signal: when high, counter increments
	input load,    // Load enable signal: when high, 'd' is loaded into 'Q'
	input [3:0] d, // Data input to be loaded when 'load' is active
	output reg [3:0] Q // 4-bit output register for the counter value
);

    // Always block sensitive to the positive edge of the clock
    always @(posedge clk) begin
        // If 'load' is high, synchronously load 'd' into 'Q' (load takes precedence)
        if (load) begin
            Q <= d;
        end
        // Else if 'enable' is high, increment 'Q'
        else if (enable) begin
            Q <= Q + 1;
        end
        // Else (if neither load nor enable is high), Q holds its current value
    end
endmodule


module count1to12_top(
    input clk,      // Clock signal
    input reset,    // Reset signal for the overall counter logic
    input enable,   // Global enable signal for the counter
    output [3:0] Q,       // Output of the counter
    output c_enable,      // Enable signal for the 'count1to12' module
    output c_load,        // Load signal for the 'count1to12' module
    output [3:0] c_d      // Data to be loaded into the 'count1to12' module
); 

    // Instantiate the 'count1to12' counter module
    count1to12 the_counter (
        .clk(clk), 
        .enable(c_enable), 
        .load(c_load), 
        .d(c_d), 
        .Q(Q) // Connect the internal counter's output to the top module's output
    );

    // 'c_enable' is directly connected to the top-level 'enable'
    assign c_enable = enable;
    
    // 'c_load' logic:
    // Load is active if (global enable is high AND counter Q reaches 12) OR if 'reset' is high.
    // This creates a count-to-12 (1 to 12) sequence and handles reset.
    assign c_load = (enable && Q == 4'd12) || reset ? 1'b1 : 1'b0;
    
    // 'c_d' is always 1, as the counter counts from 1.
    assign c_d = 4'd1;
	
            

endmodule