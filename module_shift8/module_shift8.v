module module_shift8 ( // Module for an 8-bit, 3-stage shift register with a multiplexer.
    input clk, // Clock input.
    input [7:0] d, // 8-bit data input.
    input [1:0] sel, // 2-bit select input for multiplexer.
    output reg [7:0] q // 8-bit registered output.
);
    reg [7:0] q1,q2,q3,q4; // Internal registers for shift register stages.
    my_dff8 one(clk,d,q1); // First D-flip-flop stage.
    my_dff8 two(clk,q1,q2); // Second D-flip-flop stage.
    my_dff8 three(clk,q2,q3); // Third D-flip-flop stage.
    
    always @(*) begin // Combinational always block for the multiplexer.
        case(sel) // Case statement based on 'sel' input.
            2'b00:q = d; // If sel is 00, output is directly 'd'.
            2'b01:q = q1; // If sel is 01, output is 'q1' (after 1 clock cycle delay).
            2'b10:q = q2; // If sel is 10, output is 'q2' (after 2 clock cycles delay).
            2'b11:q = q3; // If sel is 11, output is 'q3' (after 3 clock cycles delay).
        endcase
    end
endmodule // End of module.