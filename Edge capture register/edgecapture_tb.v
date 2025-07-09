`timescale 1ns / 1ps

module edgecapture_tb;
    // Declare registers for clock, reset, and 32-bit input 'in'
    reg clk, rst;
    reg [31:0] in;
    // Declare a 32-bit wire for the output 'out'
    wire [31:0] out;

    // Instantiate the Device Under Test (DUT), connecting its ports to the testbench signals
    edgecapture dut(clk, rst, in, out);

    // Initial block to generate a continuous clock signal
    initial begin
        clk = 0; // Initialize clock to 0
        forever #5 clk = ~clk; // Toggle clock every 5 time units (10ns period)
    end

    // Initial block to provide stimulus to 'rst' and 'in'
    initial begin
        // Apply initial reset and set 'in' to 0
        rst = 1; in = 0; 
        #12 rst = 0; // De-assert reset after 12ns (after first clock edge at 10ns, so 'out' is reset)

        // Test falling edge detection for lower bits
        in = 32'h0000000F; // Set lower 4 bits high
        #10;               // Wait one clock cycle. 'temp' captures 0xF. 'out' still 0.
        in = 32'h00000000; // Set all bits low. Falling edges on bits 0-3. 'out' should capture 0xF.
        #10;               // Wait one clock cycle.

        // Test falling edge detection for upper bit
        in = 32'h80000000; // Set MSB high
        #10;               // Wait one clock cycle. 'temp' captures 0x80000000. 'out' still 0xF.
        in = 32'h00000000; // Set all bits low. Falling edge on MSB. 'out' should become 0xF | 0x80000000.
        #10;               // Wait one clock cycle.

        // Re-assert reset to clear 'out'
        rst = 1; #10;      // Reset 'out'.
        rst = 0;           // De-assert reset.

        // Test falling edge detection for middle bits after reset
        in = 32'h0000F000; // Set middle bits high.
        #10;               // Wait one clock cycle. 'temp' captures 0xF000.
        in = 32'h00000000; // Set all bits low. Falling edges on bits 12-15. 'out' should capture 0xF000.
        #10;               // Wait one clock cycle.

        $finish;           // Terminate the simulation
    end

    // Initial block to monitor and display the signals
    initial begin
        // Use $monitor to display 'time', 'in', 'out', and the internal 'temp' signal.
        $monitor("Time=%t | in=%h | out=%h | temp=%h", $time, in, out, dut.temp);
    end
endmodule