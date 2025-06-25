module A(input x, input y, output z);
  // Assigns z to the result of (x XOR y) AND x
  assign z = (x ^ y) & x;
endmodule

module B(input x, input y, output z);
  // Assigns z to the inverse of (x XOR y)
  assign z = ~(x ^ y);
endmodule


module combine_circuits_A_and_B(input x, input y, output z);

	// Internal wires to connect the outputs of instances of A and B
	wire ia1, ib1, ia2, ib2;
    // Instantiate module A as IA1
    A IA1(x, y, ia1);
    // Instantiate module B as IB1
    B IB1(x, y, ib1);
    // Instantiate module A as IA2
    A IA2(x, y, ia2);
    // Instantiate module B as IB2
    B IB2(x, y, ib2);
    
    // Assigns the final output z based on the combination of intermediate signals
    assign z = (ia1 | ib1) ^ (ia2 & ib2);

    
endmodule