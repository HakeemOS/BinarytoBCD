`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/21/2023 05:12:58 PM
// Design Name: 
// Module Name: Mux4to1_4Bit_s
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Simple 4 to 1 Mux with 4Bit inputs; switching between ones, tens, hundreds for seven seg out
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Mux4to1_4Bit_s(y, a0, a1, a2, a3, sel);

    input [3:0] a0, a1, a2, a3;                                 
    input [1:0] sel;                                    //selector 

    output reg [3:0] y; 

    always @(sel or a0 or a1 or a2 or a3) begin
        case (sel)
            2'b00 : y = a0; 
            2'b01 : y = a1;
            2'b10 : y = a2;
            default: 
            y = a3; 
        endcase
    end

endmodule
