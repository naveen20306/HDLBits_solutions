module chip7458_tb();

    reg p1a, p1b, p1c, p1d, p1e, p1f,p2a, p2b, p2c, p2d;
    wire p1y,p2y;
    
    chip7458 dut(.p1a(p1a),.p1b(p1b),.p1c(p1c),.p1d(p1d),.p1e(p1e),.p1f(p1f),.p2a(p2a),.p2b(p2b),.p2c(p2c),.p2d(p2d),.p1y(p1y),.p2y(p2y));
    reg [6:0] in1;
    reg [4:0] in2;
    
    initial begin
    
    
        p1a=0; p1b=0; p1c=0; p1d=0; p1e=0; p1f=0;p2a=0; p2b=0; p2c=0; p2d=0;#1;
        
        fork    
        begin
            for(in1=6'b000000;in1<=6'b111111;in1=in1+1) begin
                {p1a, p1b, p1c, p1d, p1e, p1f}=in1;
                #2;
                $display("If p1a=%b,p1b=%b,p1c=%b,p1d=%b,p1e=%b,p1f=%b,then output p1y=%b",p1a,p1b,p1c,p1d,p1e,p1f,p1y);
            end
        end
        begin
            for(in2=0;in2<=15;in2=in2+1) begin
            {p2a,p2b,p2c,p2d}=in2[3:0];
            #2;
            $display("If p2a=%b,p2b=%b,p2c=%b,p2d=%b,then output p2y=%b",p2a,p2b,p2c,p2d,p2y);
            end
        end
        join
        #10;
        $finish;
     end
endmodule
     
    