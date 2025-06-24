`timescale 1ns / 1ps

module simple_circuit_B_tb();

    reg x,y;
    wire z;
    
    simple_circuit_B dut(x,y,z);
    
    initial begin
        x=0;y=0;#4;
        $display("The inputs are x=%b and y=%b, Output z=%b.",x,y,z);
        
        x=0;y=1;#4;
        $display("The inputs are x=%b and y=%b, Output z=%b.",x,y,z);
        
        x=1;y=0;#4;
        $display("The inputs are x=%b and y=%b, Output z=%b.",x,y,z);
        
        x=1;y=1;#4;
        $display("The inputs are x=%b and y=%b, Output z=%b.",x,y,z);

        $finish;
        
    end
endmodule
