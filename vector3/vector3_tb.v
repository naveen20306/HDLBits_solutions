module vector3_tb(); // Testbench module for 'vector3'.

    reg [4:0] a, b, c, d, e, f; // 5-bit input registers.
    wire [7:0] w, x, y, z; // 8-bit output wires.
    
    vector3 dut(.a(a),.b(b),.c(c),.d(d),.e(e),.f(f),.w(w),.x(x),.y(y),.z(z)); // Instantiate the 'vector3' module.
    
    reg [29:0] combined; // Register to generate all input combinations.
    
    initial begin // Initial block for simulation stimulus.
        for(combined=0; combined<={30{1'b1}}; combined=combined+1) begin // Loop through all 30-bit combinations.
            {a,b,c,d,e,f} = combined; // Assign current combination to inputs.
            #5; // Wait for 5 time units for outputs to settle.
            $display("Input a=%05b,b=%05b,c=%05b,d=%05b,e=%05b,f=%05b-->Output w=%08b,x=%08b,y=%08b,z=%08b",a,b,c,d,e,f,w,x,y,z); // Display inputs and outputs.
            if(combined == {30{1'b1}}) begin $finish; end // If all ones, end simulation.
        end
    end // End of initial block.
endmodule // End of testbench module.