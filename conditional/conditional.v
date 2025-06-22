module conditional( // Module to find the minimum of four 8-bit inputs.
    input [7:0] a, b, c, d, // Four 8-bit input values.
    output [7:0] min // 8-bit output for the minimum value.
);
    assign min = (a < b && a < c && a < d) ? a : // If 'a' is the smallest.
                (b < c && b < d) ? b : // Else if 'b' is the smallest among remaining.
                (c < d) ? c : d; // Else if 'c' is smaller than 'd', else 'd'.
    
endmodule // End of module.