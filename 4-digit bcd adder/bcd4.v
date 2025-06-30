module bcd_adder(
    input [3:0] a, b,      // 4-bit BCD inputs
    input cin,             // Carry-in
    output [3:0] sum,      // 4-bit BCD sum
    output carryout        // Carry-out
);
    wire [4:0] actual_sum;  // 5-bit wire to hold the direct binary sum
    wire [4:0] corrected;   // 5-bit wire to hold the BCD corrected sum

    // Perform binary addition of the two BCD digits and carry-in
    assign actual_sum = a + b + cin;

    // Check if the actual_sum is greater than 9 or if a carry was generated.
    // If true, add 6 to correct for BCD (skip 6 invalid states).
    assign corrected = (actual_sum > 9) ? actual_sum + 5'd6 : actual_sum;

    // The lower 4 bits of the corrected sum form the BCD digit output
    assign sum = corrected[3:0];
    // The 5th bit (MSB) of the corrected sum is the BCD carry-out
    assign carryout = corrected[4];
endmodule

module bcd4(
    input [15:0] a, b, // 16-bit BCD inputs (four BCD digits)
    input cin,         // Global carry-in for the LSB BCD digit
    output cout,       // Global carry-out from the MSB BCD digit
    output [15:0] sum  // 16-bit BCD sum output
);
    
    wire [3:0] carry; // Wires to chain carries between BCD adders (carry[0] to carry[3])

    // Instantiate four bcd_adder modules to perform 4-digit BCD addition
    // bcd_adder for the least significant BCD digit (bits 3:0)
    bcd_adder one(a[3:0], b[3:0], cin, sum[3:0], carry[0]);
    // bcd_adder for the second BCD digit (bits 7:4)
    bcd_adder two(a[7:4], b[7:4], carry[0], sum[7:4], carry[1]);
    // bcd_adder for the third BCD digit (bits 11:8)
    bcd_adder three(a[11:8], b[11:8], carry[1], sum[11:8], carry[2]);
    // bcd_adder for the most significant BCD digit (bits 15:12)
    bcd_adder four(a[15:12], b[15:12], carry[2], sum[15:12], carry[3]);
    
    // The carry-out of the most significant BCD adder is the final carry-out of the 4-digit BCD adder
    assign cout = carry[3];
    
endmodule