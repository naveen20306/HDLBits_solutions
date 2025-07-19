`timescale 1ns / 1ps
    
    module seconds_ena #(
        parameter MAX_COUNT = 1000  // Parameter to set the maximum count value (e.g., for a 1Hz pulse)
    )(
        input clk,    // Clock signal for synchronous operation
        input reset,  // Asynchronous active-high reset
        output reg OneHertz // Output pulse, high for one clock cycle when counter reaches MAX_COUNT
    );
        // Local parameter to calculate the minimum required bit width for the counter
        localparam WIDTH = $clog2(MAX_COUNT);
    
        // Register for the internal counter
        reg [WIDTH-1:0] counter;
    
        // Always block sensitive to the positive edge of the clock or the positive edge of reset
        always @(posedge clk or posedge reset) begin
            // Asynchronous reset logic
            if (reset) begin
                counter <= 0;    // Reset counter to 0
                OneHertz <= 0;   // Reset OneHertz output to 0
            end 
            // Normal operation (not in reset)
            else begin
                // If counter reaches MAX_COUNT-1, it means it's the last count before rolling over
                if (counter == MAX_COUNT-1) begin
                    counter <= 0;    // Reset counter to 0
                    OneHertz <= 1;   // Assert OneHertz for one clock cycle
                end 
                // Otherwise, increment the counter
                else begin
                    counter <= counter + 1; // Increment counter
                    OneHertz <= 0;   // Keep OneHertz low
                end
            end
        end
    
    endmodule