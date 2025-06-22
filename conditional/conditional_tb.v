`timescale 1ns / 1ps // Sets the time unit to 1ns and precision to 1ps.

module conditional_tb; // Testbench module for 'conditional'.

    reg [7:0] a, b, c, d; // 8-bit registers for inputs.
    wire [7:0] min; // 8-bit wire for the minimum output.

    conditional dut ( // Instantiate the DUT.
        .a(a), .b(b), .c(c), .d(d), // Connect inputs.
        .min(min) // Connect output.
    );

    initial begin // Initial block for simulation stimulus.
        a = 8'd10; b = 8'd25; c = 8'd5; d = 8'd30; // Set first set of input values.
        #5; // Wait 5 time units for propagation.
        $display("Inputs: a=%d b=%d c=%d d=%d => min=%d", a, b, c, d, min); // Display inputs and output.

        a = 8'd55; b = 8'd12; c = 8'd60; d = 8'd15; // Set second set of input values.
        #5; // Wait 5 time units.
        $display("Inputs: a=%d b=%d c=%d d=%d => min=%d", a, b, c, d, min); // Display inputs and output.

        a = 8'd100; b = 8'd100; c = 8'd100; d = 8'd100; // Set third set of input values (all equal).
        #5; // Wait 5 time units.
        $display("Inputs: a=%d b=%d c=%d d=%d => min=%d", a, b, c, d, min); // Display inputs and output.

        a = 8'd0; b = 8'd255; c = 8'd128; d = 8'd64; // Set fourth set of input values.
        #5; // Wait 5 time units.
        $display("Inputs: a=%d b=%d c=%d d=%d => min=%d", a, b, c, d, min); // Display inputs and output.

        $finish; // End simulation.
    end // End of initial block.

endmodule // End of testbench module.