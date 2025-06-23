module chip7420( // Module for a 7420-like dual 4-input NAND gate.
    input p1a, p1b, p1c, p1d, // Inputs for the first 4-input NAND gate.
    output p1y, // Output of the first NAND gate.
    input p2a, p2b, p2c, p2d, // Inputs for the second 4-input NAND gate.
    output p2y ); // Output of the second NAND gate.

    assign p1y = ~(p1a & p1b & p1c & p1d); // Implements the logic for the first 4-input NAND gate.
    assign p2y = ~(p2a & p2b & p2c & p2d); // Implements the logic for the second 4-input NAND gate.
    
endmodule // End of module.