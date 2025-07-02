module kmap1_tb();

    // Declare registers for inputs
    reg a, b, c;
    // Declare wire for the output
    wire out;
    
    // Instantiate the Device Under Test (DUT), connecting its ports to the testbench signals
    kmap1 dut(a, b, c, out);
    
    // Initial block for defining the test stimulus
    initial begin
        // Test case: a=0, b=0, c=0
        {a, b, c} = 3'b000; #2;
        // Display inputs and output
        $display("Inputs=> a=%b,b=%b,c=%b||Output=> Out=%b.", a, b, c, out);

        // Test case: a=0, b=0, c=1
        {a, b, c} = 3'b001; #2;
        // Display inputs and output
        $display("Inputs=> a=%b,b=%b,c=%b||Output=> Out=%b.", a, b, c, out);
        
        // Test case: a=0, b=1, c=0
        {a, b, c} = 3'b010; #2;
        // Display inputs and output
        $display("Inputs=> a=%b,b=%b,c=%b||Output=> Out=%b.", a, b, c, out);
        
        // Test case: a=0, b=1, c=1
        {a, b, c} = 3'b011; #2;
        // Display inputs and output
        $display("Inputs=> a=%b,b=%b,c=%b||Output=> Out=%b.", a, b, c, out);
        
        // Test case: a=1, b=0, c=0
        {a, b, c} = 3'b100; #2;
        // Display inputs and output
        $display("Inputs=> a=%b,b=%b,c=%b||Output=> Out=%b.", a, b, c, out);
        
        // Test case: a=1, b=0, c=1
        {a, b, c} = 3'b101; #2;
        // Display inputs and output
        $display("Inputs=> a=%b,b=%b,c=%b||Output=> Out=%b.", a, b, c, out);
        
        // Test case: a=1, b=1, c=0
        {a, b, c} = 3'b110; #2;
        // Display inputs and output
        $display("Inputs=> a=%b,b=%b,c=%b||Output=> Out=%b.", a, b, c, out);
        
        // Test case: a=1, b=1, c=1
        {a, b, c} = 3'b111; #2;
        // Display inputs and output
        $display("Inputs=> a=%b,b=%b,c=%b||Output=> Out=%b.", a, b, c, out);        
        
        // Terminate the simulation
        $finish;
        
    end
endmodule