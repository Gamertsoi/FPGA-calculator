`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/14/2024 07:03:51 PM
// Design Name: 
// Module Name: pow
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


module pow(
    input a,b,s,
    output reg r,p
);
    reg[99:0] x,y,sign,i,result,temp,ten,pow,tp,ttop10;
    always@* begin
        x = a;
        y = b;
        sign = s;
        result = 1;
        pow = 0;
        for (i = 1; i < 10; i = i + 1) begin
            if(i<=b)begin
                result = result*a;
            end
        end
        temp = result;
        for (i = 0; i < 29; i = i + 1) begin
            if(temp/10>0) begin
                temp = temp/10;
                pow = pow + 1;
            end
        end
        ten = 1;
        if(sign ==0)begin
            tp = pow;
            if(i+7<pow) begin
                result = result * 10000000;
                tp = pow + 7;
            end
            for (i = 0; i < 22; i = i + 1) begin
                if(i+7 < tp) begin
                    ten = ten*10;
                end
            end
            result = result/ten;
        end else begin
            tp = pow;
            ttop10 = 100000*100000;
            if(pow>19) begin
                temp = temp / ttop10;
                tp = pow - 10;
            end
            if(pow>19) begin
                temp = temp / ttop10;
                tp = pow - 10;
            end
            for (i = 0; i < 29; i = i + 1) begin
                if(i< tp+9) begin
                    ten = ten*10;
                end
            end
            result = ten / result;
            if(result/10000000<1)begin
                result = ten*10 / result;
                pow = pow - 1;
            end
        end
        r = result;
        p = pow;
    end
endmodule
