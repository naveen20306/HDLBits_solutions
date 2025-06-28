module FA(input a,b,cin,
          output sum,cout);
    // Calculate the sum for a full adder
    assign sum = a ^ b ^ cin;
    // Calculate the carry-out for a full adder
    assign cout = (a & b) | (b & cin) | (a & cin);
    
endmodule

module adder4 (
    input [3:0] x, // 4-bit input x
    input [3:0] y, // 4-bit input y
    output [4:0] sum // 5-bit output sum (including carry-out)
);
    wire [2:0] cout; // Internal wires for carry-out between full adders

    // Instantiate Full Adder for bit 0 (LSB)
    // Initial carry-in is 0 for the LSB adder in a ripple-carry adder
    FA bit0(x[0], y[0], 1'b0, sum[0], cout[0]);
    // Instantiate Full Adder for bit 1
    FA bit1(x[1], y[1], cout[0], sum[1], cout[1]);
    // Instantiate Full Adder for bit 2
    FA bit2(x[2], y[2], cout[1], sum[2], cout[2]);
    // Instantiate Full Adder for bit 3 (MSB)
    // The carry-out of the MSB adder becomes the MSB of the final sum
    FA bit3(x[3], y[3], cout[2], sum[3], sum[4]);
endmodule