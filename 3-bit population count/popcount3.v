module popcount3( 
    input [2:0] in, // 3-bit input for which to count the set bits (1s)
    output reg [1:0] out // 2-bit output to store the count of set bits (max 3, so 2 bits needed)
);
	// Declare an integer variable for loop iteration
	integer i; 
    // Always block that triggers on any change in inputs (combinational logic)
    always @(*) begin
        out = 0; // Initialize the output count to 0 for each new calculation
        // Loop through each bit of the input 'in'
        for (i = 0; i <= 2; i = i + 1) begin
            // Check if the current bit is a '1'
            if (in[i] == 1'b1) begin
                out = out + 1; // If it's a '1', increment the counter
            end
            else begin
                out = out; // If it's a '0', keep the counter as is (no change)
            end
        end
    end
                
endmodule