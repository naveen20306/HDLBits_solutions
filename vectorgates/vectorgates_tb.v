module vectorgates_tb(); // Testbench module for 'vectorgates'.

    reg [2:0] a,b; // 3-bit input registers.
    wire [2:0] out_or_bitwise; // 3-bit wire for bitwise OR output.
    wire out_or_logical; // 1-bit wire for logical OR output.
    wire [5:0] out_not; // 6-bit wire for concatenated NOT outputs.
    reg [3:0] ingen; // Loop counter for input generation.
    vectorgates dut(.a(a),.b(b),.out_or_bitwise(out_or_bitwise),.out_or_logical(out_or_logical),.out_not(out_not)); // Instantiate the DUT.
    
    initial begin // Initial block for simulation.
    
    a=0;b=0;#1; // Initialize inputs and wait.
    for (ingen=0;ingen<8;ingen=ingen+1) begin // Loop through 8 combinations.
        a=ingen[2:0]; // Assign loop value to 'a'.
        b=ingen[2:0]; // Assign loop value to 'b'.
        #2; // Wait for propagation.
        $display("Input a=%03b,b=%03b--> Output out_or_bitwise=%03b, out_or_logical=%b, out_not=%06b",a,b,out_or_bitwise,out_or_logical,out_not); // Display results.
    end
    
    end // End initial block.
    
endmodule // End of testbench.