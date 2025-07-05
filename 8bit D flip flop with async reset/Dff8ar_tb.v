`timescale 1ns / 1ps

module Dff8ar_tb();

    // Declare registers for clock, asynchronous reset, and data inputs
    reg clk;
    reg rst; // This 'rst' signal connects to 'areset' in the DUT
    reg [7:0] d;
    // Declare an 8-bit wire for the output 'q'
    wire [7:0] q;
    
    // Instantiate the Device Under Test (DUT), connecting its ports to the testbench signals
    // Connect testbench 'rst' to DUT 'areset'
    Dff8ar dut(clk, rst, d, q);
    
    // Initial block to generate a continuous clock signal
    initial begin
        clk = 0; // Initialize clock to 0
        forever #5 clk = ~clk; // Toggle clock every 5 time units (10ns period)
    end
    
    // Initial block to provide stimulus to the data input 'd' and asynchronous reset 'rst'
    initial begin
        d = 0; rst = 1; // Initialize 'd' to 0 and assert 'rst' (active high asynchronous reset)
        #5 d = 8'h34; rst = 0; // At 5ns, de-assert 'rst'. q should have been reset to 0 immediately.
                               // Now d is 8'h34, which will be captured at the next positive clock edge (10ns).
        #10 d = 8'hff; rst = 0; // At 15ns, change 'd' to 8'hff. q should capture 8'h34 at 10ns, and 8'hff at 20ns.
        #4 d = 8'h80; rst = 0; // At 19ns, change 'd' to 8'h80. q will capture 8'hff at 20ns.
        #7 d = 8'h01; rst = 1; // At 26ns, assert 'rst'. q should immediately reset to 0, regardless of clock edge.
        $finish; // Terminate the simulation
    end
    
    // Initial block to monitor and display the signals
    initial begin
        // Use $monitor to display values whenever 'd', 'rst', or 'q' changes
        $monitor("Time=%t||Input=> d=%b & Reset=%b ||Output Q=%b .", $time, d, rst, q);
    end         

endmodule