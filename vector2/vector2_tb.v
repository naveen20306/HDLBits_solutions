module vector2_tb(); // Testbench module for 'vector2'.

    reg [31:0] in; // 32-bit input to the DUT.
    wire [31:0] out; // 32-bit output from the DUT.
    
    vector2 dut(.in(in),.out(out)); // Instantiate the 'vector2' module.
    
    initial begin // Initial block for simulation stimulus.
    
        for (in = 0; in <= {32{1'b1}}; in = in + 1) begin // Loop through all possible 32-bit combinations.
            #5; // Wait for 5 time units for signals to propagate.
            $display("Input = %032b, Output = %032b", in, out); // Display the input and output vectors.
            if(in == {32{1'b1}}) begin $finish; end // If all ones, end simulation.
        end
        
    end // End of initial block.
    
endmodule // End of testbench module.