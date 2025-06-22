module vector4_tb(); // Testbench module for 'vector4'.

    reg [7:0] in; // 8-bit input to the DUT.
    wire [31:0] out; // 32-bit output from the DUT.
    
    vector4 dut(.in(in),.out(out)); // Instantiate the 'vector4' module.
    
    initial begin // Initial block for simulation stimulus.
        for(in=0; in<={8{1'b1}}; in=in+1) begin // Loop through all 256 possible 8-bit inputs.
            #5; // Wait for 5 time units for propagation.
            $display("Input in=%08b-->Output out=%032b",in,out); // Display input and output.
            if(in == {8{1'b1}}) begin $finish; end // If all ones, end simulation.
         end
    end // End of initial block.
    
endmodule // End of testbench module.