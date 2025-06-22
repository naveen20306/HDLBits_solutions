`timescale 1ns / 1ps // Sets the time unit to 1ns and precision to 1ps.

module always_casez_tb(); // Testbench module for 'always_casez'.

    reg [7:0] in; // 8-bit input register to the DUT.
    wire [2:0] pos; // 3-bit wire for the output position.
    
    always_casez dut(.in(in),.pos(pos)); // Instantiate the DUT.
    
    initial begin // Initial block for simulation stimulus.
        for(in = 0; in <= {8{1'b1}}; in = in + 1) begin // Loop through all 256 possible 8-bit input combinations.
            #5; // Wait for 5 time units for outputs to settle.
            $display("The input in=%08b and the priority position is %03d.", in, pos); // Display the input and the calculated priority position.
        end
        
        $finish; // End simulation.
    end // End of initial block.

endmodule // End of testbench module.