`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2024
// Design Name: 
// Module Name: multiplication
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Multiplies two numbers and manages sign and exponential output.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module mul(
    input s1,
    input [19:0] a,
    input s2,
    input [19:0] b,
    output reg sign,
    output reg [19:0] r, // 7-bit result (sign and BCD digits)
    output reg [9:0] p
);

    always @(*) begin
        // Perform multiplication
        p = 126;
        r = a * b;
        // Determine the sign of the result
        sign = (r == 0? 0 : s1 ^ s2);
    end
endmodule