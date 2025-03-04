`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2022 09:13:42 AM
// Design Name: 
// Module Name: bcd_control
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


module bcd_control(input [1:0] refreshcounter, input [3:0] out0,out1,out2,out3, output reg [3:0]digit=0);
always@(refreshcounter)
begin
case(refreshcounter)
2'd0:
digit=out0;
2'd1:
digit=out1;
2'd2:
digit=out2;
2'd3:
digit=out3;
endcase
end
endmodule
