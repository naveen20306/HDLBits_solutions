module vector100r( // Module to reverse the bits of a 100-bit vector.
    input [99:0] in, // 100-bit input vector.
    output reg [99:0] out // 100-bit output vector (reversed).
);
    integer i; // Declare loop variable.
    always @(*) begin // Combinational always block, sensitive to 'in'.
        for(i=0;i<100;i=i+1) begin // Loop from 0 to 99.
            out[i] = in[99-i]; // Assigns the i-th bit of 'out' from the (99-i)-th bit of 'in', effectively reversing the vector.
        end
    end
endmodule // End of module.