// synthesis verilog_input_version verilog_2001
module always_if( // Module demonstrating a 2-to-1 multiplexer using assign and always-if.
    input a, // First data input.
    input b, // Second data input.
    input sel_b1, // First bit of select signal.
    input sel_b2, // Second bit of select signal.
    output wire out_assign, // Output from continuous assignment.
    output reg out_always // Output from always block.
); 

    assign out_assign = (sel_b1 & sel_b2) ? b : a; // Continuous assignment: selects 'b' if both select bits are 1, else 'a'.
    
    always @(*) begin // Combinational always block, sensitive to all inputs (a, b, sel_b1, sel_b2).
        if ({sel_b1,sel_b2} == 2'b11) begin // If select bits form '11'.
            out_always = b; // Assign 'b' to output.
        end
        else begin // Otherwise.
            out_always = a; // Assign 'a' to output.
        end
    end
    
endmodule // End of module.