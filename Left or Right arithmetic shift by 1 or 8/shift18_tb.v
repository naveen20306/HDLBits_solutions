`timescale 1ns / 1ps

module shift18_tb;

    // Inputs
    reg clk;
    reg load;
    reg ena;
    reg [1:0] amount;
    reg signed [63:0] data;

    // Output
    wire signed [63:0] q;

    // Instantiate the shift18 module
    shift18 uut (
        .clk(clk),
        .load(load),
        .ena(ena),
        .amount(amount),
        .data(data),
        .q(q)
    );

    // Clock generation: 10ns period
    always #5 clk = ~clk;

    initial begin
        $display("Time\tclk\tload\tena\tamount\tdata\t\t\tq");

        // Initialize signals
        clk = 0;
        load = 0;
        ena = 0;
        amount = 2'b00;
        data = 64'sd0;

        // Wait a few cycles
        #10;

        // Load a negative value
        data = -64'sd256;
        load = 1;
        #10;
        load = 0;

        // Shift left by 1
        ena = 1;
        amount = 2'b00;  // <<1
        #10;

        // Shift left by 8
        amount = 2'b01;  // <<8
        #10;

        // Shift right arithmetically by 1
        amount = 2'b10;  // >>>1
        #10;

        // Shift right arithmetically by 8
        amount = 2'b11;  // >>>8
        #10;

        // Stop simulation
        ena = 0;
        #10;
        $finish;
    end

    // Optional: Monitor output
    initial begin
        $monitor("%0dns\t%b\t%b\t%b\t%02b\t%0d\t%0d", 
                 $time, clk, load, ena, amount, data, q);
    end

endmodule
