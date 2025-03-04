`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/16/2024 02:09:36 PM
// Design Name: 
// Module Name: operationsaddress
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


module operationsaddress(
    input [10:0] operations,
    output reg [3:0] operation_address
    );
    always @(*) begin
        case (operations)
            11'b00000000001: operation_address = 0;
            11'b00000000010: operation_address = 1;
            11'b00000000100: operation_address = 2;
            11'b00000001000: operation_address = 3;
            11'b00000010000: operation_address = 4;
            11'b00000100000: operation_address = 5;
            11'b00001000000: operation_address = 6;
            11'b00010000000: operation_address = 7;
            11'b00100000000: operation_address = 8;
            11'b01000000000: operation_address = 9;
            11'b10000000000: operation_address = 10;
            default: operation_address = 11; // Invalid operation
        endcase
    end
endmodule
