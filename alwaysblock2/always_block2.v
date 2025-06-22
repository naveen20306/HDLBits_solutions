// synthesis verilog_input_version verilog_2001
module always_block2( // Module demonstrating different types of assignments.
    input clk, // Clock input for sequential logic.
    input a, // First input.
    input b, // Second input.
    output wire out_assign, // Output from a continuous assignment.
    output reg out_always_comb, // Output from a combinational always block.
    output reg out_always_ff // Output from a sequential always block (flip-flop).
);

    assign out_assign = a ^ b; // Continuous assignment (combinational).
    
    always @(*) begin // Combinational always block, sensitive to 'a' and 'b'.
        out_always_comb = a ^ b; // Blocking assignment, immediately updates 'out_always_comb'.
    end
    
    always @(posedge clk) begin // Sequential always block, sensitive to positive edge of 'clk'.
        out_always_ff <= a ^ b; // Non-blocking assignment, updates 'out_always_ff' at the end of the current time step.
    end
    
endmodule // End of module.