`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/15/2024 04:05:58 PM
// Design Name: 
// Module Name: sine_bram
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


module sine_bram(
    input clk,
    input [32:0] a,
    output reg [32:0] value
    );
    wire [32:0] sine_mem;      // Output from BRAM

    // Instantiate the BRAM IP core
    blk_mem_gen_0 BRAMROM (
        .clka(clk),                   // Connect the clock
        .addra(a),                   // Address input
        .douta(sine_mem),            // Output sine value
        .ena(1'b1)                   // Enable the memory
    );

    // Always block to register the output value on the clock edge
    always @(posedge clk) begin
        value <= sine_mem;           // Capture the sine value on the rising edge of the clock
    end

endmodule
