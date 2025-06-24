`timescale 1ns / 1ps // Sets the time unit to 1ns and precision to 1ps.

module twobit_equality_tb(); // Testbench module for 'twobit_equality'.

    reg [1:0] a,b; // 2-bit registers for inputs.
    wire z; // Wire for the equality output.
    
    twobit_equality dut(a,b,z); // Instantiate the DUT.
    
    initial begin // Initial block for simulation stimulus.
    
        a=0;b=0;#4; // Test case: A=00, B=00.
        $display("The inputs are A=%02b and B=%02b, equality check results=%b.",a,b,z); // Display inputs and output.
        
        a=0;b=2'b11;#4; // Test case: A=00, B=11.
        $display("The inputs are A=%02b and B=%02b, equality check results=%b.",a,b,z); // Display inputs and output.
        
        a=2'b10;b=2'b10;#4; // Test case: A=10, B=10.
        $display("The inputs are A=%02b and B=%02b, equality check results=%b.",a,b,z); // Display inputs and output.
        
        a=2'b11;b=2'b11;#4; // Test case: A=11, B=11.
        $display("The inputs are A=%02b and B=%02b, equality check results=%b.",a,b,z); // Display inputs and output.

        a=2'b11;b=2'b10;#4; // Test case: A=11, B=10.
        $display("The inputs are A=%02b and B=%02b, equality check results=%b.",a,b,z); // Display inputs and output.

        $finish; // End simulation.
        
    end // End of initial block.
    
endmodule // End of testbench module.