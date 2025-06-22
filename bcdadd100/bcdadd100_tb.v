`timescale 1ns / 1ps // Sets the time unit to 1ns and precision to 1ps.

module bcdadd100_tb(); // Testbench module for 'bcdadd100'.
 
  reg [399:0]a,b; // 400-bit input registers for BCD operands.
  reg cin; // Carry-in register.
  wire [399:0]sum; // 400-bit sum output wire.
  wire cout; // Final carry-out wire.
  
  bcdadd100 dut(.a(a),.b(b),.cin(cin),.sum(sum),.cout(cout)); // Instantiate the DUT.
  
  initial begin // Initial block for simulation stimulus.
        
    a <= 400'b0; b <= 400'b0; cin <= 0; #5; // Test case: 0 + 0 + 0.
    $display("The sum of a=%0400b and b=%0400b is sum=%0400b cout=%b.",a,b,sum,cout); // Display results.
    
    a <= 400'b0; b <= {400{1'b1}}; cin <= 0; #5; // Test case: 0 + all ones (binary, not BCD) + 0.
    $display("The sum of a=%0400b and b=%0400b is sum=%0400b cout=%b.",a,b,sum,cout); // Display results.
    
    a <= {400{1'b1}}; b <= 400'b0; cin <= 0; #5; // Test case: all ones (binary) + 0 + 0.
    $display("The sum of a=%0400b and b=%0400b is sum=%0400b cout=%b.",a,b,sum,cout); // Display results.
    
    a <= {400{1'b1}}; b <= {400{1'b1}}; cin <= 0; #5; // Test case: all ones (binary) + all ones (binary) + 0.
    $display("The sum of a=%0400b and b=%0400b is sum=%0400b cout=%b.",a,b,sum,cout); // Display results.
    
    a <= {400{1'b1}}; b <= {400{1'b1}}; cin <= 1; #5; // Test case: all ones (binary) + all ones (binary) + 1.
    $display("The sum of a=%0400b and b=%0400b is sum=%0400b cout=%b.",a,b,sum,cout); // Display results.
    
    $finish; // End simulation.
    end // End of initial block.
endmodule // End of testbench module.