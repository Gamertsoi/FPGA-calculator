`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/16/2024 02:20:28 PM
// Design Name: 
// Module Name: Write_data
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


module write_data(
    input clk,
    input [3:0] addr,
    input [1:0] sign,
    input [9:0] numin0,numin1,
    output reg sign_data_in,
    output reg [19:0] bram_data_in,
    output reg [9:0] exp_data_in
);
    wire [19:0] bram_data[0:11];
//    reg [19:0] bram_data_in;
    wire sign_data [0:11];
//    reg sign_data_in;
    wire [9:0] exp_data [0:11];
//    reg [9:0] exp_data_in;
//    reg writenable;
    
    addition add (sign[0],numin0, sign[1],numin1,sign_data[0],bram_data[0],exp_data[0]);
    sub sub(sign[0],numin0, sign[1],numin1,sign_data[1],bram_data[1],exp_data[1]);
    mul mul(sign[0],numin0, sign[1],numin1,sign_data[2],bram_data[2],exp_data[2]);
    division div (sign[0],numin0, sign[1],numin1,sign_data[3],bram_data[3],exp_data[3]);
    sine sin (clk, sign[0], (numin0%360),sign_data[4],bram_data[4],exp_data[4]);
    cos cos (clk, (numin0%360),sign_data[5],bram_data[5],exp_data[5]);
    log log (clk,sign[0],numin0,sign[1],numin1,sign_data[7],bram_data[7],exp_data[7]);
    
//    blk_mem_gen_2 bram2_inst (
//        .clka(clk), // Clock input
//        .wea(writenable), // Write enable
//        .addra(addr), // Address input
//        .dina(sign_data_in) // Data input
//    );
//    blk_mem_gen_3 bram3_inst (
//        .clka(clk), // Clock input
//        .wea(writenable), // Write enable
//        .addra(addr), // Address input
//        .dina(bram_data_in) // Data input
//    );
//    blk_mem_gen_3 bram4_inst (
//        .clka(clk), // Clock input
//        .wea(writenable), // Write enable
//        .addra(addr), // Address input
//        .dina(exp_data_in) // Data input
//    );
    always  @(*) begin
//        writenable = 0;
        bram_data_in = bram_data[addr];
        sign_data_in = sign_data[addr];
        exp_data_in = exp_data[addr];
    end
endmodule
