`timescale 1ns / 1ps
module mux_dff1(
	input clk,    // Clock signal for synchronous operation
	input L,      // Select signal for the multiplexer (Load signal)
	input r_in,   // Data input 1 (e.g., reset input or new data)
	input q_in,   // Data input 0 (e.g., current Q or feedback)
	output reg Q  // Output register of the D flip-flop with mux
);
	// Initial block to set the power-on reset state of 'Q' to 0
	initial begin
	   Q = 0;
	end
    // Always block sensitive to the positive edge of the clock
    always @(posedge clk) begin
        // On the positive clock edge, 'Q' is updated with the selected input.
        // If 'L' is high, 'r_in' is selected; otherwise, 'q_in' is selected.
        Q <= L ? r_in : q_in;
    end
end