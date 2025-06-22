module popcount255( // Module to count the number of set bits (population count) in a 255-bit vector.
    input [254:0] in, // 255-bit input vector.
    output reg [7:0] out // 8-bit output register to store the count (max 255).
);

    integer i; // Declare loop variable.
    always @(*) begin // Combinational always block, sensitive to 'in'.
        out = 0; // IMPORTANT: Reset 'out' to 0 before starting the count for each change in 'in'.
        for (i = 0; i < 255; i = i + 1) begin // Loop through each bit of the input vector.
            if (in[i]) // If the current bit is '1'.
                out = out + 1; // Increment the count.
        end
    end

endmodule // End of module.