`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2024 03:33:25 PM
// Design Name: 
// Module Name: counter_restricted
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module counter_restricted(
    input clk, // Clock signal
    input reset, // Reset signal
    input in, // Input signal for incrementing
    input swnum, // Switch to select between num1 and num2
    output reg num1, // Counter 1 (restricted to 0 or 1)
    output reg num2 // Counter 2 (restricted to 0 or 1)
);
    reg pushing, pushing_sync, pushing_fn;
    wire pushing_edge;
    // Synchronize the input signal
    always @(posedge clk) begin
        pushing <= in;
        pushing_sync <= pushing;
    end

    // Detect the rising edge of the input signal
    always @(posedge clk) begin
        if (reset) begin
            pushing_fn <= 1'b0;
        end else begin
            pushing_fn <= pushing_sync;
        end
    end

    assign pushing_edge = pushing_sync & ~pushing_fn;

    // Two counters: num1 and num2
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            num1 <= 0; // Reset num1 to 0
            num2 <= 0; // Reset num2 to 0
        end else if (pushing_edge) begin
            if (swnum == 1'b0) begin
                // Increment num1 and restrict it to 0 or 1
                if (in) begin
                    num1 <= ~num1;
                end
            end else if (swnum == 1'b1) begin
                // Increment num2 and restrict it to 0 or 1
                if (in) begin
                    num2 <= ~num2;
                end
            end
        end
    end
endmodule
