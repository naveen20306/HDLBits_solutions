`timescale 1ns / 1ps
module min_sop_pos_tb();

    // Declare registers for inputs
    reg a, b, c, d;
    // Declare wires for outputs (Sum-of-Products and Product-of-Sums)
    wire out_sop, out_pos;
    
    // Instantiate the Device Under Test (DUT), connecting its ports to the testbench signals
    min_sop_pos dut(a, b, c, d, out_sop, out_pos);
    
    // Declare a 4-bit register to iterate through all input combinations
    reg [3:0] in;
    
    // Initial block for defining the test stimulus
    initial begin
        // Loop through all possible 4-bit input combinations (0000 to 1111)
        for (in = 0; in <= 4'b1111; in = in + 1) begin
            // Assign the current loop value to the input registers
            {a, b, c, d} = in; #2; // Apply value and wait for 2 time units
            // Display the current inputs and the resulting outputs for both SOP and POS
            $display("Inputs=> a=%b,b=%b,c=%b,d=%b||Outputs=> SOP=%b and POS=%b.", a, b, c, d, out_sop, out_pos);
        end
        // Terminate the simulation after all test cases
        $finish;
    end
    
endmodule