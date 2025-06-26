module mux9to1v( 
    input [15:0] a, b, c, d, e, f, g, h, i, // Nine 16-bit wide data inputs
    input [3:0] sel,                     // 4-bit select input (to select one of 9 inputs)
    output reg [15:0] out                // 16-bit wide output
);
	
    // Always block that triggers on any change in inputs (combinational logic)
    always @(*) begin
        // Case statement to select the output based on the 'sel' input
        case (sel)
            4'd0: out = a; // If sel is 0, output 'a'
            4'd1: out = b; // If sel is 1, output 'b'
            4'd2: out = c; // If sel is 2, output 'c'
            4'd3: out = d; // If sel is 3, output 'd'
            4'd4: out = e; // If sel is 4, output 'e'
            4'd5: out = f; // If sel is 5, output 'f'
            4'd6: out = g; // If sel is 6, output 'g'
            4'd7: out = h; // If sel is 7, output 'h'
            4'd8: out = i; // If sel is 8, output 'i'
            default: out = {16{1'b1}}; // For any other 'sel' value, output all ones (default case)
        endcase
    end
            
    
endmodule