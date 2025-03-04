`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/15/2024 05:53:57 PM
// Design Name: 
// Module Name: cos
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


module cos (
    input clk,
    input [19:0] x,
    output reg s,
    output reg [19:0] r,
    output reg [9:0] p
);
    reg [19:0] a,b;
    reg k;
    wire [19:0] c;
    sine_bram sb(clk,90 - b,c);
        always @(*) begin
        a = x;
        s = 0;
        if(a>=180) begin
            a = a - 180;
            s = ~s;
        end
        if(a>90)begin
            a = 180 - a;
            s = ~s;
        end
        if(a == 0|| a == 1) begin //0
            r = 1000;
            p = 0;
        end else if(a == 90) begin //1
            r = 0;
            p = 0;
            s = 0;
        end else begin
            b = a;
            r = c/100;
            p = (a>84? 130: 129);
        end
    end
endmodule 
