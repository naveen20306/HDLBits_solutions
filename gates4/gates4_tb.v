module gates4_tb(); // Testbench module for 'gates4'.

    reg [3:0] in; // 4-bit input to the DUT.
    wire out_and, out_or, out_xor; // Outputs from the DUT.
    
    gates4 dut(.in(in),.out_and(out_and),.out_or(out_or),.out_xor(out_xor)); // Instantiate the 'gates4' module.
    
    initial begin // Initial block for simulation stimulus.
        for(in=0; in<16; in=in+1) begin // Loop through all 16 possible 4-bit combinations.
            #3; // Wait for 3 time units for outputs to settle.
            $display("Input in=%04b-->Output and=%b,or=%b,xor=%b",in,out_and,out_or,out_xor); // Display input and outputs.
        end
    end // End of initial block.
    
endmodule // End of testbench module.