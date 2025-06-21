module wire4_tb();
    reg a,b,c;
    wire w,x,y,z;
    
    wire4 dut( .a(a),.b(b),.c(c),.w(w),.x(x),.y(y),.z(z));
    
initial begin

    $display("------------------------");
    $display("Time  | a b c | w x y z |");
    $display("------------------------");
    
    a=0;b=0;c=0;
    $display("%0t  | %b %b %b | %b %b %b %b|",$time,a,b,c,w,x,y,z);
    #10;
    
    a=0;b=0;c=1;
    $display("%0t  | %b %b %b | %b %b %b %b|",$time,a,b,c,w,x,y,z);
    #10;
    
    a=0;b=1;c=0;
    $display("%0t  | %b %b %b | %b %b %b %b|",$time,a,b,c,w,x,y,z);
    #10;
    
    a=0;b=1;c=1;
    $display("%0t  | %b %b %b | %b %b %b %b|",$time,a,b,c,w,x,y,z);
    #10;
    
    a=1;b=0;c=0;
    $display("%0t  | %b %b %b | %b %b %b %b|",$time,a,b,c,w,x,y,z);
    #10;
    
    a=1;b=0;c=1;
    $display("%0t  | %b %b %b | %b %b %b %b|",$time,a,b,c,w,x,y,z);
    #10;
    
    a=1;b=1;c=0;
    $display("%0t  | %b %b %b | %b %b %b %b|",$time,a,b,c,w,x,y,z);
    #10;

    a=1;b=1;c=1;
    $display("%0t  | %b %b %b | %b %b %b %b|",$time,a,b,c,w,x,y,z);
    #10;
    $finish;
    end
endmodule
