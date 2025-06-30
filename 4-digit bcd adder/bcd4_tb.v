timescale 1ns / 1ps

module bcd4_tb();

    reg [15:0] a, b; // Declare 16-bit registers for BCD inputs 'a' and 'b'
    reg cin;         // Declare register for carry-in
    wire cout;       // Declare wire for carry-out
    wire [15:0] sum; // Declare 16-bit wire for BCD sum
    
    // Instantiate the 4-digit BCD adder Device Under Test (DUT)
    bcd4 dut(a,b,cin,cout,sum);
    
    initial begin
        // Test Case 1: Max BCD values, no initial carry-in (9999 + 9999 + 0)
        a=16'h9999;b=16'h9999;cin=0;#4;
        $display("%h + %h + %b = %h ||carry out =%b.",a,b,cin,sum,cout);
        
        // Test Case 2: Max BCD values, with initial carry-in (9999 + 9999 + 1)
        a=16'h9999;b=16'h9999;cin=1'b1;#4;
        $display("%h + %h + %b = %h ||carry out =%b.",a,b,cin,sum,cout);
        
        // Test Case 3: Zero inputs, no initial carry-in (0000 + 0000 + 0)
        a=16'h0;b=16'h0;cin=0;#4;
        $display("%h + %h + %b = %h ||carry out =%b.",a,b,cin,sum,cout);
        
        // Test Case 4: Zero inputs, with initial carry-in (0000 + 0000 + 1)
        a=16'h0;b=16'h0;cin=1'b1;#4;
        $display("%h + %h + %b = %h ||carry out =%b.",a,b,cin,sum,cout);
        
        // Test Case 5: Normal BCD addition, no initial carry-in (1234 + 1234 + 0)
        a=16'h1234;b=16'h1234;cin=0;#4;
        $display("%h + %h + %b = %h ||carry out =%b.",a,b,cin,sum,cout);
        
        // Test Case 6: Normal BCD addition, with initial carry-in (1234 + 1234 + 1)
        a=16'h1234;b=16'h1234;cin=1'b1;#4;
        $display("%h + %h + %b = %h ||carry out =%b.",a,b,cin,sum,cout);
        
        $finish; // Terminate the simulation
        
    end
    
endmodule