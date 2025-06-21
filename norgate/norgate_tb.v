module norgate_tb(); // Testbench module for NOR gate.

    reg a,b; // Inputs to the NOR gate.
    wire out; // Output from the NOR gate.
    
    norgate dut(.a(a),.b(b),.out(out)); // Instantiate the NOR gate.
    
    initial begin // Simulation stimulus.
        a=0;b=0;#1; // Set inputs to 0,0 and wait 1 time unit.
        $display(" Out=%b nor %b=%b.",a,b,out); // Display result.
        #10; // Wait 10 time units.
        
        a=0;b=1;#1; // Set inputs to 0,1 and wait 1 time unit.
        $display(" Out=%b nor %b=%b.",a,b,out); // Display result.
        #10; // Wait 10 time units.
        
        a=1;b=0;#1; // Set inputs to 1,0 and wait 1 time unit.
        $display(" Out=%b nor %b=%b.",a,b,out); // Display result.
        #10; // Wait 10 time units.
        
        a=1;b=1;#1; // Set inputs to 1,1 and wait 1 time unit.
        $display(" Out=%b nor %b=%b.",a,b,out); // Display result.
        $finish; // End simulation.
    end
endmodule // End of testbench.