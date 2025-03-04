`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/15/2024 03:11:31 AM
// Design Name: 
// Module Name: converter2
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


module encoder(input swdigit, input sign, input [19:0] bram_data, input [9:0] exp_data, output  reg [3:0] out0,out1,out2,out3);
    reg [19:0] temp;
    always@* begin
        temp = bram_data;
        if(exp_data == 127) begin //error handling
            out0 = 4'b1011;
            out1 = 4'b1100;
            out2 = 4'b1101;
            out3 = 4'b1100;
        end else begin
            case (swdigit)
                0:begin
                    out0 = (sign == 1?4'b1111:4'b1010);
                    if(exp_data == 126)begin        //no exp
                        out1 = 4'b1010;
                        out2 = bram_data/100000;
                        out3 = (bram_data%100000)/10000;
                    end else begin
                        if(temp%10>=5)begin
                            temp = temp + 10;
                        end
                        out1 = temp / 1000;
                        out2 = (temp%1000) / 100;
                        out3 = (temp%100) / 10;
                    end
                end
                1:begin
                    if(exp_data == 126)begin         //no exp
                        out0 = (bram_data%10000)/1000;
                        out1 = (bram_data%1000)/100;
                        out2 = (bram_data%100)/10;
                        out3 = bram_data%10;
                    end else begin
                        out0 = 4'b1011;
                        out1 = (exp_data > 127 ? 4'b1111:4'b1010);
                        out2 = (exp_data > 127 ? (exp_data - 128)/10:exp_data/10);
                        out3 = (exp_data > 127 ? (exp_data - 128)%10:exp_data%10);
                    end
                end 
            endcase
        end
    end
endmodule
