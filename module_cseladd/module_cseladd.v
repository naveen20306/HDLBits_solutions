module module_cseladd( // Module for a 32-bit carry-select adder.
    input [31:0] a, // First 32-bit input operand.
    input [31:0] b, // Second 32-bit input operand.
    output reg [31:0] sum // 32-bit sum output.
);
    wire cout1,cout2,cout3; // Carry-out signals for adder stages.
    wire [15:0] sum1,sum2; // Intermediate sums for the upper half.
    add16 one(a[15:0],b[15:0],1'b0,sum[15:0],cout1); // Adds lower 16 bits with carry-in 0.
    add16 two(a[31:16],b[31:16],1'b0,sum1,cout2); // Adds upper 16 bits assuming carry-in 0.
    add16 three(a[31:16],b[31:16],1'b1,sum2,cout3); // Adds upper 16 bits assuming carry-in 1.
    
    always @(*) begin // Combinational logic to select the correct upper sum.
        case(cout1) // Based on the carry-out from the lower half.
            1'b0:sum[31:16] = sum1; // If cout1 is 0, select sum1.
            1'b1:sum[31:16] = sum2; // If cout1 is 1, select sum2.
        endcase
    end
    
endmodule // End of module.