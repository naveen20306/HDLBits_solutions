module vector5 ( // Module demonstrating vector replication and concatenation with logic.
    input a, b, c, d, e, // Five single-bit inputs.
    output [24:0] out // 25-bit output vector.
);
	
    wire [24:0] first, second; // Declare two 25-bit internal wires.
    assign first = {{5{a}},{5{b}},{5{c}},{5{d}},{5{e}}}; // Concatenates 5 replications of each input bit.
    assign second = {5{a,b,c,d,e}}; // Replicates the concatenated inputs 5 times.
    assign out = ~(first ^ second); // Computes the bitwise XNOR of 'first' and 'second'.
endmodule // End of module.