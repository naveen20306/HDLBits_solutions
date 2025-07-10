`timescale 1ns / 1ps

module count10_tb();

    // Declare registers for clock and reset inputs
    reg clk, rst;
    // Declare a 4-bit wire for the counter output 'q'
    wire [3:0] q;
    
    // Instantiate the Device Under Test (DUT), connecting its ports to the testbench signals
    count10 dut(clk, rst, q);
    
    // Initial block to generate a continuous clock signal
    initial begin
        clk = 0; // Initialize clock to 0
        forever #5 clk = ~clk; // Toggle clock every 5 time units (10ns period)
    end
    
    // Initial block to provide stimulus to the reset input
    initial begin
        rst = 1; // Assert reset (active high) to initialize the counter
        #6;      // Wait for 6ns. This ensures 'q' is reset on the first positive clock edge (at 10ns, or 5ns if module has initial block).
        rst = 0; // De-assert reset to allow the counter to begin counting
        #120;    // Wait for 120ns (12 clock cycles) to observe counting
        $finish; // Terminate the simulation
    end
    
    // Initial block to monitor and display the counter value
    initial begin
        // Use $monitor to display the current time and the counter output 'q' whenever 'q' changes.
        // Using %d for decimal output, as it's a count.
        $monitor("Time=%t||Counter=%d.", $time, q);
    end

endmodule