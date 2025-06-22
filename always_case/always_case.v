// synthesis verilog_input_version verilog_2001
module always_case ( // Module implementing an 8-to-1 multiplexer using a case statement.
    input [2:0] sel, // 3-bit select input.
    input [3:0] data0, // 4-bit data input for select 0.
    input [3:0] data1, // 4-bit data input for select 1.
    input [3:0] data2, // 4-bit data input for select 2.
    input [3:0] data3, // 4-bit data input for select 3.
    input [3:0] data4, // 4-bit data input for select 4.
    input [3:0] data5, // 4-bit data input for select 5.
    output reg [3:0] out // 4-bit output.
);
    always@(*) begin // Combinational always block, sensitive to all inputs.
        case(sel) // Case statement to select one of the data inputs.
            3'd0: out = data0; // If sel is 0, output data0.
            3'd1: out = data1; // If sel is 1, output data1.
            3'd2: out = data2; // If sel is 2, output data2.
            3'd3: out = data3; // If sel is 3, output data3.
            3'd4: out = data4; // If sel is 4, output data4.
            3'd5: out = data5; // If sel is 5, output data5.
            default: out = 0; // For other select values (6, 7), output 0.
        endcase
    end

endmodule // End of module.