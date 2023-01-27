`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Hakeem S
// 
// Create Date: 01/25/2023 08:18:38 AM
// Design Name: 
// Module Name: Top_s
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Combines all 6 modules of the project 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Top_s(sevSeg_out, an_out, inNum, clk);

    input [7:0] inNum; 
    input clk;

    output [6:0] sevSeg_out;
    output [3:0] an_out; 

    wire clk_100Hz; 
    wire [1:0] counter; 
    wire [3:0] bcd0, bcd1, bcd2, bcd_out; 
    reg [3:0] muxZeros = 4'b0000;  
    
    BinarytoBCD_s U1 (bcd0, bcd1, bcd2, inNum, clk); 
    Clk100Hz_s U2 (clk_100Hz, clk);
    Counter2Bit_s U3(counter, clk_100Hz);  
    Mux4to1_4Bit_s U4 (bcd_out, bcd0, bcd1, bcd2, muxZeros, counter); 
    Decoder2to4_s U5 (an_out, counter); 
    SevSegDisp_s U6 (sevSeg_out, bcd_out); 


endmodule
