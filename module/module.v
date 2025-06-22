module module_prob ( input a, input b, output out ); // Declares a module named 'module_prob'.

    mod_a dut(.in1(a),.in2(b),.out(out)); // Instantiates a sub-module named 'mod_a' and connects its ports.

endmodule // End of module 'module_prob'.