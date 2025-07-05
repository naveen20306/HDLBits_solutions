`timescale 1ns / 1ps

module Dff16e_tb();

    // Declare registers for clock, active-high reset (will be inverted for active-low DUT input), data, and byte enable
    reg clk;
    reg rst; // Testbench uses active-high 'rst'
    reg [15:0] d;
    reg [1:0] byteena;
    // Declare a 16-bit wire for the output 'q'
    wire [15:0] q;
    
    // Instantiate the Device Under Test (DUT).
    // Connect testbench 'rst' inverted to DUT 'resetn' (active-low reset).
    Dff16e dut(clk, ~rst, byteena, d, q);
    
    // Initial block to generate a continuous clock signal
    initial begin
        clk = 0; // Initialize clock to 0
        forever #5 clk = ~clk; // Toggle clock every 5 time units (10ns period)
    end
    
    // Initial block to provide stimulus to data 'd', reset 'rst', and byte enable 'byteena'
    initial begin
        d = 0; rst = 1; byteena = 0; // Initialize: d=0, reset active (rst=1), byteena=0 (no write)
        
        // At 5ns (posedge clk): reset is de-asserted (~rst=0->1) but active-low 'resetn' is high,
        // so flip-flop is not in reset.
        // byteena is 2'b10, so only upper byte of q should update with d[15:8].
        #5 d = 16'hff34; rst = 0; byteena = 2'b10;
        
        // At 15ns (posedge clk): byteena is still 2'b10 (from previous, no change).
        // Only upper byte updates.
        #10 d = 16'h1fff; rst = 0;
        
        // At 25ns (posedge clk): byteena is 2'b00. No byte updates. q should hold its previous value.
        #10 d = 16'h2080; rst = 0; byteena = 2'b00;
        
        // At 35ns (posedge clk): reset is asserted (~rst=1->0). q should reset to 0.
        // byteena is 2'b11, but reset takes precedence.
        #10 d = 16'h1001; rst = 1; byteena = 2'b11;
        
        // At 45ns (posedge clk): reset is de-asserted (~rst=1->0).
        // byteena is 2'b01, so only lower byte of q should update with d[7:0].
        #10 d = 16'h1100; rst = 0; byteena = 2'b01;
        
        $finish; // Terminate the simulation
    end
    
    // Initial block to monitor and display the signals
    initial begin
        // Use $monitor to display values whenever 'd', 'rst', 'q' or 'byteena' changes.
        // Add byteena to monitor for better debugging.
        $monitor("Time=%t||Input=> d=%h, Reset=%b, Byteena=%b ||Output Q=%h .", $time, d, rst, byteena, q);
    end         
    
endmodule