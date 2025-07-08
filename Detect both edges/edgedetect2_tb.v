`timescale 1ns / 1ps

module edgedetect2_tb();

    reg clk;
    reg [7:0]in;
    wire [7:0]anyedge;
    
    edgedetect2 dut(clk,in,anyedge);
    
    initial begin
        clk=0;
        forever #5 clk=~clk;
    end
    
    initial begin
        in=8'b0;#5;
        in=8'b00001010;#10;
        in=8'b10100000;#10;
        in=8'b11111111;#10;
        in=8'b10101010;#10;
        in=8'b01010101;#10;
        $finish;
    end
        
    initial begin
        $monitor("Time=%t||Inputs=>in=%b||Output=>Pos edge=%b.",$time,in,anyedge);
    end

endmodule
