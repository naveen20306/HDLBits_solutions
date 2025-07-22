`timescale 1ns / 1ps

module lfsr5new_tb();

    // Declare registers for clock and reset inputs
    reg clk;
    reg reset;   // Active-high synchronous reset to 5'h1
    // Declare a 5-bit wire for the LFSR output 'q'
    wire [4:0] q;
    
    // Instantiate the Device Under Test (DUT), connecting its ports to the testbench signals
    lfsr5new dut(clk, reset, q);
    
    // Initial block to generate a continuous clock signal
    initial begin
        clk <= 0; // Initialize clock to 0
        forever #5 clk <= ~clk; // Toggle clock every 5 time units (10ns period)
    end
            
    // Initial block to provide stimulus to the reset input
    initial begin
        reset = 1'b1; // Assert reset (active high) to initialize LFSR to 5'h1
        #10;          // Hold reset for 10ns (one full clock cycle)
        reset = 0;    // De-assert reset to allow LFSR to operate
        
        #330;         // Let the LFSR run for 330ns to observe multiple cycles.
                      // A 5-bit LFSR with proper feedback has a period of (2^5 - 1) = 31 states.
                      // 330ns / 10ns per cycle = 33 cycles, enough to see full sequence.
        
        $finish;      // Terminate the simulation
    end
            
    // Initial block to monitor and display relevant signals
    initial begin
        // Use $monitor to display time, reset state, and the LFSR output 'q'.
        $monitor("Time=%t||Reset=%b||Data=%b.", $time, reset, q);
    end
            
endmodule