module wire4( // Declares a module named 'wire4'.
    input a,b,c, // Declares three single-bit input ports: 'a', 'b', and 'c'.
    output w,x,y,z ); // Declares four single-bit output ports: 'w', 'x', 'y', and 'z'.
	assign w = a; // Continuously assigns the value of input 'a' to output 'w'.
    assign x = b; // Continuously assigns the value of input 'b' to output 'x'.
    assign y = b; // Continuously assigns the value of input 'b' to output 'y'. Note that 'x' and 'y' will always have the same value as 'b'.
    assign z = c; // Continuously assigns the value of input 'c' to output 'z'.
endmodule // Ends the module definition.