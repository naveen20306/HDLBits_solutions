`timescale 1ns / 1ps // Sets the time unit to 1ns and precision to 1ps.

module add100i_tb(); // Testbench module for 'add100i'.

    reg [99:0] a, b; // 100-bit input registers for operands.
    reg cin; // Carry-in input.
    wire [99:0] cout; // 100-bit wire for carry-out (likely meant as intermediate carries or just the final carry).
    wire [99:0] sum; // 100-bit wire for the sum output.
    
    add100i dut(a,b,cin,cout,sum); // Instantiate the DUT.
    
    initial begin // Initial block for simulation stimulus.
        
        a <= 100'b0; b <= 100'b0; cin = 0; #5; // Test case: 0 + 0 + 0.
        $display("The sum of a=%0100b and b=%0100b is sum=%0100b and cout=%b.",a,b,sum,cout[99]); // Display results.

        a <= 100'b0; b <= 100'b0; cin = 1'b1; #5; // Test case: 0 + 0 + 1.
        $display("The sum of a=%0100b and b=%0100b is sum=%0100b and cout=%b.",a,b,sum,cout[99]); // Display results.

        a <= {100{1'b1}}; b <= {100{1'b1}}; cin = 0; #5; // Test case: all ones + all ones + 0.
        $display("The sum of a=%0100b and b=%0100b is sum=%0100b and cout=%b.",a,b,sum,cout[99]); // Display results.

        a <= {100{1'b1}}; b <= {100{1'b1}}; cin = 1'b1; #5; // Test case: all ones + all ones + 1.
        $display("The sum of a=%0100b and b=%0100b is sum=%0100b and cout=%b.",a,b,sum,cout[99]); // Display results.
        
        a <= 100'b0; b <= {100{1'b1}}; cin = 0; #5; // Test case: 0 + all ones + 0.
        $display("The sum of a=%0100b and b=%0100b is sum=%0100b and cout=%b.",a,b,sum,cout[99]); // Display results.

        a <= {100{1'b1}}; b <= 100'b0; cin = 0; #5; // Test case: all ones + 0 + 0.
        $display("The sum of a=%0100b and b=%0100b is sum=%0100b and cout=%b.",a,b,sum,cout[99]); // Display results.

        a <= 100'b0; b <= {100{1'b1}}; cin = 1'b1; #5; // Test case: 0 + all ones + 1.
        $display("The sum of a=%0100b and b=%0100b is sum=%0100b and cout=%b.",a,b,sum,cout[99]); // Display results.

        a <= {100{1'b1}}; b <= 100'b0; cin = 1'b1; #5; // Test case: all ones + 0 + 1.
        $display("The sum of a=%0100b and b=%0100b is sum=%0100b and cout=%b.",a,b,sum,cout[99]); // Display results.

        $finish; // End simulation.
     
     end // End of initial block.
    
endmodule // End of testbench module.