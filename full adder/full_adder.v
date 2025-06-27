module full_adder(
    input a, b, cin,
    output cout, sum );
    
    // Calculate the sum using XOR gates
    assign sum = a ^ b ^ cin;
    // Calculate the carry-out using AND and OR gates
    assign cout = (a & b) | ((a ^ b) & cin);
    
endmodule