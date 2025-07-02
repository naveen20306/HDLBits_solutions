`timescale 1ns / 1ps

module kmap4_tb();

    // Declare registers for inputs
    reg a, b, c, d;
    // Declare wire for the output
    wire out;
    
    // Instantiate the Device Under Test (DUT), connecting its ports to the testbench signals
    kmap4 dut(a, b, c, d, out);
    
    // Initial block for defining the test stimulus
    initial begin
        // Loop through all possible 4-bit input combinations (0000 to 1111)
        for ({a, b, c, d} = 4'b0000; {a, b, c, d} <= 4'b1111; {a, b, c, d} = {a, b, c, d} + 1) begin
            #4; // Wait for 4 time units for the output to propagate
            // Display the current inputs and the resulting output
            $display("Inputs=> a=%b,b=%b,c=%b,d=%b||Output=>out=%b.", a, b, c, d, out);
        end
        // Terminate the simulation after all test cases
        $finish;
    end
            
endmodule