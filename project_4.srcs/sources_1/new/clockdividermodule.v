`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2022 10:51:35 AM
// Design Name: 
// Module Name: clockdividermodule
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


module clockdivider #(parameter n=5000)(rst,inputclk,outputclk);
input inputclk,rst;
output reg outputclk;
reg[31:0] count;
always @(posedge(inputclk),posedge(rst)) begin
if(rst==1'b1)
count<=32'b0;
else if(count==n-1)
count<=32'b0;
else
count<=count+1;
end

always @(posedge(inputclk),posedge(rst))begin
if(rst==1'b1)
outputclk<=1'b0;
else if(count==n-1)
outputclk<=~outputclk;
else
outputclk<=outputclk;
end

endmodule
