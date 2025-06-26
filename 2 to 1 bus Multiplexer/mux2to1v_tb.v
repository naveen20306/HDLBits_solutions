`timescale 1ns / 1ps

module mux2to1v_tb();

    // Declare 100-bit registers for inputs 'a' and 'b'
    reg [99:0] a, b;
    // Declare a single-bit register for the select input 'sel'
    reg sel;
    // Declare a 100-bit wire for the output 'out'
    wire [99:0] out;
    
    // Instantiate the Device Under Test (DUT), connecting its ports to the testbench signals
    mux2to1v dut(a, b, sel, out);
    
    // Initial block for defining the test stimulus
    initial begin
        // Set input 'a' to all zeros (100 times '0')
        a = 100'b0;
        // Set input 'b' to all ones (100 times '1')
        b = {100{1'b1}};
        
        // Test case 1: Select input 'a' (sel = 0)
        sel = 0; #2; // Set sel to 0 and wait for 2 time units
        // Display the select input and the resulting output. Use %0100b for 100-bit binary output.
        $display("The select input:sel=%b=>The selected output(100 times 0 if a/100 times 1 if b):out=%0100b.", sel, out);
        
        // Test case 2: Select input 'b' (sel = 1)
        sel = 1'b1; #2; // Set sel to 1 and wait for 2 time units
        // Display the select input and the resulting output
        $display("The select input:sel=%b=>The selected output(100 times 0 if a/100 times 1 if b):out=%0100b.", sel, out);
        
        // Terminate the simulation
        $finish;
        
    end

endmodule