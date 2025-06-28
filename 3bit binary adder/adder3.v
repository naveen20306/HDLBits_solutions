module fulladder(
    input a,b,cin,
    output sum,cout
);
    // Calculates the sum output for a full adder
    assign sum = a ^ b ^ cin;
    // Calculates the carry-out output for a full adder
    assign cout = (a & b) | (b & cin) | (a & cin);
    
endmodule

module adder3(
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum
);
    
    // Instantiate the least significant bit (LSB) full adder
    fulladder lsb(a[0], b[0], cin, sum[0], cout[0]);
    // Instantiate the middle bit full adder
    fulladder mid(a[1], b[1], cout[0], sum[1], cout[1]);
    // Instantiate the most significant bit (MSB) full adder
    fulladder msb(a[2], b[2], cout[1], sum[2], cout[2]);
    
endmodule