`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/15/2024 04:22:27 AM
// Design Name: 
// Module Name: decoder2
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

module encoder2(input [32:0] result_temp, output reg [3:0]out0, out1, out2);
    reg [32:0] temp;
    always@* begin
        temp = result_temp;
        if(temp % 10>= 5)begin
            temp = temp + 10;
        end
        out0 = temp / 1000;//eg 9253 -> 9 2 5 3
        out1 = (temp % 1000)/100;
        out2 = (temp % 100)/10;
    end
endmodule
