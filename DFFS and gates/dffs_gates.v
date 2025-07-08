module my_dff(
    input clk,    // Clock signal
    input rst,    // Asynchronous reset input (active high)
    input d,      // Data input
    output reg q, // Output of the D flip-flop, declared as 'reg'
    output wire qbar // Inverted output of the D flip-flop, declared as 'wire'
);

    // Always block sensitive to the positive edge of the clock OR the positive edge of the reset.
    always @(posedge clk or posedge rst) begin
        // If 'rst' is high, asynchronously reset 'q' to 0.
        if (rst)
            q <= 1'b0;
        // Otherwise (if 'rst' is not active), on the positive clock edge, update 'q' with 'd'.
        else
            q <= d;
    end
    
    // Assign 'qbar' to be the logical NOT of 'q'. This is a continuous assignment.
    assign qbar = ~q;

endmodule

module dffs_gates(
    input clk,     // Clock signal
    input rst,     // Reset signal
    input x,       // Primary input to the circuit
    output z       // Final output of the circuit
); 
    // Declare wires for intermediate data inputs (d1, d2, d3) to the D flip-flops
    wire d1, d2, d3;
    // Declare wires for the outputs (q1, q2, q3) of the D flip-flops
    wire q1, q2, q3;
    // Declare wires for the inverted outputs (q1bar, q2bar, q3bar) of the D flip-flops
    wire q1bar, q2bar, q3bar;

    // Define the input 'd1' for the first D flip-flop (XOR gate)
    assign d1 = x ^ q1;
    // Instantiate the first D flip-flop 'one'
    my_dff one(clk, rst, d1, q1, q1bar);
    
    // Define the input 'd2' for the second D flip-flop (AND gate with inverted feedback)
    assign d2 = x & q2bar;
    // Instantiate the second D flip-flop 'two'
    my_dff two(clk, rst, d2, q2, q2bar);
    
    // Define the input 'd3' for the third D flip-flop (OR gate with inverted feedback)
    assign d3 = x | q3bar;
    // Instantiate the third D flip-flop 'three'
    my_dff three(clk, rst, d3, q3, q3bar);
    
    // Define the final output 'z' (NOR gate of the D flip-flop outputs)
    assign z = ~(q1 | q2 | q3);
endmodule