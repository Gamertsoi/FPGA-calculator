`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2022 12:39:46 PM
// Design Name: 
// Module Name: converter
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


module decoder(
    input [3:0] a0,a1,a2,a3,b0,b1,b2,b3,
    output reg [9:0] result_temp1,result_temp2, 
    output reg [1:0] sign);
    always @(*) begin
        result_temp1 = a1*100+a2*10+a3;//eg 3 2 5 -> 325
        result_temp2 = b1*100+b2*10+b3;
        sign[0] = a0;
        sign[1] = b0;
    end
endmodule