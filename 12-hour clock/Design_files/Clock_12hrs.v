`timescale 1ns / 1ps

module Clock_12hrs(
    input clk,     // Clock signal
    input reset,   // Synchronous active-high reset
    input ena,     // Global enable for the clock
    output pm,     // AM/PM indicator (1 for PM, 0 for AM)
    output [7:0] hh, // Hours in BCD format (high nibble for tens, low for ones)
    output [7:0] mm, // Minutes in BCD format
    output [7:0] ss  // Seconds in BCD format
);
    // Wires for individual BCD digits of seconds, minutes, and hours
    wire [3:0] sec_ones, sec_tens, min_ones, min_tens, hrs_ones, hrs_tens;
    // Wires for enable signals of seconds and minutes (cascading)
    wire [1:0] sec_ena, min_ena;
    // Wire for enable signal of hours, and a controlled enable for seconds
    wire hrs_ena, sec_ena_controlled;
    // Register to store the AM/PM state
    reg pm_temp;

    // Assign combined BCD digits to the 8-bit outputs
    assign hh[7:4] = hrs_tens;
    assign hh[3:0] = hrs_ones;
    assign mm[7:4] = min_tens;
    assign mm[3:0] = min_ones;
    assign ss[7:4] = sec_tens;
    assign ss[3:0] = sec_ones;

    // Instance to generate a 1-second enable pulse from the 'clk' (assuming clk is faster, e.g., 1KHz)
    // MAX_COUNT parameter suggests this module generates a pulse when an internal counter reaches 1000.
    seconds_ena #(.MAX_COUNT(1000)) ena1(clk, reset, sec_ena_controlled);
    
    // Controlled enable for the 'ones_sec' counter: active when global 'ena' and 'sec_ena_controlled' are high.
    assign sec_ena[0] = (ena && sec_ena_controlled);
    // Enable for 'tens_sec' counter: active when 'sec_ones' rolls over from 9 to 0, and 'sec_ena[0]' is high.
    assign sec_ena[1] = (sec_ena[0] && sec_ones == 4'd9);

    // Instantiate seconds counters (ones and tens digits)
    // 'sec_and_min' is a generic BCD counter that rolls over at MAX_VAL (here 9 or 5).
    sec_and_min ones_sec(clk, reset, sec_ena[0], 4'd9, sec_ones);  // Seconds units (0-9)
    sec_and_min tens_sec(clk, reset, sec_ena[1], 4'd5, sec_tens);  // Seconds tens (0-5)

    // Enable for 'ones_min' counter: active when 'sec_tens' is 5 and 'sec_ones' is 9, and 'sec_ena[0]' is high.
    // This detects the rollover from 59 seconds to 00 seconds.
    assign min_ena[0] = sec_ena[0] && (sec_tens == 4'd5 && sec_ones == 4'd9);
    // Enable for 'tens_min' counter: active when 'min_ones' rolls over from 9 to 0, and 'min_ena[0]' is high.
    assign min_ena[1] = (min_ena[0] && min_ones == 4'd9);

    // Instantiate minutes counters (ones and tens digits)
    sec_and_min ones_min(clk, reset, min_ena[0], 4'd9, min_ones);  // Minutes units (0-9)
    sec_and_min tens_min(clk, reset, min_ena[1], 4'd5, min_tens);  // Minutes tens (0-5)

    // Enable for 'hour_counter': active when minutes roll over from 59 to 00, and seconds roll over from 59 to 00.
    assign hrs_ena = (sec_ena[0]) && (min_tens == 4'd5) && (min_ones == 4'd9) && (sec_tens == 4'd5) && (sec_ones == 4'd9);
    // Instantiate the hour counter
    hour_counter hour(clk, reset, hrs_ena, hrs_ones, hrs_tens); // Handles 12-hour format

    // Always block to update AM/PM indicator
    always @(posedge clk) begin
        // If 'reset' is high, reset 'pm_temp' to AM (0)
        if (reset) begin
            pm_temp <= 1'b0;
        end
        // Else if global enable 'ena' is high AND the clock rolls over from 11:59:59 to 12:00:00,
        // then toggle the AM/PM state.
        else if (ena && sec_ena[0] && hrs_tens == 4'd1 && hrs_ones == 4'd1 && min_tens == 4'd5 && min_ones == 4'd9 && sec_tens == 4'd5 && sec_ones == 4'd9) begin
            pm_temp <= ~pm_temp; // Toggle AM/PM
        end
    end
    
    // Assign the temporary PM state to the output 'pm'
    assign pm = pm_temp;
    
endmodule

// Note: The modules 'seconds_ena', 'sec_and_min', and 'hour_counter' are assumed to be defined elsewhere.
// Their definitions would be crucial for complete understanding and simulation.