module always_case2 ( // Module to find the position of the first '1' bit from LSB.
    input [3:0] in, // 4-bit input vector.
    output reg [1:0] pos // 2-bit output for the position.
);

    always @(*) begin // Combinational always block, sensitive to 'in'.
        if (in[0]) // If the least significant bit is 1.
            pos = 2'd0; // Position is 0.
        else if (in[1]) // Else if the second bit is 1.
            pos = 2'd1; // Position is 1.
        else if (in[2]) // Else if the third bit is 1.
            pos = 2'd2; // Position is 2.
        else if (in[3]) // Else if the most significant bit is 1.
            pos = 2'd3; // Position is 3.
        else // If no bits are '1'.
            pos = 2'd0; // Default position is 0.
    end

endmodule // End of module.