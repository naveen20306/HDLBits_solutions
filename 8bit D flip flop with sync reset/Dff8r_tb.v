module Dff8r_tb();

    // Declare registers for clock, reset, and data inputs
    reg clk, rst;
    reg [7:0] d;
    // Declare an 8-bit wire for the output 'q'
    wire [7:0] q;
    
    // Instantiate the Device Under Test (DUT), connecting its ports to the testbench signals
    Dff8r dut(clk, rst, d, q);
    
    // Initial block to generate a continuous clock signal
    initial begin
        clk = 0; // Initialize clock to 0
        forever #5 clk = ~clk; // Toggle clock every 5 time units (10ns period)
    end
    
    // Initial block to provide stimulus to the data input 'd' and reset 'rst'
    initial begin
        d = 0; rst = 1; // Initialize 'd' to 0 and 'rst' to 1 (active reset)
        #5 d = 8'h34; rst = 0; // At 5ns, change 'd' and de-assert reset. q should capture 0.
        #10 d = 8'hff; rst = 0; // At 15ns, change 'd' to 8'hff. q should capture 8'h34.
        #4 d = 8'h80; rst = 0; // At 19ns, change 'd' to 8'h80. q should capture 8'hff at 20ns.
        #7 d = 8'h01; rst = 1; // At 26ns, change 'd' and assert reset. q should be reset.
        $finish; // Terminate the simulation
    end
    
    // Initial block to monitor and display the signals
    initial begin
        // Use $monitor to display values whenever 'd', 'rst', or 'q' changes
        $monitor("Time=%t||Input=> d=%b & Reset=%b ||Output Q=%b .", $time, d, rst, q);
    end         
    
endmodule