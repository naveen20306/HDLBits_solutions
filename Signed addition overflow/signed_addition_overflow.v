module signed_addition_overflow(
    input [7:0] a,          // 8-bit signed input 'a'
    input [7:0] b,          // 8-bit signed input 'b'
    output [7:0] s,          // 8-bit signed sum 's'
    output overflow         // Overflow indicator
);

    wire [7:0] cout; // Wires to connect carry-out of each full_adder to the next carry-in

    // Instantiate 8 full adders to perform 8-bit binary addition
    full_adder one(a[0], b[0], 1'b0, cout[0], s[0]);     // LSB (bit 0) with carry-in 0
    full_adder two(a[1], b[1], cout[0], cout[1], s[1]);  // Bit 1
    full_adder three(a[2], b[2], cout[1], cout[2], s[2]);// Bit 2
    full_adder four(a[3], b[3], cout[2], cout[3], s[3]); // Bit 3
    full_adder five(a[4], b[4], cout[3], cout[4], s[4]); // Bit 4
    full_adder six(a[5], b[5], cout[4], cout[5], s[5]);  // Bit 5
    full_adder seven(a[6], b[6], cout[5], cout[6], s[6]);// Bit 6
    full_adder eight(a[7], b[7], cout[6], cout[7], s[7]);// MSB (bit 7)

    // Overflow detection for signed addition:
    // Overflow occurs if the carry-in to the MSB is different from the carry-out of the MSB.
    assign overflow = cout[7] ^ cout[6];
    
endmodule