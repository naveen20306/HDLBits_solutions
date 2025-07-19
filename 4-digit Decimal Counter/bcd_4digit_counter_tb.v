`timescale 1ns / 1ps

module bcd_4digit_counter_tb();

    // Declare registers for clock and reset inputs
    reg clk;
    reg reset;   
    // Declare wires for enable signals and the 16-bit BCD output
    wire [3:1] ena; // Note: 'ena' usually refers to input enable, but here it's an output from DUT.
                    // This implies the DUT probably internally generates these enables for sub-modules.
                    // The 'bcd_4digit_counter' module likely takes clk and reset, and outputs q, and perhaps internal enables.
                    // If 'ena' is an *output* from the DUT, it should be wire. If it's an input, it should be reg.
                    // Based on the 'dut' instantiation, 'ena' is an output.
    wire [15:0] q; // 4 BCD digits * 4 bits/digit = 16 bits.
    
    // Instantiate the Device Under Test (DUT), connecting its ports to the testbench signals
    // Assuming bcd_4digit_counter has ports (clk, reset, enable_outputs, bcd_output)
    // The enable outputs [3:1] usually correspond to tens, hundreds, thousands enables in a cascade.
    // The `ena` in the testbench is only 3 bits, typically for cascade (tens, hundreds, thousands).
    // The units digit enable is usually always 1.
    // The `bcd_4digit_counter` module structure is not provided here.
    bcd_4digit_counter dut(clk, reset, ena, q); 
    // If 'ena' is indeed internal enables, the DUT might look like:
    // bcd_4digit_counter dut(clk, reset, q); // with ena being internal wires in dut
    // but based on `wire [3:1] ena;` and `dut(clk,reset,ena,q);`, it's an output.
    // This implies `bcd_4digit_counter` provides these enables to other parts of a larger system.
    // The problem statement for `bcd_4digit_counter` would clarify.

    // Clock generation: 10ns period (toggle every 5ns)
    initial begin
        clk <= 0; // Initialize clock to 0
        forever #5 clk <= ~clk; // Toggle clock every 5 time units
    end
            
    // Test sequence
    initial begin
        reset = 1'b1; // Assert reset to initialize the counter to 0000
        #20;          // Hold reset for 20ns (two full clock cycles)
        reset = 0;    // De-assert reset to allow counting
        #100;         // Let the counter run for 100ns (10 clock cycles)
        $finish;      // Terminate the simulation
    end
            
    // Initial block to monitor and display the counter value
    initial begin
        // Use $monitor to display time, reset state, and the four BCD digits.
        // Accessing `dut.thousands`, `dut.hundereds`, `dut.tens`, `dut.ones` implies these are
        // directly accessible hierarchical signals or outputs from the DUT.
        // If they are part of 'q' (e.g., q[15:12], q[11:8], q[7:4], q[3:0]), then direct access to 'q' slices would be more typical.
        // Assuming 'q' is structured as {thousands, hundreds, tens, ones}, for example:
        // $monitor("Time=%t||Reset=%b||Count=%d%d%d%d.", $time, reset, q[15:12], q[11:8], q[7:4], q[3:0]);
        $monitor("Time=%t||Reset=%b||Count=%d%d%d%d.", $time, reset, dut.thousands, dut.hundereds, dut.tens, dut.ones);
    end

endmodule