module Wire_tb(); // Declares a testbench module named 'Wire_tb'.
reg in; // Declares a 'reg' type variable named 'in'. 'reg' is used to hold values in procedural blocks.
wire out; // Declares a 'wire' type variable named 'out'. 'wire' is used for continuous assignments and connections between modules.

Wire dut( // Instantiates the 'Wire' module, giving it the instance name 'dut' (Device Under Test).
    .in(in), // Connects the 'in' port of the 'Wire' module to the 'in' signal in the testbench.
    .out(out) // Connects the 'out' port of the 'Wire' module to the 'out' signal in the testbench.
);
    
initial // Defines an 'initial' block, which executes once at the beginning of the simulation.
    begin // Starts the sequential execution of statements within the 'initial' block.
        in = 0; // Sets the initial value of 'in' to 0.
        #10 in = 1; // Waits for 10 time units, then sets 'in' to 1.
        #10 in = 0; // Waits for another 10 time units, then sets 'in' to 0.
        $finish; // Terminates the simulation.
    end // Ends the sequential execution of statements.
endmodule // Ends the 'Wire_tb' module definition.