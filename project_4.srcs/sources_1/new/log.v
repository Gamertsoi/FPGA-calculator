`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/15/2024 07:15:34 PM
// Design Name: 
// Module Name: log
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


module log(
    input clk,
    input s0,
    input [19:0] x0,
    input s1,
    input [19:0] x1,
    output reg s,
    output reg [19:0] r,
    output reg [9:0] p
);
    reg [19:0] a, b;
    wire [19:0] rtemp [2:0];
    wire [9:0] ptemp;
    wire k;

    // Instantiate external modules
    log_bram logbraminst1(clk, a, rtemp[0]);
    log_bram logbraminst2(clk, b, rtemp[1]);
    division logdivinst(s0, rtemp[0], s1, rtemp[1], k, rtemp[2], ptemp);

    always@(*) begin
        // Default assignments
        a = 0;
        b = 0;
        r = 0;
        p = 0;
        s = 0;

        // Error conditions
        if (x0 == 0 || x1 == 1 || s0 == 1 || s1 == 1) begin
            p = 127; // Error code
        end else if (x1 == 0) begin
            // Natural log case
            a = x0;
            r = (x0 > 2? rtemp[0]/10:rtemp[0]);         
        end else if (x0 == 1) begin
            r = 0;
        end else begin
            // General log case
            a = x0;
            b = x1;
            r = rtemp[2];
            p = ptemp;
        end
    end
endmodule
