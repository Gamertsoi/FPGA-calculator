`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/16/2024 03:12:42 PM
// Design Name: 
// Module Name: tb
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


module testbench;

    reg [31:0] int_input;
    wire [31:0] float_output;

    // Instantiate the module
    int_to_float uut (
        .int_input(int_input),
        .float_output(float_output)
    );

    initial begin
        // Test cases
        int_input = 32'd10; // Positive integer
        #10;
        $display("Input: %d, Float: %h", int_input, float_output);

        int_input = -32'd123; // Negative integer
        #10;
        $display("Input: %d, Float: %h", int_input, float_output);

        int_input = 32'd0; // Zero
        #10;
        $display("Input: %d, Float: %h", int_input, float_output);

        int_input = 32'd1024; // Large number
        #10;
        $display("Input: %d, Float: %h", int_input, float_output);

        $finish;
    end

endmodule
