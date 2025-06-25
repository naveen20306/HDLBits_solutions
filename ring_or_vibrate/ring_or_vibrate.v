module ring_or_vibrate(
    input ring,           // Input signal to initiate a ring/vibrate action
    input vibrate_mode,   // Input signal to select vibrate mode (1'b1 for vibrate, 1'b0 for ring)
    output ringer,        // Output for activating the ringer (makes sound)
    output motor          // Output for activating the vibrator motor
);
    // Assign ringer output: ringer is active if 'ring' is high and 'vibrate_mode' is low
    assign ringer = (ring == 1'b1 & vibrate_mode == 1'b0) ? 1'b1 : 1'b0;
    // Assign motor output: motor is active if both 'ring' and 'vibrate_mode' are high
    assign motor = (ring & vibrate_mode) ? 1'b1 : 1'b0;
    
endmodule