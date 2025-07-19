`timescale 1ns / 1ps

module slow_decade_counter_tb();

    // Declare registers for clock, slow enable, and reset inputs
    reg clk;
    reg slowena;
    reg reset;
    // Declare a 4-bit wire for the counter output 'q'
    wire [3:0] q;
    
    // Instantiate the Device Under Test (DUT), connecting its ports to the testbench signals
    slow_decade_counter dut(clk, slowena, reset, q);
    
    // Initial block to generate a continuous clock signal
    initial begin
        clk = 0; // Initialize clock to 0
        forever #5 clk <= ~clk; // Toggle clock every 5 time units (10ns period)
    end
    
    // Initial block to generate a slow enable signal
    initial begin
        slowena = 0; // Initialize slowena to 0
        forever #50 slowena <= ~slowena; // Toggle slowena every 50 time units (100ns period)
    end
    
    // Initial block to control the reset and monitor signals
    initial begin
        reset = 1'b1; // Assert reset (active high) to initialize the counter
        #10;          // Hold reset for 10ns (one full clock cycle)
        reset = 0;    // De-assert reset to allow counting
        
        // Use $monitor to display relevant signals whenever they change
        $monitor("Time=%t||Reset=%b||slowena=%b||Count=%b.", $time, reset, slowena, q);
        
        // Run simulation for a sufficient time to observe multiple cycles of slowena and counting
        #200; // Extend simulation time to capture more behavior
        $finish; // Terminate the simulation
    end
            
endmodule