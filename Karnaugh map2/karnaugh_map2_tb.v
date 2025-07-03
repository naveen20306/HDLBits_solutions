`timescale 1ns / 1ps

module karnaugh_map2_tb();

    // Declare a 4-bit register for the input vector 'x', indexed from 4 down to 1
    reg [4:1] x;
    // Declare a wire for the single-bit output 'f'
    wire f;
    
    // Instantiate the Device Under Test (DUT), connecting its ports to the testbench signals
    karnaugh_map2 dut(x, f);
    
    // Initial block for defining the test stimulus
    initial begin
        // Loop through all possible 4-bit input combinations (0000 to 1111)
        // The loop variable 'x' is implicitly treated as a 4-bit unsigned integer for the increment.
        for (x = 0; x <= 4'b1111; x = x + 1) begin
            #2; // Wait for 2 time units for the output to propagate
            // Display the individual bits of the input 'x' and the resulting output 'f'
            $display("Inputs=> x1=%b,x2x=%b,x3=%b,x4=%b||Outputs=> f=%b.", x[1], x[2], x[3], x[4], f);
        end
        // Terminate the simulation after all test cases
        $finish;
    end

endmodule