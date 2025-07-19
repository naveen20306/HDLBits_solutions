`timescale 1ns / 1ps

module hour_counter(
        input clk,  // Clock signal
        input rst,  // Asynchronous reset (active high)
        input ena,  // Enable signal for the hour counter
        output reg [3:0] hrs_ones, // BCD for hours units digit
        output reg [3:0] hrs_tens  // BCD for hours tens digit
);
        
        // Always block sensitive to the positive edge of clock or positive edge of reset
        always @(posedge clk or posedge rst) begin
            // Asynchronous reset condition
            if (rst) begin
                hrs_tens <= 4'd1; // Reset hours to 1
                hrs_ones <= 4'd2; // Reset hours to 12 (1:2)
            end
            // If not in reset and 'ena' is high, then update hours
            else if (ena) begin
                    // Special case: If current hour is 12 (1:2), wrap around to 1 (0:1)
                    if (hrs_ones == 4'd2 && hrs_tens == 4'd1) begin
                        hrs_tens <= 4'd0; // Tens digit becomes 0
                        hrs_ones <= 4'd1; // Units digit becomes 1 (making it 01 i.e., 1 AM/PM)
                    end
                    // If units digit is 9 (e.g., 09, 19 - but 19 is not possible in 12hr clock), roll over units and increment tens
                    else if (hrs_ones == 4'd9) begin
                            // If tens digit is 0 (i.e., 09 becomes 10)
                            if (!hrs_tens) begin // equivalent to hrs_tens == 4'd0
                                hrs_tens <= 4'd1; // Tens digit becomes 1
                                hrs_ones <= 4'd0; // Units digit becomes 0
                            end
                            // Else (tens digit is already 1), do nothing here as this condition should only apply to 09.
                            // The 12 -> 1 wrap around is handled by the first if.
                            // No other values for hrs_tens are expected in a 12-hour clock (only 0 or 1).
                    end
                    // General case: increment units digit
                    else begin
                        hrs_ones <= hrs_ones + 1;
                    end
            end
         end 
         
endmodule