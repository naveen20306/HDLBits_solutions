module chip7458 ( // Module for a 7458-like dual AND-OR gate.
    input p1a, p1b, p1c, p1d, p1e, p1f, // Inputs for the first section.
    output p1y, // Output for the first section.
    input p2a, p2b, p2c, p2d, // Inputs for the second section.
    output p2y ); // Output for the second section.
	wire wire1,wire2,wire3,wire4; // Internal wires for intermediate logic.
    
    assign wire1 = p1a & p1b & p1c; // ANDing first three inputs of section 1.
    assign wire2 = p1d & p1e & p1f; // ANDing last three inputs of section 1.
    assign wire3 = p2a & p2b; // ANDing first two inputs of section 2.
    assign wire4 = p2c & p2d; // ANDing last two inputs of section 2.
    assign p1y = wire1 | wire2; // ORing results for p1y output.
    assign p2y = wire3 | wire4; // ORing results for p2y output.

endmodule // End of module.