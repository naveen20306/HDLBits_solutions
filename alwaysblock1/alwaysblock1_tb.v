module alwaysblock1_tb(); // Testbench module for 'alwaysblock1'.

    reg a,b; // Inputs to the DUT.
    wire out_assign; // Output from continuous assignment.
    wire out_alwaysblock; // Output from always block.
    
    alwaysblock1 dut(.a(a),.b(b),.out_assign(out_assign),.out_alwaysblock(out_alwaysblock)); // Instantiate the DUT.
    
    initial begin // Initial block for simulation stimulus.
        a=0;b=0;#5; // Set inputs to 0,0 and wait 5 time units.
        $display("Input a=0 and b=0-->Output out_assign=%b and out_alwaysblock=%b",out_assign,out_alwaysblock); // Display results.
        
        a=0;b=1;#5; // Set inputs to 0,1 and wait 5 time units.
        $display("Input a=0 and b=1-->Output out_assign=%b and out_alwaysblock=%b",out_assign,out_alwaysblock); // Display results.
        
        a=1;b=0;#5; // Set inputs to 1,0 and wait 5 time units.
        $display("Input a=1 and b=0-->Output out_assign=%b and out_alwaysblock=%b",out_assign,out_alwaysblock); // Display results.
        
        a=1;b=1;#5; // Set inputs to 1,1 and wait 5 time units.
        $display("Input a=1 and b=1-->Output out_assign=%b and out_alwaysblock=%b",out_assign,out_alwaysblock); // Display results.
        
        $finish; // End simulation.
    end

endmodule // End of testbench module.