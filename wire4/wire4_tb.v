module wire4_tb(); // Testbench module.
    reg a,b,c; // Inputs to the DUT.
    wire w,x,y,z; // Outputs from the DUT.
    
    wire4 dut( .a(a),.b(b),.c(c),.w(w),.x(x),.y(y),.z(z)); // Instantiate wire4 module.
    
initial begin // Simulation stimulus.

    $display("------------------------"); // Display header.
    $display("Time  | a b c | w x y z |"); // Display column labels.
    $display("------------------------"); // Display header.
    
    a=0;b=0;c=0; // Set inputs.
    $display("%0t  | %b %b %b | %b %b %b %b|",$time,a,b,c,w,x,y,z); // Display values.
    #10; // Wait 10 time units.
    
    a=0;b=0;c=1; // Set inputs.
    $display("%0t  | %b %b %b | %b %b %b %b|",$time,a,b,c,w,x,y,z); // Display values.
    #10; // Wait 10 time units.
    
    a=0;b=1;c=0; // Set inputs.
    $display("%0t  | %b %b %b | %b %b %b %b|",$time,a,b,c,w,x,y,z); // Display values.
    #10; // Wait 10 time units.
    
    a=0;b=1;c=1; // Set inputs.
    $display("%0t  | %b %b %b | %b %b %b %b|",$time,a,b,c,w,x,y,z); // Display values.
    #10; // Wait 10 time units.
    
    a=1;b=0;c=0; // Set inputs.
    $display("%0t  | %b %b %b | %b %b %b %b|",$time,a,b,c,w,x,y,z); // Display values.
    #10; // Wait 10 time units.
    
    a=1;b=0;c=1; // Set inputs.
    $display("%0t  | %b %b %b | %b %b %b %b|",$time,a,b,c,w,x,y,z); // Display values.
    #10; // Wait 10 time units.
    
    a=1;b=1;c=0; // Set inputs.
    $display("%0t  | %b %b %b | %b %b %b %b|",$time,a,b,c,w,x,y,z); // Display values.
    #10; // Wait 10 time units.

    a=1;b=1;c=1; // Set inputs.
    $display("%0t  | %b %b %b | %b %b %b %b|",$time,a,b,c,w,x,y,z); // Display values.
    #10; // Wait 10 time units.
    $finish; // End simulation.
    end // End initial block.
endmodule // End module.