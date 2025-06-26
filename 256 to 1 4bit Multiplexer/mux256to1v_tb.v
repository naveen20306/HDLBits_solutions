`timescale 1ns / 1ps

module mux256to1v_tb();

    // Declare a 1024-bit register for the input vector 'in'
    reg [1023:0] in;
    // Declare an 8-bit register for the select input 'sel'
    reg [7:0] sel;
    // Declare a 4-bit wire for the output 'out'
    wire [3:0] out;

    // Instantiate the Device Under Test (DUT), connecting its ports to the testbench signals
    mux256to1v dut(in, sel, out);
    
    // Initial block for defining the test stimulus
    initial begin
        // Initialize the 1024-bit input vector with a repeating pattern of 8'b00001111.
        // This means every 8 bits will be 00001111.
        in = {128{8'b00001111}}; #1; // Apply value and wait for 1 time unit
        
        // Loop through all possible 256 values for the select input (0 to 255)
        for (sel = 0; sel <= {8{1'b1}}; sel = sel + 1) begin // {8{1'b1}} is 255 (all ones for 8 bits)
            #5; // Wait for 5 time units for the output to propagate
            // Display the select input, the multiplexer's output, and cross-check it with the expected 4-bit slice from the input vector
            $display("Select line:sel=%03d=>Output out=%04b=>Cross check in[%03d]=%04b.", sel, out, sel, in[(sel*4)+:4]);
        end
        // Terminate the simulation after all test cases
        $finish;
    end
endmodule