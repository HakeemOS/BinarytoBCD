`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Hakeem S
// 
// Create Date: 01/21/2023 05:36:59 PM
// Design Name: 
// Module Name: Counter2Bit_s
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 2 Bit counter used as select for Mux and Decoder 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Counter2Bit_s(count, clk);

    input clk; 

    output reg [1:0] count; 

    always @(posedge clk ) begin
        count = count + 1;  
    end

endmodule
