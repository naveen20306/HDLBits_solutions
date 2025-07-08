`timescale 1ns / 1ps

module jkff_tb();

    // Declare registers for clock, J and K inputs
    reg clk, j, k;
    // Declare wire for the output Q
    wire q;
    
    // Instantiate the Device Under Test (DUT), connecting its ports to the testbench signals
    jkff dut(clk, j, k, q);
    
    // Initial block to generate a continuous clock signal
    initial begin
        clk = 0; // Initialize clock to 0
        forever #5 clk = ~clk; // Toggle clock every 5 time units (10ns period)
    end
    
    // Initial block to provide stimulus to J and K inputs
    initial begin
        // Apply various combinations of J and K and observe Q after a clock cycle
        // Initial state: J=0, K=0 (Hold)
        j <= 0; k <= 0; #10; // Q should remain 0 initially.
        
        // J=0, K=1 (Reset)
        j <= 0; k <= 1'b1; #10; // Q should become 0.
        
        // J=0, K=0 (Hold)
        j <= 0; k <= 0; #10; // Q should remain 0.
        
        // J=1, K=0 (Set)
        j <= 1'b1; k <= 0; #10; // Q should become 1.
        
        // J=0, K=0 (Hold)
        j <= 0; k <= 0; #10; // Q should remain 1.
        
        // J=1, K=1 (Toggle)
        j <= 1'b1; k <= 1'b1; #10; // Q should toggle from 1 to 0.
        
        // J=0, K=0 (Hold)
        j <= 0; k <= 0; #10; // Q should remain 0.
        
        // J=1, K=1 (Toggle)
        j <= 1'b1; k <= 1'b1; #10; // Q should toggle from 0 to 1.
        
        $finish; // Terminate the simulation
    end
    
    // Initial block to monitor and display the signals
    initial begin
        // Use $monitor to display values whenever J, K, or Q changes
        $monitor("Time=%time||Inputs=> J=%b and K=%b || Outputs=>Q=%b.", $time, j, k, q);
    end
    
endmodule