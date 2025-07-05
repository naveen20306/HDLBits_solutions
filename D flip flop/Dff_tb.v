`timescale 1ns / 1ps

module Dff_tb();

    // Declare registers for clock and data inputs
    reg clk, d;
    // Declare wire for the flip-flop output
    wire q;
    
    // Instantiate the Device Under Test (DUT), connecting its ports to the testbench signals
    Dff dut(clk, d, q);
    
    // Initial block to generate a continuous clock signal
    initial begin
        clk = 0; // Initialize clock to 0
        forever #5 clk = ~clk; // Toggle clock every 5 time units (10ns period)
    end
    
    // Initial block to provide stimulus to the data input 'd'
    initial begin
        d = 0;   // Initialize data input 'd' to 0
        #3 d = 1; // At 3ns, change 'd' to 1
        #5 d = 0; // At 8ns, change 'd' to 0 (after a posedge clk at 5ns)
        #5 d = 0; // At 13ns, 'd' remains 0 (after a posedge clk at 15ns)
        #2 d = 0; // At 15ns, 'd' remains 0 (just before a posedge clk)
        #5 d = 1; // At 20ns, change 'd' to 1 (after a posedge clk at 25ns)
        #5 d = 0; // At 25ns, change 'd' to 0 (after a posedge clk at 35ns)
        
        $finish; // Terminate the simulation
    end
    
    // Initial block to monitor and display the signals
    initial begin
        // Use $monitor to display values whenever 'd' or 'q' changes
        $monitor("Time=%t||Input=> d=%b ||Output Q=%b.", $time, d, q);
    end         

endmodule