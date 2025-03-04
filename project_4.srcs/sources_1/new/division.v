`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2024 08:02:47 PM
// Design Name: 
// Module Name: division
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


module division(
    input s1,
    input [32:0] a,
    input s2,
    input [32:0] b,
    output reg s,
    output reg [19:0] r,
    output reg [9:0] p
);
    always @(*) begin
        p = 0;
        s = s1 ^ s2;
        if(b == 0)begin
            p = 127; //error
        end else if(a == 0) begin
            r = 0;
            s = 0;
        end else begin
            if(a == b)begin
                r = 1000;
            end else if(a>b)begin
                if(a/b>99)begin
                    r = a*10/b;
                    p = 2;
                end else if(a/b>9) begin
                    r = a*100/b;
                    p = 1;
                end else begin
                    r = a*1000/b;
                end
            end else begin
                if(a*10/b>1)begin
                    r = a*10*1000/b;
                    p = 129;
                end else if(a*100/b>1) begin
                    r = a*100*1000/b;
                    p = 130;
                end else begin
                    r = a*1000*1000/b;
                    p = 131;
                end
            end
        end
    end
endmodule
