`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/20/2022 11:27:35 AM
// Design Name: 
// Module Name: anode_control
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


module anode_control(input [1:0]LED_activating_counter,  output reg [3:0] Anode_Activate);
    // anode activating signals for 4 LEDs
// decoder to generate anode signals 
always @(LED_activating_counter)
begin
    case(LED_activating_counter)
    2'b00: begin
        Anode_Activate = 4'b0111; 
         end
    2'b01: begin
        Anode_Activate = 4'b1011; 
            end
    2'b10: begin
        Anode_Activate = 4'b1101; 
          end
      2'b11: begin
        Anode_Activate = 4'b1110; 
        end
    endcase
end

endmodule
