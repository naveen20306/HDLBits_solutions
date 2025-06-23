module truthtable1( // Module implementing a Boolean function based on a truth table.
    input x3, // First input variable.
    input x2, // Second input variable.
    input x1, // Third input variable.
    output f // Output of the Boolean function.
);

    assign f = (~x3 & x2 & x1) | // Term for 011
              (~x3 & x2 & ~x1) | // Term for 010
              (x3 & ~x2 & x1) | // Term for 101
              (x3 & x2 & x1); // Term for 111
    // This expression simplifies to (x2) | (x3 & x1).
    
endmodule // End of module.