timescale 1ns / 1ps

module full_adder_tb();

    reg a,b,cin;
    wire sum,cout;
    
    // Instantiate the Device Under Test (DUT)
    full_adder dut(a,b,cin,cout,sum);
    
    initial begin
        // Test case 1: all inputs are 0
        a=0;b=0;cin=0;#2;
        $display("Inputs=> a=%b, b=%b and carry in=%b||Outputs=> sum=%b and carry out=%b.",a,b,cin,sum,cout);
        
        // Test case 2: carry in is 1
        a=0;b=0;cin=1;#2;
        $display("Inputs=> a=%b, b=%b and carry in=%b||Outputs=> sum=%b and carry out=%b.",a,b,cin,sum,cout);
        
        // Test case 3: b is 1
        a=0;b=1;cin=0;#2;
        $display("Inputs=> a=%b, b=%b and carry in=%b||Outputs=> sum=%b and carry out=%b.",a,b,cin,sum,cout);
        
        // Test case 4: b and carry in are 1
        a=0;b=1;cin=1;#2;
        $display("Inputs=> a=%b, b=%b and carry in=%b||Outputs=> sum=%b and carry out=%b.",a,b,cin,sum,cout);
        
        // Test case 5: a is 1
        a=1;b=0;cin=0;#2;
        $display("Inputs=> a=%b, b=%b and carry in=%b||Outputs=> sum=%b and carry out=%b.",a,b,cin,sum,cout);
        
        // Test case 6: a and carry in are 1
        a=1;b=0;cin=1;#2;
        $display("Inputs=> a=%b, b=%b and carry in=%b||Outputs=> sum=%b and carry out=%b.",a,b,cin,sum,cout);
        
        // Test case 7: a and b are 1
        a=1;b=1;cin=0;#2;
        $display("Inputs=> a=%b, b=%b and carry in=%b||Outputs=> sum=%b and carry out=%b.",a,b,cin,sum,cout);
        
        // Test case 8: all inputs are 1
        a=1;b=1;cin=1;#2;
        $display("Inputs=> a=%b, b=%b and carry in=%b||Outputs=> sum=%b and carry out=%b.",a,b,cin,sum,cout);

        // Terminate the simulation
        $finish;
        
    end
endmodule