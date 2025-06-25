`timescale 1ns / 1ps

module popcount3_tb();

    // Declare a 3-bit register for the input to the DUT
    reg [2:0] in;
    // Declare a 2-bit wire for the output (popcount of 3 bits can be 0, 1, 2, or 3, requiring 2 bits)
    wire [1:0] out;
    
    // Instantiate the Device Under Test (DUT), connecting its ports to the testbench signals
    popcount3 dut(in, out);
    
    // Initial block for defining the test stimulus
    initial begin
        // Loop through all possible 3-bit input combinations (000 to 111)
        for (in = 0; in <= 3'b111; in = in + 1) begin
            #5; // Wait for 5 time units for the output to propagate
            // Display the current input and the calculated number of ones (popcount)
            $display("The input=%03b=>No of 1's=%d.", in, out);
        end
        // Terminate the simulation after all test cases have been run
        $finish;
    end

endmodule