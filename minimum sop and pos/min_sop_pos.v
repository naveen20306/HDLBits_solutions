module min_sop_pos(
    input a,        // First input variable
    input b,        // Second input variable
    input c,        // Third input variable
    input d,        // Fourth input variable
    output out_sop, // Output for Sum-of-Products (SOP) minimization
    output out_pos  // Output for Product-of-Sums (POS) minimization
); 
    // Assigns 'out_sop' based on the Sum-of-Products expression: (C AND D) OR (NOT A AND NOT B AND C)
    assign out_sop = (c & d) | (~a & ~b & c);
    // Assigns 'out_pos' based on the Product-of-Sums expression: C AND (NOT B OR D) AND (NOT A OR D)
    assign out_pos = c & (~b | d) & (~a | d);
endmodule