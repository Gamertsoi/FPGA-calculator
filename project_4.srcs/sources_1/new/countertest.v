`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2022 12:22:26 PM
// Design Name: 
// Module Name: countertest
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


module countertest(
    input clk,
    input swnum,
    input [3:0] in,
    input rstn,
    input [10:0] operations,
    input swdigit,
    output [6:0] y,
    output [3:0] Anode_Activate
);
    wire [3:0] num1[3:0];
    wire [3:0] num2[3:0]; // Outputs from counters
    wire [3:0] addra;
    wire [3:0] out [3:0];
    wire [9:0] numin[1:0];
    wire [1:0] sign;
    wire sign_data;
    wire [19:0] bram_data;
    wire [9:0] exp_data;
    reg [3:0] temp[3:0];
    wire clkout;
    //    wire [13:0] result, result2, result3, result4;
    reg [6:0] y1, y2;
    reg detect;

    // Clock divider
    clockdivider #(5000) clkd(rstn, clk, clkout);

    // Refresh counter
    wire [1:0] refreshcounter;
    wire [3:0] digit, digit1;
    count_refresh dev(clkout, refreshcounter);

    // Instantiate counters
    genvar i;
    generate
    // Counter for out[0] (restricted to 0 or 1)
    counter_restricted c(clkout, rstn, in[0], swnum, num2[0], num1[0]);

    // Counters for out[1], out[2], and out[3] (normal range 0 to 9)
    for (i = 1; i < 4; i = i + 1) begin: block_normal_counters
    counter_normal c(clkout, rstn, in[i], swnum, num2[i], num1[i]);
    end
    endgenerate

    // Anode control
    anode_control inst(refreshcounter, Anode_Activate);

    // Arithmetic operations
    write_data wd(clk,addra ,sign,numin[0],numin[1],sign_data,bram_data,exp_data);

    decoder dcinst(num2[0],num2[1],num2[2],num2[3],num1[0],num1[1],num1[2],num1[3], numin[0], numin[1], sign);
    operationsaddress opadd(operations,addra);



    encoder enc(swdigit,sign_data, bram_data, exp_data,out [0],out [1],out [2],out [3]);
    // Temp logic and operation selection
    always @(posedge clkout) begin
    if (operations == 0) begin
    temp[0] = (swnum == 1 ? num1[0] : num2[0]);
    if (temp[0] == 1)begin
    temp[0] = 4'b1111;
    end else begin
    temp[0] = 4'b1010;
    end
    temp[1] = (swnum == 1 ? num1[1] : num2[1]);
    temp[2] = (swnum == 1 ? num1[2] : num2[2]);
    temp[3] = (swnum == 1 ? num1[3] : num2[3]);
    end
    if (operations != 0) begin
        temp [0] = out [0];
        temp [1] = out [1];
        temp [2] = out [2];
        temp [3] = out [3];
    end
    end

    // BCD control and 7-segment display logic
    bcd_control bcd(refreshcounter, temp[0], temp[1], temp[2], temp[3], digit);
    sdcc sdcc(digit, 1'b1, y);
endmodule

