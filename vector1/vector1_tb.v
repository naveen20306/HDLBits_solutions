module vector1_tb(); // Testbench module for 'vector1'.

    reg [15:0] in; // 16-bit input to the DUT.
    wire [7:0] out_hi,out_lo; // High and low 8-bit outputs from the DUT.
    
    vector1 dut(.in(in),.out_hi(out_hi),.out_lo(out_lo)); // Instantiate the 'vector1' module.
    
    initial begin // Initial block for simulation stimulus.
        in = 0; // Initialize the input to 0.
        for (in = 16'b0000000000000000; in <= 16'b1111111111111111; in = in + 1) begin // Loop through all possible 16-bit combinations.
            #10; // Wait for 10 time units.
            if(in == 16'b1111111111111111) begin // Check if the last combination has been reached.
                $finish; // End the simulation.
            end
        end
    end // End of initial block.
endmodule // End of testbench module.