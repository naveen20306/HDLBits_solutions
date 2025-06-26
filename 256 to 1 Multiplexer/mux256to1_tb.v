`timescale 1ns / 1ps

module mux256to1_tb();

    // Declare an 8-bit register for the select input (2^8 = 256 combinations)
    reg [7:0] sel;
    // Declare a 256-bit register for the input vector
    reg [255:0] in;
    // Declare a single-bit wire for the output
    wire out;
    
    // Instantiate the Device Under Test (DUT), connecting its ports to the testbench signals
    mux256to1 dut(in, sel, out);
    
    // Initial block for defining the test stimulus
    initial begin
        // Initialize the 256-bit input vector with an alternating '10' pattern.
        // This means in[0] = 0, in[1] = 1, in[2] = 0, in[3] = 1, and so on.
        in = {128{2'b10}}; #1; // Apply value and wait for 1 time unit
        
        // Loop through all possible 256 values for the select input (0 to 255)
        for (sel = 0; sel <= {8{1'b1}}; sel = sel + 1) begin // {8{1'b1}} is 255 (all ones for 8 bits)
            #5; // Wait for 5 time units for the output to propagate
            // Display the select input, the multiplexer's output, and cross-check it with the expected bit from the input vector
            $display("Input sel=%03d=>Output selected bit from input [255:0]in=%b(Cross check in[%03d]=%b).", sel, out, sel, in[sel]);
        end
        // Terminate the simulation after all test cases
        $finish;
    end

endmodule