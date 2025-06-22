module fulladder(input a,b,cin,output sum,cout); // Module for a 1-bit full adder.
    assign sum = a ^ b ^ cin; // Calculates the sum bit.
    assign cout = (a & b) | ((a ^ b) & cin); // Calculates the carry-out bit.
endmodule

module add100i( // Module for a 100-bit ripple-carry adder.
    input [99:0] a, b, // 100-bit input operands.
    input cin, // Carry-in to the LSB.
    output [99:0] cout, // Individual carry-outs for each bit position.
    output [99:0] sum ); // 100-bit sum output.
	
    
    wire [100:0] carry_internal; // Internal wire to connect carries between full adders. carry_internal[0] is cin, carry_internal[100] is the final carry-out.
    assign carry_internal[0] = cin; // Connects the module's cin to the first carry-in of the chain.
    genvar i; // Declares a generate loop variable.
    generate // Start of generate block for instantiating multiple full adders.
        for (i=0; i<100; i=i+1) begin : hundredbitadder // Loop 100 times to create a chain of full adders.
            fulladder obj(.a(a[i]),.b(b[i]),.cin(carry_internal[i]),.sum(sum[i]),.cout(cout[i])); // Instantiate a full adder for each bit position.
            assign carry_internal[i+1] = cout[i]; // Connects the carry-out of the current full adder to the carry-in of the next.
        end
    endgenerate // End of generate block.
    
endmodule // End of module.