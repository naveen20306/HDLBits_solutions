`timescale 1ns / 1ps // Sets the time unit to 1ns and precision to 1ps.

module popcount255_tb(); // Testbench module for 'popcount255'.

    reg [254:0] in; // 255-bit input register to the DUT.
    wire [7:0] out; // 8-bit wire for the population count output.
    
    popcount255 dut(.in(in),.out(out)); // Instantiate the DUT.
    
    initial begin // Initial block for simulation stimulus.
            
            in[254:0] = 255'b0; #2; // Set input to all zeros and wait 2 time units.
            $display("The input in=%0255b.The number of 1s=%3d.",in,out); // Display input and population count.
            
            in[254:0] = {255{1'b1}}; #2; // Set input to all ones and wait 2 time units.
            $display("The input in=%0255b.The number of 1s=%3d.",in,out); // Display input and population count.
            
            in[254:0] = 255'b1; #2; // Set input to LSB as 1, rest 0 and wait 2 time units.
            $display("The input in=%0255b.The number of 1s=%3d.",in,out); // Display input and population count.
            
            in[254:0] = {1'b1,{254'b0}}; #2; // Set input to MSB as 1, rest 0 and wait 2 time units.
            $display("The input in=%0255b.The number of 1s=%3d.",in,out); // Display input and population count.
            
            in[254:0] = {{127{2'b10}},1'b1}; #2; // Set input to alternating 10s pattern and wait 2 time units.
            $display("The input in=%0255b.The number of 1s=%3d.",in,out); // Display input and population count.

            $finish; // End simulation.
            end // End of initial block.
endmodule // End of testbench module.