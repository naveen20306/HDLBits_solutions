`timescale 1ns / 1ps // Sets the time unit to 1ns and precision to 1ps.

module always_case2_tb(); // Testbench module for 'always_case2'.

    reg [3:0] in; // 4-bit input register to the DUT.
    wire [1:0] pos; // 2-bit wire for the output position.
    
    always_case2 dut(.in(in),.pos(pos)); // Instantiate the DUT.
    
    initial begin // Initial block for simulation stimulus.
        for(in = 0; in < 16; in = in + 1) begin // Loop through all 16 possible 4-bit input combinations.
            #5; // Wait for 5 time units for outputs to settle.
            $display("The input in=%04b and the priority position is %02d.", in, pos); // Display the input and the calculated priority position.
        end
        
        $finish; // End simulation.
    end // End of initial block.

endmodule // End of testbench module.