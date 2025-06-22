module always_block2_tb(); // Testbench module for 'always_block2'.

  reg clk; // Clock signal.
  reg a; // First input signal.
  reg b; // Second input signal.
  wire out_assign; // Output from continuous assignment.
  wire out_always_comb; // Output from combinational always block.
  wire out_always_ff; // Output from sequential always block.

  always_block2 uut ( // Instantiate the DUT.
    .clk(clk), // Connect clock.
    .a(a), // Connect input 'a'.
    .b(b), // Connect input 'b'.
    .out_assign(out_assign), // Connect continuous assignment output.
    .out_always_comb(out_always_comb), // Connect combinational output.
    .out_always_ff(out_always_ff) // Connect sequential output.
  );

  initial begin // Clock generation block.
    clk = 0; // Initialize clock to 0.
    forever #5 clk = ~clk; // Toggle clock every 5 time units.
  end

  initial begin // Stimulus generation block.
    a = 0; // Initialize 'a'.
    b = 0; // Initialize 'b'.
    #10; // Wait 10 time units.

    a = 0; // Change 'a'.
    b = 1; // Change 'b'.
    #10; // Wait 10 time units.

    a = 1; // Change 'a'.
    b = 0; // Change 'b'.
    #10; // Wait 10 time units.

    a = 1; // Change 'a'.
    b = 1; // Change 'b'.
    #10; // Wait 10 time units.

    $finish; // End simulation.
  end

  initial begin // Monitor block for displaying values.
    $monitor("Time=%0t | clk=%b, a=%b, b=%b | out_assign=%b, out_always_comb=%b, out_always_ff=%b", // Format string for display.
             $time, clk, a, b, out_assign, out_always_comb, out_always_ff); // Variables to display.
  end

endmodule // End of testbench module.