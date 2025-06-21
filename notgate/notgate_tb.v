module notgate_tb(); // Testbench module for NOT gate.

    reg in; // Input signal to the NOT gate.
    wire out; // Output signal from the NOT gate.
    
    notgate dut( .in(in),.out(out)); // Instantiate the NOT gate module.
    
    initial begin // Initial block for stimulus generation.
 
        in = 0; // Set initial input to 0.
        #1; // Wait for 1 time unit.
        $display("For input in=%b,output out=%b.",in,out); // Display input and output.
        #10; // Wait for 10 time units.
        in = 1; // Change input to 1.
        #1; // Wait for 1 time unit.
        $display("\nFor input in=%b,output out=%b.",in,out); // Display input and output.
        $finish; // End simulation.
    end
    
endmodule // End of testbench module.