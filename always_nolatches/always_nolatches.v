// synthesis verilog_input_version verilog_2001
module always_nolatches ( // Module for decoding PS/2 keyboard scan codes for arrow keys.
    input [15:0] scancode, // 16-bit input for keyboard scan code.
    output reg left, // Output indicating 'left' arrow key press.
    output reg down, // Output indicating 'down' arrow key press.
    output reg right, // Output indicating 'right' arrow key press.
    output reg up // Output indicating 'up' arrow key press.
); 

    always @(*) begin // Combinational always block, sensitive to 'scancode'.
        left=0;right=0;down=0;up=0; // Initialize all outputs to 0 to avoid latches.
        casez(scancode) // Casez statement to decode scancodes.
            16'he06b: begin left=1;right=0;down=0;up=0; end // Scancode for left arrow key.
            16'he072: begin left=0;right=0;down=1;up=0; end // Scancode for down arrow key.
            16'he074: begin left=0;right=1;down=0;up=0; end // Scancode for right arrow key.
            16'he075: begin left=0;right=0;down=0;up=1; end // Scancode for up arrow key.
            default: begin left=0;right=0;down=0;up=0; end // Default case: all outputs are 0.
        endcase
    end
            
endmodule // End of module.