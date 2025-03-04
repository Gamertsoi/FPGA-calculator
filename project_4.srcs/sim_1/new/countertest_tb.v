`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/16/2024 08:51:24 PM
// Design Name: 
// Module Name: countertest_tb
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


`timescale 1ns / 1ps

module countertest_tb;

    // Inputs
    reg clk;
    reg swnum;
    reg swdigit;
    reg [3:0] in;
    reg rstn;
    reg [10:0] operations;

    // Outputs
    wire [6:0] y;
    wire [3:0] Anode_Activate;

    // Instantiate the Unit Under Test (UUT)
    countertest uut (
        .clk(clk),
        .swnum(swnum),
        .swdigit(swdigit),
        .in(in),
        .rstn(rstn),
        .operations(operations),
        .y(y),
        .Anode_Activate(Anode_Activate)
    );

    // Clock generation (50 MHz clock, 20 ns period)
    initial begin
        clk = 0;
        forever #10 clk = ~clk;
    end

    // Test procedure
    initial begin
        // Initialize inputs
        swnum = 0;
        swdigit = 0;
        in = 4'b0000;
        rstn = 0;
        operations = 11'b00000000000;

        // Apply reset
        #50 rstn = 1; // Release reset after 50 ns
        #50 rstn = 0; // Assert reset again

        // Test Case 1: Basic switch and button test
        #1000;
        in = 4'b0010; // Add 1
        #1000;
        in = 4'b0000;
        #1000;
        in = 4'b0010; // Add 1
        #1000;
        in = 4'b0000;
        #1000;
        in = 4'b1000; // Add 100
        #1000;
        in = 4'b0000;
        #1000;
        in = 4'b0100; // Add 10
        #1000;
        in = 4'b0000;
        #1000;
        swnum = 1;
        in = 4'b0010; // Add 1
        #1000;
        in = 4'b0000;
        #1000;
        in = 4'b1000; // Add 100
        #1000;
        in = 4'b0000;
        #1000;
        in = 4'b0001; // Add 100
        #1000;
        in = 4'b0000;
        swnum = 0;
        //set up a = 112, b = -101
        #1000;
        operations = 11'b00000000001; //test for add
        #500;
        swdigit = 1;
        #500;
        operations = 11'b00000000010; //test for sub
        #500;
        swdigit = 1;
        operations = 11'b00000000100; //test for mul
        #500;
        swdigit = 1;
        #500;
        operations = 11'b00000001000; //test for div
        #500;
        swdigit = 1;
        #500;
        operations = 11'b00000010000; //test for sin
        #500;
        swdigit = 1;
        #500;
        operations = 11'b00000100000; //test for cos
        #500;
        swdigit = 1;
        #500;
        operations = 11'b00001000000; //test for tan
        #500;
        swdigit = 1;
        #500;
        operations = 11'b00010000000; //test for log
        #500;
        swdigit = 1;
        #500;
        operations = 11'b00100000000; //test for sqrt
        #500;
        swdigit = 1;
        #500;
        operations = 11'b01000000000; //test for exp
        #500;
        swdigit = 1;
        #500;
        operations = 11'b10000000000; //test for pow
        #500;
        swdigit = 1;
        $stop;
    end

endmodule
