`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/15/2024 07:21:32 PM
// Design Name: 
// Module Name: log_bram
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


module log_bram(
    input clk,
    input [19:0] a,
    output reg [19:0] value
    );
    wire [19:0] log_mem;      // Output from BRAM

    // Instantiate the BRAM IP core
    blk_mem_gen_1 BRAMROM (
        .clka(clk),                   // Connect the clock
        .addra(a),                   // Address input
        .douta(log_mem),            // Output sine value
        .ena(1'b1)                   // Enable the memory
    );

    // Always block to register the output value on the clock edge
    always @(posedge clk) begin
        value <= log_mem;           // Capture the sine value on the rising edge of the clock
    end

endmodule
