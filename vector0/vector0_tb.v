module vector0_tb();

    reg [2:0]vec;
    wire [2:0]outv;
    wire o2,o1,o0;
    
    vector0 dut(.vec(vec),.outv(outv),.o0(o0),.o1(o1),.o2(o2));
    
    initial begin 
        vec=0;
        for (vec=0;vec<8;vec=vec+1)begin
            #5;
            $display("Input vec=%B%B%B,Output outv=%B%B%B,o2=%b,o1=%b,o0=%b",vec[2],vec[1],vec[0],outv[2],outv[1],outv[0],o2,o1,o0);
        end
     end
     
endmodule
