module module_name ( // Defines a module.
    input a, // First input.
    input b, // Second input.
    input c, // Third input.
    input d, // Fourth input.
    output out1, // First output.
    output out2 // Second output.
);
    mod_a dut(.out1(out1),.out2(out2),.in1(a),.in2(b),.in3(c),.in4(d)); // Instantiates 'mod_a' with named port mapping.
endmodule // End of module.