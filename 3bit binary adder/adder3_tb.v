timescale 1ns / 1ps

module adder3_tb();

    reg [2:0] a,b;
    reg cin;
    wire [2:0] cout,sum;
    integer i,j,k;

    // Instantiate the 3-bit adder Device Under Test (DUT)
    adder3 dut(a,b,cin,cout,sum);

    initial begin
        // Loop through all possible values for 'a' (0 to 7)
        for(i=0;i<8;i=i+1) begin
            // Loop through all possible values for 'b' (0 to 7)
            for(j=0;j<8;j=j+1)begin
                // Loop through all possible values for 'cin' (0 or 1)
                for(k=0;k<2;k=k+1)begin
                    // Apply inputs and wait for 5 time units
                    a=i;b=j;cin=k;#5;
                    // Display the inputs and outputs
                    $display("Inputs=>a=%b,b=%b and cin=%b||Output=>sum=%b and carry out=%b.",a,b,cin,sum,cout[2]);
                end
            end
        end
        // Terminate the simulation
        $finish;
    end
endmodule