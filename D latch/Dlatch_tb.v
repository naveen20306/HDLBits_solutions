`timescale 1ns / 1ps

module Dlatch_tb();

    // Declare registers for data input 'd' and enable 'ena'
    reg d, ena;
    // Declare a wire for the latch output 'q'
    wire q;
    
    // Instantiate the Device Under Test (DUT), connecting its ports to the testbench signals
    Dlatch dut(d, ena, q);
    
    // Initial block to provide stimulus to 'd' and 'ena'
    initial begin
        // Test case 1: d=0, ena=0. Latch is transparent, output should follow d. Then ena=0, latch holds.
        d = 0; ena = 0;
        #5 d = 0; ena = 1; // At 5ns, ena becomes 1 (transparent). Q should become 0.
        #5 d = 1; ena = 1; // At 10ns, d becomes 1 (ena is 1, transparent). Q should become 1.
        #5 d = 1; ena = 0; // At 15ns, ena becomes 0 (latch holds). Q should hold 1, even if d changes later.
        // The problem description only gives these 4 stimulus lines. Add $finish for proper simulation end.
        #5 $finish; // Add a final delay and terminate simulation
    end
    
    // Initial block to monitor and display the signals
    initial begin
        // Use $monitor to display values whenever 'ena', 'd', or 'q' changes
        $monitor("Time=%t||Inputs=> enable=%b & d=%b||Output=> Q=%b.", $time, ena, d, q);
    end
            
endmodule