// synthesis verilog_input_version verilog_2001
module always_if2( // Module implementing conditional logic for system control.
    input cpu_overheated, // Input signal indicating CPU overheating.
    output reg shut_off_computer, // Output signal to shut off the computer.
    input arrived, // Input signal indicating arrival at destination.
    input gas_tank_empty, // Input signal indicating empty gas tank.
    output reg keep_driving // Output signal to continue driving.
); //

    always @(*) begin // Combinational always block for 'shut_off_computer'.
        if (cpu_overheated) // If CPU is overheated.
           shut_off_computer = 1; // Shut off the computer.
        else // Otherwise.
            shut_off_computer = 0; // Do not shut off.
    end

    always @(*) begin // Combinational always block for 'keep_driving'.
        if (~arrived) // If not arrived at destination.
           keep_driving = ~gas_tank_empty; // Continue driving if gas tank is not empty.
        else // If arrived.
           keep_driving = 1'b0; // Stop driving.
    end

endmodule // End of module.