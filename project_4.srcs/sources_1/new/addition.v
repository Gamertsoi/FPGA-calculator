`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2022 08:39:27 AM
// Design Name: 
// Module Name: addition
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



module addition(
    input s1,                    // Sign of operand `a`
    input [19:0] a,              // 20-bit operand `a`
    input s2,                    // Sign of operand `b`
    input [19:0] b,              // 20-bit operand `b`
    output reg sign,             // Sign of the result
    output reg [19:0] r,         // 21-bit result to handle overflow
    output reg [9:0] p
);

    always @(*) begin
        p = 126;
        // Check if the signs are the same
        if (s1 == s2) begin
            // Same sign: Perform addition
            r = a + b;
            sign = s1;  // Result sign matches the operands' sign
        end else begin
            // Different signs: Perform subtraction
            if (a > b) begin
                r = a - b;
                sign = s1;  // Result sign matches the larger operand's sign
            end else begin
                r = b - a;
                sign = s2;  // Result sign matches the larger operand's sign
            end
            
            // Special case: Result is zero, set sign to 0
            if (r == 0) begin
                sign = 0;
            end
        end
    end
endmodule