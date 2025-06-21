module andgate_tb(); // Testbench module for AND gate.

    reg a,b; // Inputs to the AND gate.
    wire out; // Output from the AND gate.
    
    andgate dut(.a(a),.b(b),.out(out)); // Instantiate the AND gate.
    
    initial begin // Simulation stimulus.
        a=0;b=0; // Set inputs to 0,0.
        $display(" Out=%b & %b=%b.",a,b,out); // Display result.
        #10; // Wait 10 time units.
        
        a=0;b=1; // Set inputs to 0,1.
        $display(" Out=%b & %b=%b.",a,b,out); // Display result.
        #10; // Wait 10 time units.
        
        a=1;b=0; // Set inputs to 1,0.
        $display(" Out=%b & %b=%b.",a,b,out); // Display result.
        #10; // Wait 10 time units.
        
        a=1;b=1; // Set inputs to 1,1.
        $display(" Out=%b & %b=%b.",a,b,out); // Display result.
        $finish; // End simulation.
    end
endmodule // End of testbench.