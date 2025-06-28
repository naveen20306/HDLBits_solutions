timescale 1ns / 1ps

module adder4_tb();

    reg [3:0] x,y;    // Declare 4-bit registers for inputs x and y
    wire [4:0] sum;   // Declare a 5-bit wire for the sum (4-bit sum + 1-bit carry-out)
    integer i,j;      // Declare integer loop variables

    adder4 dut(x,y,sum); // Instantiate the 4-bit adder Device Under Test (DUT)
    
    initial begin
        // Loop through all possible 4-bit values for x (0 to 15)
        for(i=0;i<16;i=i+1)begin
            // Loop through all possible 4-bit values for y (0 to 15)
            for(j=0;j<16;j=j+1)begin
                x=i;y=j;#2; // Assign inputs and wait for 2 time units for propagation
                // Display the inputs, the 4-bit sum, and the carry-out (MSB of sum)
                $display("Inputs=>a=%b and b=%b ||Output=>sum=%b and carry out=%b.",x,y,sum[3:0],sum[4]);
            end
        end
        $finish; // Terminate the simulation after all test cases
    end

endmodule