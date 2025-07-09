`timescale 1ns / 1ps

module dualedge_tb();

    // Declare registers for clock, data input 'd', and reset 'rst'
    reg clk, d, rst;
    // Declare a wire for the output 'q'
    wire q;
    
    // Instantiate the Device Under Test (DUT), connecting its ports to the testbench signals
    dualedge dut(clk, d, rst, q);
    
    // Initial block to generate a continuous clock signal
    initial begin
        clk = 0; // Initialize clock to 0
        forever #10 clk = ~clk; // Toggle clock every 10 time units (20ns period)
    end
    
    // Initial block to provide stimulus to data 'd' and reset 'rst'
    initial begin
        rst = 1; d = 0; #7; // At 0ns: rst=1, d=0. Q should be reset. At 7ns: rst=1, d=0.
        rst = 0; d = 1; #5; // At 7ns: rst=0, d=1. At 10ns (posedge clk), q1 captures d=1. q becomes 1.
                            // At 12ns: rst=0, d=1.
        rst = 0; d = 0; #8; // At 12ns: rst=0, d=0. At 20ns (negedge clk), q0 captures d=0. q becomes 0.
                            // At 20ns (posedge clk at 30ns), q1 will capture d=0.
        rst = 0; d = 0; #10; // At 20ns: rst=0, d=0. At 30ns (posedge clk), q1 captures d=0. q becomes 0.
                             // At 30ns: rst=0, d=0.
        rst = 1; d = 1; #10; // At 30ns: rst=1, d=1. q should asynchronously reset to 0 immediately.
                             // At 40ns: rst=1, d=1. q remains 0.
        rst = 0; d = 0; #11; // At 40ns: rst=0, d=0. At 50ns (posedge clk), q1 captures 0. q becomes 0.
                             // At 51ns: rst=0, d=0.
        $finish; // Terminate the simulation
    end
    
    // Initial block to monitor and display the signals
    initial begin
        // Use $monitor to display values whenever 'd' or 'q' changes
        $monitor("Time=%t||Input d=%b ||Output Q=%b.", $time, d, q);
    end
            
endmodule