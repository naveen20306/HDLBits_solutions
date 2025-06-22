module top_module ( // Top-level module.
    input a, // First input.
    input b, // Second input.
    input c, // Third input.
    input d, // Fourth input.
    output out1, // First output.
    output out2 // Second output.
);
    mod_a dut(out1,out2,a,b,c,d); // Instantiate 'mod_a' with positional port mapping.
endmodule // End of module.