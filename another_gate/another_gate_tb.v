`timescale 1ns / 1ps // Sets the time unit to 1ns and precision to 1ps.

module another_gate_tb(); // Testbench module for 'another_gate'.

    reg in1,in2; // Registers for the two input signals.
    wire out; // Wire for the output signal.
    
    another_gate dut(.in1(in1),.in2(in2),.out(out)); // Instantiate the DUT.
    
    initial begin // Initial block for simulation stimulus.
    
        in1=0;in2=0;#4; // Set inputs to 0,0 and wait 4 time units.
        $display("The inputs are in1=%b,in2=%b and the output(in1&(~in2)is %b.",in1,in2,out); // Display inputs and output.
        
        in1=0;in2=1;#4; // Set inputs to 0,1 and wait 4 time units.
        $display("The inputs are in1=%b,in2=%b and the output(in1&(~in2)is %b.",in1,in2,out); // Display inputs and output.

        in1=1;in2=0;#4; // Set inputs to 1,0 and wait 4 time units.
        $display("The inputs are in1=%b,in2=%b and the output(in1&(~in2)is %b.",in1,in2,out); // Display inputs and output.

        in1=1;in2=1;#4; // Set inputs to 1,1 and wait 4 time units.
        $display("The inputs are in1=%b,in2=%b and the output(in1&(~in2)is %b.",in1,in2,out); // Display inputs and output.
        
     end // End of initial block.
    
endmodule // End of testbench module.