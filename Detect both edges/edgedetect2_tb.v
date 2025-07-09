`timescale 1ns / 1ps

module edgedetect2_tb();

    // Declare registers for clock and input 'in'
    reg clk;
    reg [7:0] in;
    // Declare a wire for the output 'anyedge'
    wire [7:0] anyedge;
    
    // Instantiate the Device Under Test (DUT), connecting its ports to the testbench signals
    edgedetect2 dut(clk, in, anyedge);
    
    // Initial block to generate a continuous clock signal
    initial begin
        clk = 0; // Initialize clock to 0
        forever #5 clk = ~clk; // Toggle clock every 5 time units (10ns period)
    end
    
    // Initial block to provide stimulus to the input 'in'
    initial begin
        in = 8'b0;          // Initialize input to all zeros
        #5;                 // Wait 5ns (to align 'in' with the first posedge clk at 5ns)
        
        in = 8'b00001010;   // Change input.
        #10;                // Wait 10ns (one clock cycle). 'anyedge' will reflect changes from previous 'in'.
        
        in = 8'b10100000;   // Change input.
        #10;                // Wait 10ns.
        
        in = 8'b11111111;   // Change input.
        #10;                // Wait 10ns.
        
        in = 8'b10101010;   // Change input.
        #10;                // Wait 10ns.
        
        in = 8'b01010101;   // Change input.
        #10;                // Wait 10ns.
        
        $finish;            // Terminate the simulation
    end
            
    // Initial block to monitor and display the signals
    initial begin
        // Use $monitor to display values whenever 'in' or 'anyedge' changes
        $monitor("Time=%t||Inputs=>in=%b||Output=>Pos edge=%b.", $time, in, anyedge);
    end

endmodule