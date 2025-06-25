`timescale 1ns / 1ps

module ring_or_vibrate_tb();

    // Declare registers for inputs: 'ring' signal and 'vibrate' mode
    reg ring, vibrate;
    // Declare wires for outputs: 'ringer' sound and 'motor' vibration
    wire ringer, motor;
    
    // Instantiate the Device Under Test (DUT), connecting its ports to the testbench signals
    ring_or_vibrate dut(ring, vibrate, ringer, motor);
    
    // Initial block for defining the test stimulus
    initial begin   
        // Test case 1: ring=0, vibrate=0 (Neither ring nor vibrate)
        ring = 0; vibrate = 0; #4;
        // Display inputs and corresponding outputs
        $display("The inputs are ring=%b and vibrate=%b, Output ringer=%b and motor=%b.", ring, vibrate, ringer, motor);
        
        // Test case 2: ring=0, vibrate=1 (Vibrate mode is on, but no incoming ring)
        ring = 0; vibrate = 1; #4;
        // Display inputs and corresponding outputs
        $display("The inputs are ring=%b and vibrate=%b, Output ringer=%b and motor=%b.", ring, vibrate, ringer, motor);
        
        // Test case 3: ring=1, vibrate=0 (Incoming ring, not in vibrate mode - should ring)
        ring = 1; vibrate = 0; #4;
        // Display inputs and corresponding outputs
        $display("The inputs are ring=%b and vibrate=%b, Output ringer=%b and motor=%b.", ring, vibrate, ringer, motor);
        
        // Test case 4: ring=1, vibrate=1 (Incoming ring, in vibrate mode - should vibrate)
        ring = 1; vibrate = 1; #4;
        // Display inputs and corresponding outputs
        $display("The inputs are ring=%b and vibrate=%b, Output ringer=%b and motor=%b.", ring, vibrate, ringer, motor);

        // Terminate the simulation
        $finish;
        
    end
endmodule