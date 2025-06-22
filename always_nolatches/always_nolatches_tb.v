`timescale 1ns / 1ps // Sets the time unit to 1ns and precision to 1ps.

module always_nolatches_tb(); // Testbench module for 'always_nolatches'.

    reg [15:0] scancode; // 16-bit register for the scancode input.
    wire left,down,right,up; // Wires for the directional outputs.
    
    always_nolatches dut(.scancode(scancode),.left(left),.down(down),.right(right),.up(up)); // Instantiate the DUT.
    
    initial begin // Initial block for simulation stimulus.
        for(scancode = 16'he060; scancode <= {16{1'b1}}; scancode = scancode + 1) begin // Loop through scancodes starting from 0xE060.
            #5; // Wait for 5 time units for outputs to settle.
            $display("The input scancode=%04h and %s pressed",scancode,(left==1'b1)?"left arrow key is":((right==1'b1)?"right arrow key is":((up==1'b1)?"up arrow key is":((down==1'b1)?"down arrow key is":("None of the arrow keys are"))))); // Display the scancode and which arrow key is pressed.
        end
        $finish; // End simulation.
    end // End of initial block.
            
endmodule // End of testbench module.