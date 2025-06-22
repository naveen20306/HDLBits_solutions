module module_shift( input clk, input d, output q ); // Module for a 3-stage shift register.
    wire q1,q2; // Internal wires to connect D-flip-flops.
    my_dff one(clk,d,q1); // First D-flip-flop: d -> q1.
    my_dff two(clk,q1,q2); // Second D-flip-flop: q1 -> q2.
    my_dff three(clk,q2,q); // Third D-flip-flop: q2 -> q.
endmodule // End of module.