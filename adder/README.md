// 📘 HDLBits: Exams/m2014_q4j
// Implement the circuit as shown in:
// https://hdlbits.01xz.net/mw/images/d/d2/Exams_m2014q4j.png

module top_module (
    input [3:0] x,
    input [3:0] y,
    output [4:0] sum
);

    wire [2:0] carry;  // Internal carry wires

    // Instantiate 4 full adders (one for each bit)
    fadd fa0 (.a(x[0]), .b(y[0]), .cin(1'b0),      .sum(sum[0]), .cout(carry[0]));
    fadd fa1 (.a(x[1]), .b(y[1]), .cin(carry[0]),  .sum(sum[1]), .cout(carry[1]));
    fadd fa2 (.a(x[2]), .b(y[2]), .cin(carry[1]),  .sum(sum[2]), .cout(carry[2]));
    fadd fa3 (.a(x[3]), .b(y[3]), .cin(carry[2]),  .sum(sum[3]), .cout(sum[4])); // Final carry as MSB

endmodule

// Supporting full adder module
module fadd(
    input a, b, cin,
    output sum, cout
);
    assign sum  = a ^ b ^ cin;
    assign cout = (a & b) | (a & cin) | (b & cin);
endmodule
