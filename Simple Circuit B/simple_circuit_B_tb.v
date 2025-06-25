`timescale 1ns / 1ps // Sets the time unit to 1ns and precision to 1ps.

module simple_circuit_B_tb(); // Testbench module for 'simple_circuit_B'.

    reg x,y; // Registers for the two input signals.
    wire z; // Wire for the output signal.
    
    simple_circuit_B dut(x,y,z); // Instantiate the DUT.
    
    initial begin // Initial block for simulation stimulus.
        x=0;y=0;#4; // Set inputs to 0,0 and wait 4 time units.
        $display("The inputs are x=%b and y=%b, Output z=%b.",x,y,z); // Display inputs and output.
        
        x=0;y=1;#4; // Set inputs to 0,1 and wait 4 time units.
        $display("The inputs are x=%b and y=%b, Output z=%b.",x,y,z); // Display inputs and output.
        
        x=1;y=0;#4; // Set inputs to 1,0 and wait 4 time units.
        $display("The inputs are x=%b and y=%b, Output z=%b.",x,y,z); // Display inputs and output.
        
        x=1;y=1;#4; // Set inputs to 1,1 and wait 4 time units.
        $display("The inputs are x=%b and y=%b, Output z=%b.",x,y,z); // Display inputs and output.

        $finish; // End simulation.
        
    end // End of initial block.
endmodule // End of testbench module.