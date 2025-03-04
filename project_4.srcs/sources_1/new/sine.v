`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/15/2024 02:56:09 PM
// Design Name: 
// Module Name: sine
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


module sine (
    input clk,
    input sign,
    input [19:0] x,
    output reg s,
    output reg [19:0] r,
    output reg [9:0] p
);
    reg [19:0] a,b;
    wire [19:0] c;
    // Memory array to store sine values
    sine_bram sb(clk,b,c);
    always @(*) begin
        a = x;
        s = sign;
        if(a>=180) begin
            a = a - 180;
            s = ~s;
        end
        if(a>90)begin
            a = 180 - a;
        end
        if(a ==0) begin //0
            r = 0;
            p = 0;
            s = 0;
        end else if(a == 89||a == 90) begin //sin(90)=1, sin(89) = 1.00 (3 sig fig)
            r = 1000;
            p = 0;
        end else begin
            b = a;
            r = c/100;
            p = (a<6? 130: 129);
        end
    end


endmodule