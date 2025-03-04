`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/14/2024 06:42:19 PM
// Design Name: 
// Module Name: power
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


module power(
    input power,
    input [3:0] a2,b2,c2,d2,a1,b1,c1,d1, // 4-bit input for num: [0] = sign, [3:1] = BCD digits
    output reg [3:0] r0,r1,r2,r3,p0,p1,p2,p3 // 7-bit result (sign and BCD digits)
);
    reg [99:0] a,b,ta,i;
    integer pa;
    always @power begin
        // Calculate a^b using real arithmetic
        a = b2+c2+d2;
        b = b1+c1+d1;
        pa = 0;
        if(a == 0)begin
            if(b == 0)begin
                r0 = 4'b1011; //E
                r1 = 4'b1100; //r
                r2 = 4'b1101; //o
                r3 = 4'b1100; //r
                p0 = 4'b1011;
                p1 = 4'b1100;
                p2 = 4'b1101;
                p3 = 4'b1100;
            end else begin
                r0 = 4'b1010; //blank
                r1 = 4'b0000;
                r2 = 4'b0000;
                r3 = 4'b0000;
                p0 = 4'b1011;
                p1 = 4'b1010; //blank
                p2 = 4'b0000;
                p3 = 4'b0000;
            end
        end else if(a == 1)begin
            r0 = 4'b1010; //blank
            r1 = 4'b0001;
            r2 = 4'b0000;
            r3 = 4'b0000;
            p0 = 4'b1011;
            p1 = 4'b1010; //blank
            p2 = 4'b0000;
            p3 = 4'b0000;
        end else if(b == 0) begin
            r0 = 4'b1010; //blank
            r1 = 4'b0001;
            r2 = 4'b0000;
            r3 = 4'b0000;
            p0 = 4'b1011;
            p1 = 4'b1010; //blank
            p2 = 4'b0000;
            p3 = 4'b0000;
        end else if(b == 1) begin
            r0 = a2;
            r1 = b2;
            r2 = c2;
            r3 = d2;
            p0 = 4'b1011;
            p1 = 4'b1010;
            p2 = 4'b0000;
            if(a>99) begin
                p3 = 2;
            end else if(a>9) begin
                p3 = 1;
            end else begin
                p3 = 0;
            end
        end else begin
            ta = a;
            if(b%2==0)begin
                r0 = 4'b1010;
            end else if(a2 == 1)begin
                r0 = 4'b1111;
            end else begin
                r0 = 4'b1010;
            end
            for(i=0;i<1000;i=i+1)begin
                if(i<b) begin
                    ta = ta*a;
                    if(ta>=100000000)begin
                        ta = ta/1000;
                        pa = pa + 3;
                    end
                end
            end
            p1 = a1;
            if(a1 == 1)begin //negative index
                if(ta/10000 == 0) begin
                    pa = -1;
                end
                for(i = 0;i<10;i=i+1)begin
                    if(ta/10000>9)begin
                        ta = ta/10; //get 5 sig fig
                        pa = pa + 1;
                    end else if(ta/10000 == 0) begin
                        ta = ta*10; //get 5 sig fig
                        pa = pa + 1;
                    end
                end
                ta = 10000000/ta;
                if(ta == 1000)begin
                    pa = pa - 3;
                end
                pa = pa - 2;
                if(pa>99)begin
                    r0 = 4'b1011; //E
                    r1 = 4'b1100; //r
                    r2 = 4'b1101; //o
                    r3 = 4'b1100; //r
                    p0 = 4'b1011;
                    p1 = 4'b1100;
                    p2 = 4'b1101;
                    p3 = 4'b1100;
                end else begin
                    r1 = ta/1000;
                    r2 = (ta%1000)/100;
                    r3 = (ta%100)/10;
                    if(ta%10>=5)begin
                        r3 = r3 + 1;
                    end
                    p2 = pa/10;
                    p3 = pa%10;
                end
            end else begin
                if(ta>=10000000)begin
                    r1 = ta/10000000;
                    r2 = (ta%10000000)/1000000;
                    r3 = (ta%1000000)/100000;
                    if(ta%100000>=50000)begin
                        r3 = r3 + 1;
                    end
                    pa = pa + 7;
                end else if(ta>=1000000)begin
                    r1 = ta/1000000;
                    r2 = (ta%1000000)/100000;
                    r3 = (ta%100000)/10000;
                    pa = pa + 6;
                    if(ta%10000>=5000)begin
                        r3 = r3 + 1;
                    end
                end else if(ta>=100000)begin
                    r1 = ta/100000;
                    r2 = (ta%100000)/10000;
                    r3 = (ta%10000)/1000;
                    pa = pa + 5;
                    if(ta%1000>=500)begin
                        r3 = r3 + 1;
                    end
                end else if(ta>=1000000)begin
                    r1 = ta/10000;
                    r2 = (ta%10000)/1000;
                    r3 = (ta%1000)/100;
                    pa = pa + 4;
                    if(ta%100>=50)begin
                        r3 = r3 + 1;
                    end
                end else if(ta>=1000)begin
                    r1 = ta/1000;
                    r2 = (ta%1000)/100;
                    r3 = (ta%100)/10;
                    pa = pa + 3;
                    if(ta%10>=5)begin
                        r3 = r3 + 1;
                    end
                end else if(ta>=100)begin
                    r1 = ta/100;
                    r2 = (ta%100)/10;
                    r3 = ta%10;
                    pa = pa + 2;
                end else if(ta>=10)begin
                    r1 = ta/10;
                    r2 = ta%10;
                    r3 = 0;
                    pa = pa + 1;
                end else begin
                    r1 = ta;
                    r2 = 0;
                    r3 = 0;
                end
                if(pa>99)begin
                    r0 = 4'b1011; //E
                    r1 = 4'b1100; //r
                    r2 = 4'b1101; //o
                    r3 = 4'b1100; //r
                    p0 = 4'b1011;
                    p1 = 4'b1100;
                    p2 = 4'b1101;
                    p3 = 4'b1100;
                end else begin
                    p2 = pa/10;
                    p3 = pa%10;
                end
            end
        end
    end
endmodule