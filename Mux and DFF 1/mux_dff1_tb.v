`timescale 1ns / 1ps

module mux_dff1_tb();

    // Declare registers for clock and inputs L, r_in, q_in
    reg clk;
    reg L;    // Likely a load/enable signal
    reg r_in; // First input to the multiplexer
    reg q_in; // Second input to the multiplexer
    // Declare a wire for the output Q
    wire Q;
    
    // Instantiate the Device Under Test (DUT), connecting its ports to the testbench signals
    mux_dff1 dut(clk, L, r_in, q_in, Q);
    
    // Initial block to generate a continuous clock signal
    initial begin
        clk = 0; // Initialize clock to 0
        forever #5 clk = ~clk; // Toggle clock every 5 time units (10ns period)
    end
    
    // Initial block to provide stimulus to inputs L, r_in, q_in
    initial begin
        // Loop through all 8 possible combinations of {L, r_in, q_in}
        for ({L, r_in, q_in} = 3'b000; {L, r_in, q_in} <= 3'b111; {L, r_in, q_in} = {L, r_in, q_in} + 1) begin
            #10; // Wait for 10 time units (one full clock cycle) before changing inputs
                 // This ensures the DFF has a clock edge to capture values.
        end
        $finish; // Terminate the simulation
    end
    
    // Initial block to monitor and display the signals
    initial begin
        // Use $monitor to display values whenever L, r_in, q_in, or Q changes
        $monitor("TIme=%t||Input=>L=%b,r_in=%b,q_in=%b||Outputs=>Q=%b.", $time, L, r_in, q_in, Q);
    end
    
endmodule