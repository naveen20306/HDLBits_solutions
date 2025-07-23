`timescale 1ns / 1ps

module lfsr32_tb();

    // Declare registers for clock and reset inputs
    reg clk;
    reg reset;   // Active-high synchronous reset to 32'h1
    // Declare a 32-bit wire for the LFSR output 'q'
    wire [31:0] q;
    
    // Instantiate the Device Under Test (DUT), connecting its ports to the testbench signals
    lfsr32 dut(clk, reset, q);
    
    // Initial block to generate a continuous clock signal
    initial begin
        clk <= 0; // Initialize clock to 0
        forever #5 clk <= ~clk; // Toggle clock every 5 time units (10ns period)
    end
            
    // Initial block to provide stimulus to the reset input
    initial begin
        reset = 1'b1; // Assert reset (active high) to initialize LFSR
        #10;          // Hold reset for 10ns (one full clock cycle) to ensure reset propagates
        
        reset = 1'b0; // De-assert reset to allow LFSR to operate
        #1000;        // Let the LFSR run for 1000ns (100 clock cycles) to observe its sequence
        
        $finish;      // Terminate the simulation
    end
            
    // Initial block to monitor and display the LFSR output
    initial begin
        // Use $monitor to display the current time and the LFSR output 'q'
        $monitor("Time=%t||Output=%b.", $time, q);
    end
            
endmodule