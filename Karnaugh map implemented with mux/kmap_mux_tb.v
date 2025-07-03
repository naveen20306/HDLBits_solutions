`timescale 1ns / 1ps

module kmap_mux_tb();

    // Declare registers for inputs
    reg c, d;
    // Declare a 4-bit wire for the output
    wire [3:0] muxin;
    
    // Instantiate the Device Under Test (DUT), connecting its ports to the testbench signals
    kmap_mux dut(c, d, muxin);
    
    // Initial block for defining the test stimulus
    initial begin
        // Test case 1: c=0, d=0
        c = 0; d = 0; #4;
        // Display inputs and output
        $display("The inputs are c=%b and d=%b, Output mux_in=%b.", c, d, muxin);
        
        // Test case 2: c=0, d=1
        c = 0; d = 1; #4;
        // Display inputs and output
        $display("The inputs are c=%b and d=%b, Output mux_in=%b.", c, d, muxin);
        
        // Test case 3: c=1, d=0
        c = 1; d = 0; #4;
        // Display inputs and output
        $display("The inputs are c=%b and d=%b, Output mux_in=%b.", c, d, muxin);
        
        // Test case 4: c=1, d=1
        c = 1; d = 1; #4;
        // Display inputs and output
        $display("The inputs are c=%b and d=%b, Output mux_in=%b.", c, d, muxin);

        // Terminate the simulation
        $finish;
    end
endmodule