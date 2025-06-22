`timescale 1ns / 1ps // Sets the time unit to 1ns and precision to 1ps.

module gates100_tb(); // Testbench module for 'gates100'.

        reg [99:0]in; // 100-bit input register to the DUT.
        wire out_and,out_or,out_xor; // Wires for reduction outputs.
        
        gates100 dut(.in(in),.out_and(out_and),.out_or(out_or),.out_xor(out_xor)); // Instantiate the DUT.
        
        initial begin // Initial block for simulation stimulus.
            in[99:0] = 100'b0; #2; // Set input to all zeros and wait 2 time units.
            $display("The input in=%099b.The outputs are out_and=%b,out_or=%b,out_xor=%b.",in,out_and,out_or,out_xor); // Display results.
            
            in[99:0] = {100{1'b1}}; #2; // Set input to all ones and wait 2 time units.
            $display("The input in=%099b.The outputs are out_and=%b,out_or=%b,out_xor=%b.",in,out_and,out_or,out_xor); // Display results.
            
            in[99:0] = 100'b1; #2; // Set input to 1 (LSB is 1, rest are 0) and wait 2 time units.
            $display("The input in=%099b.The outputs are out_and=%b,out_or=%b,out_xor=%b.",in,out_and,out_or,out_xor); // Display results.
            
            in[99:0] = {1'b1,{99'b0}}; #2; // Set input to MSB as 1, rest 0 and wait 2 time units.
            $display("The input in=%099b.The outputs are out_and=%b,out_or=%b,out_xor=%b.",in,out_and,out_or,out_xor); // Display results.
            
            in[99:0] = {50{2'b10}}; #2; // Set input to alternating 10s and wait 2 time units.
            $display("The input in=%099b.The outputs are out_and=%b,out_or=%b,out_xor=%b.",in,out_and,out_or,out_xor); // Display results.

            $finish; // End simulation.
            
        end // End of initial block.
            
endmodule // End of testbench module.