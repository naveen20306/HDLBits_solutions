module mux256to1v( 
    input [1023:0] in, // 1024-bit wide input vector
    input [7:0] sel,  // 8-bit select input (0 to 255)
    output [3:0] out  // 4-bit wide output
);

    // Assigns the 4-bit output 'out' by selecting a 4-bit slice from the 'in' vector.
    // The starting bit of the slice is calculated as 'sel * 4'.
    // The '+: 4' indicates a slice of 4 bits, starting from the calculated index.
    assign out = in[ (sel * 4) +: 4 ]; 
    
endmodule