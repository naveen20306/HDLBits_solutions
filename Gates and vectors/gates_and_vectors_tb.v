`timescale 1ns / 1ps

module gates_and_vectors_tb();

    // Declare a 4-bit register for the input vector 'in'
    reg [3:0] in;
    // Declare a 3-bit wire for 'out_both' output
    wire [2:0] out_both;
    // Declare a 3-bit wire for 'out_any' output
    wire [3:1] out_any;
    // Declare a 4-bit wire for 'out_different' output
    wire [3:0] out_different;
    
    // Instantiate the Device Under Test (DUT), connecting its ports to the testbench signals
    gates_and_vectors dut(in, out_both, out_any, out_different);
    
    // Initial block for defining the test stimulus
    initial begin
        // Loop through all possible 4-bit input combinations (0000 to 1111)
        for (in = 0; in <= 4'b1111; in = in + 1) begin
            #5; // Wait for 5 time units for the outputs to propagate
            // Display the current input and the resulting outputs from the DUT
            $display("Input:%04b||Output:out_both=%03b,out_any=%03b,out_different=%04b.", in, out_both, out_any, out_different);
        end
        // Terminate the simulation after all test cases have been run
        $finish;
    end
    
endmodule