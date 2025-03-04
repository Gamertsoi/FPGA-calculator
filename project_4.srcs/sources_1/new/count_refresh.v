`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/20/2022 11:44:10 AM
// Design Name: 
// Module Name: count_refresh
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

module count_refresh(input clk, output reg [1:0] refresh_counter=0);
always @(posedge clk)
refresh_counter<=refresh_counter+1;
endmodule

