`timescale 1ns / 1ps

module mux9to1v_tb();

    // Declare 16-bit registers for all 9 data inputs
    reg [15:0] a, b, c, d, e, f, g, h, i;
    // Declare a 4-bit register for the select input
    reg [3:0] sel;
    // Declare a 16-bit wire for the output
    wire [15:0] out;
    
    // Instantiate the Device Under Test (DUT), connecting its ports to the testbench signals
    mux9to1v dut(a, b, c, d, e, f, g, h, i, sel, out);
    
    // Initial block for defining the test stimulus
    initial begin
        // Initialize all data inputs with distinct hexadecimal patterns
        a = {4{4'ha}}; // AAAA
        b = {4{4'hb}}; // BBBB
        c = {4{4'hc}}; // CCCC
        d = {4{4'hd}}; // DDDD
        e = {4{4'he}}; // EEEE
        f = {4{4'hf}}; // FFFF
        g = {4{4'h0}}; // 0000
        h = {4{4'h1}}; // 1111
        i = {4{4'h2}}; // 2222
        
        // Test case 1: Select input 'a' (sel = 0)
        sel = 4'd0; #2;
        // Display select input and output. Note the display string comment is misleading, it refers to g,h,i for specific values, but this tests all inputs.
        $display("The select input:sel=%02d=>The selected output:out=%h.", sel, out);
        
        // Test case 2: Select input 'b' (sel = 1)
        sel = 4'd1; #2;
        $display("The select input:sel=%02d=>The selected output:out=%h.", sel, out);
        
        // Test case 3: Select input 'c' (sel = 2)
        sel = 4'd2; #2;
        $display("The select input:sel=%02d=>The selected output:out=%h.", sel, out);

        // Test case 4: Select input 'd' (sel = 3)
        sel = 4'd3; #2;
        $display("The select input:sel=%02d=>The selected output:out=%h.", sel, out);

        // Test case 5: Select input 'e' (sel = 4)
        sel = 4'd4; #2;
        $display("The select input:sel=%02d=>The selected output:out=%h.", sel, out);

        // Test case 6: Select input 'f' (sel = 5)
        sel = 4'd5; #2;
        $display("The select input:sel=%02d=>The selected output:out=%h.", sel, out);

        // Test case 7: Select input 'g' (sel = 6)
        sel = 4'd6; #2;
        $display("The select input:sel=%02d=>The selected output:out=%h.", sel, out);

        // Test case 8: Select input 'h' (sel = 7)
        sel = 4'd7; #2;
        $display("The select input:sel=%02d=>The selected output:out=%h.", sel, out);

        // Test case 9: Select input 'i' (sel = 8)
        sel = 4'd8; #2;
        $display("The select input:sel=%02d=>The selected output:out=%h.", sel, out);
        
        // Test case 10: Default case (sel = 11, which is not 0-8)
        sel = 4'd11; #2;
        $display("The select input:sel=%02d=>The selected output:out=%h.", sel, out);

        // Terminate the simulation
        $finish;
        
    end

endmodule