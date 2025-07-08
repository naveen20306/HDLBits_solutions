`timescale 1ns / 1ps

module jkff(
    input clk,  // Clock signal for synchronous operation
    input j,    // J input of the JK flip-flop
    input k,    // K input of the JK flip-flop
    output reg Q // Output of the JK flip-flop, declared as 'reg'
); 

    // Initial block to set the power-on reset state of 'Q' to 0
    initial begin
        Q = 0;
    end
    
    // Always block sensitive to the positive edge of the clock
    always @(posedge clk) begin
        // JK flip-flop characteristic equation: Q_next = J*Q_bar + K_bar*Q
        // If J=0 and K=1 (Reset condition), Q becomes 0
        if (~j & k) begin
            Q <= 1'b0;
        end
        // Else if J=1 and K=0 (Set condition), Q becomes 1
        else if (j & ~k) begin
            Q <= 1'b1;
        end
        // Else if J=1 and K=1 (Toggle condition), Q flips its state
        else if (j & k) begin
            Q <= ~Q;
        end
        // If J=0 and K=0 (Hold condition), Q retains its current state (implied as no 'else' for this case)
    end
    
endmodule