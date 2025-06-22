`timescale 1ns / 1ps // Sets the time unit to 1ns and precision to 1ps.

module always_if2_tb(); // Testbench module for 'always_if2'.

    reg cpu_overheated,arrived,gas_tank_empty; // Registers for inputs.
    wire shut_off_computer,keep_driving; // Wires for outputs from the DUT.
    
    always_if2 dut(.cpu_overheated(cpu_overheated),.arrived(arrived),.gas_tank_empty(gas_tank_empty),.shut_off_computer(shut_off_computer),.keep_driving(keep_driving)); // Instantiate the DUT.
    
    initial begin // Initial block for stimulus.
        cpu_overheated <= 0; arrived <= 0; gas_tank_empty <= 0; #5; // Set inputs and wait 5 time units.
        $display("Inputs cpu_overheated=%b;arrived=%b;gas_tank_empty=%b-->Output shut_off_computer=%b and keep_driving=%b.",cpu_overheated,arrived,gas_tank_empty,shut_off_computer,keep_driving); // Display results.
        
        cpu_overheated <= 0; arrived <= 0; gas_tank_empty <= 1; #5; // Set inputs and wait 5 time units.
        $display("Inputs cpu_overheated=%b;arrived=%b;gas_tank_empty=%b-->Output shut_off_computer=%b and keep_driving=%b.",cpu_overheated,arrived,gas_tank_empty,shut_off_computer,keep_driving); // Display results.
        
        cpu_overheated <= 1; arrived <= 1; gas_tank_empty <= 0; #5; // Set inputs and wait 5 time units.
        $display("Inputs cpu_overheated=%b;arrived=%b;gas_tank_empty=%b-->Output shut_off_computer=%b and keep_driving=%b.",cpu_overheated,arrived,gas_tank_empty,shut_off_computer,keep_driving); // Display results.
        
        cpu_overheated <= 1; arrived <= 1; gas_tank_empty <= 1; #5; // Set inputs and wait 5 time units.
        $display("Inputs cpu_overheated=%b;arrived=%b;gas_tank_empty=%b-->Output shut_off_computer=%b and keep_driving=%b.",cpu_overheated,arrived,gas_tank_empty,shut_off_computer,keep_driving); // Display results.
        
        $finish; // End simulation.
     end // End of initial block.
endmodule // End of testbench module.