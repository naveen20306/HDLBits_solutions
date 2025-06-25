module thermostat(
    input too_cold, // Input: indicates if the temperature is too cold
    input too_hot,  // Input: indicates if the temperature is too hot
    input mode,     // Input: 1 for heating mode, 0 for cooling mode
    input fan_on,   // Input: external signal to force the fan on
    output heater,  // Output: activates the heating unit
    output aircon,  // Output: activates the air conditioning unit
    output fan      // Output: activates the fan
); 

    // Heater is active if in heating mode ('mode' is 1) and it's too cold
    assign heater = (mode & too_cold) ? 1'b1 : 1'b0;
    // Air conditioner is active if in cooling mode ('mode' is 0) and it's too hot
    assign aircon = (~mode & too_hot) ? 1'b1 : 1'b0;
    // Fan is active if heater is on, or aircon is on, or external fan_on signal is high
    assign fan = (heater | aircon | fan_on) ? 1'b1 : 1'b0;
    
    
endmodule