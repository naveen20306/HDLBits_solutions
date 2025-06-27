module half_adder(
    input a, b,
    output cout, sum );
    
    // Calculate the sum using an XOR gate
    assign sum = a ^ b;
    // Calculate the carry-out using an AND gate
    assign cout = a & b;
    
endmodule