`timescale 1ns / 1ps

module Clock12hrs_tb();
    // Declare registers for clock, reset, and enable inputs
    reg clk;
    reg reset;
    reg ena;
    // Declare wires for the outputs: PM indicator, hours, minutes, and seconds in BCD
    wire pm;
    wire [7:0] hh; // Hours (tens:ones)
    wire [7:0] mm; // Minutes (tens:ones)
    wire [7:0] ss; // Seconds (tens:ones)
    
    // Instantiate the Device Under Test (DUT), connecting its ports to the testbench signals
    Clock_12hrs dut(clk, reset, ena, pm, hh, mm, ss);
    
    // Initial block to generate a continuous clock signal
    // Clock period is 1ms (1,000,000 ns), toggling every 0.5ms (500,000 ns)
    initial begin
        clk <= 0; // Initialize clock to 0
        forever #500_000 clk <= ~clk; // Toggle clock every 0.5ms
    end
            
    // Initial block to provide stimulus to reset and enable inputs
    initial begin
        reset = 1'b1; ena = 0; // Assert reset, disable global enable
        #1_500_000; // Hold reset for 1.5ms to ensure initial state (12:00:00 AM)
        
        reset = 0; ena = 1'b1; // De-assert reset, enable the clock to start counting
        
        // Wait until the clock reaches 11:59:59 PM to observe the PM toggle
        // This wait condition will pause simulation until 'pm' is 1 AND 'hh' is 11 AND 'mm' is 59 AND 'ss' is 59.
        wait (pm && hh == 8'h11 && mm == 8'h59 && ss == 8'h59);
        
        $finish; // Terminate the simulation once the condition is met
    end
            
    // Initial block to monitor and display the clock time and PM indicator
    initial begin
        // Use $monitor to display the clock time in HH:MM:SS format and the PM state.
        // %D is used to print decimal values from bit slices.
        $monitor("Time=%D%D:%D%D:%D%D||PM(1 if yes else 0)=%b.", hh[7:4], hh[3:0], mm[7:4], mm[3:0], ss[7:4], ss[3:0], pm);
    end
endmodule