module vector0 ( // Module for vector manipulation.
    input wire [2:0] vec, // 3-bit input vector.
    output wire [2:0] outv, // 3-bit output vector.
    output wire o2, // Individual bit output (MSB).
    output wire o1, // Individual bit output.
    output wire o0 // Individual bit output (LSB).
); 
    
    assign o0 = vec[0]; // Assigns the least significant bit of 'vec' to 'o0'.
    assign o1 = vec[1]; // Assigns the middle bit of 'vec' to 'o1'.
    assign o2 = vec[2]; // Assigns the most significant bit of 'vec' to 'o2'.
    assign outv = vec; // Assigns the entire 'vec' input to 'outv'.
    
endmodule // Ends the module definition.