`timescale 1ns / 1ps

module Mux2to1_tb();

    // Declare registers for inputs: data inputs 'a', 'b', and select 'sel'
    reg a, b, sel;
    // Declare a wire for the output 'out'
    wire out;
    
    // Instantiate the Device Under Test (DUT), connecting its ports to the testbench signals
    Mux2to1 dut(a, b, sel, out);
    
    // Initial block for defining the test stimulus
    initial begin
        // Set fixed data inputs for testing
        a = 0; b = 1;
        
        // Test case 1: Select 'a' (sel = 0)
        sel = 0; #2; // Set sel to 0 and wait for 2 time units
        // Display the select input and the resulting output
        $display("The select input:sel=%b=>The selected output(0 if a/1 if b):out=%b.", sel, out);
        
        // Test case 2: Select 'b' (sel = 1)
        sel = 1'b1; #2; // Set sel to 1 and wait for 2 time units
        // Display the select input and the resulting output
        $display("The select input:sel=%b=>The selected output(0 if a/1 if b):out=%b.", sel, out);
        
        // Terminate the simulation
        $finish;
        
    end

endmodule