`timescale 1ns / 1ps

module rotate100_tb();

    // Declare registers for clock, load, enable, and data inputs
    reg clk;
    reg load;
    reg [1:0] ena;
    reg [99:0] data;
    // Declare a 100-bit wire for the output 'q'
    wire [99:0] q;
    
    // Instantiate the Device Under Test (DUT), connecting its ports to the testbench signals
    rotate100 dut(clk, load, ena, data, q);
    
    // Initial block to generate a continuous clock signal
    initial begin
        clk <= 0; // Initialize clock to 0
        forever #5 clk <= ~clk; // Toggle clock every 5 time units (10ns period)
    end
            
    // Initial block to provide stimulus to load, ena, and data inputs
    initial begin
        // Initial state
        load = 0; ena = 0; data = 0; #5; // At 0ns: No load, no enable. Data=0.
                                          // At 5ns: Q should hold initial value (likely 'x' or 0 if a power-on reset is implicit in DUT, but not here).
                                          // Note: The DUT 'rotate100' does not have an 'initial' block for 'q', so 'q' will be 'x' until loaded.
        
        // Test Case 1: Load data (100'b11)
        // ena = 2'b01 (rotate right) is set, but load has precedence.
        load = 1'b1; ena = 2'b01; data = 100'b11; #10; // At 5ns: Load is active, data=100'b11.
                                                        // At 15ns (posedge clk): Q should load 100'b11.
        
        // Test Case 2: Rotate right
        load = 0; ena = 2'b01; data = 100'bz; #10; // At 15ns: Load inactive, Enable (rotate right) active. Data is don't care.
                                                    // At 25ns (posedge clk): Q should rotate right. (e.g. if 100'b11, becomes {1'b1, 98'b0, 1'b1})
        
        // Test Case 3: Load data (100'b1)
        // ena = 2'b10 (rotate left) is set, but load has precedence.
        load = 1'b1; ena = 2'b10; data = 100'b1; #10; // At 25ns: Load active, data=100'b1.
                                                       // At 35ns (posedge clk): Q should load 100'b1.
        
        // Test Case 4: Rotate left
        load = 0; ena = 2'b10; data = 100'bz; #10; // At 35ns: Load inactive, Enable (rotate left) active. Data is don't care.
                                                    // At 45ns (posedge clk): Q should rotate left. (e.g. if 100'b1, becomes {99'b0, 1'b1})
        
        // Test Case 5: Load data (100'b111)
        // ena = 2'b11 (default/hold) is set, but load has precedence.
        load = 1'b1; ena = 2'b11; data = 100'b111; #10; // At 45ns: Load active, data=100'b111.
                                                         // At 55ns (posedge clk): Q should load 100'b111.
        
        // Test Case 6: No rotation (default case of 'ena')
        load = 0; ena = 2'b11; data = 100'bz; #10; // At 55ns: Load inactive, Enable (default/hold) active. Data is don't care.
                                                    // At 65ns (posedge clk): Q should hold its current value (100'b111).
        
        $finish; // Terminate the simulation
    end
            
    // Initial block to monitor and display relevant signals
    initial begin
        // Use $monitor to display time, load, enable, data, and the output 'q'.
        $monitor("Time=%t||Load=%b||Enable=%b||Data=%b||Output=%b.", $time, load, ena, data, q);
    end

endmodule