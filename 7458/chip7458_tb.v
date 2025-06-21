module chip7458_tb(); // Testbench module for chip7458.

    reg p1a, p1b, p1c, p1d, p1e, p1f,p2a, p2b, p2c, p2d; // Inputs to the DUT.
    wire p1y,p2y; // Outputs from the DUT.
    
    chip7458 dut(.p1a(p1a),.p1b(p1b),.p1c(p1c),.p1d(p1d),.p1e(p1e),.p1f(p1f),.p2a(p2a),.p2b(p2b),.p2c(p2c),.p2d(p2d),.p1y(p1y),.p2y(p2y)); // Instantiate chip7458.
    reg [6:0] in1; // Loop variable for p1 inputs.
    reg [4:0] in2; // Loop variable for p2 inputs.
    
    initial begin // Initial block for simulation.
    
        p1a=0; p1b=0; p1c=0; p1d=0; p1e=0; p1f=0;p2a=0; p2b=0; p2c=0; p2d=0;#1; // Initialize all inputs and wait.
        
        fork // Start parallel blocks.
        begin // First parallel block for p1y inputs.
            for(in1=6'b000000;in1<=6'b111111;in1=in1+1) begin // Loop through all combinations for p1 inputs.
                {p1a, p1b, p1c, p1d, p1e, p1f}=in1; // Assign loop value to p1 inputs.
                #2; // Wait for output to settle.
                $display("If p1a=%b,p1b=%b,p1c=%b,p1d=%b,p1e=%b,p1f=%b,then output p1y=%b",p1a,p1b,p1c,p1d,p1e,p1f,p1y); // Display inputs and p1y.
            end
        end
        begin // Second parallel block for p2y inputs.
            for(in2=0;in2<=15;in2=in2+1) begin // Loop through all combinations for p2 inputs.
            {p2a,p2b,p2c,p2d}=in2[3:0]; // Assign loop value to p2 inputs.
            #2; // Wait for output to settle.
            $display("If p2a=%b,p2b=%b,p2c=%b,p2d=%b,then output p2y=%b",p2a,p2b,p2c,p2d,p2y); // Display inputs and p2y.
            end
        end
        join // Wait for all forked blocks to complete.
        #10; // Wait 10 time units.
        $finish; // End simulation.
     end // End initial block.
endmodule // End of testbench.