module wire_decl_tb(); // Testbench module for 'wire_decl'.

    reg a,b,c,d; // Regs to drive inputs.
    wire out,out_n; // Wires to observe outputs.
    
    wire_decl dut(.a(a),.b(b),.c(c),.d(d),.out(out),.out_n(out_n)); // Instantiate the DUT.
    
    reg[4:0] input_vector; // Loop variable for input combinations.
    
    initial begin // Initial block for simulation.
    a=0;b=0;c=0;d=0; // Initialize inputs.
    #1; // Wait 1 time unit for initial propagation.
    for(input_vector=0;input_vector<16;input_vector=input_vector+1) begin // Loop through all 16 input combinations.
        {a,b,c,d}=input_vector[3:0]; // Assign bits of input_vector to inputs a,b,c,d.
        #2; // Wait 2 time units for outputs to settle.
        $display("If a=%b,b=%b,c=%b,d=%b,then output out=%b,out_n=%b",a,b,c,d,out,out_n); // Display current inputs and outputs.
    end
    
    $finish; // End simulation.
    end // End initial block.
endmodule // End of testbench module.