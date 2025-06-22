// synthesis verilog_input_version verilog_2001
module alwaysblock1( // Module demonstrating continuous assignment vs. always block for combinational logic.
    input a, // First input.
    input b, // Second input.
    output wire out_assign, // Output assigned using 'assign' statement.
    output reg out_alwaysblock // Output assigned within an 'always' block.
);
	assign out_assign = a & b; // Continuously assigns the AND of 'a' and 'b' to 'out_assign'.
    always @(*) begin // Always block, sensitive to any change in its inputs (a, b).
        out_alwaysblock = a & b; // Assigns the AND of 'a' and 'b' to 'out_alwaysblock'.
    end
endmodule // End of module.