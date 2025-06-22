`timescale 1ns / 1ps // Sets the time unit to 1ns and precision to 1ps.

module always_case_tb(); // Testbench module for 'always_case'.

    reg [2:0] sel; // 3-bit register for select input.
    reg [3:0] data0,data1,data2,data3,data4,data5; // 4-bit registers for data inputs.
    wire [3:0] out; // 4-bit wire for the output from the DUT.
    
    always_case dut(.sel(sel),.data0(data0),.data1(data1),.data2(data2),.data3(data3),.data4(data4),.data5(data5),.out(out)); // Instantiate the DUT.
    
    initial begin // Initial block for stimulus generation.
        data0 <= 0; data1 <= 1; data2 <= 2; data3 <= 3; data4 <= 4; data5 <= 5; #2; // Initialize data inputs and wait 2 time units.
        
        for(sel=0; sel<=3'b111; sel=sel+1) begin // Loop through all 8 possible select line combinations.
            #2; // Wait 2 time units for output to settle.
            $display("The select line sel=%03b and the out of 6:1 mux = %d.",sel,out); // Display the select value and the multiplexer's output.
            if(sel == 3'b111) $finish; // If the last select combination is reached, end simulation.
        end
        
    end // End of initial block.
    
endmodule // End of testbench module.