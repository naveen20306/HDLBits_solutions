`timescale 1ns / 1ps

module mux_dff2_tb();

    // Declare registers for clock and inputs w, R, E, L
    reg clk, w, R, E, L;
    // Declare a wire for the output Q
    wire Q;
    
    // Instantiate the Device Under Test (DUT), connecting its ports to the testbench signals
    mux_dff2 dut(clk, w, R, E, L, Q);
    
    // Initial block to generate a continuous clock signal
    initial begin
        clk = 0; // Initialize clock to 0
        forever #5 clk = ~clk; // Toggle clock every 5 time units (10ns period)
    end
    
    // Initial block to provide stimulus to inputs w, R, E, L
    initial begin
        // Loop through all 16 possible combinations of {w, R, E, L}
        for ({w, R, E, L} = 4'b0000; {w, R, E, L} <= 4'b1111; {w, R, E, L} = {w, R, E, L} + 1) begin
            #10; // Wait for 10 time units (one full clock cycle) before changing inputs
                 // This ensures the DFF has a clock edge to capture values.
        end
        $finish; // Terminate the simulation
    end
    
    // Initial block to monitor and display the signals
    initial begin
        // Use $monitor to display values whenever w, R, E, L, or Q changes
        $monitor("TIme=%t||Input=>w=%b,R=%b,E=%b,L=%b||Outputs=>Q=%b.", $time, w, R, E, L, Q);
    end

endmodule