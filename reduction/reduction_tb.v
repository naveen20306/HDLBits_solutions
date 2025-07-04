`timescale 1ns / 1ps // Sets the time unit to 1ns and precision to 1ps.

module reduction_tb(); // Testbench module for 'reduction'.

    reg [7:0] in; // 8-bit input register to the DUT.
    wire parity; // Output wire for parity.
    
    reduction dut(.in(in),.parity(parity)); // Instantiate the DUT.
    
    initial begin // Initial block for simulation stimulus.
        for(in = 0; in <= {8{1'b1}}; in = in + 1) begin // Loop through all 256 possible 8-bit input combinations.
            #5; // Wait for 5 time units for output to settle.
            $display("The parity of %08b is %b.",in,parity); // Display the input and its parity.
         end
     $finish; // End simulation.
     end // End of initial block.

endmodule // End of testbench module.