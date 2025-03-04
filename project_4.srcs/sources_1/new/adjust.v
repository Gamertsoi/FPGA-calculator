`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2022 12:44:24 PM
// Design Name: 
// Module Name: adjust
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


module adjust(input [3:0] a,input [3:0] b,input [3:0] c,input [3:0] d,output[7:0] num1,num2);
wire [7:0] temp1,temp2;
assign temp1=a*10;
assign num1=temp1+b;
assign temp2=c*10;
assign num2=temp2+d;


endmodule
