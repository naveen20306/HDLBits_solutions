// synthesis verilog_input_version verilog_2001
module always_casez ( // Module implementing an 8-bit priority encoder using a casez statement.
    input [7:0] in, // 8-bit input vector.
    output reg [2:0] pos // 3-bit output indicating the position of the highest priority '1'.
);

    always @(*) begin // Combinational always block, sensitive to 'in'.
        casez(in) // Casez statement for priority encoding (handles 'z' as don't care).
            8'bzzzzzzz1: pos = 3'd0; // If bit 0 is '1' (and higher bits don't care).
            8'bzzzzzz1z: pos = 3'd1; // If bit 1 is '1'.
            8'bzzzzz1zz: pos = 3'd2; // If bit 2 is '1'.
            8'bzzzz1zzz: pos = 3'd3; // If bit 3 is '1'.
            8'bzzz1zzzz: pos = 3'd4; // If bit 4 is '1'.
            8'bzz1zzzzz: pos = 3'd5; // If bit 5 is '1'.
            8'bz1zzzzzz: pos = 3'd6; // If bit 6 is '1'.
            8'b1zzzzzzz: pos = 3'd7; // If bit 7 is '1'.
            default: pos = 0; // If no bits are '1' (all zeros), default to position 0.
        endcase
    end
    
endmodule // End of module.