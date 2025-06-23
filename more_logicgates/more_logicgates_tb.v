`timescale 1ns / 1ps // Sets the time unit to 1ns and precision to 1ps.

module more_logicgates_tb(); // Testbench module for 'more_logicgates'.

    reg a,b; // Registers for the two input signals.
    wire out_and,out_or,out_xor,out_nand,out_nor, out_xnor,out_anotb; // Wires for various gate outputs.
    
    more_logicgates dut(a,b,out_and,out_or,out_xor,out_nand,out_nor, out_xnor,out_anotb); // Instantiate the DUT using positional port mapping.
    
    initial begin // Initial block for simulation stimulus.
    
        a=0;b=0;#4; // Set inputs to 0,0 and wait 4 time units.
        $display("The inputs are a=%b,b=%b and the outputs of and=%b,or=%b,xor=%b,nand=%b,nor=%b,xnor=%b,a and (not b)=%b.",a,b,out_and,out_or,out_xor,out_nand,out_nor, out_xnor,out_anotb); // Display results.
        
        a=0;b=1;#4; // Set inputs to 0,1 and wait 4 time units.
        $display("The inputs are a=%b,b=%b and the outputs of and=%b,or=%b,xor=%b,nand=%b,nor=%b,xnor=%b,a and (not b)=%b.",a,b,out_and,out_or,out_xor,out_nand,out_nor, out_xnor,out_anotb); // Display results.

        a=1;b=0;#4; // Set inputs to 1,0 and wait 4 time units.
        $display("The inputs are a=%b,b=%b and the outputs of and=%b,or=%b,xor=%b,nand=%b,nor=%b,xnor=%b,a and (not b)=%b.",a,b,out_and,out_or,out_xor,out_nand,out_nor, out_xnor,out_anotb); // Display results.

        a=1;b=1;#4; // Set inputs to 1,1 and wait 4 time units.
        $display("The inputs are a=%b,b=%b and the outputs of and=%b,or=%b,xor=%b,nand=%b,nor=%b,xnor=%b,a and (not b)=%b.",a,b,out_and,out_or,out_xor,out_nand,out_nor, out_xnor,out_anotb); // Display results.
        
     end // End of initial block.

endmodule // End of testbench module.