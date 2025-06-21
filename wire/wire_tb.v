module Wire_tb();
reg in;
wire out;

Wire dut(
    .in(in),
    .out(out)
    );
    
initial 
    begin 
        in=0;
        #10 in=1;
        #10 in=0;
        $finish;
    end
endmodule
