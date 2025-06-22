module vector5_tb(); // Testbench module for 'vector5'.

    reg a,b,c,d,e; // Single-bit input registers to the DUT.
    wire[24:0] out; // 25-bit output from the DUT.
    reg [4:0] test_input; // Register to generate 5-bit test input combinations.
    
    vector5 dut(.a(a),.b(b),.c(c),.d(d),.e(e),.out(out)); // Instantiate the 'vector5' module.
    
   initial begin // Initial block for simulation stimulus.
    a=0;b=0;c=0;d=0;e=0;#2; // Initialize all inputs to 0 and wait 2 time units.
    for(test_input=0; test_input<={5{1'b1}}; test_input=test_input+1) begin // Loop through all 32 possible 5-bit input combinations.
        {a,b,c,d,e} = test_input; // Assign current combination to inputs a,b,c,d,e.
        #5; // Wait for 5 time units for outputs to settle.
        $display("Input a=%b,b=%b,c=%b,d=%b,e=%b-->Output out=%025b",a,b,c,d,e,out); // Display inputs and the 25-bit output.
        if(test_input == {5{1'b1}}) begin $finish; end // If all inputs are '1', end simulation.
    end
   end // End of initial block.
endmodule // End of testbench module.