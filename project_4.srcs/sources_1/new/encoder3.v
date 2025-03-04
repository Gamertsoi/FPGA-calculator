`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/15/2024 04:25:57 AM
// Design Name: 
// Module Name: encoder3
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


module powencoder(input [32:0] result_temp, output reg [3:0]out0, out1, out2);
    always@*begin
        if(result_temp < 256)begin
            out0 = 4'b1010;
            out1 = result_temp / 10; //eg 9253 -> 9 2 5 3
            out2 = result_temp % 10;
        end else begin
            out0 = 4'b1111;
            out1 = (result_temp - 256) / 10; //eg 9253 -> 9 2 5 3
            out2 = (result_temp - 256) % 10;
        end
    end
endmodule
