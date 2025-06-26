module Mux2to1( 
    input a,    // First data input
    input b,    // Second data input
    input sel,  // Select signal: if sel is 1, output b; if sel is 0, output a
    output out  // Output of the multiplexer
); 
	
    // Assign 'out' based on the 'sel' signal (ternary operator for a 2-to-1 multiplexer)
    assign out = (sel) ? b : a;
    
endmodule