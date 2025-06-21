module vector0_tb(); // Testbench module for 'vector0'.

    reg [2:0]vec; // 3-bit input vector to the DUT.
    wire [2:0]outv; // 3-bit output vector from the DUT.
    wire o2,o1,o0; // Individual bit outputs from the DUT.
    
    vector0 dut(.vec(vec),.outv(outv),.o0(o0),.o1(o1),.o2(o2)); // Instantiate the 'vector0' module.
    
    initial begin // Initial block for simulation stimulus.
        vec = 0; // Initialize the input vector to 0.
        for (vec=0; vec<8; vec=vec+1) begin // Loop through all 8 possible 3-bit combinations.
            #5; // Wait for 5 time units for signals to propagate.
            $display("Input vec=%B%B%B,Output outv=%B%B%B,o2=%b,o1=%b,o0=%b",vec[2],vec[1],vec[0],outv[2],outv[1],outv[0],o2,o1,o0); // Display the input vector, output vector, and individual bit outputs.
        end
     end // End of initial block.
     
endmodule // End of testbench module.