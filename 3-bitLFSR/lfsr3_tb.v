`timescale 1ns / 1ps

module lfsr3_tb();

    // Declare registers for the input 'r' (likely initial seed/state), clock, and load control
    reg [2:0] r;
    reg clk, load;    // 'r' is for the LFSR state, 'load' for loading, 'clk' for clocking
    // Declare wires for combined KEY input and LEDR output
    wire [1:0] KEY;     // Combined signal for load and clk (as per module lfsr3's port list assumption)
    wire [2:0] LEDR;    // Output from the LFSR (likely the LFSR state)

    // Assign the 'load' and 'clk' registers to the 'KEY' wire.
    // Assuming KEY[1] is 'load' and KEY[0] is 'clk' based on the $monitor line.
    assign KEY = {load, clk}; 
    
    // Instantiate the Device Under Test (DUT), connecting its ports to the testbench signals
    lfsr3 dut(r, KEY, LEDR); 
    // Note: The 'lfsr3' module definition is not provided, so assumptions about its ports are made.
    // Based on the tb, 'lfsr3' expects inputs 'r' (3-bit) and 'KEY' (2-bit), and outputs 'LEDR' (3-bit).
    
    // Initial block to generate a continuous clock signal
    initial begin
        clk <= 0; // Initialize clock to 0
        forever #5 clk <= ~clk; // Toggle clock every 5 time units (10ns period)
    end
    
    // Initial block to provide stimulus to 'load' and 'r'
    initial begin
        load = 1'b1; r = 3'b001; #10; // At 0ns: Assert load, set 'r' (initial seed) to 001.
                                     // At 10ns: Still loading. LFSR should be 001.
        load = 0; r = 3'bzzz; #500; // At 10ns: De-assert load. 'r' becomes 'zzz' (don't care as not loading).
                                    // LFSR should now run, generating pseudo-random sequence.
                                    // Simulate for 500ns (50 clock cycles) to observe the sequence.
        $finish; // Terminate the simulation
    end
    
    // Initial block to monitor and display relevant signals
    initial begin
        // Use $monitor to display time, load signal (KEY[1]), input 'r' (SW in comment suggests it's a switch input), and LFSR output 'LEDR'.
        $monitor("Time=%t||Load=%b||SW=%b||LEDR=%b.", $time, KEY[1], r, LEDR);
    end
    
endmodule