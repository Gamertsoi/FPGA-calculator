`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2022 11:45:04 AM
// Design Name: 
// Module Name: counter
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


module counter_normal(
    input clk, // Clock signal
    input reset, // Reset signal
    input in, // Input signal for incrementing
    input swnum, // Switch to select between num1 and num2
    output reg [3:0] num1, // Counter 1
    output reg [3:0] num2 // Counter 2
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
            num1 <= 4'b0000; // Reset num1 to 0
            num2 <= 4'b0000; // Reset num2 to 0
        end else if (pushing_edge) begin
            if (swnum == 1'b0) begin
                // Increment num1 and restrict it to 0 or 1
                if (in) begin
                    num1 <= num1 + 1;
                end
                if (num1 >= 4'b1001) begin
                    num1 <= 4'b0000; // Wrap back to 0 if count exceeds 9
                end
            end else if (swnum == 1'b1) begin
                // Increment num2 and restrict it to 0 or 1
                if (in) begin
                    num2 <= num2 + 1;
                end
                if (num2 >= 4'b1001) begin
                    num2 <= 4'b0000; // Wrap back to 0 if count exceeds 9
                end
            end
        end
    end
endmodule
