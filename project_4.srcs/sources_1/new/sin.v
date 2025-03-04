`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/14/2024 06:40:08 PM
// Design Name: 
// Module Name: sin
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


module sin(
    input sin,
    input sign,
    input [32:0] x,
    output reg [3:0] s,
    output reg [32:0] r,p
);
    reg [64:0] a,a0;//a3,a5,a7;
    integer i;
    always@(*) begin
        a = x;
        if(x>=720)begin
            a = a-720;
        end else if(x>=360)begin
            a = a-360;
        end
        if(sign==1) begin
            a = 360 - a;
        end
        if(a>180) begin
            a = a - 180;
            s = 4'b1111;
        end
        if(a == 0 || a == 180) begin //0
            r = 0;
            p = 0;
        end else if(a == 90) begin //1
            r = 1000;
            p = 0;
        end else if(a == 30) begin //0.5
            r = 5000;
            p = 257;
        end else begin
            a = a*31416/180; //scale up 10000 time
            a0 = a;            
            for(i = 1;i < 6;i = i + 1) begin
                a0 = (a0 * a /10000 * a /10000) / ((2 * i)* (2 * i + 1));
                r = r + a0;
            end
            
//            a3 = a;
//            pa3 = 0;
//            for(i=1;i<3;i=i+1)begin
//                a3 = a3*a;
//                if(a3>=1000000000)begin
//                    a3 = a3/10000;
//                    pa3 = pa3 + 4;
//                end else if(a3>=100000000)begin
//                    a3 = a3/1000;
//                    pa3 = pa3 + 3;
//                end
//            end
//            a5 = a3;
//            pa5 = pa3;
//            for(i=1;i<3;i=i+1)begin
//                a5 = a5*a;
//                if(a5>=1000000000)begin
//                    a5 = a5/10000;
//                    pa5 = pa5 + 4;
//                end else if(a3>=100000000)begin
//                    a5 = a5/1000;
//                    pa5 = pa5 + 3;
//                end
//            end
//            a7 = a5;
//            pa7 = pa5;
//            for(i=1;i<3;i=i+1)begin
//                a7 = a7*a;
//                if(a7>=1000000000)begin
//                    a7 = a7/10000;
//                    pa7 = pa7 + 4;
//                end else if(a3>=100000000)begin
//                    a7 = a7/1000;
//                    pa7 = pa7 + 3;
//                end
//            end
//            a3 = a3/6;
//            a5 = a5/120;
//            a7 = a7/5040;
//            pa3 = 4+pa3-15;
//            pa5 = 4+pa5-25;
//            if(pa3 < 1)begin
//                a3 = 0;
//            end
//            if(pa5 < 1)begin
//                a5 = 0;
//            end
//            for(i=1;i<5;i=i+1)begin
//                if(pa3>7)begin
//                    a3 = a3/100;
//                end
//                if(pa3>6)begin
//                    a3 = a3/10;
//                end
//            end
//            for(i=1;i<5;i=i+1)begin
//                if(pa5>7)begin
//                    a5 = a5/100;
//                end
//                if(pa5>6)begin
//                    a5 = a5/10;
//                end
//            end
//            r = a - a3 + a5 - a7;
            if(r/10000>0)begin
                r = r/10;
                p = 0;
            end else if(r/1000>0) begin
                p = 257;
            end else if(r/100>0) begin
                r = r*10;
                p = 258;
            end
        end






    end
endmodule
