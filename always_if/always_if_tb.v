`timescale 1ns / 1ps // Sets the time unit to 1ns and precision to 1ps.

module always_if_tb(); // Testbench module for 'always_if'.

    reg a,b,sel_b1,sel_b2; // Registers for inputs and select lines.
    wire out_assign,out_always; // Wires for outputs from the DUT.
    
    always_if dut(.a(a),.b(b),.sel_b1(sel_b1),.sel_b2(sel_b2),.out_assign(out_assign),.out_always(out_always)); // Instantiate the DUT.
    
    initial begin // Initial block for stimulus.
        a=0;b=1; // Set base input values.
        #1; // Wait 1 time unit.
        
        {sel_b1,sel_b2}=2'b00;#1; // Set select lines to 00 and wait.
        $display("The Select line value is %02b,the Output of the mux using assign statement=%b and always block=%b",{sel_b1,sel_b2},out_assign,out_always); // Display results.
        
        {sel_b1,sel_b2}=2'b01;#1; // Set select lines to 01 and wait.
        $display("The Select line value is %02b,the Output of the mux using assign statement=%b and always block=%b",{sel_b1,sel_b2},out_assign,out_always); // Display results.
        
        {sel_b1,sel_b2}=2'b10;#1; // Set select lines to 10 and wait.
        $display("The Select line value is %02b,the Output of the mux using assign statement=%b and always block=%b",{sel_b1,sel_b2},out_assign,out_always); // Display results.
        
        {sel_b1,sel_b2}=2'b11;#1; // Set select lines to 11 and wait.
        $display("The Select line value is %02b,the Output of the mux using assign statement=%b and always block=%b",{sel_b1,sel_b2},out_assign,out_always); // Display results.
        
        $finish; // End simulation.
     end // End of initial block.
endmodule // End of testbench module.