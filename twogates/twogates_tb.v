`timescale 1ns / 1ps // Sets the time unit to 1ns and precision to 1ps.

module twogates_tb(); // Testbench module for 'twogates'.

    reg in1,in2,in3; // Registers for the three input signals.
    wire out; // Wire for the output signal.
    
    twogates dut(in1,in2,in3,out); // Instantiate the DUT using positional port mapping.
    reg [2:0] ins; // Loop variable to generate all 3-bit input combinations.
    
    initial begin // Initial block for simulation stimulus.
        for(ins = 0; ins <= 3'b111; ins = ins + 1) begin // Loop through all 8 possible 3-bit input combinations.
            {in1,in2,in3} = ins; // Assign current combination to inputs.
            #4; // Wait for 4 time units for outputs to settle.
            $display("The inputs are in1=%b,in2=%b,in3=%b and the output is %b",in1,in2,in3,out); // Display inputs and output.
        end
    end // End of initial block.

endmodule // End of testbench module.