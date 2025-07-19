`timescale 1ns / 1ps

module count1to1000_tb;

    // Inputs
    reg clk;
    reg reset;

    // Outputs from the DUT
    wire OneHertz;
    wire [2:0] c_enable; // Assuming this might be enables for BCD digits or similar cascade

    // DUT instantiation
    count1to1000 dut (
        .clk(clk),
        .reset(reset),
        .OneHertz(OneHertz),
        .c_enable(c_enable) // Connect to the DUT's output
    );

    // Clock generation: 1ms period (1,000,000 ns) => toggles every 0.5ms (500,000 ns)
    initial begin
        clk = 0;
        forever #500_000 clk = ~clk; // 1ms full period
    end

    // Test sequence
    initial begin
        // Initial conditions: assert reset
        reset = 1;
        #1_000_000;      // Hold reset for 1ms (2 clock cycles) to ensure reset propagates
        reset = 0;       // De-assert reset

        // Let the counter run for a little over 1 second (1000 clock cycles for OneHertz)
        // If the 'count1to1000' module counts up to 1000, and its clk is 1ms, then 1.5 seconds is sufficient to see a full cycle.
        #1_500_000_000;  // 1.5 seconds (1.5 * 1,000,000,000 ns)
                         // This is a very long simulation time for 1ns/1ps timescale.
                         // For a 1ms clock period (1,000,000 ns), 1.5 seconds is 1500 * 1,000,000 = 1.5 x 10^9 ns.
                         // It seems the 'OneHertz' signal implies a slower clock derived from 'clk'.
                         // If 'OneHertz' means a pulse every 1 second, and the clk is 1ms, then 'count1to1000'
                         // should internally count up to 1000 * 1000 = 1,000,000 to generate a 1Hz signal.
                         // Let's assume 'clk' is the *primary* clock to the counter, and 'OneHertz' is derived.
                         // If 'clk' is 1ns period, then 500_000 is 0.5ms. The comment indicates 1ms period for 'clk'.
                         // If clk period is 1ms, then OneHertz would toggle every 0.5 sec.
                         // Let's clarify the clock period based on the comment: "1ms full period" means clock toggles every 0.5ms.
                         // So a count to 1000 on this 1ms clock means 1000ms = 1 second.
                         // The simulation time seems appropriate for observing 'OneHertz' output.

        $finish;         // Terminate simulation
    end

    // Monitor output
    // Using an always @(posedge clk) block to capture values at clock edges
    // This will display at every 1ms interval (posedge clk).
    always @(posedge clk) begin
        $display("Time=%0t ns || OneHertz=%b", $time, OneHertz);
    end
    
    // Optional: Monitor intermediate signals if available in the DUT and needed for debugging
    /*
    // To monitor the BCD digits, they would need to be outputs of count1to1000, or directly accessed via hierarchical paths.
    // Example assuming internal BCD counters might be named 'bcd_hundreds', 'bcd_tens', 'bcd_units'
    initial begin
        $monitor("Time=%0t ns | BCD: %d %d %d | OneHertz=%b", $time, dut.bcd_hundreds, dut.bcd_tens, dut.bcd_units, OneHertz);
    end
    */

endmodule