`timescale 1ns / 1ps

module count1to12_tb();

    reg clk;
    reg reset;
    reg enable;
    wire [3:0] Q;
    wire c_enable;
    wire c_load;
    wire[3:0] c_d;
    
    count1to12_top dut(clk,reset,enable,Q,c_enable,c_load,c_d);
    
    initial begin
        clk<=0;
        forever #5 clk<=~clk;
        end
        
     initial begin
        reset=1'b1;enable=0;#10;
        
        reset=0;enable=1'b1;
        
        #50;
        $finish;
        end
     
     initial begin
        $monitor("Time=%t||Reset=%b||Enable=%b||counter load=%b||data to be loaded=%b||Count=%b.",$time,reset,enable,c_load,c_d,Q);
        end
endmodule
