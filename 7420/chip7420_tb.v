`timescale 1ns / 1ps // Sets the time unit to 1ns and precision to 1ps.

module chip7420_tb(); // Testbench module for 'chip7420'.

    reg p1a, p1b, p1c, p1d, p2a, p2b, p2c, p2d; // Registers for inputs to both NAND gates.
    wire p1y,p2y; // Wires for outputs from both NAND gates.
    
    chip7420 dut(p1a, p1b, p1c, p1d,p1y,p2a, p2b, p2c, p2d,p2y); // Instantiate the DUT using positional port mapping.
    reg [3:0] in; // Loop variable to generate input combinations.
    initial begin // Initial block for simulation stimulus.
        for(in = 0; in <= 4'b1111; in = in + 1) begin // Loop through all 16 possible 4-bit input combinations.
            {p1a, p1b, p1c, p1d} = in; // Assign current combination to first set of inputs.
            {p2a, p2b, p2c, p2d} = in; // Assign the same combination to second set of inputs.
            #5; // Wait for 5 time units for outputs to settle.
            $display("The inputs p1a=%b,p1b=%b,p1c=%b,p1d=%b,p2a=%b,p2b=%b,p2c=%b,p2d=%b and the outputs are p1y=%b,p2y=%b.", p1a, p1b, p1c, p1d, p2a, p2b, p2c, p2d,p1y,p2y); // Display inputs and outputs.
        end
        $finish; // End simulation.
    end // End of initial block.
    
endmodule // End of testbench module.