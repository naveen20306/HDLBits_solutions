`timescale 1ns / 1ps

module even_longer_vectors_tb();

    // Declare a 100-bit register for the input vector 'in'
    reg [99:0] in;
    // Declare a 99-bit wire for 'out_both' output (index 98 down to 0)
    wire [98:0] out_both;
    // Declare a 99-bit wire for 'out_any' output (index 99 down to 1)
    wire [99:1] out_any;
    // Declare a 100-bit wire for 'out_different' output
    wire [99:0] out_different;
    
    // Instantiate the Device Under Test (DUT), connecting its ports to the testbench signals
    even_longer_vectors dut(in, out_both, out_any, out_different);
    
    // Initial block for defining the test stimulus
    initial begin
        // Test case 1: All inputs are 0
        in = 100'b0; #10;
        // Display inputs and outputs. Note: %099b will display 99 bits, adjust if 100 bits are desired for 'in' and 'out_different'.
        $display("Input:%099b||Output:out_both=%098b,out_any=%098b,out_different=%099b.", in, out_both, out_any, out_different);
        
        // Test case 2: All inputs are 1
        in = {100{1'b1}}; #10;
        // Display inputs and outputs
        $display("Input:%099b||Output:out_both=%098b,out_any=%098b,out_different=%099b.", in, out_both, out_any, out_different);

        // Test case 3: Alternating 01 pattern
        in = {50{2'b01}}; #15;
        // Display inputs and outputs
        $display("Input:%099b||Output:out_both=%098b,out_any=%098b,out_different=%099b.", in, out_both, out_any, out_different);

        // Test case 4: Alternating 10 pattern
        in = {50{2'b10}}; #15;
        // Display inputs and outputs
        $display("Input:%099b||Output:out_both=%098b,out_any=%098b,out_different=%099b.", in, out_both, out_any, out_different);
        
        // Test case 5: MSB is 1, rest are 0
        in = {1'b1, 99'b0}; #15;
        // Display inputs and outputs
        $display("Input:%099b||Output:out_both=%098b,out_any=%098b,out_different=%099b.", in, out_both, out_any, out_different);
        
        // Test case 6: MSB is 0, rest are 1
        in = {1'b0, {99{1'b1}}}; #15;
        // Display inputs and outputs
        $display("Input:%099b||Output:out_both=%098b,out_any=%098b,out_different=%099b.", in, out_both, out_any, out_different);
        
        // Test case 7: First 50 bits are 0, next 50 bits are 1
        in = {{50{1'b0}}, {50{1'b1}}}; #15;
        // Display inputs and outputs
        $display("Input:%099b||Output:out_both=%098b,out_any=%098b,out_different=%099b.", in, out_both, out_any, out_different);

        // Test case 8: First 50 bits are 1, next 50 bits are 0
        in = {{50{1'b1}}, {50{1'b0}}}; #15;
        // Display inputs and outputs
        $display("Input:%099b||Output:out_both=%098b,out_any=%098b,out_different=%099b.", in, out_both, out_any, out_different);

        // Terminate the simulation
        $finish;
    end
    
endmodule