`timescale 1ns / 1ps

module dffs_gates_tb();

    // Declare registers for clock, input 'x', and reset 'rst'
    reg clk, x, rst;
    // Declare a wire for the output 'z'
    wire z;

    // Instantiate the Device Under Test (DUT)
    dffs_gates dut(clk, rst, x, z);

    // Clock generation: 10ns period (toggle every 5ns)
    initial begin
        clk = 0; // Initialize clock to 0
        forever #5 clk = ~clk; // Toggle clock every 5 time units
    end

    // Input stimulus
    initial begin
        // Initial reset: assert reset to clear all flip-flops
        rst = 1;
        x = 0; // Set initial value for 'x'
        
        // Deassert reset just before the first active clock edge after initial reset period
        #7 rst = 0; 

        // Apply inputs on every positive clock edge
        // Each stimulus change is timed to occur one clock cycle (10ns) after the previous.
        #3; // Wait 3ns to align 'x' change with the setup time before the next positive clock edge (at 10ns)

        x = 0; @(posedge clk);  // Cycle 1: x=0. Flip-flops will capture based on their d-inputs.
        x = 1; @(posedge clk);  // Cycle 2: x=1.
        x = 1; @(posedge clk);  // Cycle 3: x=1.
        x = 0; @(posedge clk);  // Cycle 4: x=0.
        x = 1; @(posedge clk);  // Cycle 5: x=1.
        x = 0; @(posedge clk);  // Cycle 6: x=0.
        x = 0; @(posedge clk);  // Cycle 7: x=0.
        x = 1; @(posedge clk);  // Cycle 8: x=1.

        // Done with stimulus. Wait one more clock edge to observe final outputs.
        @(posedge clk);
        $finish; // Terminate the simulation
    end

    // Optional monitor block to display signal values over time
    initial begin
        $monitor("Time=%0t | clk=%b rst=%b x=%b | z=%b", $time, clk, rst, x, z);
    end

endmodule