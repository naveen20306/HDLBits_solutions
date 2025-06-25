`timescale 1ns / 1ps

module combine_circuits_A_and_B_tb();

    // Declare registers for inputs
    reg x, y;
    // Declare wire for the output
    wire z;
    
    // Instantiate the Device Under Test (DUT), connecting its ports to the testbench signals
    combine_circuits_A_and_B dut(x, y, z);
    
    // Initial block for defining the test stimulus
    initial begin
        // Test case: x=0, y=0
        x = 0; y = 0; #4;
        // Display inputs and output
        $display("Inputs: x=%b and y=%b and Output:z=%b.",x,y,z);
        // Test case: x=0, y=1
        x = 0; y = 1; #4;
        // Display inputs and output
        $display("Inputs: x=%b and y=%b and Output:z=%b.",x,y,z);
        // Test case: x=1, y=0
        x = 1; y = 0; #4;
        // Display inputs and output
        $display("Inputs: x=%b and y=%b and Output:z=%b.",x,y,z);
        // Test case: x=1, y=1
        x = 1; y = 1; #4;
        // Display inputs and output
        $display("Inputs: x=%b and y=%b and Output:z=%b.",x,y,z);
        // Terminate simulation
        $finish;
        
    end

endmodule