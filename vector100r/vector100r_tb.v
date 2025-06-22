`timescale 1ns / 1ps // Sets the time unit to 1ns and precision to 1ps.

module vector100r_tb(); // Testbench module for 'vector100r'.

    reg [99:0] in; // 100-bit input register to the DUT.
    wire [99:0] out; // 100-bit output wire from the DUT.
        
        vector100r dut(.in(in),.out(out)); // Instantiate the DUT.
        
        initial begin // Initial block for simulation stimulus.
            in[99:0] = 100'b0; #2; // Set input to all zeros and wait 2 time units.
            $display("The input in=%099b.The reversed output=%b.",in,out); // Display input and reversed output.
            
            in[99:0] = {100{1'b1}}; #2; // Set input to all ones and wait 2 time units.
            $display("The input in=%099b.The reversed output=%b.",in,out); // Display input and reversed output.
            
            in[99:0] = 100'b1; #2; // Set input to 1 (LSB is 1) and wait 2 time units.
            $display("The input in=%099b.The reversed output=%b.",in,out); // Display input and reversed output.
            
            in[99:0] = {1'b1,{99'b0}}; #2; // Set input to MSB as 1, rest 0 and wait 2 time units.
            $display("The input in=%099b.The reversed output=%b.",in,out); // Display input and reversed output.
            
            in[99:0] = {50{2'b10}}; #2; // Set input to alternating 10s and wait 2 time units.
            $display("The input in=%099b.The reversed output=%b.",in,out); // Display input and reversed output.

            $finish; // End simulation.
            
        end // End of initial block.
            
endmodule // End of testbench module.