`timescale 1ns / 1ps // Sets the time unit to 1ns and precision to 1ps.

module truthtable1_tb(); // Testbench module for 'truthtable1'.

    reg x3,x2,x1; // Registers for the three input variables.
    wire f; // Wire for the function output.
    
    truthtable1 dut(x3,x2,x1,f); // Instantiate the DUT using positional port mapping.
    reg [2:0] in_wire; // Loop variable to generate all 3-bit input combinations.
    initial begin // Initial block for simulation stimulus.
        for(in_wire = 0; in_wire <= 3'b111; in_wire = in_wire + 1) begin // Loop through all 8 possible 3-bit input combinations.
            {x3,x2,x1} = in_wire; // Assign current combination to inputs.
            #5; // Wait for 5 time units for output to settle.
            $display("The input x3=%b,x2=%b,x1=%b and the output of the function f=%b.",x3,x2,x1,f); // Display inputs and function output.
        end
        $finish; // End simulation.
    end // End of initial block.
    
endmodule // End of testbench module.