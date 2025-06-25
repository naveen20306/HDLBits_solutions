`timescale 1ns / 1ps

module thermostat_tb();

    // Declare registers for inputs of the thermostat module
    reg cold;   // Represents 'too_cold' input to the DUT
    reg hot;    // Represents 'too_hot' input to the DUT
    reg mode;   // Represents 'mode' input to the DUT
    reg fan;    // Represents 'fan_on' input to the DUT
    
    // Declare wires for outputs of the thermostat module
    wire heater;   // Represents 'heater' output from the DUT
    wire ac;       // Represents 'aircon' output from the DUT
    wire fan_on;   // Represents 'fan' output from the DUT (note: renamed to avoid conflict with reg 'fan')

    // Declare a 4-bit register to iterate through all input combinations
    reg [3:0] in_wire; // Corrected to 4 bits as there are 4 inputs (mode, cold, hot, fan)
    
    // Instantiate the Device Under Test (DUT), connecting its ports to the testbench signals
    // Connect testbench signals to DUT inputs and outputs
    thermostat dut(cold, hot, mode, fan, heater, ac, fan_on);
    
    // Initial block for defining the test stimulus
    initial begin
        // Loop through all possible 16 combinations for the 4 inputs (mode, cold, hot, fan)
        for (in_wire = 0; in_wire <= 4'b1111; in_wire = in_wire + 1) begin
            // Assign the current loop value to the input registers
            // The order here should match the order they are connected in the DUT instance
            // {mode, cold, hot, fan} = in_wire; // Original line - assuming mapping as {mode, too_cold, too_hot, fan_on}
            {mode, cold, hot, fan} = in_wire; // Assign in order of 'in_wire' bits: in_wire[3] to mode, in_wire[2] to cold, etc.
            #5; // Wait for 5 time units for the outputs to propagate
            // Display the current inputs and the resulting outputs
            $display("Inputs:Mode(cooling=0/heating=1)=%b,too_cold=%b,too_hot=%b,fan_on=%b || Outputs:Heater=%b,Airconditioner=%b and Fan Switch=%b.", mode, cold, hot, fan, heater, ac, fan_on);
        end
        // Terminate the simulation after all test cases
        $finish;
    end
    
endmodule