`timescale 1ns / 1ps

module Dff8_tb();

    // Declare a register for the clock signal
    reg clk;
    // Declare an 8-bit register for the data input 'd'
    reg [7:0] d;
    // Declare an 8-bit wire for the output 'q'
    wire [7:0] q;
    
    // Instantiate the Device Under Test (DUT), connecting its ports to the testbench signals
    Dff8 dut(clk, d, q);
    
    // Initial block to generate a continuous clock signal
    initial begin
        clk = 0; // Initialize clock to 0
        forever #5 clk = ~clk; // Toggle clock every 5 time units (10ns period)
    end
    
    // Initial block to provide stimulus to the data input 'd'
    initial begin
        d = 0;      // Initialize data input 'd' to 0
        #5 d = 8'h34; // At 5ns, change 'd' to 8'h34 (first positive clock edge)
        #10 d = 8'hff; // At 15ns, change 'd' to 8'hff (after positive clock edge at 15ns)
        #4 d = 8'h80; // At 19ns, change 'd' to 8'h80 (just before positive clock edge at 20ns)
        #7 d = 8'h01; // At 26ns, change 'd' to 8'h01 (after positive clock edge at 25ns)
        $finish;    // Terminate the simulation
    end
    
    // Initial block to monitor and display the signals
    initial begin
        // Use $monitor to display values whenever 'd' or 'q' changes
        $monitor("Time=%t||Input=> d=%b ||Output Q=%b.", $time, d, q);
    end         
    
endmodule