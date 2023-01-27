`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Hakeem S
// 
// Create Date: 01/21/2023 05:26:43 PM
// Design Name: 
// Module Name: Decoder2to4_s
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 2 to 4 Decoder 4Bit; switching enables (an) for seven seg out
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Decoder2to4_s(an, sel);

    input [1:0] sel; 

    output reg [3:0] an; 

    always @(sel) begin
        case (sel)
            2'b00 : an = 4'b1110; 
            2'b01 : an = 4'b1101; 
            2'b10 : an = 4'b1011;  
            default: 
            an = 4'b1111;
        endcase
    end
    
endmodule
