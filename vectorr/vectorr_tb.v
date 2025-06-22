module vectorr_tb(); // Testbench module for 'vectorr'.

    reg [7:0] in; // 8-bit input to the DUT.
    wire [7:0] out; // 8-bit output from the DUT.
    
    vectorr dut(.in(in),.out(out)); // Instantiate the 'vectorr' module.
    
    initial begin // Initial block for simulation stimulus.
        for(in = 0; in <= {8{1'b1}}; in = in + 1) begin // Loop through all 256 possible 8-bit combinations.
            #5; // Wait for 5 time units for outputs to settle.
            $display("Input in=%08b--> Output reversed=%08b",in,out); // Display input and reversed output.
            if (in == {8{1'b1}}) begin $finish; end // If all ones, end simulation.
        end
    end // End of initial block.
endmodule // End of testbench module.