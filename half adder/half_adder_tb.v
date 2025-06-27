timescale 1ns / 1ps

module half_adder_tb();

    reg a,b;
    wire cout,sum;
    
    // Instantiate the Device Under Test (DUT)
    half_adder dut(a,b,cout,sum);
    
    initial begin
        // Test case 1: both inputs are 0
        a=0;b=0;#2;
        $display("Inputs=> a=%b and b=%b||Outputs=> sum=%b and carry out=%b.",a,b,sum,cout);
        
        // Test case 2: b is 1
        a=0;b=1;#2;
        $display("Inputs=> a=%b and b=%b||Outputs=> sum=%b and carry out=%b.",a,b,sum,cout);

        // Test case 3: a is 1
        a=1;b=0;#2;
        $display("Inputs=> a=%b and b=%b||Outputs=> sum=%b and carry out=%b.",a,b,sum,cout);

        // Test case 4: both inputs are 1
        a=1;b=1;#2;
        $display("Inputs=> a=%b and b=%b||Outputs=> sum=%b and carry out=%b.",a,b,sum,cout);

        // Terminate the simulation
        $finish;
        
    end
    
endmodule