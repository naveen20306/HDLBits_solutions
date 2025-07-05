`timescale 1ns / 1ps

module dff_gate_tb();

    // Declare registers for data input 'in' and clock 'clk'
    reg in, clk;
    // Declare a wire for the output 'out'
    wire out;
    
    // Instantiate the Device Under Test (DUT), connecting its ports to the testbench signals
    dff_gate dut(clk, in, out);
    
    // Initial block to generate a continuous clock signal
    initial begin
        clk = 0; // Initialize clock to 0
        forever #5 clk = ~clk; // Toggle clock every 5 time units (10ns period)
    end
    
    // Initial block to provide stimulus to the data input 'in'
    initial begin
        in = 0;   // Initialize data input 'in' to 0
        #5 in = 1; // At 5ns, change 'in' to 1. This value will be XORed with current 'out' at 10ns posedge clk.
        #5 in = 0; // At 10ns, change 'in' to 0. This value will be XORed with current 'out' at 15ns posedge clk.
        #5 in = 1; // At 15ns, change 'in' to 1. This value will be XORed with current 'out' at 20ns posedge clk.
        #5 in = 0; // At 20ns, change 'in' to 0. This value will be XORed with current 'out' at 25ns posedge clk.
        #5 in = 0; // At 25ns, 'in' remains 0. This value will be XORed with current 'out' at 30ns posedge clk.
        #5 in = 1; // At 30ns, change 'in' to 1. This value will be XORed with current 'out' at 35ns posedge clk.
        #5 in = 1; // At 35ns, 'in' remains 1. This value will be XORed with current 'out' at 40ns posedge clk.
        
        #5 $finish; // Add a final delay and terminate simulation
    end
    // A $monitor block could be added here for better visibility of signals over time, e.g.:
    /*
    initial begin
        $monitor("Time=%t | CLK=%b | IN=%b | OUT=%b", $time, clk, in, out);
    end
    */
endmodule