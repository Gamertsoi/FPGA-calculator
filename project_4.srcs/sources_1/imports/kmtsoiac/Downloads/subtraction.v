`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2022
// Design Name: 
// Module Name: subtract
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Subtraction operation for the calculator
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module sub(
    input s1,
    input [19:0] a,
    input s2,
    input [19:0] b,
    output reg sign,
    output reg [19:0] r2, // 7-bit result (sign and BCD digits)
    output reg [9:0] p
);
    always @(*) begin
        p = 126;
        if(s1 == s2) begin
            if(a >= b) begin
                r2 = a - b;
                sign = s1;
            end else begin
                r2 = b - a;
                sign = s2; // Flip the sign
            end
        end else begin
            r2 = a + b;
            sign = s1;
        end

        if(r2 == 0) begin
            sign = 0;
        end
    end
endmodule