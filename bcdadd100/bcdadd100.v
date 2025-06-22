module bcd_fadd (input [3:0] a, // 4-bit BCD digit input.
    input [3:0] b, // 4-bit BCD digit input.
    input cin, // Carry-in.
    output cout, // Carry-out.
    output [3:0] sum ); // 4-bit BCD sum digit.

    wire [4:0] binary_sum; // Internal wire for binary sum (can be up to 9+9+1=19).
    assign binary_sum = a + b + cin; // Calculates the binary sum.

    assign sum = (binary_sum > 9) ? (binary_sum - 10) : binary_sum; // Adjusts sum for BCD: subtracts 10 if binary sum > 9.
    assign cout = (binary_sum > 9) ? 1 : 0; // Generates carry-out if binary sum > 9.


endmodule

module bcdadd100( // Module for a 100-digit BCD adder (400 bits total).
    input [399:0] a, b, // 400-bit BCD input operands (100 digits).
    input cin, // Initial carry-in.
    output cout, // Final carry-out.
    output [399:0] sum ); // 400-bit BCD sum output.
    
    wire [100:0] carry_internal; // Internal wires to propagate carries between BCD digits.
    assign carry_internal[0] = cin; // Connects initial carry-in.
    genvar i; // Generate loop variable.
    generate // Start of generate block.
        for (i = 0; i < 100; i = i + 1) begin : bcd_adder_stage // Loop 100 times for each BCD digit.
            bcd_fadd digit_adder ( // Instantiate a bcd_fadd for each digit.
                .a (a[i*4 + 3 : i*4]), // Connect 4-bit 'a' digit.
                .b (b[i*4 + 3 : i*4]), // Connect 4-bit 'b' digit.
                .cin (carry_internal[i]), // Connect carry-in from previous stage.
                .cout (carry_internal[i+1]), // Connect carry-out to next stage.
                .sum (sum[i*4 + 3 : i*4]) // Connect 4-bit 'sum' digit.
            );
        end
    endgenerate // End of generate block.
    assign cout = carry_internal[100]; // Assign the final carry-out.
endmodule // End of module.