timescale 1ns / 1ps

module signed_addition_overflow_tb();

    reg [7:0] a,b;   // Declare 8-bit registers for signed inputs 'a' and 'b'
    wire [7:0] s;    // Declare 8-bit wire for the signed sum 's'
    wire of;         // Declare wire for the overflow flag 'of'
    
    // Instantiate the Device Under Test (DUT)
    signed_addition_overflow dut(a,b,s,of);
    
    initial begin
        // Test case 1: Positive numbers, no overflow (0 + 0 = 0)
        a=0;b=0;#3;
        $display("Inputs=>a=%d and b=%d || Outputs=> Sum=%d and overflow flag=%b.",$signed(a),$signed(b),$signed(s),of);
        
        // Test case 2: Negative numbers, no overflow (-1 + -1 = -2)
        a={8{1'b1}};b={8{1'b1}};#3; // a = -1, b = -1
        $display("Inputs=>a=%d and b=%d || Outputs=> Sum=%d and overflow flag=%b.",$signed(a),$signed(b),$signed(s),of);

        // Test case 3: Positive overflow (64 + 64 = 128, which overflows for 8-bit signed)
        a=8'b01000000;b=8'b01000000;#3; // a = 64, b = 64
        $display("Inputs=>a=%d and b=%d || Outputs=> Sum=%d and overflow flag=%b.",$signed(a),$signed(b),$signed(s),of);

        // Test case 4: Negative overflow (-128 + -128 = -256, which overflows for 8-bit signed)
        a=8'b10000000;b=8'b10000000;#3; // a = -128, b = -128
        $display("Inputs=>a=%d and b=%d || Outputs=> Sum=%d and overflow flag=%b.",$signed(a),$signed(b),$signed(s),of);
    
        $finish; // Terminate the simulation
    end

endmodule