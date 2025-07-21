`timescale 1ns / 1ps

module Shift_reg_4bit_tb();

    // Declare registers for clock, asynchronous reset, load, enable, and data inputs
    reg clk;
    reg areset;  // async active-high reset to zero
    reg load;
    reg ena;
    reg [3:0] data;
    // Declare a 4-bit wire for the output 'q'
    wire [3:0] q;

    // Instantiate the Device Under Test (DUT), connecting its ports to the testbench signals
    Shift_reg_4bit dut(clk, areset, load, ena, data, q);
    
    // Initial block to generate a continuous clock signal
    initial begin
        clk <= 0; // Initialize clock to 0
        forever #5 clk <= ~clk; // Toggle clock every 5 time units (10ns period)
    end
            
    // Initial block to provide stimulus to areset, load, ena, and data inputs
    initial begin
        // Test Case 1: Active reset
        areset = 1'b1; load = 0; ena = 0; data = 0; #10; // At 0ns: Reset is active, Q should be 0.
                                                       // At 10ns: Still reset, Q is 0.
        // Test Case 2: Load data
        areset = 1'b0; load = 1'b1; ena = 0; data = 4'hf; #10; // At 10ns: Reset de-asserted, Load is active.
                                                              // At 20ns (posedge clk): Q should load 4'hf.
        // Test Case 3: Shift enable
        areset = 1'b0; load = 0; ena = 1'b1; data = 4'hz; #10; // At 20ns: Load de-asserted, Enable is active. Data is don't care.
                                                              // At 30ns (posedge clk): Q should shift right. (e.g., if Q was 1111, now 0111)
        // Test Case 4: Reset takes precedence
        areset = 1'b1; load = 1'b1; ena = 1'b1; data = 4'bz; #10; // At 30ns: Reset is active. Load and Enable are don't care.
                                                                 // At 30ns: Q should immediately reset to 0 (asynchronous reset).
                                                                 // At 40ns: Still reset, Q is 0.
        
        #10; // Additional delay to observe final state
        
        $finish; // Terminate the simulation
    end
            
    // Initial block to monitor and display relevant signals
    initial begin
        // Use $monitor to display time, control signals, data, and the shifted output 'q'.
        $monitor("Time=%0t||Reset=%b||Load=%b||Enable=%b||Data=%b||Shifted output=%b.", $time, areset, load, ena, data, q);
    end
            
endmodule