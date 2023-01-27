`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Hakeem S
// 
// Create Date: 01/21/2023 04:55:39 PM
// Design Name: 
// Module Name: Clk100Hz_s
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: slow clock for counter used to periodically switch between seven segement displays; up'ed to 1kHz instead of 100Hz 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Clk100Hz_s(clk_out, clk);

    input clk; 
    output clk_out; 

    reg [18:0] counter = 0;
    reg clk_temp;        

    always @(posedge clk ) begin
        counter = counter + 1; 
        if (counter == 50000) begin         //count to 500,000 for 100Hz clk trying 1kHz clk
            counter = 0; 
            clk_temp = ~clk_temp; 
        end       
    end 

    assign clk_out = clk_temp; 

endmodule
